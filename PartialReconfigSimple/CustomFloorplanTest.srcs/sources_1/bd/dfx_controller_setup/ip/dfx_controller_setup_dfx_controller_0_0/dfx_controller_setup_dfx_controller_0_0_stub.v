// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Oct  3 18:02:33 2020
// Host        : KomaroKomp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Entertaiment/Programy/VHDL/VHDL/PartialReconfigSimple/CustomFloorplanTest.srcs/sources_1/bd/dfx_controller_setup/ip/dfx_controller_setup_dfx_controller_0_0/dfx_controller_setup_dfx_controller_0_0_stub.v
// Design      : dfx_controller_setup_dfx_controller_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dfx_controller_dfx_controller_setup_dfx_controller_0_0,Vivado 2020.1" *)
module dfx_controller_setup_dfx_controller_0_0(m_axi_mem_araddr, m_axi_mem_arlen, 
  m_axi_mem_arsize, m_axi_mem_arburst, m_axi_mem_arprot, m_axi_mem_arcache, 
  m_axi_mem_aruser, m_axi_mem_arvalid, m_axi_mem_arready, m_axi_mem_rdata, m_axi_mem_rresp, 
  m_axi_mem_rlast, m_axi_mem_rvalid, m_axi_mem_rready, clk, reset, icap_clk, icap_reset, 
  icap_csib, icap_rdwrb, icap_i, icap_o, vsm_VS_0_hw_triggers, vsm_VS_0_rm_shutdown_req, 
  vsm_VS_0_rm_shutdown_ack, vsm_VS_0_rm_decouple, vsm_VS_0_rm_reset, 
  vsm_VS_0_event_error, vsm_VS_0_m_axis_status_tdata, vsm_VS_0_m_axis_status_tvalid)
/* synthesis syn_black_box black_box_pad_pin="m_axi_mem_araddr[31:0],m_axi_mem_arlen[7:0],m_axi_mem_arsize[2:0],m_axi_mem_arburst[1:0],m_axi_mem_arprot[2:0],m_axi_mem_arcache[3:0],m_axi_mem_aruser[3:0],m_axi_mem_arvalid,m_axi_mem_arready,m_axi_mem_rdata[31:0],m_axi_mem_rresp[1:0],m_axi_mem_rlast,m_axi_mem_rvalid,m_axi_mem_rready,clk,reset,icap_clk,icap_reset,icap_csib,icap_rdwrb,icap_i[31:0],icap_o[31:0],vsm_VS_0_hw_triggers[1:0],vsm_VS_0_rm_shutdown_req,vsm_VS_0_rm_shutdown_ack,vsm_VS_0_rm_decouple,vsm_VS_0_rm_reset,vsm_VS_0_event_error,vsm_VS_0_m_axis_status_tdata[31:0],vsm_VS_0_m_axis_status_tvalid" */;
  output [31:0]m_axi_mem_araddr;
  output [7:0]m_axi_mem_arlen;
  output [2:0]m_axi_mem_arsize;
  output [1:0]m_axi_mem_arburst;
  output [2:0]m_axi_mem_arprot;
  output [3:0]m_axi_mem_arcache;
  output [3:0]m_axi_mem_aruser;
  output m_axi_mem_arvalid;
  input m_axi_mem_arready;
  input [31:0]m_axi_mem_rdata;
  input [1:0]m_axi_mem_rresp;
  input m_axi_mem_rlast;
  input m_axi_mem_rvalid;
  output m_axi_mem_rready;
  input clk;
  input reset;
  input icap_clk;
  input icap_reset;
  output icap_csib;
  output icap_rdwrb;
  input [31:0]icap_i;
  output [31:0]icap_o;
  input [1:0]vsm_VS_0_hw_triggers;
  output vsm_VS_0_rm_shutdown_req;
  input vsm_VS_0_rm_shutdown_ack;
  output vsm_VS_0_rm_decouple;
  output vsm_VS_0_rm_reset;
  output vsm_VS_0_event_error;
  output [31:0]vsm_VS_0_m_axis_status_tdata;
  output vsm_VS_0_m_axis_status_tvalid;
endmodule
