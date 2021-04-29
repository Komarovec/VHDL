--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Thu Sep 10 21:30:46 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    icap_csib : out STD_LOGIC;
    icap_i : out STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_o : in STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_rdwrb : out STD_LOGIC;
    qspi_flash_io0_i : in STD_LOGIC;
    qspi_flash_io0_o : out STD_LOGIC;
    qspi_flash_io0_t : out STD_LOGIC;
    qspi_flash_io1_i : in STD_LOGIC;
    qspi_flash_io1_o : out STD_LOGIC;
    qspi_flash_io1_t : out STD_LOGIC;
    qspi_flash_ss_i : in STD_LOGIC;
    qspi_flash_ss_o : out STD_LOGIC;
    qspi_flash_ss_t : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=9,da_board_cnt=12,da_bram_cntlr_cnt=1,da_clkrst_cnt=27,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_axi_quad_spi_0_1 is
  port (
    ext_spi_clk : in STD_LOGIC;
    s_axi4_aclk : in STD_LOGIC;
    s_axi4_aresetn : in STD_LOGIC;
    s_axi4_awaddr : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi4_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi4_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi4_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi4_awlock : in STD_LOGIC;
    s_axi4_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi4_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi4_awvalid : in STD_LOGIC;
    s_axi4_awready : out STD_LOGIC;
    s_axi4_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi4_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi4_wlast : in STD_LOGIC;
    s_axi4_wvalid : in STD_LOGIC;
    s_axi4_wready : out STD_LOGIC;
    s_axi4_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi4_bvalid : out STD_LOGIC;
    s_axi4_bready : in STD_LOGIC;
    s_axi4_araddr : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi4_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi4_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi4_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi4_arlock : in STD_LOGIC;
    s_axi4_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi4_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi4_arvalid : in STD_LOGIC;
    s_axi4_arready : out STD_LOGIC;
    s_axi4_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi4_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi4_rlast : out STD_LOGIC;
    s_axi4_rvalid : out STD_LOGIC;
    s_axi4_rready : in STD_LOGIC;
    io0_i : in STD_LOGIC;
    io0_o : out STD_LOGIC;
    io0_t : out STD_LOGIC;
    io1_i : in STD_LOGIC;
    io1_o : out STD_LOGIC;
    io1_t : out STD_LOGIC;
    spisel : in STD_LOGIC;
    ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    ss_t : out STD_LOGIC;
    cfgclk : out STD_LOGIC;
    cfgmclk : out STD_LOGIC;
    eos : out STD_LOGIC;
    preq : out STD_LOGIC;
    ip2intc_irpt : out STD_LOGIC
  );
  end component design_1_axi_quad_spi_0_1;
  component design_1_dfx_controller_0_0 is
  port (
    m_axi_mem_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mem_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mem_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mem_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mem_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mem_arvalid : out STD_LOGIC;
    m_axi_mem_arready : in STD_LOGIC;
    m_axi_mem_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mem_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mem_rlast : in STD_LOGIC;
    m_axi_mem_rvalid : in STD_LOGIC;
    m_axi_mem_rready : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    icap_clk : in STD_LOGIC;
    icap_reset : in STD_LOGIC;
    icap_csib : out STD_LOGIC;
    icap_rdwrb : out STD_LOGIC;
    icap_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vsm_VS_0_rm_shutdown_req : out STD_LOGIC;
    vsm_VS_0_rm_shutdown_ack : in STD_LOGIC;
    vsm_VS_0_rm_decouple : out STD_LOGIC;
    vsm_VS_0_rm_reset : out STD_LOGIC;
    vsm_VS_0_event_error : out STD_LOGIC;
    vsm_VS_0_sw_shutdown_req : out STD_LOGIC;
    vsm_VS_0_sw_startup_req : out STD_LOGIC;
    s_axi_reg_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_reg_awvalid : in STD_LOGIC;
    s_axi_reg_awready : out STD_LOGIC;
    s_axi_reg_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_reg_wvalid : in STD_LOGIC;
    s_axi_reg_wready : out STD_LOGIC;
    s_axi_reg_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_reg_bvalid : out STD_LOGIC;
    s_axi_reg_bready : in STD_LOGIC;
    s_axi_reg_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_reg_arvalid : in STD_LOGIC;
    s_axi_reg_arready : out STD_LOGIC;
    s_axi_reg_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_reg_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_reg_rvalid : out STD_LOGIC;
    s_axi_reg_rready : in STD_LOGIC
  );
  end component design_1_dfx_controller_0_0;
  component design_1_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_axi_protocol_convert_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_axi_protocol_convert_0_0;
  component design_1_axi_protocol_convert_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  end component design_1_axi_protocol_convert_1_0;
  component design_1_rst_clk_wiz_0_100M_5 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_rst_clk_wiz_0_100M_5;
  component design_1_reset_inv_0_5 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_reset_inv_0_5;
  signal axi_protocol_convert_0_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_convert_0_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_convert_0_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_convert_0_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_convert_0_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_convert_0_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_convert_0_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_convert_0_M_AXI_RVALID : STD_LOGIC;
  signal axi_protocol_convert_1_M_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_protocol_convert_1_M_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARREADY : STD_LOGIC;
  signal axi_protocol_convert_1_M_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_protocol_convert_1_M_AXI_ARVALID : STD_LOGIC;
  signal axi_protocol_convert_1_M_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_protocol_convert_1_M_AXI_RLAST : STD_LOGIC;
  signal axi_protocol_convert_1_M_AXI_RREADY : STD_LOGIC;
  signal axi_protocol_convert_1_M_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_protocol_convert_1_M_AXI_RVALID : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO0_I : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO0_O : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO0_T : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO1_I : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO1_O : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_IO1_T : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_SS_I : STD_LOGIC;
  signal axi_quad_spi_0_SPI_0_SS_O : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_quad_spi_0_SPI_0_SS_T : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal clk_wiz_0_locked : STD_LOGIC;
  signal dfx_controller_0_ICAP_csib : STD_LOGIC;
  signal dfx_controller_0_ICAP_i : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dfx_controller_0_ICAP_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dfx_controller_0_ICAP_rdwrb : STD_LOGIC;
  signal dfx_controller_0_M_AXI_MEM_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARREADY : STD_LOGIC;
  signal dfx_controller_0_M_AXI_MEM_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_ARVALID : STD_LOGIC;
  signal dfx_controller_0_M_AXI_MEM_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_RLAST : STD_LOGIC;
  signal dfx_controller_0_M_AXI_MEM_RREADY : STD_LOGIC;
  signal dfx_controller_0_M_AXI_MEM_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal dfx_controller_0_M_AXI_MEM_RVALID : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal reset_inv_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_clk_wiz_0_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sys_clock_1 : STD_LOGIC;
  signal NLW_axi_protocol_convert_1_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_protocol_convert_1_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_protocol_convert_1_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_axi_quad_spi_0_cfgclk_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_cfgmclk_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_eos_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_ip2intc_irpt_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_preq_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_s_axi4_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_s_axi4_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_s_axi4_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_quad_spi_0_s_axi4_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_dfx_controller_0_s_axi_reg_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_s_axi_reg_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_s_axi_reg_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_s_axi_reg_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_s_axi_reg_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_event_error_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_decouple_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_shutdown_req_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_sw_shutdown_req_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_sw_startup_req_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_s_axi_reg_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_dfx_controller_0_s_axi_reg_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_dfx_controller_0_s_axi_reg_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rst_clk_wiz_0_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_clk_wiz_0_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_0_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_0_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of icap_csib : signal is "xilinx.com:interface:icap:1.0 icap csib";
  attribute X_INTERFACE_INFO of icap_rdwrb : signal is "xilinx.com:interface:icap:1.0 icap rdwrb";
  attribute X_INTERFACE_INFO of qspi_flash_io0_i : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO0_I";
  attribute X_INTERFACE_INFO of qspi_flash_io0_o : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO0_O";
  attribute X_INTERFACE_INFO of qspi_flash_io0_t : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO0_T";
  attribute X_INTERFACE_INFO of qspi_flash_io1_i : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO1_I";
  attribute X_INTERFACE_INFO of qspi_flash_io1_o : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO1_O";
  attribute X_INTERFACE_INFO of qspi_flash_io1_t : signal is "xilinx.com:interface:spi:1.0 qspi_flash IO1_T";
  attribute X_INTERFACE_INFO of qspi_flash_ss_i : signal is "xilinx.com:interface:spi:1.0 qspi_flash SS_I";
  attribute X_INTERFACE_INFO of qspi_flash_ss_o : signal is "xilinx.com:interface:spi:1.0 qspi_flash SS_O";
  attribute X_INTERFACE_INFO of qspi_flash_ss_t : signal is "xilinx.com:interface:spi:1.0 qspi_flash SS_T";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of icap_i : signal is "xilinx.com:interface:icap:1.0 icap i";
  attribute X_INTERFACE_INFO of icap_o : signal is "xilinx.com:interface:icap:1.0 icap o";
