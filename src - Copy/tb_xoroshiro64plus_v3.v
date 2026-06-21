`timescale 1ns / 1ps
//==============================================================================
// Testbench: tb_xoroshiro64plus
// DUT: xoroshiro64plus (the core PRNG, not the tt_um_* wrapper)
//
// Strategy
// --------
// 1) "Golden model": a second always-block in this TB, coded directly from
//    the same equations as the DUT (rotl26 / shift9 / xor / ripple-carry
//    sum / serializer + valid_out timing), fed the EXACT same stimulus as
//    the DUT. Every clock cycle, DUT serial_out/valid_out are compared
//    against the golden model's. This is a "bit-exact RTL twin" oracle:
//    it is good at catching implementation bugs (mis-wiring, typos, logic
//    regressions, reset bugs, corner-case handling) across any stimulus,
//    including the randomized regression below. It will NOT catch a bug
//    that is baked into the spec itself, since both copies share it.
//
// 2) Directed, hand-calculated checks (Test A/B): the expected first
//    output word is computed independently in the testbench (plain
//    addition of known seed values) and compared to the DUT's actual
//    output. These two checks are independent of the golden-model
//    equations and so DO catch a shared algorithmic mistake.
//
// 3) A randomized regression that fuzzes seed, enable, and ro_noise while
//    the golden-model comparator runs continuously, including across
//    mid-stream reseeds and resets.
//
// Important protocol note modeled here: valid_out pulses for only ONE
// cycle per 32-cycle frame (when a new s0+s1 sum is loaded into the shift
// register). serial_out streams one new bit every cycle thereafter
// (MSB-first) regardless of valid_out. Also note bit_cnt is only cleared
// by rst_n, NOT by seed_wen -- a mid-frame reseed resumes shifting from
// wherever bit_cnt currently is (see Test C).
//==============================================================================

module tb_xoroshiro64plus_v3;

    // ------------------------------------------------------------
    // DUT I/O
    // ------------------------------------------------------------
    reg        clk;
    reg        rst_n;
    reg        enable;
    reg        ro_noise;
    reg  [7:0] seed_data;
    reg        seed_wen;
    reg  [2:0] seed_sel;
    wire       serial_out;
    wire       valid_out;

    xoroshiro64plus_v2 dut (
        .clk        (clk),
        .rst_n      (rst_n),
        .enable     (enable),
        .ro_noise   (ro_noise),
        .seed_data  (seed_data),
        .seed_wen   (seed_wen),
        .seed_sel   (seed_sel),
        .serial_out (serial_out),
        .valid_out  (valid_out)
    );

    // ------------------------------------------------------------
    // Clock: 100MHz
    // ------------------------------------------------------------
    localparam CLK_PERIOD = 10;
    initial clk = 1'b0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ------------------------------------------------------------
    // Waveform dump
    // ------------------------------------------------------------
    // initial begin
        // $dumpfile("tb_xoroshiro64plus.vcd");
        // $dumpvars(0, tb_xoroshiro64plus);
    // end

    // ------------------------------------------------------------
    // Watchdog
    // ------------------------------------------------------------
    initial begin
        #500000;
        $display("[%0t] ERROR: Watchdog timeout - simulation did not finish", $time);
        $finish;
    end

    //==============================================================
    // Golden reference model (bit-exact RTL twin, see header note)
    //==============================================================
    reg [31:0] g_s0, g_s1, g_shift;
    reg [5:0]  g_bit_cnt;
    reg        g_valid;

    wire        g_seed_s1_sel = seed_sel[2];
    wire [1:0]  g_seed_byte   = seed_sel[1:0];
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
        end else if (seed_wen) begin
            if (!g_seed_s1_sel) begin
                case (g_seed_byte)
                    2'b00: g_s0[ 7: 0] <= seed_data;
                    2'b01: g_s0[15: 8] <= seed_data;
                    2'b10: g_s0[23:16] <= seed_data;
                    2'b11: g_s0[31:24] <= seed_data;
                endcase
            end else begin
                case (g_seed_byte)
                    2'b00: g_s1[ 7: 0] <= seed_data;
                    2'b01: g_s1[15: 8] <= seed_data;
                    2'b10: g_s1[23:16] <= seed_data;
                    2'b11: g_s1[31:24] <= seed_data;
                endcase
            end
            g_valid <= 1'b0;
        end else if (enable) begin
            g_s0 <= g_s0_next ^ {31'b0, ro_noise};
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

    //==============================================================
    // Continuous checker: DUT vs golden model, every cycle
    //==============================================================
    integer check_count;
    integer error_count;
    reg     checking_enabled;

    always @(negedge clk) begin
        if (checking_enabled) begin
            check_count = check_count + 1;
            if (serial_out !== g_serial_out) begin
                error_count = error_count + 1;
                $display("[%0t] MISMATCH serial_out: DUT=%b golden=%b (golden bit_cnt=%0d)",
                           $time, serial_out, g_serial_out, g_bit_cnt);
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
            seed_sel  = sel;
            seed_data = data;
            seed_wen  = 1'b1;
            @(negedge clk);
            seed_wen  = 1'b0;
        end
    endtask

    // seed_val[31:0] -> s0, seed_val[63:32] -> s1 (sel 0-3 = s0 bytes 0-3,
    // sel 4-7 = s1 bytes 0-3, per seed_sel[2]/seed_sel[1:0] decoding)
    task load_seed(input [63:0] seed_val);
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1)
                write_seed_byte(i[2:0], seed_val[i*8 +: 8]);
        end
    endtask

    task do_reset;
        begin
            rst_n     = 1'b0;
            enable    = 1'b0;
            ro_noise  = 1'b0;
            seed_wen  = 1'b0;
            seed_sel  = 3'd0;
            seed_data = 8'h00;
            repeat (3) @(negedge clk);
            rst_n = 1'b1;
            @(negedge clk);
        end
    endtask

    // Captures one 32-bit word, MSB-first, frame-aligned to valid_out.
    // serial_out is sampled every cycle starting from the valid_out pulse,
    // not just while valid_out is high (see header note).
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

    //==============================================================
    // Stimulus
    //==============================================================
    reg [31:0] word0, word1, word2;
    reg [31:0] expected0, expected1;
    integer    pass_count, fail_count;
    integer    k;
    reg [63:0] rand_seed;

    initial begin
        check_count      = 0;
        error_count      = 0;
        checking_enabled = 0;
        pass_count       = 0;
        fail_count       = 0;

        $display("================================================================");
        $display(" Starting tb_xoroshiro64plus");
        $display("================================================================");

        // ---------------- Test A: default seed after reset ----------------
        do_reset;
        checking_enabled = 1; // golden model tracks DUT from here on

        enable = 1'b1;
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

        // ---------------- Test B: known seed ----------------
        enable = 1'b0;
        do_reset;
        load_seed({32'h0000_0002, 32'h0000_0001}); // s1=2, s0=1
        enable = 1'b1;
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

        // ---------------- Test C: seed write mid-stream ----------------
        // bit_cnt is only cleared by rst_n, not by seed_wen, so this
        // exercises the "resume mid-frame after reseed" corner case.
        // No extra assert beyond the live golden-model compare above.
        capture_one_word(word2);
        write_seed_byte(3'd0, 8'hAA); // reseed mid-frame, one byte of s0
        repeat (40) @(negedge clk);
        $display("[%0t] INFO: mid-stream reseed corner case exercised (see live compare)",
                   $time);

        // ---------------- Test D: enable/disable gating ----------------
        enable = 1'b0;
        repeat (20) @(negedge clk);
        if (valid_out !== 1'b0) begin
            $display("[%0t] FAIL: valid_out asserted while disabled", $time);
            fail_count = fail_count + 1;
        end else begin
            $display("[%0t] PASS: valid_out stays low while disabled", $time);
            pass_count = pass_count + 1;
        end
        enable = 1'b1;

        // ---------------- Test E: randomized regression ----------------
        $display("--- Randomized regression (golden-model live compare) ---");
        for (k = 0; k < 20; k = k + 1) begin
            enable = 1'b0;
            if (k % 5 == 0) do_reset; // occasionally reset mid-test
            rand_seed = {$random, $random};
            load_seed(rand_seed);
            enable   = $random;
            ro_noise = $random;
            repeat (80) begin
                @(negedge clk);
                if ($random % 4 == 0) enable   = ~enable;
                if ($random % 8 == 0) ro_noise = ~ro_noise;
            end
        end
        enable = 1'b1;
        repeat (50) @(negedge clk);

        // ---------------- Summary ----------------
        $display("================================================================");
        $display(" Golden-model live compare: %0d cycles checked, %0d mismatches",
                   check_count, error_count);
        $display(" Directed tests: %0d PASSED, %0d FAILED", pass_count, fail_count);
        if ((error_count == 0) && (fail_count == 0))
            $display(" RESULT: ALL TESTS PASSED");
        else
            $display(" RESULT: TESTS FAILED");
        $display("================================================================");

        $finish;
    end

endmodule