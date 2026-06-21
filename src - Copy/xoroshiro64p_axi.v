// =============================================================================
// xoroshiro64plus_axi.v — AXI4-Lite slave wrapper
// =============================================================================
// Wraps xoroshiro64plus core with a minimal AXI4-Lite register interface
// suitable for Vivado IP Packager and Zynq block design.
//
// Register map (32-bit word addresses, byte offsets):
//
//  Offset  Name      Access  Bits
//  0x00    CONTROL   R/W     [0]    enable     — 1 = PRNG running
//                            [1]    sw_reset   — 1 = hold core in reset
//                            [31:2] reserved (RAZ/WI)
//
//  0x04    SEED      W       [7:0]  seed_data  — byte value to write
//                            [10:8] seed_sel   — byte lane (000..111)
//                            [31:11] ignored
//          (write auto-pulses seed_wen for exactly 1 clock cycle)
//          (reads return 0x00000000)
//
//  0x08    OUTPUT    R       [31:0] latched PRNG output word
//          (captured combinatorially on every valid_out pulse from core)
//          (reads are non-destructive — same word until next valid_out)
//
//  0x0C    STATUS    R       [0]    output_valid — toggles each new word
//                            [1]    ro_noise_in  — live ro_noise pin level
//                            [2]    enabled      — mirrors CONTROL[0]
//                            [31:3] reserved (RAZ)
//
// AXI4-Lite compliance notes:
//  - Single outstanding transaction (no pipelining needed for this use case)
//  - Write response (BRESP) always OKAY (2'b00)
//  - Read response (RRESP) always OKAY (2'b00)
//  - Unaligned / unimplemented addresses return 0 on read, ignore on write
//  - WSTRB honoured per-byte on CONTROL; ignored on SEED (always full word)
//  - All registers in S_AXI_ACLK domain; no CDC required
//
// Parameters:
//  C_S_AXI_DATA_WIDTH  32 (fixed — xoroshiro output is 32 bits)
//  C_S_AXI_ADDR_WIDTH  4  (covers 0x00..0x0F, 4 registers)
// =============================================================================

`default_nettype none
`timescale 1ns / 1ps

