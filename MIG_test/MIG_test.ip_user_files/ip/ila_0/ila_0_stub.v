// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Jan 23 17:55:18 2021
// Host        : KomaroKomp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Entertaiment/Programy/VHDL/VHDL/MIG_test/MIG_test.gen/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[15:0],probe2[15:0],probe3[0:0],probe4[0:0],probe5[3:0],probe6[21:0],probe7[0:0],probe8[0:0],probe9[0:0],probe10[0:0],probe11[0:0],probe12[21:0],probe13[3:0],probe14[21:0],probe15[63:0],probe16[63:0]" */;
  input clk;
  input [0:0]probe0;
  input [15:0]probe1;
  input [15:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [3:0]probe5;
  input [21:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [21:0]probe12;
  input [3:0]probe13;
  input [21:0]probe14;
  input [63:0]probe15;
  input [63:0]probe16;
endmodule