begin
  axi_quad_spi_0_SPI_0_IO0_I <= qspi_flash_io0_i;
  axi_quad_spi_0_SPI_0_IO1_I <= qspi_flash_io1_i;
  axi_quad_spi_0_SPI_0_SS_I <= qspi_flash_ss_i;
  dfx_controller_0_ICAP_o(31 downto 0) <= icap_o(31 downto 0);
  icap_csib <= dfx_controller_0_ICAP_csib;
  icap_i(31 downto 0) <= dfx_controller_0_ICAP_i(31 downto 0);
  icap_rdwrb <= dfx_controller_0_ICAP_rdwrb;
  qspi_flash_io0_o <= axi_quad_spi_0_SPI_0_IO0_O;
  qspi_flash_io0_t <= axi_quad_spi_0_SPI_0_IO0_T;
  qspi_flash_io1_o <= axi_quad_spi_0_SPI_0_IO1_O;
  qspi_flash_io1_t <= axi_quad_spi_0_SPI_0_IO1_T;
  qspi_flash_ss_o <= axi_quad_spi_0_SPI_0_SS_O(0);
  qspi_flash_ss_t <= axi_quad_spi_0_SPI_0_SS_T;
  reset_1 <= reset;
  sys_clock_1 <= sys_clock;
axi_protocol_convert_0: component design_1_axi_protocol_convert_0_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_convert_0_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_convert_0_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_convert_0_M_AXI_ARCACHE(3 downto 0),
      m_axi_arlen(3 downto 0) => axi_protocol_convert_0_M_AXI_ARLEN(3 downto 0),
      m_axi_arlock(1 downto 0) => axi_protocol_convert_0_M_AXI_ARLOCK(1 downto 0),
      m_axi_arprot(2 downto 0) => axi_protocol_convert_0_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => axi_protocol_convert_0_M_AXI_ARQOS(3 downto 0),
      m_axi_arready => axi_protocol_convert_0_M_AXI_ARREADY,
      m_axi_arsize(2 downto 0) => axi_protocol_convert_0_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(3 downto 0) => axi_protocol_convert_0_M_AXI_ARUSER(3 downto 0),
      m_axi_arvalid => axi_protocol_convert_0_M_AXI_ARVALID,
      m_axi_rdata(31 downto 0) => axi_protocol_convert_0_M_AXI_RDATA(31 downto 0),
      m_axi_rlast => axi_protocol_convert_0_M_AXI_RLAST,
      m_axi_rready => axi_protocol_convert_0_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_convert_0_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_protocol_convert_0_M_AXI_RVALID,
      s_axi_araddr(31 downto 0) => dfx_controller_0_M_AXI_MEM_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => dfx_controller_0_M_AXI_MEM_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => dfx_controller_0_M_AXI_MEM_ARLEN(7 downto 0),
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => dfx_controller_0_M_AXI_MEM_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARSIZE(2 downto 0),
      s_axi_aruser(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARUSER(3 downto 0),
      s_axi_arvalid => dfx_controller_0_M_AXI_MEM_ARVALID,
      s_axi_rdata(31 downto 0) => dfx_controller_0_M_AXI_MEM_RDATA(31 downto 0),
      s_axi_rlast => dfx_controller_0_M_AXI_MEM_RLAST,
      s_axi_rready => dfx_controller_0_M_AXI_MEM_RREADY,
      s_axi_rresp(1 downto 0) => dfx_controller_0_M_AXI_MEM_RRESP(1 downto 0),
      s_axi_rvalid => dfx_controller_0_M_AXI_MEM_RVALID
    );
