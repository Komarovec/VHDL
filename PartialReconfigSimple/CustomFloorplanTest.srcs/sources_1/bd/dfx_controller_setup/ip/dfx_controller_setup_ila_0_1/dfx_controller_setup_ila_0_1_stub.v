// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Sep 22 22:26:46 2020
// Host        : KomaroKomp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Entertaiment/Programy/VHDL/VHDL/PartialReconfigSimple/CustomFloorplanTest.srcs/sources_1/bd/dfx_controller_setup/ip/dfx_controller_setup_ila_0_1/dfx_controller_setup_ila_0_1_stub.v
// Design      : dfx_controller_setup_ila_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.1" *)
module dfx_controller_setup_ila_0_1(clk, probe0, probe1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[31:0]" */;
  input clk;
  input [0:0]probe0;
  input [31:0]probe1;
endmodule