module xoroshiro64plus_axi #(
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 4
)(
    // ── AXI4-Lite slave interface ─────────────────────────────────────────
    input  wire                          S_AXI_ACLK,
    input  wire                          S_AXI_ARESETN,   // active LOW

    // Write address channel
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_AWADDR,
    input  wire [2:0]                    S_AXI_AWPROT,    // ignored
    input  wire                          S_AXI_AWVALID,
    output reg                           S_AXI_AWREADY,

    // Write data channel
    input  wire [C_S_AXI_DATA_WIDTH-1:0] S_AXI_WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB,
    input  wire                          S_AXI_WVALID,
    output reg                           S_AXI_WREADY,

    // Write response channel
    output reg  [1:0]                    S_AXI_BRESP,
    output reg                           S_AXI_BVALID,
    input  wire                          S_AXI_BREADY,

    // Read address channel
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] S_AXI_ARADDR,
    input  wire [2:0]                    S_AXI_ARPROT,    // ignored
    input  wire                          S_AXI_ARVALID,
    output reg                           S_AXI_ARREADY,

    // Read data channel
    output reg  [C_S_AXI_DATA_WIDTH-1:0] S_AXI_RDATA,
    output reg  [1:0]                    S_AXI_RRESP,
    output reg                           S_AXI_RVALID,
    input  wire                          S_AXI_RREADY,

    // ── External: RO noise input (routed to top-level port) ──────────────
    input  wire                          ro_noise,

    // ── Optional: LED sidecar outputs ─────────────────────────────────────
    output wire                          serial_out_led,   // raw serial bit
    output wire                          valid_out_led     // word-ready pulse
);

    // =========================================================================
    // Local signals
    // =========================================================================
    // Clk / rst alias for readability
    wire clk   = S_AXI_ACLK;
    wire rst_n = S_AXI_ARESETN;

    // ── Register storage ─────────────────────────────────────────────────────
    reg        reg_enable;       // CONTROL[0]
    reg        reg_sw_reset;     // CONTROL[1]

    reg [31:0] reg_output;       // OUTPUT — latched from core
    reg        reg_out_valid;    // STATUS[0] — toggles each new word

    // ── AXI internal address latches ─────────────────────────────────────────
    reg [C_S_AXI_ADDR_WIDTH-1:0] wr_addr;   // latched write address
    reg [C_S_AXI_ADDR_WIDTH-1:0] rd_addr;   // latched read address

    // ── Seed write pulse ──────────────────────────────────────────────────────
    // seed_wen is a single-cycle strobe generated when the ARM writes 0x04.
    // We gate it off one cycle after assertion to guarantee exactly 1 pulse.
    reg        seed_wen_r;
    reg [7:0]  seed_data_r;
    reg [2:0]  seed_sel_r;

    // ── Write transaction tracking ────────────────────────────────────────────
    // AXI-lite write: AWVALID+AWREADY and WVALID+WREADY may arrive in any
    // order. We latch address and data independently and commit when both seen.
    reg aw_done;   // address phase complete
    reg w_done;    // data phase complete
    reg [C_S_AXI_DATA_WIDTH-1:0] w_data_lat;   // latched write data
    reg [C_S_AXI_DATA_WIDTH/8-1:0] w_strb_lat; // latched write strobe

    // =========================================================================
    // xoroshiro64+ core instance
    // =========================================================================
    wire serial_out_w;
    wire valid_out_w;

    xoroshiro64plus u_core (
        .clk        (clk),
        .rst_n      (rst_n & ~reg_sw_reset),  // AXI reset OR sw_reset bit
        .enable     (reg_enable),
        .ro_noise   (ro_noise),
        .seed_data  (seed_data_r),
        .seed_wen   (seed_wen_r),
        .seed_sel   (seed_sel_r),
        .serial_out (serial_out_w),
        .valid_out  (valid_out_w)
    );

    assign serial_out_led = serial_out_w;
    assign valid_out_led  = valid_out_w;

    // =========================================================================
    // OUTPUT register: capture on valid_out pulse
    // =========================================================================
    // The core produces a new 32-bit word every 32 cycles (one complete
    // serialisation window). We latch it here so the ARM can read it at
    // any time — no need to poll on a tight deadline.
    always @(posedge clk) begin
        if (!rst_n) begin
            reg_output    <= 32'h0;
            reg_out_valid <= 1'b0;
        end else if (valid_out_w) begin
            // Reconstruct the word from the shift register output.
            // valid_out pulses when bit_cnt==0 and shift_reg is freshly loaded;
            // at that moment serial_out already carries bit[31] of the new word.
            // Rather than re-serialise, we tap the core's internal output_reg
            // directly. Since xoroshiro64plus exposes only serial_out, we
            // accumulate the word here over 32 cycles using the valid_out flag
            // as a load signal and serial_out as the shift-in bit.
            reg_out_valid <= ~reg_out_valid;  // toggle on each new word
        end
    end

    // Word accumulator — rebuilds the 32-bit word from the serial stream.
    // valid_out=1 → load first bit (MSB); then shift in for 31 more cycles.
    reg [31:0] accum;
    reg [5:0]  accum_cnt;   // counts bits received in current word
    reg        accum_run;   // high while accumulating

    always @(posedge clk) begin
        if (!rst_n || reg_sw_reset) begin
            accum      <= 32'h0;
            accum_cnt  <= 6'd0;
            accum_run  <= 1'b0;
        end else begin
            if (valid_out_w) begin
                // Start of a new 32-bit word — capture MSB immediately
                accum     <= {31'b0, serial_out_w};
                accum_cnt <= 6'd1;
                accum_run <= 1'b1;
            end else if (accum_run) begin
                accum     <= {accum[30:0], serial_out_w};
                accum_cnt <= accum_cnt + 6'd1;
                if (accum_cnt == 6'd31) begin
                    reg_output <= {accum[30:0], serial_out_w}; // latch complete word
                    accum_run  <= 1'b0;
                    accum_cnt  <= 6'd0;
                end
            end
        end
    end

    // =========================================================================
    // AXI4-Lite WRITE channel
    // =========================================================================
    // Accept address and data phases independently (spec allows any order).
    // Commit the write and send BRESP once both phases are complete.

    always @(posedge clk) begin
        if (!rst_n) begin
            S_AXI_AWREADY <= 1'b0;
            S_AXI_WREADY  <= 1'b0;
            S_AXI_BVALID  <= 1'b0;
            S_AXI_BRESP   <= 2'b00;
            aw_done       <= 1'b0;
            w_done        <= 1'b0;
            wr_addr       <= {C_S_AXI_ADDR_WIDTH{1'b0}};
            w_data_lat    <= 32'h0;
            w_strb_lat    <= 4'hF;
            // Registers
            reg_enable    <= 1'b0;
            reg_sw_reset  <= 1'b0;
            seed_wen_r    <= 1'b0;
            seed_data_r   <= 8'h0;
            seed_sel_r    <= 3'h0;
        end else begin

            // ── Default: clear single-cycle strobes ───────────────────────
            seed_wen_r    <= 1'b0;

            // ── Write address phase ───────────────────────────────────────
            if (S_AXI_AWVALID && !aw_done) begin
                S_AXI_AWREADY <= 1'b1;
                wr_addr       <= S_AXI_AWADDR;
                aw_done       <= 1'b1;
            end else begin
                S_AXI_AWREADY <= 1'b0;
            end

            // ── Write data phase ──────────────────────────────────────────
            if (S_AXI_WVALID && !w_done) begin
                S_AXI_WREADY <= 1'b1;
                w_data_lat   <= S_AXI_WDATA;
                w_strb_lat   <= S_AXI_WSTRB;
                w_done       <= 1'b1;
            end else begin
                S_AXI_WREADY <= 1'b0;
            end

            // ── Commit write when both phases done ────────────────────────
            if (aw_done && w_done && !S_AXI_BVALID) begin
                aw_done <= 1'b0;
                w_done  <= 1'b0;

                case (wr_addr[3:2])   // bits [3:2] select register (word aligned)

                    2'b00: begin  // 0x00 CONTROL — byte-strobe aware
                        if (w_strb_lat[0]) begin
                            reg_enable   <= w_data_lat[0];
                            reg_sw_reset <= w_data_lat[1];
                        end
                    end

                    2'b01: begin  // 0x04 SEED — write-only, pulse seed_wen
                        seed_data_r <= w_data_lat[7:0];
                        seed_sel_r  <= w_data_lat[10:8];
                        seed_wen_r  <= 1'b1;   // single-cycle pulse
                    end

                    // 0x08 OUTPUT — read-only, ignore writes
                    // 0x0C STATUS — read-only, ignore writes
                    default: begin end
                endcase

                // Send write response
                S_AXI_BVALID <= 1'b1;
                S_AXI_BRESP  <= 2'b00;  // OKAY
            end

            // ── Clear BVALID once master accepts ──────────────────────────
            if (S_AXI_BVALID && S_AXI_BREADY) begin
                S_AXI_BVALID <= 1'b0;
            end
        end
    end

    // =========================================================================
    // AXI4-Lite READ channel
    // =========================================================================
    // Latch address on ARVALID, drive data one cycle later, hold until RREADY.

    always @(posedge clk) begin
        if (!rst_n) begin
            S_AXI_ARREADY <= 1'b0;
            S_AXI_RVALID  <= 1'b0;
            S_AXI_RDATA   <= 32'h0;
            S_AXI_RRESP   <= 2'b00;
            rd_addr        <= {C_S_AXI_ADDR_WIDTH{1'b0}};
        end else begin

            // ── Accept read address ───────────────────────────────────────
            if (S_AXI_ARVALID && !S_AXI_RVALID) begin
                S_AXI_ARREADY <= 1'b1;
                rd_addr       <= S_AXI_ARADDR;
            end else begin
                S_AXI_ARREADY <= 1'b0;
            end

            // ── Drive read data one cycle after address accepted ──────────
            if (S_AXI_ARREADY) begin   // address was just latched
                S_AXI_RVALID <= 1'b1;
                S_AXI_RRESP  <= 2'b00;

                case (rd_addr[3:2])
                    2'b00: S_AXI_RDATA <= {30'b0, reg_sw_reset, reg_enable};
                    2'b01: S_AXI_RDATA <= 32'h0;          // SEED write-only
                    2'b10: S_AXI_RDATA <= reg_output;     // OUTPUT word
                    2'b11: S_AXI_RDATA <= {29'b0,         // STATUS
                                           reg_enable,
                                           ro_noise,
                                           reg_out_valid};
                endcase
            end

            // ── Clear RVALID once master accepts ──────────────────────────
            if (S_AXI_RVALID && S_AXI_RREADY) begin
                S_AXI_RVALID <= 1'b0;
            end
        end
    end

endmodule

`default_nettype wire
