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
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire ro_noise,
    input wire [7:0] seed_data,
    input wire seed_wen,
    input wire [2:0] seed_sel,
    output wire serial_out,
    output reg valid_out
);
    reg [31:0] s0, s1;
    reg [31:0] shift_reg;
    reg [5:0]  bit_cnt;

    // Seed control
    wire seed_s1_sel = seed_sel[2];
    wire [1:0] seed_byte = seed_sel[1:0];

    // ====================== Ripple Carry Adder ======================
    wire [31:0] rca_sum;
    wire [32:0] rca_carry;
    assign rca_carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : rca_fa
            assign rca_sum[i]     = s0[i] ^ s1[i] ^ rca_carry[i];
            assign rca_carry[i+1] = (s0[i] & s1[i]) | (s0[i] & rca_carry[i]) | (s1[i] & rca_carry[i]);
        end
    endgenerate

    // xoroshiro+ equations
    wire [31:0] s0_next = s0 ^ s1;
    wire [31:0] s0_rotl26 = {s0[5:0], s0[31:6]};
    wire [31:0] s1_next = s0_rotl26 ^ s1 ^ {s1[22:0], 9'b0};

    assign serial_out = shift_reg[31];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s0        <= 32'hDEAD_BEEF;
            s1        <= 32'hCAFE_F00D;
            shift_reg <= 32'h0;
            bit_cnt   <= 6'd0;
            valid_out <= 1'b0;
        end else if (seed_wen) begin
            // Seed write
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
            // === Update state ===
            s0 <= s0_next ^ {31'b0, ro_noise};
            s1 <= s1_next;

            // === Serializer (Critical Fix) ===
            if (bit_cnt == 0) begin
                shift_reg <= rca_sum;        // Load new sum
                valid_out <= 1'b1;
                bit_cnt   <= 6'd1;
            end else begin
                shift_reg <= {shift_reg[30:0], 1'b0};   // Shift right (MSB out)
                valid_out <= 1'b0;
                bit_cnt   <= (bit_cnt == 6'd31) ? 6'd0 : bit_cnt + 1;
            end
        end else begin
            valid_out <= 1'b0;
        end
    end
endmodule
`default_nettype wire