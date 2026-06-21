// `default_nettype none
// module tb_tt_um_xoroshiro64plus;

    // // ====================== Signals ======================
    // reg        clk     = 0;
    // reg        rst_n   = 0;
    // reg        ena     = 1;
    // reg [7:0]  ui_in   = 0;
    // reg [7:0]  uio_in  = 0;
    
    // wire [7:0] uo_out;
    // wire [7:0] uio_out;
    // wire [7:0] uio_oe;

    // wire serial_out = uo_out[0];
    // wire valid_out  = uo_out[1];

    // // ====================== Clock Generation ======================
    // always #5 clk = ~clk;   // 100 MHz clock for simulation

    // // ====================== DUT Instantiation ======================
    // tt_um_xoroshiro64plus dut (
        // .ui_in   (ui_in),
        // .uo_out  (uo_out),
        // .uio_in  (uio_in),
        // .uio_out (uio_out),
        // .uio_oe  (uio_oe),
        // .ena     (ena),
        // .clk     (clk),
        // .rst_n   (rst_n)
    // );

    // // ====================== Seed Loading Task ======================
    // task load_seed;
        // input [63:0] seed;
        // integer i;
        // begin
            // $display("\n=== Loading 64-bit seed = %h ===", seed);
            
            // // Load S0 (4 bytes)
            // for (i = 0; i < 4; i = i + 1) begin
                // @(posedge clk);
                // ui_in       <= seed[8*i +: 8];
                // uio_in[2:0] <= i;           // 000 to 011 for S0
                // uio_in[3]   <= 1'b1;        // seed_wen
                // @(posedge clk);
                // uio_in[3]   <= 1'b0;
            // end

            // // Load S1 (4 bytes)
            // for (i = 0; i < 4; i = i + 1) begin
                // @(posedge clk);
                // ui_in       <= seed[32 + 8*i +: 8];
                // uio_in[2:0] <= 4 + i;       // 100 to 111 for S1
                // uio_in[3]   <= 1'b1;
                // @(posedge clk);
                // uio_in[3]   <= 1'b0;
            // end

            // $display("Seed loading completed.");
        // end
    // endtask

    // // ====================== Main Test Sequence ======================
    // initial begin
        // $dumpfile("xoroshiro_tb.vcd");
        // $dumpvars(0, tb_tt_um_xoroshiro64plus);

        // // Initial reset
        // rst_n = 0;
        // ena   = 1;
        // uio_in = 8'b0;
        // #30;
        // rst_n = 1;
        // #20;

        // // === Test 1: Load a known seed ===
        // load_seed(64'h1234_5678_9ABC_DEF0);

        // // Enable PRNG
        // uio_in[4] = 1'b1;     // enable = 1
        // #100;

        // // Let it run for some time
        // #5000;

        // // === Test 2: Load another seed ===
        // load_seed(64'hDEAD_BEEF_CAFE_F00D);

        // #8000;

        // $display("\n=== Simulation finished successfully ===\n");
        // $finish;
    // end

    // // ====================== Monitor Output ======================
    // always @(posedge clk) begin
        // if (valid_out) begin
            // $display("Time=%0t | VALID | New 32-bit word started (serial MSB first)", $time);
        // end
    // end

    // // Optional: Monitor serial stream (you can enable if needed)
    // // always @(posedge clk) begin
    // //     $display("Time=%0t | serial=%b valid=%b", $time, serial_out, valid_out);
    // // end

// endmodule
// `default_nettype wire




`default_nettype none
module tb_tt_um_xoroshiro64plus;

    reg        clk     = 0;
    reg        rst_n   = 0;
    reg        ena     = 1;
    reg [7:0]  ui_in   = 0;
    reg [7:0]  uio_in  = 0;
    
    wire [7:0] uo_out;

    wire serial_out = uo_out[0];
    wire valid_out  = uo_out[1];

    always #5 clk = ~clk;   // 100 MHz

    tt_um_xoroshiro64plus dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (),
        .uio_oe  (),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // ====================== Seed Loading Task ======================
    task load_seed;
        input [63:0] seed;
        integer i;
        begin
            $display("\n=== Loading seed = %h ===", seed);
            
            // S0 bytes
            for (i = 0; i < 4; i = i + 1) begin
                @(posedge clk);
                ui_in       <= seed[8*i +: 8];
                uio_in[2:0] <= i;
                uio_in[3]   <= 1'b1;
                @(posedge clk);
                uio_in[3]   <= 1'b0;
            end

            // S1 bytes
            for (i = 0; i < 4; i = i + 1) begin
                @(posedge clk);
                ui_in       <= seed[32 + 8*i +: 8];
                uio_in[2:0] <= 4 + i;
                uio_in[3]   <= 1'b1;
                @(posedge clk);
                uio_in[3]   <= 1'b0;
            end

            // IMPORTANT: Clear seed_data after loading
            @(posedge clk);
            ui_in <= 8'h00;
            $display("Seed loaded and ui_in cleared.");
        end
    endtask

    // ====================== Main Test ======================
    initial begin
        $dumpfile("xoroshiro_tb.vcd");
        $dumpvars(0, tb_tt_um_xoroshiro64plus);

        rst_n = 0;
        uio_in = 0;
        #40;
        rst_n = 1;
        #20;

        load_seed(64'h1234_5678_9ABC_DEF0);

        uio_in[4] = 1'b1;        // enable PRNG
        uio_in[7:6] = 2'b00;     // external clock

        #2000;

        // Monitor first 8 outputs
        repeat(8) @(posedge valid_out);

        $display("\n=== Simulation finished ===\n");
        $finish;
    end

    // ====================== Output Monitor ======================
    always @(posedge clk) begin
        if (valid_out) begin
            $display("Time=%0t | VALID_OUT | Output = %h   | ui_in=%h", 
                     $time, dut.u_core.shift_reg, ui_in);
        end
    end

endmodule
`default_nettype wire