axi_protocol_convert_1: component design_1_axi_protocol_convert_1_0
     port map (
      aclk => clk_wiz_0_clk_out1,
      aresetn => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      m_axi_araddr(31 downto 0) => axi_protocol_convert_1_M_AXI_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => axi_protocol_convert_1_M_AXI_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => axi_protocol_convert_1_M_AXI_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => axi_protocol_convert_1_M_AXI_ARLEN(7 downto 0),
      m_axi_arlock(0) => axi_protocol_convert_1_M_AXI_ARLOCK(0),
      m_axi_arprot(2 downto 0) => axi_protocol_convert_1_M_AXI_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_axi_protocol_convert_1_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => axi_protocol_convert_1_M_AXI_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_axi_protocol_convert_1_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => axi_protocol_convert_1_M_AXI_ARSIZE(2 downto 0),
      m_axi_aruser(3 downto 0) => NLW_axi_protocol_convert_1_m_axi_aruser_UNCONNECTED(3 downto 0),
      m_axi_arvalid => axi_protocol_convert_1_M_AXI_ARVALID,
      m_axi_rdata(31 downto 0) => axi_protocol_convert_1_M_AXI_RDATA(31 downto 0),
      m_axi_rlast => axi_protocol_convert_1_M_AXI_RLAST,
      m_axi_rready => axi_protocol_convert_1_M_AXI_RREADY,
      m_axi_rresp(1 downto 0) => axi_protocol_convert_1_M_AXI_RRESP(1 downto 0),
      m_axi_rvalid => axi_protocol_convert_1_M_AXI_RVALID,
      s_axi_araddr(31 downto 0) => axi_protocol_convert_0_M_AXI_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => axi_protocol_convert_0_M_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_protocol_convert_0_M_AXI_ARCACHE(3 downto 0),
      s_axi_arlen(3 downto 0) => axi_protocol_convert_0_M_AXI_ARLEN(3 downto 0),
      s_axi_arlock(1 downto 0) => axi_protocol_convert_0_M_AXI_ARLOCK(1 downto 0),
      s_axi_arprot(2 downto 0) => axi_protocol_convert_0_M_AXI_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => axi_protocol_convert_0_M_AXI_ARQOS(3 downto 0),
      s_axi_arready => axi_protocol_convert_0_M_AXI_ARREADY,
      s_axi_arsize(2 downto 0) => axi_protocol_convert_0_M_AXI_ARSIZE(2 downto 0),
      s_axi_aruser(3 downto 0) => axi_protocol_convert_0_M_AXI_ARUSER(3 downto 0),
      s_axi_arvalid => axi_protocol_convert_0_M_AXI_ARVALID,
      s_axi_rdata(31 downto 0) => axi_protocol_convert_0_M_AXI_RDATA(31 downto 0),
      s_axi_rlast => axi_protocol_convert_0_M_AXI_RLAST,
      s_axi_rready => axi_protocol_convert_0_M_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_protocol_convert_0_M_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_protocol_convert_0_M_AXI_RVALID
    );
