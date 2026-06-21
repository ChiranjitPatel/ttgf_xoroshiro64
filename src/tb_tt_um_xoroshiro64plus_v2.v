`timescale 1ns / 1ps
//==============================================================================
// Testbench: tb_tt_um_xoroshiro64plus_v2
// DUT: tt_um_xoroshiro64plus_v2 (TinyTapeout top wrapper)
//
// IMPORTANT - empirically verified RO clock-mux behavior in behavioral sim
// --------------------------------------------------------------------------
// ring_osc_fpga is an UNTIMED combinational inverter ring (odd stage count,
// ena tied permanently to 1'b1). It is instantiated unconditionally, so it
// is "live" from time 0 regardless of clk_sel.
//
// Verified with Icarus Verilog: this does NOT hang the simulator and does
// NOT actually oscillate. Because NOT(X) = X and X & 1'b1 = X in 4-state
// Verilog, the ring reaches a stable fixed point of all-X within the first
// few delta cycles at time 0 and then never changes again. The practical
// effect: whenever clk_sel selects osc_50m or osc_30m, core_clk becomes a
// constant X and the xoroshiro64plus core simply freezes (no posedge ever
// fires), rather than the RO genuinely toggling at ~50MHz/~30MHz.
//
// This is a known limitation of untimed RTL/behavioral simulation for
// self-oscillating loops, not a DUT bug -- on real silicon, real gate
// delays make it oscillate. True RO frequency/jitter can only be observed
// in a gate-level simulation back-annotated with SDF timing, which is
// outside the scope of an RTL testbench.
//
// This testbench therefore does two separate things for the RO paths:
//   1) Test F: explicitly confirms/documents the X-freeze behavior above,
//      so a future simulator/tool change that alters this is visible.
//   2) Test G: uses `force`/`release` on the hierarchical RO output nets
//      (dut.osc_50m / dut.osc_30m) to inject a clean synthetic clock
//      standing in for "RO is actually oscillating" and confirms the
//      clock MUX and downstream core logic work correctly through that
//      path. This validates the mux/wiring/core, NOT the RO's real
//      analog behavior.
//
// All other functional verification (seeding, enable gating, serializer
// framing) uses clk_sel=00 (external clk), backed by a bit-exact golden
// RTL twin of the xoroshiro64plus core that runs in lockstep with the DUT
// and is compared every cycle.
//==============================================================================

module tb_tt_um_xoroshiro64plus_v2;

    // ------------------------------------------------------------
    // DUT I/O
    // ------------------------------------------------------------
    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    reg  [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    reg        ena;
    reg        clk;
    reg        rst_n;

    wire serial_out = uo_out[0];
    wire valid_out  = uo_out[1];

    tt_um_xoroshiro64plus_v2 dut (
        .ui_in   (ui_in),
        .uo_out  (uo_out),
        .uio_in  (uio_in),
        .uio_out (uio_out),
        .uio_oe  (uio_oe),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // ------------------------------------------------------------
    // Clock: 100MHz external clk (used whenever clk_sel = 2'b00)
    // ------------------------------------------------------------
    localparam CLK_PERIOD = 10;
    initial clk = 1'b0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ------------------------------------------------------------
    // Synthetic stand-in oscillators for forced-clock RO tests (Test G).
    // Nominal periods only -- NOT a model of real RO frequency/jitter.
    // ------------------------------------------------------------
    reg osc50_gen, osc30_gen;
    initial osc50_gen = 1'b0;
    initial osc30_gen = 1'b0;
    always #10   osc50_gen = ~osc50_gen; // ~50MHz stand-in (20ns period)
    always #16.7 osc30_gen = ~osc30_gen; // ~30MHz stand-in (33.4ns period)

    // ------------------------------------------------------------
    // Waveform dump
    // ------------------------------------------------------------
    // initial begin
        // $dumpfile("tb_tt_um_xoroshiro64plus_v2.vcd");
        // $dumpvars(0, tb_tt_um_xoroshiro64plus_v2);
    // end

    // ------------------------------------------------------------
    // Watchdog
    // ------------------------------------------------------------
    // initial begin
        // #1000000;
        // $display("[%0t] ERROR: Watchdog timeout - simulation did not finish", $time);
        // $finish;
    // end

    //==============================================================
    // Golden reference model of xoroshiro64plus (bit-exact RTL twin),
    // clocked by the same `clk` used by the DUT when clk_sel=00.
    // Only meaningful while clk_sel=00; comparisons are gated by
    // `checking_enabled`, which test phases turn off before switching
    // to an RO clk_sel.
    //==============================================================
    reg [31:0] g_s0, g_s1, g_shift;
    reg [5:0]  g_bit_cnt;
    reg        g_valid;

    wire        g_enable      = uio_in[4] & ena;
    wire        g_seed_wen    = uio_in[3];
    wire [2:0]  g_seed_sel    = uio_in[2:0];
    wire        g_ro_noise    = uio_in[5];
    wire        g_seed_s1_sel = g_seed_sel[2];
    wire [1:0]  g_seed_byte   = g_seed_sel[1:0];
    wire [31:0] g_rca_sum     = g_s0 + g_s1;
    wire [31:0] g_s0_next     = g_s0 ^ g_s1;
    wire [31:0] g_s0_rotl26   = {g_s0[5:0], g_s0[31:6]};
    wire [31:0] g_s1_next     = g_s0_rotl26 ^ g_s1 ^ {g_s1[22:0], 9'b0};
    wire        g_serial_out  = g_shift[31];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            g_s0      <= 32'hDEAD_BEEF;
            g_s1      <= 32'hCAFE_F00D;
            g_shift   <= 32'h0;
            g_bit_cnt <= 6'd0;
            g_valid   <= 1'b0;
        end else if (g_seed_wen) begin
            if (!g_seed_s1_sel) begin
                case (g_seed_byte)
                    2'b00: g_s0[ 7: 0] <= ui_in;
                    2'b01: g_s0[15: 8] <= ui_in;
                    2'b10: g_s0[23:16] <= ui_in;
                    2'b11: g_s0[31:24] <= ui_in;
                endcase
            end else begin
                case (g_seed_byte)
                    2'b00: g_s1[ 7: 0] <= ui_in;
                    2'b01: g_s1[15: 8] <= ui_in;
                    2'b10: g_s1[23:16] <= ui_in;
                    2'b11: g_s1[31:24] <= ui_in;
                endcase
            end
            g_valid <= 1'b0;
        end else if (g_enable) begin
            g_s0 <= g_s0_next ^ {31'b0, g_ro_noise};
            g_s1 <= g_s1_next;
            if (g_bit_cnt == 0) begin
                g_shift   <= g_rca_sum;
                g_valid   <= 1'b1;
                g_bit_cnt <= 6'd1;
            end else begin
                g_shift   <= {g_shift[30:0], 1'b0};
                g_valid   <= 1'b0;
                g_bit_cnt <= (g_bit_cnt == 6'd31) ? 6'd0 : g_bit_cnt + 1;
            end
        end else begin
            g_valid <= 1'b0;
        end
    end

    integer check_count;
    integer error_count;
    reg     checking_enabled;

    always @(negedge clk) begin
        if (checking_enabled) begin
            check_count = check_count + 1;
            if (serial_out !== g_serial_out) begin
                error_count = error_count + 1;
                $display("[%0t] MISMATCH serial_out: DUT=%b golden=%b", $time, serial_out, g_serial_out);
            end
            if (valid_out !== g_valid) begin
                error_count = error_count + 1;
                $display("[%0t] MISMATCH valid_out: DUT=%b golden=%b", $time, valid_out, g_valid);
            end
        end
    end

    //==============================================================
    // Tasks
    //==============================================================
    task write_seed_byte(input [2:0] sel, input [7:0] data);
        begin
            @(negedge clk);
            uio_in[2:0] = sel;
            ui_in       = data;
            uio_in[3]   = 1'b1;
            @(negedge clk);
            uio_in[3]   = 1'b0;
        end
    endtask

    task load_seed(input [63:0] seed_val);
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1)
                write_seed_byte(i[2:0], seed_val[i*8 +: 8]);
        end
    endtask

    task do_reset;
        begin
            rst_n  = 1'b0;
            ena    = 1'b0;
            ui_in  = 8'h00;
            uio_in = 8'h00; // seed_sel=0,seed_wen=0,enable=0,ro_noise=0,clk_sel=00
            repeat (5) @(negedge clk);
            rst_n  = 1'b1;
            repeat (2) @(negedge clk);
        end
    endtask

    // Captures a 32-bit word over `clk`, MSB-first, frame-aligned to valid_out.
    task capture_one_word(output reg [31:0] word_out);
        integer i;
        begin
            @(negedge clk);
            while (valid_out !== 1'b1) @(negedge clk);
            word_out[31] = serial_out;
            for (i = 30; i >= 0; i = i - 1) begin
                @(negedge clk);
                word_out[i] = serial_out;
            end
        end
    endtask

    // Captures a 32-bit word synced to one of the forced synthetic RO
    // clocks instead of `clk`. which: 0 = osc50_gen, 1 = osc30_gen.
    task capture_one_word_ro(input integer which, output reg [31:0] word_out);
        integer i;
        begin
            if (which == 0) begin
                @(negedge osc50_gen);
                while (valid_out !== 1'b1) @(negedge osc50_gen);
                word_out[31] = serial_out;
                for (i = 30; i >= 0; i = i - 1) begin
                    @(negedge osc50_gen);
                    word_out[i] = serial_out;
                end
            end else begin
                @(negedge osc30_gen);
                while (valid_out !== 1'b1) @(negedge osc30_gen);
                word_out[31] = serial_out;
                for (i = 30; i >= 0; i = i - 1) begin
                    @(negedge osc30_gen);
                    word_out[i] = serial_out;
                end
            end
        end
    endtask

    //==============================================================
    // Stimulus
    //==============================================================
    reg [31:0] word0, word1, word_ro;
    reg [31:0] expected0, expected1;
    integer    pass_count, fail_count;
    integer    k;
    reg [63:0] rand_seed;

    initial begin
        check_count       = 0;
        error_count       = 0;
        checking_enabled  = 0;
        pass_count        = 0;
        fail_count        = 0;

        $display("================================================================");
        $display(" Starting tb_tt_um_xoroshiro64plus_v2");
        $display("================================================================");

        // ---------------- Test A: reset state ----------------
        do_reset;
        if (uo_out !== 8'h00 || uio_out !== 8'h00 || uio_oe !== 8'h00) begin
            $display("[%0t] FAIL: outputs not all-zero after reset (uo_out=0x%02h uio_out=0x%02h uio_oe=0x%02h)",
                       $time, uo_out, uio_out, uio_oe);
            fail_count = fail_count + 1;
        end else begin
            $display("[%0t] PASS: uo_out/uio_out/uio_oe all 0x00 after reset", $time);
            pass_count = pass_count + 1;
        end

        // ---------------- Test B: default-seed first word (clk_sel=00) ----------------
        checking_enabled = 1; // golden model tracks DUT from here on (clk_sel must stay 00)
        ena       = 1'b1;
        uio_in[4] = 1'b1; // enable
        capture_one_word(word0);
        expected0 = 32'hDEAD_BEEF + 32'hCAFE_F00D;
        if (word0 === expected0) begin
            $display("[%0t] PASS: default-seed first word = 0x%08h", $time, word0);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] FAIL: default-seed first word = 0x%08h, expected 0x%08h",
                       $time, word0, expected0);
            fail_count = fail_count + 1;
        end

        // ---------------- Test C: ena pin gating ----------------
        ena = 1'b0;
        repeat (50) @(negedge clk);
        if (valid_out !== 1'b0) begin
            $display("[%0t] FAIL: valid_out asserted while top-level ena=0", $time);
            fail_count = fail_count + 1;
        end else begin
            $display("[%0t] PASS: core stays idle while ena=0", $time);
            pass_count = pass_count + 1;
        end
        ena = 1'b1;

        // ---------------- Test D: known seed ----------------
        uio_in[4] = 1'b0;
        do_reset;
        load_seed(64'h0000_0002_0000_0001); // s1=2, s0=1
        ena       = 1'b1;
        uio_in[4] = 1'b1;
        capture_one_word(word1);
        expected1 = 32'h1 + 32'h2;
        if (word1 === expected1) begin
            $display("[%0t] PASS: seeded(s0=1,s1=2) first word = 0x%08h", $time, word1);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] FAIL: seeded first word = 0x%08h, expected 0x%08h",
                       $time, word1, expected1);
            fail_count = fail_count + 1;
        end

        // ---------------- Test E: randomized regression (clk_sel=00) ----------------
        $display("--- Randomized regression on external clk path ---");
        for (k = 0; k < 15; k = k + 1) begin
            uio_in[4] = 1'b0;
            if (k % 5 == 0) do_reset;
            rand_seed = {$random, $random};
            load_seed(rand_seed);
            uio_in[4] = $random;
            uio_in[5] = $random; // ro_noise
            ena       = 1'b1;
            repeat (80) begin
                @(negedge clk);
                if ($random % 4 == 0) uio_in[4] = ~uio_in[4];
                if ($random % 8 == 0) uio_in[5] = ~uio_in[5];
            end
        end
        uio_in[4] = 1'b0;
        repeat (20) @(negedge clk);
        checking_enabled = 0; // stop golden compare before touching clk_sel

        // ---------------- Test F: RO clk_sel freezes to X (documented) ----------------
        $display("--- RO clk_sel paths: confirming documented X-freeze behavior ---");
        do_reset;
        uio_in[7:6] = 2'b01; // select osc_50m, unforced
        uio_in[4]   = 1'b1;
        ena         = 1'b1;
        repeat (10) @(negedge clk); // external clk still ticks the TB, core_clk does not
        if ((dut.core_clk === 1'bx) && (dut.osc_50m === 1'bx)) begin
            $display("[%0t] PASS (expected): core_clk/osc_50m settled to X with clk_sel=01 (untimed RO, no SDF)",
                       $time);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] INFO: core_clk=%b osc_50m=%b with clk_sel=01 (differs from previously observed X-settle; simulator/tool dependent)",
                       $time, dut.core_clk, dut.osc_50m);
        end

        uio_in[7:6] = 2'b10; // select osc_30m, unforced
        repeat (10) @(negedge clk);
        if ((dut.core_clk === 1'bx) && (dut.osc_30m === 1'bx)) begin
            $display("[%0t] PASS (expected): core_clk/osc_30m settled to X with clk_sel=10", $time);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] INFO: core_clk=%b osc_30m=%b with clk_sel=10", $time, dut.core_clk, dut.osc_30m);
        end

        uio_in[7:6] = 2'b00; // back to external clk
        uio_in[4]   = 1'b0;
        ena         = 1'b0;
        repeat (5) @(negedge clk);

        // ---------------- Test G: forced synthetic RO clock - mux/core function ----------------
        $display("--- RO clk_sel paths: forced synthetic clock, validating mux + core logic ---");

        // osc_50m path
        do_reset;
        load_seed(64'h0000_0002_0000_0001); // s1=2, s0=1
        uio_in[7:6] = 2'b01; // select osc_50m
        force dut.osc_50m = osc50_gen;
        ena         = 1'b1;
        uio_in[4]   = 1'b1;
        capture_one_word_ro(0, word_ro);
        if (word_ro === expected1) begin
            $display("[%0t] PASS: osc_50m mux path functional, first word = 0x%08h", $time, word_ro);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] FAIL: osc_50m mux path first word = 0x%08h, expected 0x%08h",
                       $time, word_ro, expected1);
            fail_count = fail_count + 1;
        end
        uio_in[4] = 1'b0;
        ena       = 1'b0;
        release dut.osc_50m;

        // osc_30m path
        uio_in[7:6] = 2'b00;
        do_reset;
        load_seed(64'h0000_0002_0000_0001); // s1=2, s0=1
        uio_in[7:6] = 2'b10; // select osc_30m
        force dut.osc_30m = osc30_gen;
        ena         = 1'b1;
        uio_in[4]   = 1'b1;
        capture_one_word_ro(1, word_ro);
        if (word_ro === expected1) begin
            $display("[%0t] PASS: osc_30m mux path functional, first word = 0x%08h", $time, word_ro);
            pass_count = pass_count + 1;
        end else begin
            $display("[%0t] FAIL: osc_30m mux path first word = 0x%08h, expected 0x%08h",
                       $time, word_ro, expected1);
            fail_count = fail_count + 1;
        end
        uio_in[4] = 1'b0;
        ena       = 1'b0;
        release dut.osc_30m;
        uio_in[7:6] = 2'b00; // restore external clk for cleanliness

        // ---------------- Summary ----------------
        $display("================================================================");
        $display(" Golden-model live compare (clk_sel=00 only): %0d cycles checked, %0d mismatches",
                   check_count, error_count);
        $display(" Directed/RO tests: %0d PASSED, %0d FAILED", pass_count, fail_count);
        if ((error_count == 0) && (fail_count == 0))
            $display(" RESULT: ALL TESTS PASSED");
        else
            $display(" RESULT: TESTS FAILED");
        $display("================================================================");

        $finish;
    end

endmodule