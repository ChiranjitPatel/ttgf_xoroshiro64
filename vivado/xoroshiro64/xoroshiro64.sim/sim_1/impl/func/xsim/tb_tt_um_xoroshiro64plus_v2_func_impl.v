// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Jun 21 16:38:29 2026
// Host        : GHOST running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/Github/ttgf_xoroshiro64/vivado/xoroshiro64/xoroshiro64.sim/sim_1/impl/func/xsim/tb_tt_um_xoroshiro64plus_v2_func_impl.v
// Design      : tt_um_xoroshiro64plus_v2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ring_osc_fpga
   (core_clk,
    clk_IBUF,
    uio_in_IBUF,
    out);
  output core_clk;
  input clk_IBUF;
  input [1:0]uio_in_IBUF;
  input [0:0]out;

  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire [20:0]chain;
  wire clk_IBUF;
  wire core_clk;
  wire [0:0]out;
  wire [1:0]uio_in_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_1
       (.I0(chain[19]),
        .O(chain[20]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_10
       (.I0(chain[10]),
        .O(chain[11]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_11
       (.I0(chain[9]),
        .O(chain[10]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_12
       (.I0(chain[8]),
        .O(chain[9]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_13
       (.I0(chain[7]),
        .O(chain[8]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_14
       (.I0(chain[6]),
        .O(chain[7]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_15
       (.I0(chain[5]),
        .O(chain[6]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_16
       (.I0(chain[4]),
        .O(chain[5]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_17
       (.I0(chain[3]),
        .O(chain[4]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_18
       (.I0(chain[2]),
        .O(chain[3]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_19
       (.I0(chain[1]),
        .O(chain[2]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_2
       (.I0(chain[18]),
        .O(chain[19]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_20
       (.I0(chain[0]),
        .O(chain[1]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_21
       (.I0(chain[20]),
        .O(chain[0]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_3
       (.I0(chain[17]),
        .O(chain[18]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_4
       (.I0(chain[16]),
        .O(chain[17]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_5
       (.I0(chain[15]),
        .O(chain[16]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_6
       (.I0(chain[14]),
        .O(chain[15]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_7
       (.I0(chain[13]),
        .O(chain[14]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_8
       (.I0(chain[12]),
        .O(chain[13]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_9
       (.I0(chain[11]),
        .O(chain[12]));
  LUT5 #(
    .INIT(32'hCAFCCA0C)) 
    core_clk_BUFG_inst_i_1
       (.I0(chain[0]),
        .I1(clk_IBUF),
        .I2(uio_in_IBUF[1]),
        .I3(uio_in_IBUF[0]),
        .I4(out),
        .O(core_clk));
endmodule

(* ORIG_REF_NAME = "ring_osc_fpga" *) 
module ring_osc_fpga__parameterized0
   (out);
  output [0:0]out;

  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire [34:0]chain;

  assign out[0] = chain[0];
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_1
       (.I0(chain[33]),
        .O(chain[34]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_10
       (.I0(chain[24]),
        .O(chain[25]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_11
       (.I0(chain[23]),
        .O(chain[24]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_12
       (.I0(chain[22]),
        .O(chain[23]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_13
       (.I0(chain[21]),
        .O(chain[22]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_14
       (.I0(chain[20]),
        .O(chain[21]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_15
       (.I0(chain[19]),
        .O(chain[20]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_16
       (.I0(chain[18]),
        .O(chain[19]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_17
       (.I0(chain[17]),
        .O(chain[18]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_18
       (.I0(chain[16]),
        .O(chain[17]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_19
       (.I0(chain[15]),
        .O(chain[16]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_2
       (.I0(chain[32]),
        .O(chain[33]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_20
       (.I0(chain[14]),
        .O(chain[15]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_21
       (.I0(chain[13]),
        .O(chain[14]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_22
       (.I0(chain[12]),
        .O(chain[13]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_23
       (.I0(chain[11]),
        .O(chain[12]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_24
       (.I0(chain[10]),
        .O(chain[11]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_25
       (.I0(chain[9]),
        .O(chain[10]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_26
       (.I0(chain[8]),
        .O(chain[9]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_27
       (.I0(chain[7]),
        .O(chain[8]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_28
       (.I0(chain[6]),
        .O(chain[7]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_29
       (.I0(chain[5]),
        .O(chain[6]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_3
       (.I0(chain[31]),
        .O(chain[32]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_30
       (.I0(chain[4]),
        .O(chain[5]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_31
       (.I0(chain[3]),
        .O(chain[4]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_32
       (.I0(chain[2]),
        .O(chain[3]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_33
       (.I0(chain[1]),
        .O(chain[2]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_34
       (.I0(chain[0]),
        .O(chain[1]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_35
       (.I0(chain[34]),
        .O(chain[0]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_4
       (.I0(chain[30]),
        .O(chain[31]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_5
       (.I0(chain[29]),
        .O(chain[30]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_6
       (.I0(chain[28]),
        .O(chain[29]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_7
       (.I0(chain[27]),
        .O(chain[28]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_8
       (.I0(chain[26]),
        .O(chain[27]));
  LUT1 #(
    .INIT(2'h1)) 
    chain_inferred_i_9
       (.I0(chain[25]),
        .O(chain[26]));
endmodule

(* ECO_CHECKSUM = "ac80a567" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module tt_um_xoroshiro64plus_v2
   (ui_in,
    uo_out,
    uio_in,
    uio_out,
    uio_oe,
    ena,
    clk,
    rst_n);
  input [7:0]ui_in;
  output [7:0]uo_out;
  input [7:0]uio_in;
  output [7:0]uio_out;
  output [7:0]uio_oe;
  input ena;
  input clk;
  input rst_n;

  wire clk;
  wire clk_IBUF;
  wire core_clk;
  wire core_clk_BUFG;
  wire ena;
  wire ena_IBUF;
  wire osc_30m;
  wire rst_n;
  wire rst_n_IBUF;
  wire [7:0]ui_in;
  wire [7:0]ui_in_IBUF;
  wire [7:0]uio_in;
  wire [7:0]uio_in_IBUF;
  wire [7:0]uio_oe;
  wire [7:0]uio_out;
  wire [7:0]uo_out;
  wire [1:0]uo_out_OBUF;

  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  BUFG core_clk_BUFG_inst
       (.I(core_clk),
        .O(core_clk_BUFG));
  IBUF ena_IBUF_inst
       (.I(ena),
        .O(ena_IBUF));
  ring_osc_fpga__parameterized0 ro30
       (.out(osc_30m));
  ring_osc_fpga ro50
       (.clk_IBUF(clk_IBUF),
        .core_clk(core_clk),
        .out(osc_30m),
        .uio_in_IBUF(uio_in_IBUF[7:6]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  xoroshiro64plus u_core
       (.CLK(core_clk_BUFG),
        .ena_IBUF(ena_IBUF),
        .rst_n_IBUF(rst_n_IBUF),
        .ui_in_IBUF(ui_in_IBUF),
        .uio_in_IBUF(uio_in_IBUF[5:0]),
        .uo_out_OBUF(uo_out_OBUF));
  IBUF \ui_in_IBUF[0]_inst 
       (.I(ui_in[0]),
        .O(ui_in_IBUF[0]));
  IBUF \ui_in_IBUF[1]_inst 
       (.I(ui_in[1]),
        .O(ui_in_IBUF[1]));
  IBUF \ui_in_IBUF[2]_inst 
       (.I(ui_in[2]),
        .O(ui_in_IBUF[2]));
  IBUF \ui_in_IBUF[3]_inst 
       (.I(ui_in[3]),
        .O(ui_in_IBUF[3]));
  IBUF \ui_in_IBUF[4]_inst 
       (.I(ui_in[4]),
        .O(ui_in_IBUF[4]));
  IBUF \ui_in_IBUF[5]_inst 
       (.I(ui_in[5]),
        .O(ui_in_IBUF[5]));
  IBUF \ui_in_IBUF[6]_inst 
       (.I(ui_in[6]),
        .O(ui_in_IBUF[6]));
  IBUF \ui_in_IBUF[7]_inst 
       (.I(ui_in[7]),
        .O(ui_in_IBUF[7]));
  IBUF \uio_in_IBUF[0]_inst 
       (.I(uio_in[0]),
        .O(uio_in_IBUF[0]));
  IBUF \uio_in_IBUF[1]_inst 
       (.I(uio_in[1]),
        .O(uio_in_IBUF[1]));
  IBUF \uio_in_IBUF[2]_inst 
       (.I(uio_in[2]),
        .O(uio_in_IBUF[2]));
  IBUF \uio_in_IBUF[3]_inst 
       (.I(uio_in[3]),
        .O(uio_in_IBUF[3]));
  IBUF \uio_in_IBUF[4]_inst 
       (.I(uio_in[4]),
        .O(uio_in_IBUF[4]));
  IBUF \uio_in_IBUF[5]_inst 
       (.I(uio_in[5]),
        .O(uio_in_IBUF[5]));
  IBUF \uio_in_IBUF[6]_inst 
       (.I(uio_in[6]),
        .O(uio_in_IBUF[6]));
  IBUF \uio_in_IBUF[7]_inst 
       (.I(uio_in[7]),
        .O(uio_in_IBUF[7]));
  OBUF \uio_oe_OBUF[0]_inst 
       (.I(1'b0),
        .O(uio_oe[0]));
  OBUF \uio_oe_OBUF[1]_inst 
       (.I(1'b0),
        .O(uio_oe[1]));
  OBUF \uio_oe_OBUF[2]_inst 
       (.I(1'b0),
        .O(uio_oe[2]));
  OBUF \uio_oe_OBUF[3]_inst 
       (.I(1'b0),
        .O(uio_oe[3]));
  OBUF \uio_oe_OBUF[4]_inst 
       (.I(1'b0),
        .O(uio_oe[4]));
  OBUF \uio_oe_OBUF[5]_inst 
       (.I(1'b0),
        .O(uio_oe[5]));
  OBUF \uio_oe_OBUF[6]_inst 
       (.I(1'b0),
        .O(uio_oe[6]));
  OBUF \uio_oe_OBUF[7]_inst 
       (.I(1'b0),
        .O(uio_oe[7]));
  OBUF \uio_out_OBUF[0]_inst 
       (.I(1'b0),
        .O(uio_out[0]));
  OBUF \uio_out_OBUF[1]_inst 
       (.I(1'b0),
        .O(uio_out[1]));
  OBUF \uio_out_OBUF[2]_inst 
       (.I(1'b0),
        .O(uio_out[2]));
  OBUF \uio_out_OBUF[3]_inst 
       (.I(1'b0),
        .O(uio_out[3]));
  OBUF \uio_out_OBUF[4]_inst 
       (.I(1'b0),
        .O(uio_out[4]));
  OBUF \uio_out_OBUF[5]_inst 
       (.I(1'b0),
        .O(uio_out[5]));
  OBUF \uio_out_OBUF[6]_inst 
       (.I(1'b0),
        .O(uio_out[6]));
  OBUF \uio_out_OBUF[7]_inst 
       (.I(1'b0),
        .O(uio_out[7]));
  OBUF \uo_out_OBUF[0]_inst 
       (.I(uo_out_OBUF[0]),
        .O(uo_out[0]));
  OBUF \uo_out_OBUF[1]_inst 
       (.I(uo_out_OBUF[1]),
        .O(uo_out[1]));
  OBUF \uo_out_OBUF[2]_inst 
       (.I(1'b0),
        .O(uo_out[2]));
  OBUF \uo_out_OBUF[3]_inst 
       (.I(1'b0),
        .O(uo_out[3]));
  OBUF \uo_out_OBUF[4]_inst 
       (.I(1'b0),
        .O(uo_out[4]));
  OBUF \uo_out_OBUF[5]_inst 
       (.I(1'b0),
        .O(uo_out[5]));
  OBUF \uo_out_OBUF[6]_inst 
       (.I(1'b0),
        .O(uo_out[6]));
  OBUF \uo_out_OBUF[7]_inst 
       (.I(1'b0),
        .O(uo_out[7]));
endmodule

module xoroshiro64plus
   (uo_out_OBUF,
    CLK,
    rst_n_IBUF,
    ena_IBUF,
    uio_in_IBUF,
    ui_in_IBUF);
  output [1:0]uo_out_OBUF;
  input CLK;
  input rst_n_IBUF;
  input ena_IBUF;
  input [5:0]uio_in_IBUF;
  input [7:0]ui_in_IBUF;

  wire CLK;
  wire [5:0]bit_cnt;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_1_n_0 ;
  wire \bit_cnt[3]_i_1_n_0 ;
  wire \bit_cnt[4]_i_1_n_0 ;
  wire \bit_cnt[5]_i_1_n_0 ;
  wire \bit_cnt[5]_i_2_n_0 ;
  wire [31:1]data1;
  wire ena_IBUF;
  wire p_0_in12_in;
  wire p_0_in15_in;
  wire p_0_in18_in;
  wire p_0_in21_in;
  wire p_0_in24_in;
  wire p_0_in27_in;
  wire p_0_in30_in;
  wire p_0_in33_in;
  wire p_0_in36_in;
  wire p_0_in39_in;
  wire p_0_in3_in;
  wire p_0_in42_in;
  wire p_0_in45_in;
  wire p_0_in48_in;
  wire p_0_in51_in;
  wire p_0_in54_in;
  wire p_0_in57_in;
  wire p_0_in60_in;
  wire p_0_in63_in;
  wire p_0_in67_in;
  wire p_0_in6_in;
  wire p_0_in70_in;
  wire p_0_in73_in;
  wire p_0_in76_in;
  wire p_0_in79_in;
  wire p_0_in82_in;
  wire p_0_in85_in;
  wire p_0_in88_in;
  wire p_0_in91_in;
  wire p_0_in9_in;
  wire [31:0]p_1_in;
  wire p_1_in10_in;
  wire p_1_in13_in;
  wire p_1_in16_in;
  wire p_1_in19_in;
  wire p_1_in22_in;
  wire p_1_in25_in;
  wire p_1_in28_in;
  wire p_1_in31_in;
  wire p_1_in34_in;
  wire p_1_in37_in;
  wire p_1_in40_in;
  wire p_1_in43_in;
  wire p_1_in46_in;
  wire p_1_in49_in;
  wire p_1_in52_in;
  wire p_1_in55_in;
  wire p_1_in58_in;
  wire p_1_in61_in;
  wire p_1_in64_in;
  wire p_1_in68_in;
  wire p_1_in71_in;
  wire p_1_in74_in;
  wire p_1_in77_in;
  wire p_1_in7_in;
  wire p_1_in80_in;
  wire p_1_in83_in;
  wire p_1_in86_in;
  wire p_1_in89_in;
  wire p_1_in92_in;
  wire p_1_in_0;
  wire rca_carry_10__4;
  wire rca_carry_11__4;
  wire rca_carry_12__4;
  wire rca_carry_13__4;
  wire rca_carry_14__4;
  wire rca_carry_15__4;
  wire rca_carry_16__4;
  wire rca_carry_17__4;
  wire rca_carry_18__4;
  wire rca_carry_19__4;
  wire rca_carry_2019_out;
  wire rca_carry_2121_out;
  wire rca_carry_2266_in;
  wire rca_carry_23__4;
  wire rca_carry_24__4;
  wire rca_carry_25__4;
  wire rca_carry_26__4;
  wire rca_carry_27__4;
  wire rca_carry_28__4;
  wire rca_carry_29__4;
  wire rca_carry_2__4;
  wire rca_carry_3031_out;
  wire rca_carry_3133_out;
  wire rca_carry_3__4;
  wire rca_carry_4__4;
  wire rca_carry_5__4;
  wire rca_carry_6__4;
  wire rca_carry_7__4;
  wire rca_carry_8__4;
  wire rca_carry_9__4;
  wire rst_n_IBUF;
  wire \s0[15]_i_1_n_0 ;
  wire \s0[23]_i_1_n_0 ;
  wire \s0[31]_i_1_n_0 ;
  wire \s0[31]_i_3_n_0 ;
  wire \s0[7]_i_1_n_0 ;
  wire \s0_reg_n_0_[0] ;
  wire \s0_reg_n_0_[31] ;
  wire \s1[0]_i_1_n_0 ;
  wire \s1[10]_i_1_n_0 ;
  wire \s1[11]_i_1_n_0 ;
  wire \s1[12]_i_1_n_0 ;
  wire \s1[13]_i_1_n_0 ;
  wire \s1[14]_i_1_n_0 ;
  wire \s1[15]_i_1_n_0 ;
  wire \s1[15]_i_2_n_0 ;
  wire \s1[16]_i_1_n_0 ;
  wire \s1[17]_i_1_n_0 ;
  wire \s1[18]_i_1_n_0 ;
  wire \s1[19]_i_1_n_0 ;
  wire \s1[1]_i_1_n_0 ;
  wire \s1[20]_i_1_n_0 ;
  wire \s1[21]_i_1_n_0 ;
  wire \s1[22]_i_1_n_0 ;
  wire \s1[23]_i_1_n_0 ;
  wire \s1[23]_i_2_n_0 ;
  wire \s1[24]_i_1_n_0 ;
  wire \s1[25]_i_1_n_0 ;
  wire \s1[26]_i_1_n_0 ;
  wire \s1[27]_i_1_n_0 ;
  wire \s1[28]_i_1_n_0 ;
  wire \s1[29]_i_1_n_0 ;
  wire \s1[2]_i_1_n_0 ;
  wire \s1[30]_i_1_n_0 ;
  wire \s1[31]_i_1_n_0 ;
  wire \s1[31]_i_2_n_0 ;
  wire \s1[3]_i_1_n_0 ;
  wire \s1[4]_i_1_n_0 ;
  wire \s1[5]_i_1_n_0 ;
  wire \s1[6]_i_1_n_0 ;
  wire \s1[7]_i_1_n_0 ;
  wire \s1[7]_i_2_n_0 ;
  wire \s1[8]_i_1_n_0 ;
  wire \s1[9]_i_1_n_0 ;
  wire \s1_reg_n_0_[0] ;
  wire \s1_reg_n_0_[31] ;
  wire [31:0]shift_reg;
  wire \shift_reg[31]_i_3_n_0 ;
  wire [7:0]ui_in_IBUF;
  wire [5:0]uio_in_IBUF;
  wire [1:0]uo_out_OBUF;
  wire valid_out1_out;

  LUT1 #(
    .INIT(2'h1)) 
    \bit_cnt[0]_i_1 
       (.I0(bit_cnt[0]),
        .O(\bit_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \bit_cnt[1]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[1]),
        .O(\bit_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h6C)) 
    \bit_cnt[2]_i_1 
       (.I0(bit_cnt[0]),
        .I1(bit_cnt[2]),
        .I2(bit_cnt[1]),
        .O(\bit_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \bit_cnt[3]_i_1 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[0]),
        .I2(bit_cnt[2]),
        .I3(bit_cnt[1]),
        .O(\bit_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \bit_cnt[4]_i_1 
       (.I0(bit_cnt[3]),
        .I1(bit_cnt[4]),
        .I2(bit_cnt[0]),
        .I3(bit_cnt[2]),
        .I4(bit_cnt[1]),
        .O(\bit_cnt[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \bit_cnt[5]_i_1 
       (.I0(uio_in_IBUF[3]),
        .I1(uio_in_IBUF[4]),
        .I2(ena_IBUF),
        .O(\bit_cnt[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAAAAAAAAAA)) 
    \bit_cnt[5]_i_2 
       (.I0(bit_cnt[5]),
        .I1(bit_cnt[3]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[0]),
        .I4(bit_cnt[2]),
        .I5(bit_cnt[4]),
        .O(\bit_cnt[5]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[0] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .Q(bit_cnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[1] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .Q(bit_cnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[2] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[2]_i_1_n_0 ),
        .Q(bit_cnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[3] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[3]_i_1_n_0 ),
        .Q(bit_cnt[3]));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[4] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[4]_i_1_n_0 ),
        .Q(bit_cnt[4]));
  FDCE #(
    .INIT(1'b0)) 
    \bit_cnt_reg[5] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\bit_cnt[5]_i_2_n_0 ),
        .Q(bit_cnt[5]));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s0[0]_i_1 
       (.I0(ui_in_IBUF[0]),
        .I1(\s1_reg_n_0_[0] ),
        .I2(\s0_reg_n_0_[0] ),
        .I3(uio_in_IBUF[5]),
        .I4(uio_in_IBUF[3]),
        .O(p_1_in[0]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[10]_i_1 
       (.I0(p_0_in30_in),
        .I1(p_1_in31_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[2]),
        .O(p_1_in[10]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[11]_i_1 
       (.I0(p_0_in33_in),
        .I1(p_1_in34_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[3]),
        .O(p_1_in[11]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[12]_i_1 
       (.I0(p_0_in36_in),
        .I1(p_1_in37_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[4]),
        .O(p_1_in[12]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[13]_i_1 
       (.I0(p_0_in39_in),
        .I1(p_1_in40_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[5]),
        .O(p_1_in[13]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[14]_i_1 
       (.I0(p_0_in42_in),
        .I1(p_1_in43_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[6]),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'h04040404FF000000)) 
    \s0[15]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[15]_i_2 
       (.I0(p_0_in45_in),
        .I1(p_1_in46_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[7]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[16]_i_1 
       (.I0(p_0_in48_in),
        .I1(p_1_in49_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[0]),
        .O(p_1_in[16]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[17]_i_1 
       (.I0(p_0_in51_in),
        .I1(p_1_in52_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[1]),
        .O(p_1_in[17]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[18]_i_1 
       (.I0(p_0_in54_in),
        .I1(p_1_in55_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[2]),
        .O(p_1_in[18]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[19]_i_1 
       (.I0(p_0_in57_in),
        .I1(p_1_in58_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[3]),
        .O(p_1_in[19]));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s0[1]_i_1 
       (.I0(ui_in_IBUF[1]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in_0),
        .I3(p_0_in3_in),
        .O(p_1_in[1]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[20]_i_1 
       (.I0(p_0_in60_in),
        .I1(p_1_in61_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[4]),
        .O(p_1_in[20]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[21]_i_1 
       (.I0(p_0_in63_in),
        .I1(p_1_in64_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[5]),
        .O(p_1_in[21]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[22]_i_1 
       (.I0(p_0_in67_in),
        .I1(p_1_in68_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[6]),
        .O(p_1_in[22]));
  LUT6 #(
    .INIT(64'h04040404FF000000)) 
    \s0[23]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[1]),
        .I2(uio_in_IBUF[0]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[23]_i_2 
       (.I0(p_0_in70_in),
        .I1(p_1_in71_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[7]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[24]_i_1 
       (.I0(p_0_in73_in),
        .I1(p_1_in74_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[0]),
        .O(p_1_in[24]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[25]_i_1 
       (.I0(p_0_in76_in),
        .I1(p_1_in77_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[1]),
        .O(p_1_in[25]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[26]_i_1 
       (.I0(p_0_in79_in),
        .I1(p_1_in80_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[2]),
        .O(p_1_in[26]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[27]_i_1 
       (.I0(p_0_in82_in),
        .I1(p_1_in83_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[3]),
        .O(p_1_in[27]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[28]_i_1 
       (.I0(p_0_in85_in),
        .I1(p_1_in86_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[4]),
        .O(p_1_in[28]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[29]_i_1 
       (.I0(p_0_in88_in),
        .I1(p_1_in89_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[5]),
        .O(p_1_in[29]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[2]_i_1 
       (.I0(p_0_in6_in),
        .I1(p_1_in7_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[2]),
        .O(p_1_in[2]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[30]_i_1 
       (.I0(p_0_in91_in),
        .I1(p_1_in92_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[6]),
        .O(p_1_in[30]));
  LUT6 #(
    .INIT(64'h40404040FF000000)) 
    \s0[31]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[31]_i_2 
       (.I0(\s1_reg_n_0_[31] ),
        .I1(\s0_reg_n_0_[31] ),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[7]),
        .O(p_1_in[31]));
  LUT1 #(
    .INIT(2'h1)) 
    \s0[31]_i_3 
       (.I0(rst_n_IBUF),
        .O(\s0[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[3]_i_1 
       (.I0(p_0_in9_in),
        .I1(p_1_in10_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[3]),
        .O(p_1_in[3]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[4]_i_1 
       (.I0(p_0_in12_in),
        .I1(p_1_in13_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[4]),
        .O(p_1_in[4]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[5]_i_1 
       (.I0(p_0_in15_in),
        .I1(p_1_in16_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[5]),
        .O(p_1_in[5]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[6]_i_1 
       (.I0(p_0_in18_in),
        .I1(p_1_in19_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[6]),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'h01010101FF000000)) 
    \s0[7]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s0[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[7]_i_2 
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[7]),
        .O(p_1_in[7]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[8]_i_1 
       (.I0(p_0_in24_in),
        .I1(p_1_in25_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[0]),
        .O(p_1_in[8]));
  LUT4 #(
    .INIT(16'hF606)) 
    \s0[9]_i_1 
       (.I0(p_0_in27_in),
        .I1(p_1_in28_in),
        .I2(uio_in_IBUF[3]),
        .I3(ui_in_IBUF[1]),
        .O(p_1_in[9]));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[0] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[0]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(\s0_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[10] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[10]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in31_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[11] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[11]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in34_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[12] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[12]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in37_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[13] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[13]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in40_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[14] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[14]),
        .Q(p_1_in43_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[15] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[15]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in46_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[16] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .D(p_1_in[16]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in49_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[17] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[17]),
        .Q(p_1_in52_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[18] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .D(p_1_in[18]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in55_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[19] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .D(p_1_in[19]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in58_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[1] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[1]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in_0));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[20] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[20]),
        .Q(p_1_in61_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[21] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .D(p_1_in[21]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in64_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[22] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[22]),
        .Q(p_1_in68_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[23] 
       (.C(CLK),
        .CE(\s0[23]_i_1_n_0 ),
        .D(p_1_in[23]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in71_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[24] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[24]),
        .Q(p_1_in74_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[25] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[25]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in77_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[26] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[26]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in80_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[27] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[27]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in83_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[28] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[28]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in86_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[29] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[29]),
        .Q(p_1_in89_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[2] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[2]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in7_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[30] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[30]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in92_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[31] 
       (.C(CLK),
        .CE(\s0[31]_i_1_n_0 ),
        .D(p_1_in[31]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(\s0_reg_n_0_[31] ));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[3] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[3]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in10_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[4] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[4]),
        .Q(p_1_in13_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[5] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[5]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in16_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[6] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[6]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in19_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[7] 
       (.C(CLK),
        .CE(\s0[7]_i_1_n_0 ),
        .D(p_1_in[7]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in22_in));
  FDCE #(
    .INIT(1'b0)) 
    \s0_reg[8] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(p_1_in[8]),
        .Q(p_1_in25_in));
  FDPE #(
    .INIT(1'b1)) 
    \s0_reg[9] 
       (.C(CLK),
        .CE(\s0[15]_i_1_n_0 ),
        .D(p_1_in[9]),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_1_in28_in));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[0]_i_1 
       (.I0(ui_in_IBUF[0]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in19_in),
        .I3(\s1_reg_n_0_[0] ),
        .O(\s1[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[10]_i_1 
       (.I0(ui_in_IBUF[2]),
        .I1(p_0_in30_in),
        .I2(p_1_in49_in),
        .I3(p_0_in3_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[11]_i_1 
       (.I0(ui_in_IBUF[3]),
        .I1(p_0_in33_in),
        .I2(p_1_in52_in),
        .I3(p_0_in6_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[12]_i_1 
       (.I0(ui_in_IBUF[4]),
        .I1(p_0_in36_in),
        .I2(p_1_in55_in),
        .I3(p_0_in9_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[13]_i_1 
       (.I0(ui_in_IBUF[5]),
        .I1(p_0_in39_in),
        .I2(p_1_in58_in),
        .I3(p_0_in12_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[14]_i_1 
       (.I0(ui_in_IBUF[6]),
        .I1(p_0_in42_in),
        .I2(p_1_in61_in),
        .I3(p_0_in15_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h08080808FF000000)) 
    \s1[15]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s1[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[15]_i_2 
       (.I0(ui_in_IBUF[7]),
        .I1(p_0_in45_in),
        .I2(p_1_in64_in),
        .I3(p_0_in18_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[16]_i_1 
       (.I0(ui_in_IBUF[0]),
        .I1(p_0_in48_in),
        .I2(p_1_in68_in),
        .I3(p_0_in21_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[17]_i_1 
       (.I0(ui_in_IBUF[1]),
        .I1(p_0_in51_in),
        .I2(p_1_in71_in),
        .I3(p_0_in24_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[18]_i_1 
       (.I0(ui_in_IBUF[2]),
        .I1(p_0_in54_in),
        .I2(p_1_in74_in),
        .I3(p_0_in27_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[19]_i_1 
       (.I0(ui_in_IBUF[3]),
        .I1(p_0_in57_in),
        .I2(p_1_in77_in),
        .I3(p_0_in30_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[1]_i_1 
       (.I0(ui_in_IBUF[1]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in22_in),
        .I3(p_0_in3_in),
        .O(\s1[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[20]_i_1 
       (.I0(ui_in_IBUF[4]),
        .I1(p_0_in60_in),
        .I2(p_1_in80_in),
        .I3(p_0_in33_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[21]_i_1 
       (.I0(ui_in_IBUF[5]),
        .I1(p_0_in63_in),
        .I2(p_1_in83_in),
        .I3(p_0_in36_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[22]_i_1 
       (.I0(ui_in_IBUF[6]),
        .I1(p_0_in67_in),
        .I2(p_1_in86_in),
        .I3(p_0_in39_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h08080808FF000000)) 
    \s1[23]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[1]),
        .I2(uio_in_IBUF[0]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s1[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[23]_i_2 
       (.I0(ui_in_IBUF[7]),
        .I1(p_0_in70_in),
        .I2(p_1_in89_in),
        .I3(p_0_in42_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[24]_i_1 
       (.I0(ui_in_IBUF[0]),
        .I1(p_0_in73_in),
        .I2(p_1_in92_in),
        .I3(p_0_in45_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[25]_i_1 
       (.I0(ui_in_IBUF[1]),
        .I1(p_0_in76_in),
        .I2(\s0_reg_n_0_[31] ),
        .I3(p_0_in48_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[26]_i_1 
       (.I0(ui_in_IBUF[2]),
        .I1(p_0_in51_in),
        .I2(p_0_in79_in),
        .I3(\s0_reg_n_0_[0] ),
        .I4(uio_in_IBUF[3]),
        .O(\s1[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[27]_i_1 
       (.I0(ui_in_IBUF[3]),
        .I1(p_0_in54_in),
        .I2(p_0_in82_in),
        .I3(p_1_in_0),
        .I4(uio_in_IBUF[3]),
        .O(\s1[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[28]_i_1 
       (.I0(ui_in_IBUF[4]),
        .I1(p_0_in57_in),
        .I2(p_0_in85_in),
        .I3(p_1_in7_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[29]_i_1 
       (.I0(ui_in_IBUF[5]),
        .I1(p_0_in60_in),
        .I2(p_0_in88_in),
        .I3(p_1_in10_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[29]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[2]_i_1 
       (.I0(ui_in_IBUF[2]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in25_in),
        .I3(p_0_in6_in),
        .O(\s1[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[30]_i_1 
       (.I0(ui_in_IBUF[6]),
        .I1(p_0_in63_in),
        .I2(p_0_in91_in),
        .I3(p_1_in13_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h80808080FF000000)) 
    \s1[31]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s1[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[31]_i_2 
       (.I0(ui_in_IBUF[7]),
        .I1(p_0_in67_in),
        .I2(\s1_reg_n_0_[31] ),
        .I3(p_1_in16_in),
        .I4(uio_in_IBUF[3]),
        .O(\s1[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[3]_i_1 
       (.I0(ui_in_IBUF[3]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in28_in),
        .I3(p_0_in9_in),
        .O(\s1[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[4]_i_1 
       (.I0(ui_in_IBUF[4]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in31_in),
        .I3(p_0_in12_in),
        .O(\s1[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[5]_i_1 
       (.I0(ui_in_IBUF[5]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in34_in),
        .I3(p_0_in15_in),
        .O(\s1[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[6]_i_1 
       (.I0(ui_in_IBUF[6]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in37_in),
        .I3(p_0_in18_in),
        .O(\s1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02020202FF000000)) 
    \s1[7]_i_1 
       (.I0(uio_in_IBUF[2]),
        .I1(uio_in_IBUF[0]),
        .I2(uio_in_IBUF[1]),
        .I3(ena_IBUF),
        .I4(uio_in_IBUF[4]),
        .I5(uio_in_IBUF[3]),
        .O(\s1[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[7]_i_2 
       (.I0(ui_in_IBUF[7]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in40_in),
        .I3(p_0_in21_in),
        .O(\s1[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h8BB8)) 
    \s1[8]_i_1 
       (.I0(ui_in_IBUF[0]),
        .I1(uio_in_IBUF[3]),
        .I2(p_1_in43_in),
        .I3(p_0_in24_in),
        .O(\s1[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAC33C)) 
    \s1[9]_i_1 
       (.I0(ui_in_IBUF[1]),
        .I1(p_0_in27_in),
        .I2(p_1_in46_in),
        .I3(\s1_reg_n_0_[0] ),
        .I4(uio_in_IBUF[3]),
        .O(\s1[9]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[0] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .D(\s1[0]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(\s1_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[10] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[10]_i_1_n_0 ),
        .Q(p_0_in30_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[11] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[11]_i_1_n_0 ),
        .Q(p_0_in33_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[12] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .D(\s1[12]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in36_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[13] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .D(\s1[13]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in39_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[14] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .D(\s1[14]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in42_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[15] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .D(\s1[15]_i_2_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in45_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[16] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[16]_i_1_n_0 ),
        .Q(p_0_in48_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[17] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[17]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in51_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[18] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[18]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in54_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[19] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[19]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in57_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[1] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[1]_i_1_n_0 ),
        .Q(p_0_in3_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[20] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[20]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in60_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[21] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[21]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in63_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[22] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[22]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in67_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[23] 
       (.C(CLK),
        .CE(\s1[23]_i_1_n_0 ),
        .D(\s1[23]_i_2_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in70_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[24] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[24]_i_1_n_0 ),
        .Q(p_0_in73_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[25] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .D(\s1[25]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in76_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[26] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[26]_i_1_n_0 ),
        .Q(p_0_in79_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[27] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .D(\s1[27]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in82_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[28] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[28]_i_1_n_0 ),
        .Q(p_0_in85_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[29] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[29]_i_1_n_0 ),
        .Q(p_0_in88_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[2] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .D(\s1[2]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in6_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[30] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .D(\s1[30]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in91_in));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[31] 
       (.C(CLK),
        .CE(\s1[31]_i_1_n_0 ),
        .D(\s1[31]_i_2_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(\s1_reg_n_0_[31] ));
  FDPE #(
    .INIT(1'b1)) 
    \s1_reg[3] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .D(\s1[3]_i_1_n_0 ),
        .PRE(\s0[31]_i_3_n_0 ),
        .Q(p_0_in9_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[4] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[4]_i_1_n_0 ),
        .Q(p_0_in12_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[5] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[5]_i_1_n_0 ),
        .Q(p_0_in15_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[6] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[6]_i_1_n_0 ),
        .Q(p_0_in18_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[7] 
       (.C(CLK),
        .CE(\s1[7]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[7]_i_2_n_0 ),
        .Q(p_0_in21_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[8] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[8]_i_1_n_0 ),
        .Q(p_0_in24_in));
  FDCE #(
    .INIT(1'b0)) 
    \s1_reg[9] 
       (.C(CLK),
        .CE(\s1[15]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(\s1[9]_i_1_n_0 ),
        .Q(p_0_in27_in));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \shift_reg[0]_i_1 
       (.I0(\s0_reg_n_0_[0] ),
        .I1(\s1_reg_n_0_[0] ),
        .I2(\shift_reg[31]_i_3_n_0 ),
        .O(shift_reg[0]));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[10]_i_1 
       (.I0(p_0_in30_in),
        .I1(p_1_in31_in),
        .I2(rca_carry_10__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[10]),
        .O(shift_reg[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[10]_i_2 
       (.I0(p_0_in27_in),
        .I1(p_1_in28_in),
        .I2(rca_carry_9__4),
        .O(rca_carry_10__4));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[11]_i_1 
       (.I0(p_0_in33_in),
        .I1(p_1_in34_in),
        .I2(rca_carry_11__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[11]),
        .O(shift_reg[11]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[11]_i_2 
       (.I0(p_0_in30_in),
        .I1(p_1_in31_in),
        .I2(p_0_in27_in),
        .I3(p_1_in28_in),
        .I4(rca_carry_9__4),
        .O(rca_carry_11__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[12]_i_1 
       (.I0(p_0_in36_in),
        .I1(p_1_in37_in),
        .I2(rca_carry_12__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[12]),
        .O(shift_reg[12]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[12]_i_2 
       (.I0(p_0_in33_in),
        .I1(p_1_in34_in),
        .I2(rca_carry_11__4),
        .O(rca_carry_12__4));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[13]_i_1 
       (.I0(p_0_in39_in),
        .I1(p_1_in40_in),
        .I2(rca_carry_13__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[13]),
        .O(shift_reg[13]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[13]_i_2 
       (.I0(p_0_in36_in),
        .I1(p_1_in37_in),
        .I2(p_0_in33_in),
        .I3(p_1_in34_in),
        .I4(rca_carry_11__4),
        .O(rca_carry_13__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[14]_i_1 
       (.I0(p_0_in42_in),
        .I1(p_1_in43_in),
        .I2(rca_carry_14__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[14]),
        .O(shift_reg[14]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[14]_i_2 
       (.I0(p_0_in39_in),
        .I1(p_1_in40_in),
        .I2(rca_carry_13__4),
        .O(rca_carry_14__4));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[15]_i_1 
       (.I0(p_0_in45_in),
        .I1(p_1_in46_in),
        .I2(rca_carry_15__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[15]),
        .O(shift_reg[15]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[15]_i_2 
       (.I0(p_0_in42_in),
        .I1(p_1_in43_in),
        .I2(p_0_in39_in),
        .I3(p_1_in40_in),
        .I4(rca_carry_13__4),
        .O(rca_carry_15__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[16]_i_1 
       (.I0(p_0_in48_in),
        .I1(p_1_in49_in),
        .I2(rca_carry_16__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[16]),
        .O(shift_reg[16]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[16]_i_2 
       (.I0(p_0_in45_in),
        .I1(p_1_in46_in),
        .I2(rca_carry_15__4),
        .O(rca_carry_16__4));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[17]_i_1 
       (.I0(p_0_in51_in),
        .I1(p_1_in52_in),
        .I2(rca_carry_17__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[17]),
        .O(shift_reg[17]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[17]_i_2 
       (.I0(p_0_in48_in),
        .I1(p_1_in49_in),
        .I2(p_0_in45_in),
        .I3(p_1_in46_in),
        .I4(rca_carry_15__4),
        .O(rca_carry_17__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[18]_i_1 
       (.I0(p_0_in54_in),
        .I1(p_1_in55_in),
        .I2(rca_carry_18__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[18]),
        .O(shift_reg[18]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[18]_i_2 
       (.I0(p_0_in51_in),
        .I1(p_1_in52_in),
        .I2(rca_carry_17__4),
        .O(rca_carry_18__4));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[19]_i_1 
       (.I0(p_0_in57_in),
        .I1(p_1_in58_in),
        .I2(rca_carry_19__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[19]),
        .O(shift_reg[19]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[19]_i_2 
       (.I0(p_0_in54_in),
        .I1(p_1_in55_in),
        .I2(p_0_in51_in),
        .I3(p_1_in52_in),
        .I4(rca_carry_17__4),
        .O(rca_carry_19__4));
  LUT6 #(
    .INIT(64'hFFFF877800008778)) 
    \shift_reg[1]_i_1 
       (.I0(\s0_reg_n_0_[0] ),
        .I1(\s1_reg_n_0_[0] ),
        .I2(p_1_in_0),
        .I3(p_0_in3_in),
        .I4(\shift_reg[31]_i_3_n_0 ),
        .I5(data1[1]),
        .O(shift_reg[1]));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[20]_i_1 
       (.I0(p_0_in60_in),
        .I1(p_1_in61_in),
        .I2(rca_carry_2019_out),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[20]),
        .O(shift_reg[20]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[20]_i_2 
       (.I0(p_0_in57_in),
        .I1(p_1_in58_in),
        .I2(rca_carry_19__4),
        .O(rca_carry_2019_out));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[21]_i_1 
       (.I0(p_0_in63_in),
        .I1(p_1_in64_in),
        .I2(rca_carry_2121_out),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[21]),
        .O(shift_reg[21]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[21]_i_2 
       (.I0(p_0_in60_in),
        .I1(p_1_in61_in),
        .I2(p_0_in57_in),
        .I3(p_1_in58_in),
        .I4(rca_carry_19__4),
        .O(rca_carry_2121_out));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[22]_i_1 
       (.I0(p_0_in67_in),
        .I1(p_1_in68_in),
        .I2(rca_carry_2266_in),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[22]),
        .O(shift_reg[22]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[22]_i_2 
       (.I0(p_0_in63_in),
        .I1(p_1_in64_in),
        .I2(rca_carry_2121_out),
        .O(rca_carry_2266_in));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[23]_i_1 
       (.I0(p_0_in70_in),
        .I1(p_1_in71_in),
        .I2(rca_carry_23__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[23]),
        .O(shift_reg[23]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[23]_i_2 
       (.I0(p_0_in67_in),
        .I1(p_1_in68_in),
        .I2(p_0_in63_in),
        .I3(p_1_in64_in),
        .I4(rca_carry_2121_out),
        .O(rca_carry_23__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[24]_i_1 
       (.I0(p_0_in73_in),
        .I1(p_1_in74_in),
        .I2(rca_carry_24__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[24]),
        .O(shift_reg[24]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[24]_i_2 
       (.I0(p_0_in70_in),
        .I1(p_1_in71_in),
        .I2(rca_carry_23__4),
        .O(rca_carry_24__4));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[25]_i_1 
       (.I0(p_0_in76_in),
        .I1(p_1_in77_in),
        .I2(rca_carry_25__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[25]),
        .O(shift_reg[25]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[25]_i_2 
       (.I0(p_0_in73_in),
        .I1(p_1_in74_in),
        .I2(p_0_in70_in),
        .I3(p_1_in71_in),
        .I4(rca_carry_23__4),
        .O(rca_carry_25__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[26]_i_1 
       (.I0(p_0_in79_in),
        .I1(p_1_in80_in),
        .I2(rca_carry_26__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[26]),
        .O(shift_reg[26]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[26]_i_2 
       (.I0(p_0_in76_in),
        .I1(p_1_in77_in),
        .I2(rca_carry_25__4),
        .O(rca_carry_26__4));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[27]_i_1 
       (.I0(p_0_in82_in),
        .I1(p_1_in83_in),
        .I2(rca_carry_27__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[27]),
        .O(shift_reg[27]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[27]_i_2 
       (.I0(p_0_in79_in),
        .I1(p_1_in80_in),
        .I2(p_0_in76_in),
        .I3(p_1_in77_in),
        .I4(rca_carry_25__4),
        .O(rca_carry_27__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[28]_i_1 
       (.I0(p_0_in85_in),
        .I1(p_1_in86_in),
        .I2(rca_carry_28__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[28]),
        .O(shift_reg[28]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[28]_i_2 
       (.I0(p_0_in82_in),
        .I1(p_1_in83_in),
        .I2(rca_carry_27__4),
        .O(rca_carry_28__4));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[29]_i_1 
       (.I0(p_0_in88_in),
        .I1(p_1_in89_in),
        .I2(rca_carry_29__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[29]),
        .O(shift_reg[29]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[29]_i_2 
       (.I0(p_0_in85_in),
        .I1(p_1_in86_in),
        .I2(p_0_in82_in),
        .I3(p_1_in83_in),
        .I4(rca_carry_27__4),
        .O(rca_carry_29__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[2]_i_1 
       (.I0(rca_carry_2__4),
        .I1(p_0_in6_in),
        .I2(p_1_in7_in),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[2]),
        .O(shift_reg[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    \shift_reg[2]_i_2 
       (.I0(p_0_in3_in),
        .I1(\s1_reg_n_0_[0] ),
        .I2(\s0_reg_n_0_[0] ),
        .I3(p_1_in_0),
        .O(rca_carry_2__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[30]_i_1 
       (.I0(p_0_in91_in),
        .I1(p_1_in92_in),
        .I2(rca_carry_3031_out),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[30]),
        .O(shift_reg[30]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[30]_i_2 
       (.I0(p_0_in88_in),
        .I1(p_1_in89_in),
        .I2(rca_carry_29__4),
        .O(rca_carry_3031_out));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[31]_i_1 
       (.I0(\s1_reg_n_0_[31] ),
        .I1(\s0_reg_n_0_[31] ),
        .I2(rca_carry_3133_out),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[31]),
        .O(shift_reg[31]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[31]_i_2 
       (.I0(p_0_in91_in),
        .I1(p_1_in92_in),
        .I2(p_0_in88_in),
        .I3(p_1_in89_in),
        .I4(rca_carry_29__4),
        .O(rca_carry_3133_out));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \shift_reg[31]_i_3 
       (.I0(bit_cnt[5]),
        .I1(bit_cnt[3]),
        .I2(bit_cnt[1]),
        .I3(bit_cnt[4]),
        .I4(bit_cnt[2]),
        .I5(bit_cnt[0]),
        .O(\shift_reg[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[3]_i_1 
       (.I0(p_0_in9_in),
        .I1(p_1_in10_in),
        .I2(rca_carry_3__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[3]),
        .O(shift_reg[3]));
  LUT6 #(
    .INIT(64'hEEE8E8E8E8888888)) 
    \shift_reg[3]_i_2 
       (.I0(p_0_in6_in),
        .I1(p_1_in7_in),
        .I2(p_0_in3_in),
        .I3(\s1_reg_n_0_[0] ),
        .I4(\s0_reg_n_0_[0] ),
        .I5(p_1_in_0),
        .O(rca_carry_3__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[4]_i_1 
       (.I0(p_0_in12_in),
        .I1(p_1_in13_in),
        .I2(rca_carry_4__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[4]),
        .O(shift_reg[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[4]_i_2 
       (.I0(p_0_in9_in),
        .I1(p_1_in10_in),
        .I2(rca_carry_3__4),
        .O(rca_carry_4__4));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[5]_i_1 
       (.I0(p_0_in15_in),
        .I1(p_1_in16_in),
        .I2(rca_carry_5__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[5]),
        .O(shift_reg[5]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[5]_i_2 
       (.I0(p_0_in12_in),
        .I1(p_1_in13_in),
        .I2(p_0_in9_in),
        .I3(p_1_in10_in),
        .I4(rca_carry_3__4),
        .O(rca_carry_5__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[6]_i_1 
       (.I0(p_0_in18_in),
        .I1(p_1_in19_in),
        .I2(rca_carry_6__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[6]),
        .O(shift_reg[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[6]_i_2 
       (.I0(p_0_in15_in),
        .I1(p_1_in16_in),
        .I2(rca_carry_5__4),
        .O(rca_carry_6__4));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[7]_i_1 
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .I2(rca_carry_7__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[7]),
        .O(shift_reg[7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[7]_i_2 
       (.I0(p_0_in18_in),
        .I1(p_1_in19_in),
        .I2(p_0_in15_in),
        .I3(p_1_in16_in),
        .I4(rca_carry_5__4),
        .O(rca_carry_7__4));
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[8]_i_1 
       (.I0(p_0_in24_in),
        .I1(p_1_in25_in),
        .I2(rca_carry_8__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[8]),
        .O(shift_reg[8]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \shift_reg[8]_i_2 
       (.I0(p_0_in21_in),
        .I1(p_1_in22_in),
        .I2(rca_carry_7__4),
        .O(rca_carry_8__4));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFF960096)) 
    \shift_reg[9]_i_1 
       (.I0(p_0_in27_in),
        .I1(p_1_in28_in),
        .I2(rca_carry_9__4),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .I4(data1[9]),
        .O(shift_reg[9]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \shift_reg[9]_i_2 
       (.I0(p_0_in24_in),
        .I1(p_1_in25_in),
        .I2(p_0_in21_in),
        .I3(p_1_in22_in),
        .I4(rca_carry_7__4),
        .O(rca_carry_9__4));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[0]),
        .Q(data1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[10] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[10]),
        .Q(data1[11]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[11] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[11]),
        .Q(data1[12]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[12] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[12]),
        .Q(data1[13]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[13] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[13]),
        .Q(data1[14]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[14] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[14]),
        .Q(data1[15]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[15] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[15]),
        .Q(data1[16]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[16] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[16]),
        .Q(data1[17]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[17] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[17]),
        .Q(data1[18]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[18] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[18]),
        .Q(data1[19]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[19] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[19]),
        .Q(data1[20]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[1] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[1]),
        .Q(data1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[20] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[20]),
        .Q(data1[21]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[21] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[21]),
        .Q(data1[22]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[22] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[22]),
        .Q(data1[23]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[23] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[23]),
        .Q(data1[24]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[24] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[24]),
        .Q(data1[25]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[25] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[25]),
        .Q(data1[26]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[26] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[26]),
        .Q(data1[27]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[27] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[27]),
        .Q(data1[28]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[28] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[28]),
        .Q(data1[29]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[29] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[29]),
        .Q(data1[30]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[2] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[2]),
        .Q(data1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[30] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[30]),
        .Q(data1[31]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[31] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[31]),
        .Q(uo_out_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[3] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[3]),
        .Q(data1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[4] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[4]),
        .Q(data1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[5] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[5]),
        .Q(data1[6]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[6] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[6]),
        .Q(data1[7]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[7] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[7]),
        .Q(data1[8]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[8] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[8]),
        .Q(data1[9]));
  FDCE #(
    .INIT(1'b0)) 
    \shift_reg_reg[9] 
       (.C(CLK),
        .CE(\bit_cnt[5]_i_1_n_0 ),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(shift_reg[9]),
        .Q(data1[10]));
  LUT4 #(
    .INIT(16'h0008)) 
    valid_out_i_1
       (.I0(ena_IBUF),
        .I1(uio_in_IBUF[4]),
        .I2(uio_in_IBUF[3]),
        .I3(\shift_reg[31]_i_3_n_0 ),
        .O(valid_out1_out));
  FDCE #(
    .INIT(1'b0)) 
    valid_out_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(\s0[31]_i_3_n_0 ),
        .D(valid_out1_out),
        .Q(uo_out_OBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
