`default_nettype none

module tt_um_xoroshiro64plus_v2 (
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input wire ena,
    input wire clk,
    input wire rst_n
);

    assign uio_out = 8'h00;
    assign uio_oe  = 8'h00;

    // Signal unpacking
    // uio_in[2:0] : seed_sel
    // uio_in[3]   : seed_wen
    // uio_in[4]   : enable
    // uio_in[5]   : ro_noise (external entropy input, tied to 0 if unused)
    // uio_in[7:6] : unused
    wire [2:0] seed_sel = uio_in[2:0];
    wire seed_wen       = uio_in[3];
    wire enable         = uio_in[4] & ena;
    wire ro_noise       = uio_in[5];

    // ====================== Ring Oscillators ======================
    // Outputs exposed on uo_out[3:2] for entropy measurement / observation.
    // Not connected to core clock — core always runs on the TT-provided clk.
    wire osc_fast, osc_slow;

    ring_osc #(.STAGES(67)) ro_fast (.ena(ena), .osc_out(osc_fast));
    ring_osc #(.STAGES(97)) ro_slow (.ena(ena), .osc_out(osc_slow));

    // ====================== Core ======================
    wire serial_out_w, valid_out_w;

    xoroshiro64plus u_core (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (enable),
        .ro_noise   (ro_noise),
        .seed_data  (ui_in),
        .seed_wen   (seed_wen),
        .seed_sel   (seed_sel),
        .serial_out (serial_out_w),
        .valid_out  (valid_out_w)
    );

	// List all unused inputs to prevent warnings
	wire _unused = &{uio_in[7:6], 1'b0};
	
    // ====================== Output Assignments ======================
    // uo_out[0] : serial_out  — PRNG bitstream
    // uo_out[1] : valid_out   — pulses high when a new 32-bit word begins
    // uo_out[2] : osc_fast    — ring oscillator (~fast), 53*2+1 = 107 inverters
    // uo_out[3] : osc_slow    — ring oscillator (~slow), 97*2+1 = 195 inverters
    // uo_out[7:4] : reserved, driven low
    assign uo_out[0]   = serial_out_w;
    assign uo_out[1]   = valid_out_w;
    assign uo_out[2]   = osc_fast;
    assign uo_out[3]   = osc_slow;
    assign uo_out[7:4] = 4'b0;

endmodule