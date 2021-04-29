// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Sep 10 17:42:59 2020
// Host        : KomaroKomp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Entertaiment/Programy/VHDL/VHDL/PartialReconfigSimple/MEMcontroller/MEMcontroller.srcs/sources_1/bd/design_1/ip/design_1_reset_inv_0_5/design_1_reset_inv_0_5_stub.v
// Design      : design_1_reset_inv_0_5
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2020.1" *)
module design_1_reset_inv_0_5(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule
