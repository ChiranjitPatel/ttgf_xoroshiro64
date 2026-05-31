// =============================================================================
// tt_um_xoroshiro64plus — TinyTapeout wrapper
// =============================================================================
// TinyTapeout standard port map:
//   ui_in  [7:0]  : dedicated inputs
//   uo_out [7:0]  : dedicated outputs
//   uio_in [7:0]  : bidirectional (used as inputs here)
//   uio_out[7:0]  : bidirectional outputs
//   uio_oe [7:0]  : bidirectional output-enable (1 = drive out)
//   ena           : project enable (from TT infrastructure)
//   clk           : clock
//   rst_n         : reset, active low
//
// Pin assignment:
// ── ui_in (8 dedicated inputs) ───────────────────────────────────────────────
//   [7:0]  seed_data[7:0]   — 8-bit seed byte
//
// ── uio_in (bidirectional, used as inputs) ───────────────────────────────────
//   [2:0]  seed_sel[2:0]    — byte address (000..111 → S0/S1 bytes 0..3)
//   [3]    seed_wen          — seed write enable
//   [4]    enable            — PRNG enable
//   [5]    ro_noise          — 1-bit RO entropy input
//   [7:6]  (reserved / GND)
//
// ── uo_out (8 dedicated outputs) ─────────────────────────────────────────────
//   [0]    serial_out        — MSB-first 32-bit serial stream
//   [1]    valid_out         — pulses high when new 32-bit word starts
//   [7:2]  (tied 0)
// =============================================================================

`default_nettype none

module tt_um_xoroshiro64plus (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    // All bidir pins used as inputs; drive outputs low, OE = 0
    assign uio_out = 8'h00;
    assign uio_oe  = 8'h00;

    // Unpack controls from uio_in
    wire [2:0] seed_sel  = uio_in[2:0];
    wire       seed_wen  = uio_in[3];
    wire       enable    = uio_in[4] & ena;  // AND with TT project-enable
    wire       ro_noise  = uio_in[5];

    // Serial outputs
    wire serial_out_w, valid_out_w;
	
	// List all unused inputs to prevent warnings
	wire _unused = &{uio_in[7:6], 1'b0};

    assign uo_out[0]   = serial_out_w;
    assign uo_out[1]   = valid_out_w;
    assign uo_out[7:2] = 6'b0;

    xoroshiro64plus u_core (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (enable),
        .ro_noise   (ro_noise),
        .seed_data  (ui_in[7:0]),
        .seed_wen   (seed_wen),
        .seed_sel   (seed_sel),
        .serial_out (serial_out_w),
        .valid_out  (valid_out_w)
    );

endmodule

`default_nettype wire
