`default_nettype none
module tb_xoroshiro64plus_v2;

    reg clk = 0;
    always #5 clk = ~clk;        // 100 MHz external clock for simulation

    reg rst_n = 0;
    reg [7:0] ui_in = 0;
    reg [7:0] uio_in = 0;
    wire [7:0] uo_out;

    wire serial_out = uo_out[0];
    wire valid_out  = uo_out[1];

    integer i;

    // Instantiate DUT
    tt_um_xoroshiro64plus_v2 dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (),
        .uio_oe  (),
        .ena     (1'b1),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // ====================== Seed Loading Task ======================
    task load_seed;
        input [63:0] seed;
        begin
            $display("=== Loading 64-bit seed = %h ===", seed);
            
            // Write S0 bytes
            for (i = 0; i < 4; i = i + 1) begin
                @(posedge clk);
                ui_in     = seed[8*i +: 8];      // byte i of S0
                uio_in[2:0] = i;                 // seed_sel = 000 to 011
                uio_in[3]   = 1'b1;              // seed_wen = 1
                @(posedge clk);
                uio_in[3]   = 1'b0;              // pulse
            end

            // Write S1 bytes
            for (i = 0; i < 4; i = i + 1) begin
                @(posedge clk);
                ui_in       = seed[32 + 8*i +: 8]; // byte i of S1
                uio_in[2:0] = 4 + i;               // seed_sel = 100 to 111
                uio_in[3]   = 1'b1;
                @(posedge clk);
                uio_in[3]   = 1'b0;
            end
            
            $display("Seed loading completed.");
        end
    endtask

    // ====================== Main Test Sequence ======================
    initial begin
        // $dumpfile("xoroshiro_tb.vcd");
        // $dumpvars(0, tb_xoroshiro);

        rst_n = 0;
        uio_in = 8'b00_000000;   // clk_sel = 00 (external clk)
        #50;
        rst_n = 1;
        #20;

        // === Test 1: Load custom seed ===
        load_seed(64'h1234_5678_9ABC_DEF0);

        // Select 50MHz RO for faster simulation output
        uio_in[7:6] = 2'b01;     // clk_sel = 01 → ~50MHz RO (behavioral)
        uio_in[4]   = 1'b1;      // enable = 1

        #2000;                   // Let it run for a while

        // === Test 2: Load another seed ===
        load_seed(64'hDEAD_BEEF_CAFE_F00D);

        #5000;

        $display("Simulation finished.");
        $finish;
    end

    // Monitor output
    always @(posedge clk) begin
        if (valid_out) begin
            $display("Time=%0t | New 32-bit word: %h (serial MSB first)", $time, dut.u_core.output_reg);
        end
    end

endmodule
`default_nettype wire