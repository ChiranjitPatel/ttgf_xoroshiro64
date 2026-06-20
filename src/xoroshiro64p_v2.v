`default_nettype none

module xoroshiro64plus (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire ro_noise,
    input wire [7:0] seed_data,
    input wire seed_wen,
    input wire [2:0] seed_sel,
    output wire serial_out,
    output reg valid_out
);
    reg [31:0] s0, s1;
    reg [31:0] output_reg;
    reg [31:0] shift_reg;
    reg [5:0] bit_cnt;

    // Seed control
    wire seed_s1_sel = seed_sel[2];
    wire [1:0] seed_byte = seed_sel[1:0];

    // ====================== FIXED Ripple Carry Adder ======================
    wire [31:0] rca_sum;
    wire [32:0] carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : rca_fa
            assign rca_sum[i] = s0[i] ^ s1[i] ^ carry[i];
            assign carry[i+1] = (s0[i] & s1[i]) | (s0[i] & carry[i]) | (s1[i] & carry[i]);
        end
    endgenerate
    // =====================================================================

    // xoroshiro update
    wire [31:0] s0_next = s0 ^ s1;
    wire [31:0] s0_rotl26 = {s0[5:0], s0[31:6]};
    wire [31:0] s1_next = s0_rotl26 ^ s1 ^ {s1[22:0], 9'b0};

    assign serial_out = shift_reg[31];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s0 <= 32'hDEAD_BEEF;
            s1 <= 32'hCAFE_F00D;
            output_reg <= 32'h0;
            shift_reg  <= 32'h0;
            bit_cnt    <= 6'd0;
            valid_out  <= 1'b0;
        end else begin
            if (seed_wen) begin
                // Seed loading
                if (!seed_s1_sel) begin
                    case (seed_byte)
                        2'b00: s0[ 7: 0] <= seed_data;
                        2'b01: s0[15: 8] <= seed_data;
                        2'b10: s0[23:16] <= seed_data;
                        2'b11: s0[31:24] <= seed_data;
                    endcase
                end else begin
                    case (seed_byte)
                        2'b00: s1[ 7: 0] <= seed_data;
                        2'b01: s1[15: 8] <= seed_data;
                        2'b10: s1[23:16] <= seed_data;
                        2'b11: s1[31:24] <= seed_data;
                    endcase
                end
                valid_out <= 1'b0;
            end else if (enable) begin
                // PRNG step with RO noise
                s0 <= s0_next ^ {31'b0, ro_noise};
                s1 <= s1_next;
                output_reg <= rca_sum;

                // Serializer
                if (bit_cnt == 6'd0) begin
                    shift_reg <= rca_sum;     // Load new word
                    valid_out <= 1'b1;
                    bit_cnt   <= 6'd1;
                end else begin
                    shift_reg <= {shift_reg[30:0], 1'b0};
                    valid_out <= 1'b0;
                    bit_cnt   <= bit_cnt + 6'd1;
                end
            end else begin
                valid_out <= 1'b0;
            end
        end
    end
endmodule
`default_nettype wire