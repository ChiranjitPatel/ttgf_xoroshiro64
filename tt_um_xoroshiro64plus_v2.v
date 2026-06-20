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

    wire [2:0] seed_sel = uio_in[2:0];
    wire seed_wen       = uio_in[3];
    wire enable         = uio_in[4] & ena;
    wire ro_noise       = uio_in[5];
    wire [1:0] clk_sel  = uio_in[7:6];

    // ====================== FPGA Ring Oscillators ======================
    wire osc_50m, osc_30m;

    ring_osc_fpga #(.STAGES(21)) ro50 (.ena(1'b1), .osc_out(osc_50m));
    ring_osc_fpga #(.STAGES(35)) ro30 (.ena(1'b1), .osc_out(osc_30m));

    // Clock mux
    wire core_clk;
    always @(*) begin
        case (clk_sel)
            2'b01:   core_clk = osc_50m;
            2'b10:   core_clk = osc_30m;
            default: core_clk = clk;
        endcase
    end

    wire serial_out_w, valid_out_w;

    xoroshiro64plus u_core (
        .clk        (core_clk),
        .rst_n      (rst_n),
        .enable     (enable),
        .ro_noise   (ro_noise),
        .seed_data  (ui_in),
        .seed_wen   (seed_wen),
        .seed_sel   (seed_sel),
        .serial_out (serial_out_w),
        .valid_out  (valid_out_w)
    );

    assign uo_out[0] = serial_out_w;
    assign uo_out[1] = valid_out_w;
    assign uo_out[7:2] = 6'b0;

endmodule


// ====================== Behavioral Ring Oscillator for FPGA ======================
module ring_osc_fpga #(
    parameter STAGES = 21
) (
    input wire ena,
    output wire osc_out
);
    (* keep = "true", dont_touch = "true" *)
    wire [STAGES-1:0] chain;

    genvar i;
    generate
        for (i = 0; i < STAGES; i = i + 1) begin
            if (i == 0)
                assign chain[0] = ~chain[STAGES-1] & ena;
            else
                assign chain[i] = ~chain[i-1];
        end
    endgenerate

    assign osc_out = chain[0];
endmodule

`default_nettype wire