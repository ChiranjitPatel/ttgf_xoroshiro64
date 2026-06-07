// `default_nettype none

// `ifdef USE_POWER_PINS
        // `define LINT_OFF_PINMISSING_POWER_PINS /* verilator lint_off PINMISSING */
        // `define LINT_ON_PINMISSING_POWER_PINS  /* verilator lint_on PINMISSING */
// `endif
	
// module GF_inverter (
    // input   wire a,
    // output  wire y
// );
 // `LINT_OFF_PINMISSING_POWER_PINS
    // (* keep_hierarchy *) gf180mcu_fd_sc_mcu7t5v0__inv_1    gf180mcu_inverter (
        // .I  (a),
        // .ZN  (y)
    // );

// `LINT_ON_PINMISSING_POWER_PINS

// endmodule

// module ring_osc #(
    // parameter DEPTH = 500 // Becomes DEPTH*2+1 inverters to ensure it is odd.
// ) (
    // input wire ena,
    // output wire osc_out
// );

    // wire [DEPTH*2:0] inv_in;
    // wire [DEPTH*2:0] inv_out;
    // assign inv_in[DEPTH*2:1] = inv_out[DEPTH*2-1:0]; // Chain.
    // assign inv_in[0] = inv_out[DEPTH*2] & ena; // Loop back.
    // // Generate an instance array of inverters, chained and looped back via the 2 assignments above:
    // (* keep_hierarchy *) GF_inverter inv_array [DEPTH*2:0] ( .a(inv_in), .y(inv_out) );
    // assign osc_out = inv_in[0];

// endmodule

// `ifdef LINT_OFF_PINMISSING_POWER_PINS
    // `undef LINT_OFF_PINMISSING_POWER_PINS
// `endif

// `ifdef LINT_ON_PINMISSING_POWER_PINS
    // `undef LINT_ON_PINMISSING_POWER_PINS
// `endif


`default_nettype none

module GF_inverter (
    input wire a,
    output wire y
);
    (* keep_hierarchy *) gf180mcu_fd_sc_mcu7t5v0__inv_1 gf180mcu_inverter (
        .I (a),
        .ZN (y)
        // Add power pins if your flow requires them:
        // .VPWR(1'b1), .VGND(1'b0)  // or connect to actual supplies
    );
endmodule

module ring_osc #(
    parameter DEPTH = 500  // Becomes DEPTH*2+1 inverters (odd number)
) (
    input wire ena,
    output wire osc_out
);
    wire [DEPTH*2:0] inv_in;
    wire [DEPTH*2:0] inv_out;

    // Chain the inverters
    assign inv_in[DEPTH*2:1] = inv_out[DEPTH*2-1:0];
    // Close the ring (enable controlled)
    assign inv_in[0] = inv_out[DEPTH*2] & ena;

    // Instantiate the array of inverters
    GF_inverter inv_array [DEPTH*2:0] (
        .a(inv_in),
        .y(inv_out)
    );

    assign osc_out = inv_in[0];
endmodule