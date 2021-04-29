// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Sep 18 17:16:29 2020
// Host        : KomaroKomp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Entertaiment/Programy/VHDL/VHDL/PartialReconfigSimple/CustomFloorplanTest.runs/ila_0_synth_1/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.1" *)
module ila_0(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[1:0],probe1[31:0],probe2[0:0],probe3[8:0]" */;
  input clk;
  input [1:0]probe0;
  input [31:0]probe1;
  input [0:0]probe2;
  input [8:0]probe3;
endmodule