axi_quad_spi_0: component design_1_axi_quad_spi_0_1
     port map (
      cfgclk => NLW_axi_quad_spi_0_cfgclk_UNCONNECTED,
      cfgmclk => NLW_axi_quad_spi_0_cfgmclk_UNCONNECTED,
      eos => NLW_axi_quad_spi_0_eos_UNCONNECTED,
      ext_spi_clk => clk_wiz_0_clk_out1,
      io0_i => axi_quad_spi_0_SPI_0_IO0_I,
      io0_o => axi_quad_spi_0_SPI_0_IO0_O,
      io0_t => axi_quad_spi_0_SPI_0_IO0_T,
      io1_i => axi_quad_spi_0_SPI_0_IO1_I,
      io1_o => axi_quad_spi_0_SPI_0_IO1_O,
      io1_t => axi_quad_spi_0_SPI_0_IO1_T,
      ip2intc_irpt => NLW_axi_quad_spi_0_ip2intc_irpt_UNCONNECTED,
      preq => NLW_axi_quad_spi_0_preq_UNCONNECTED,
      s_axi4_aclk => clk_wiz_0_clk_out1,
      s_axi4_araddr(23 downto 0) => axi_protocol_convert_1_M_AXI_ARADDR(23 downto 0),
      s_axi4_arburst(1 downto 0) => axi_protocol_convert_1_M_AXI_ARBURST(1 downto 0),
      s_axi4_arcache(3 downto 0) => axi_protocol_convert_1_M_AXI_ARCACHE(3 downto 0),
      s_axi4_aresetn => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      s_axi4_arlen(7 downto 0) => axi_protocol_convert_1_M_AXI_ARLEN(7 downto 0),
      s_axi4_arlock => axi_protocol_convert_1_M_AXI_ARLOCK(0),
      s_axi4_arprot(2 downto 0) => axi_protocol_convert_1_M_AXI_ARPROT(2 downto 0),
      s_axi4_arready => axi_protocol_convert_1_M_AXI_ARREADY,
      s_axi4_arsize(2 downto 0) => axi_protocol_convert_1_M_AXI_ARSIZE(2 downto 0),
      s_axi4_arvalid => axi_protocol_convert_1_M_AXI_ARVALID,
      s_axi4_awaddr(23 downto 0) => B"000000000000000000000000",
      s_axi4_awburst(1 downto 0) => B"01",
      s_axi4_awcache(3 downto 0) => B"0011",
      s_axi4_awlen(7 downto 0) => B"00000000",
      s_axi4_awlock => '0',
      s_axi4_awprot(2 downto 0) => B"000",
      s_axi4_awready => NLW_axi_quad_spi_0_s_axi4_awready_UNCONNECTED,
      s_axi4_awsize(2 downto 0) => B"010",
      s_axi4_awvalid => '0',
      s_axi4_bready => '0',
      s_axi4_bresp(1 downto 0) => NLW_axi_quad_spi_0_s_axi4_bresp_UNCONNECTED(1 downto 0),
      s_axi4_bvalid => NLW_axi_quad_spi_0_s_axi4_bvalid_UNCONNECTED,
      s_axi4_rdata(31 downto 0) => axi_protocol_convert_1_M_AXI_RDATA(31 downto 0),
      s_axi4_rlast => axi_protocol_convert_1_M_AXI_RLAST,
      s_axi4_rready => axi_protocol_convert_1_M_AXI_RREADY,
      s_axi4_rresp(1 downto 0) => axi_protocol_convert_1_M_AXI_RRESP(1 downto 0),
      s_axi4_rvalid => axi_protocol_convert_1_M_AXI_RVALID,
      s_axi4_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi4_wlast => '0',
      s_axi4_wready => NLW_axi_quad_spi_0_s_axi4_wready_UNCONNECTED,
      s_axi4_wstrb(3 downto 0) => B"1111",
      s_axi4_wvalid => '0',
      spisel => '1',
      ss_i(0) => axi_quad_spi_0_SPI_0_SS_I,
      ss_o(0) => axi_quad_spi_0_SPI_0_SS_O(0),
      ss_t => axi_quad_spi_0_SPI_0_SS_T
    );
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => sys_clock_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => clk_wiz_0_locked,
      reset => reset_inv_0_Res(0)
    );
