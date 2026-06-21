`default_nettype none

module GF_inverter (
    input   wire a,
    output  wire y
);
    /* verilator lint_off PINMISSING */
    (* keep_hierarchy *) gf180mcu_fd_sc_mcu7t5v0__inv_1    gf180mcu_inverter (
        .I  (a),
        .ZN  (y)
    );
    /* verilator lint_on PINMISSING */
endmodule

module ring_osc #(
    parameter STAGES = 21 // Becomes STAGES*2+1 inverters to ensure it is odd.
) (
    input wire ena,
    output wire osc_out
);
    wire [STAGES*2:0] inv_in;
    wire [STAGES*2:0] inv_out;
    assign inv_in[STAGES*2:1] = inv_out[STAGES*2-1:0]; // Chain.
    assign inv_in[0] = inv_out[STAGES*2] & ena;        // Loop back.
    (* keep_hierarchy *) GF_inverter inv_array [STAGES*2:0] ( .a(inv_in), .y(inv_out) );
    assign osc_out = inv_in[0];
endmodule
`default_nettype wire

//====================== FPGA Ring Oscillator ======================
// module ring_osc #(
    // parameter STAGES = 21
// ) (
    // input wire ena,
    // output wire osc_out
// );
    // (* keep = "true", dont_touch = "true" *)
    // wire [STAGES-1:0] chain;

    // genvar i;
    // generate
        // for (i = 0; i < STAGES; i = i + 1) begin : ro_inv
            // if (i == 0)
                // assign chain[0] = ~chain[STAGES-1] & ena;
            // else
                // assign chain[i] = ~chain[i-1];
        // end
    // endgenerate

    // assign osc_out = chain[0];
// endmodule

// `default_nettype wire