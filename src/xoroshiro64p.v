// =============================================================================
// xoroshiro64+ TRNG — TinyTapeout GF 180nm 1×1 tile
// =============================================================================
// Algorithm : xoroshiro64+  (Blackman & Vigna, 2018)
//             period = 2^64 - 1, passes PractRand / BigCrush on 32-bit output
//
// Features  :
//   • 32-bit state S0, 32-bit state S1
//   • Ripple-carry adder (RCA) for output = S0 + S1
//   • 1-bit ring-oscillator (RO) noise injection into S0[0] each cycle
//   • 32→1 serial output; 'valid_out' pulses when a new word starts shifting
//   • Seed load via 32-bit scan-style interface (seed_data, seed_wen, seed_sel)
//   • Active-low asynchronous reset with default seed ≠ 0
//
// I/O budget (TinyTapeout 1×1):
//   Inputs  : clk, rst_n, ro_noise, seed_data[7:0], seed_wen, seed_sel[1:0]
//             enable
//   Outputs : serial_out, valid_out
//   (seed loaded 8 bits at a time via 4 writes → sel 0..3, covers both states)
//
// Timing    : single clock domain; RCA worst-case ≈ 32 × 150ps = ~5ns @ 180nm
//             → safe at 50 MHz; well within TinyTapeout spec
// =============================================================================

`default_nettype none

module xoroshiro64plus (
    // ── Clock & reset ──────────────────────────────────────────────────────
    input  wire        clk,
    input  wire        rst_n,      // active-low async reset

    // ── Control ────────────────────────────────────────────────────────────
    input  wire        enable,     // gate the PRNG; hold 0 to pause

    // ── RO noise injection ─────────────────────────────────────────────────
    input  wire        ro_noise,   // 1-bit from free-running ring oscillator

    // ── Seed load interface (8-bit chunks, 4 writes cover both 32-bit states)
    //    seed_sel: 00 → S0[7:0]   01 → S0[15:8]
    //              10 → S0[31:16] 11 → S1[7:0] … (handled by sub-module)
    //    Full 64-bit seed loaded via seed_ctrl sub-module below
    input  wire [7:0]  seed_data,
    input  wire        seed_wen,
    input  wire [2:0]  seed_sel,   // 000..011 → S0 bytes; 100..111 → S1 bytes

    // ── Serial output ──────────────────────────────────────────────────────
    output wire        serial_out, // MSB-first serial stream
    output reg         valid_out   // high for 1 cycle when new 32-bit word loaded
);

    // =========================================================================
    // 1. State registers
    // =========================================================================
    reg [31:0] s0, s1;

    // =========================================================================
    // 2. Seed controller — byte-addressable write into s0 / s1
    // =========================================================================
    // seed_sel[2]: 0 → target S0, 1 → target S1
    // seed_sel[1:0]: byte lane within the target word
    wire        seed_s1_sel = seed_sel[2];
    wire [1:0]  seed_byte   = seed_sel[1:0];

    // =========================================================================
    // 3. RCA adder: output_word = s0 + s1
    //    Built as a chain of 32 full-adder cells (no carry-lookahead)
    // =========================================================================
    wire [31:0] rca_sum;
    wire [31:0] rca_carry; // carry chain; rca_carry[0] = 0 (no cin)

    assign rca_carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : rca_fa
            // Full adder: sum = a^b^cin, cout = majority(a,b,cin)
            assign rca_sum[i]       = s0[i] ^ s1[i] ^ rca_carry[i];
            assign rca_carry[i+1]   = (s0[i] & s1[i]) | (s0[i] & rca_carry[i]) | (s1[i] & rca_carry[i]);
        end
    endgenerate
    // rca_carry[32] is the carry-out (discarded as per xoroshiro spec)

    // =========================================================================
    // 4. xoroshiro64+ update equations
    //    s0_next = s0 ^ s1
    //    s1_next = rotl(s0, 26) ^ s1 ^ (s1 << 9)
    // =========================================================================
    wire [31:0] s0_next, s1_next;

    assign s0_next = s0 ^ s1;

    // rotl(s0, 26) = {s0[5:0], s0[31:6]}
    wire [31:0] s0_rotl26 = {s0[5:0], s0[31:6]};

    assign s1_next = s0_rotl26 ^ s1 ^ {s1[22:0], 9'b0};
    //                                   ^^^^^^^^^^^^^^^^^^
    //                                   s1 << 9  (shift left, MSBs discarded)

    // =========================================================================
    // 5. Output register — latches the RCA sum at the same cycle
    // =========================================================================
    reg [31:0] output_reg;

    // =========================================================================
    // 6. 32-to-1 serializer — MSB first, shifts on every enabled clock
    //    Loads output_reg when bit_cnt wraps to 0
    // =========================================================================
    reg [31:0] shift_reg;
    reg [5:0]  bit_cnt;    // counts 0..31; wraps each 32 cycles

    assign serial_out = shift_reg[31];

    // =========================================================================
    // 7. State machine / clocked logic
    // =========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Non-zero default seed (must not be all-zero for xoroshiro)
            s0         <= 32'hDEAD_BEEF;
            s1         <= 32'hCAFE_F00D;
            output_reg <= 32'h0;
            shift_reg  <= 32'h0;
            bit_cnt    <= 6'd0;
            valid_out  <= 1'b0;
        end else begin
            // ── Seed load (highest priority, overrides PRNG update) ──────
            if (seed_wen) begin
                if (!seed_s1_sel) begin
                    case (seed_byte)
                        2'b00: s0[ 7: 0] <= seed_data;
                        2'b01: s0[15: 8] <= seed_data;
                        2'b10: s0[23:16] <= seed_data;
                        2'b11: s0[31:24] <= seed_data;
                    endcase
                end else begin
                    case (seed_byte)
                        2'b00: s1[ 7: 0] <= seed_data;
                        2'b01: s1[15: 8] <= seed_data;
                        2'b10: s1[23:16] <= seed_data;
                        2'b11: s1[31:24] <= seed_data;
                    endcase
                end
                valid_out <= 1'b0;

            end else if (enable) begin
                // ── PRNG step ────────────────────────────────────────────
                // RO noise injected into S0[0] before state update
                s0 <= s0_next ^ {31'b0, ro_noise};
                s1 <= s1_next;

                // Latch RCA output (s0+s1 computed combinatorially this cycle)
                output_reg <= rca_sum;

                // ── Serializer ───────────────────────────────────────────
                if (bit_cnt == 6'd0) begin
                    // Load new word, MSB shifts out this cycle
                    shift_reg <= rca_sum;
                    valid_out <= 1'b1;
                    bit_cnt   <= 6'd1;
                end else if (bit_cnt == 6'd31) begin
                    shift_reg <= {shift_reg[30:0], 1'b0};
                    valid_out <= 1'b0;
                    bit_cnt   <= 6'd0;
                end else begin
                    shift_reg <= {shift_reg[30:0], 1'b0};
                    valid_out <= 1'b0;
                    bit_cnt   <= bit_cnt + 6'd1;
                end
            end else begin
                valid_out <= 1'b0;
            end
        end
    end

endmodule

`default_nettype wire