dfx_controller_0: component design_1_dfx_controller_0_0
     port map (
      clk => clk_wiz_0_clk_out1,
      icap_clk => clk_wiz_0_clk_out1,
      icap_csib => dfx_controller_0_ICAP_csib,
      icap_i(31 downto 0) => dfx_controller_0_ICAP_o(31 downto 0),
      icap_o(31 downto 0) => dfx_controller_0_ICAP_i(31 downto 0),
      icap_rdwrb => dfx_controller_0_ICAP_rdwrb,
      icap_reset => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      m_axi_mem_araddr(31 downto 0) => dfx_controller_0_M_AXI_MEM_ARADDR(31 downto 0),
      m_axi_mem_arburst(1 downto 0) => dfx_controller_0_M_AXI_MEM_ARBURST(1 downto 0),
      m_axi_mem_arcache(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARCACHE(3 downto 0),
      m_axi_mem_arlen(7 downto 0) => dfx_controller_0_M_AXI_MEM_ARLEN(7 downto 0),
      m_axi_mem_arprot(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARPROT(2 downto 0),
      m_axi_mem_arready => dfx_controller_0_M_AXI_MEM_ARREADY,
      m_axi_mem_arsize(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARSIZE(2 downto 0),
      m_axi_mem_aruser(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARUSER(3 downto 0),
      m_axi_mem_arvalid => dfx_controller_0_M_AXI_MEM_ARVALID,
      m_axi_mem_rdata(31 downto 0) => dfx_controller_0_M_AXI_MEM_RDATA(31 downto 0),
      m_axi_mem_rlast => dfx_controller_0_M_AXI_MEM_RLAST,
      m_axi_mem_rready => dfx_controller_0_M_AXI_MEM_RREADY,
      m_axi_mem_rresp(1 downto 0) => dfx_controller_0_M_AXI_MEM_RRESP(1 downto 0),
      m_axi_mem_rvalid => dfx_controller_0_M_AXI_MEM_RVALID,
      reset => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      s_axi_reg_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_reg_arready => NLW_dfx_controller_0_s_axi_reg_arready_UNCONNECTED,
      s_axi_reg_arvalid => '0',
      s_axi_reg_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_reg_awready => NLW_dfx_controller_0_s_axi_reg_awready_UNCONNECTED,
      s_axi_reg_awvalid => '0',
      s_axi_reg_bready => '0',
      s_axi_reg_bresp(1 downto 0) => NLW_dfx_controller_0_s_axi_reg_bresp_UNCONNECTED(1 downto 0),
      s_axi_reg_bvalid => NLW_dfx_controller_0_s_axi_reg_bvalid_UNCONNECTED,
      s_axi_reg_rdata(31 downto 0) => NLW_dfx_controller_0_s_axi_reg_rdata_UNCONNECTED(31 downto 0),
      s_axi_reg_rready => '0',
      s_axi_reg_rresp(1 downto 0) => NLW_dfx_controller_0_s_axi_reg_rresp_UNCONNECTED(1 downto 0),
      s_axi_reg_rvalid => NLW_dfx_controller_0_s_axi_reg_rvalid_UNCONNECTED,
      s_axi_reg_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_reg_wready => NLW_dfx_controller_0_s_axi_reg_wready_UNCONNECTED,
      s_axi_reg_wvalid => '0',
      vsm_VS_0_event_error => NLW_dfx_controller_0_vsm_VS_0_event_error_UNCONNECTED,
      vsm_VS_0_rm_decouple => NLW_dfx_controller_0_vsm_VS_0_rm_decouple_UNCONNECTED,
      vsm_VS_0_rm_reset => NLW_dfx_controller_0_vsm_VS_0_rm_reset_UNCONNECTED,
      vsm_VS_0_rm_shutdown_ack => '1',
      vsm_VS_0_rm_shutdown_req => NLW_dfx_controller_0_vsm_VS_0_rm_shutdown_req_UNCONNECTED,
      vsm_VS_0_sw_shutdown_req => NLW_dfx_controller_0_vsm_VS_0_sw_shutdown_req_UNCONNECTED,
      vsm_VS_0_sw_startup_req => NLW_dfx_controller_0_vsm_VS_0_sw_startup_req_UNCONNECTED
    );
reset_inv_0: component design_1_reset_inv_0_5
     port map (
      Op1(0) => reset_1,
      Res(0) => reset_inv_0_Res(0)
    );
rst_clk_wiz_0_100M: component design_1_rst_clk_wiz_0_100M_5
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_clk_wiz_0_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_0_locked,
      ext_reset_in => reset_1,
      interconnect_aresetn(0) => NLW_rst_clk_wiz_0_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_clk_wiz_0_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_0_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_clk_wiz_0_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_0_clk_out1
    );
end STRUCTURE;
