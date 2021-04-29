--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Sat Oct  3 18:00:53 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target dfx_controller_setup.bd
--Design      : dfx_controller_setup
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity s00_couplers_imp_F7J61P is
  port (
    M_ACLK : in STD_LOGIC;
    M_ARESETN : in STD_LOGIC;
    M_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arready : in STD_LOGIC;
    M_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_arvalid : out STD_LOGIC;
    M_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_rlast : in STD_LOGIC;
    M_AXI_rready : out STD_LOGIC;
    M_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_rvalid : in STD_LOGIC;
    S_ACLK : in STD_LOGIC;
    S_ARESETN : in STD_LOGIC;
    S_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_arready : out STD_LOGIC;
    S_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_arvalid : in STD_LOGIC;
    S_AXI_awready : out STD_LOGIC;
    S_AXI_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_bvalid : out STD_LOGIC;
    S_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_rlast : out STD_LOGIC;
    S_AXI_rready : in STD_LOGIC;
    S_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_rvalid : out STD_LOGIC;
    S_AXI_wready : out STD_LOGIC
  );
end s00_couplers_imp_F7J61P;

architecture STRUCTURE of s00_couplers_imp_F7J61P is
  component dfx_controller_setup_s00_data_fifo_0 is
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
  end component dfx_controller_setup_s00_data_fifo_0;
  signal M_ACLK_1 : STD_LOGIC;
  signal M_ARESETN_1 : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARREADY : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_s00_data_fifo_ARVALID : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_s00_data_fifo_RLAST : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_RREADY : STD_LOGIC;
  signal s00_couplers_to_s00_data_fifo_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_s00_data_fifo_RVALID : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_data_fifo_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARREADY : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_data_fifo_to_s00_couplers_ARVALID : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_data_fifo_to_s00_couplers_RLAST : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_RREADY : STD_LOGIC;
  signal s00_data_fifo_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_data_fifo_to_s00_couplers_RVALID : STD_LOGIC;
  signal NLW_s00_data_fifo_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s00_data_fifo_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_s00_data_fifo_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  M_ACLK_1 <= M_ACLK;
  M_ARESETN_1 <= M_ARESETN;
  M_AXI_araddr(31 downto 0) <= s00_data_fifo_to_s00_couplers_ARADDR(31 downto 0);
  M_AXI_arburst(1 downto 0) <= s00_data_fifo_to_s00_couplers_ARBURST(1 downto 0);
  M_AXI_arcache(3 downto 0) <= s00_data_fifo_to_s00_couplers_ARCACHE(3 downto 0);
  M_AXI_arlen(7 downto 0) <= s00_data_fifo_to_s00_couplers_ARLEN(7 downto 0);
  M_AXI_arlock(0) <= s00_data_fifo_to_s00_couplers_ARLOCK(0);
  M_AXI_arprot(2 downto 0) <= s00_data_fifo_to_s00_couplers_ARPROT(2 downto 0);
  M_AXI_arsize(2 downto 0) <= s00_data_fifo_to_s00_couplers_ARSIZE(2 downto 0);
  M_AXI_arvalid <= s00_data_fifo_to_s00_couplers_ARVALID;
  M_AXI_rready <= s00_data_fifo_to_s00_couplers_RREADY;
  S_AXI_arready <= s00_couplers_to_s00_data_fifo_ARREADY;
  S_AXI_rdata(31 downto 0) <= s00_couplers_to_s00_data_fifo_RDATA(31 downto 0);
  S_AXI_rlast <= s00_couplers_to_s00_data_fifo_RLAST;
  S_AXI_rresp(1 downto 0) <= s00_couplers_to_s00_data_fifo_RRESP(1 downto 0);
  S_AXI_rvalid <= s00_couplers_to_s00_data_fifo_RVALID;
  s00_couplers_to_s00_data_fifo_ARADDR(31 downto 0) <= S_AXI_araddr(31 downto 0);
  s00_couplers_to_s00_data_fifo_ARBURST(1 downto 0) <= S_AXI_arburst(1 downto 0);
  s00_couplers_to_s00_data_fifo_ARCACHE(3 downto 0) <= S_AXI_arcache(3 downto 0);
  s00_couplers_to_s00_data_fifo_ARLEN(7 downto 0) <= S_AXI_arlen(7 downto 0);
  s00_couplers_to_s00_data_fifo_ARPROT(2 downto 0) <= S_AXI_arprot(2 downto 0);
  s00_couplers_to_s00_data_fifo_ARSIZE(2 downto 0) <= S_AXI_arsize(2 downto 0);
  s00_couplers_to_s00_data_fifo_ARUSER(3 downto 0) <= S_AXI_aruser(3 downto 0);
  s00_couplers_to_s00_data_fifo_ARVALID <= S_AXI_arvalid;
  s00_couplers_to_s00_data_fifo_RREADY <= S_AXI_rready;
  s00_data_fifo_to_s00_couplers_ARREADY <= M_AXI_arready;
  s00_data_fifo_to_s00_couplers_RDATA(31 downto 0) <= M_AXI_rdata(31 downto 0);
  s00_data_fifo_to_s00_couplers_RLAST <= M_AXI_rlast;
  s00_data_fifo_to_s00_couplers_RRESP(1 downto 0) <= M_AXI_rresp(1 downto 0);
  s00_data_fifo_to_s00_couplers_RVALID <= M_AXI_rvalid;
  S_AXI_awready <= 'Z';
  S_AXI_bvalid <= 'Z';
  S_AXI_wready <= 'Z';
  S_AXI_bresp(0) <= 'Z';
  S_AXI_bresp(1) <= 'Z';
s00_data_fifo: component dfx_controller_setup_s00_data_fifo_0
     port map (
      aclk => M_ACLK_1,
      aresetn => M_ARESETN_1,
      m_axi_araddr(31 downto 0) => s00_data_fifo_to_s00_couplers_ARADDR(31 downto 0),
      m_axi_arburst(1 downto 0) => s00_data_fifo_to_s00_couplers_ARBURST(1 downto 0),
      m_axi_arcache(3 downto 0) => s00_data_fifo_to_s00_couplers_ARCACHE(3 downto 0),
      m_axi_arlen(7 downto 0) => s00_data_fifo_to_s00_couplers_ARLEN(7 downto 0),
      m_axi_arlock(0) => s00_data_fifo_to_s00_couplers_ARLOCK(0),
      m_axi_arprot(2 downto 0) => s00_data_fifo_to_s00_couplers_ARPROT(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_s00_data_fifo_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => s00_data_fifo_to_s00_couplers_ARREADY,
      m_axi_arregion(3 downto 0) => NLW_s00_data_fifo_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => s00_data_fifo_to_s00_couplers_ARSIZE(2 downto 0),
      m_axi_aruser(3 downto 0) => NLW_s00_data_fifo_m_axi_aruser_UNCONNECTED(3 downto 0),
      m_axi_arvalid => s00_data_fifo_to_s00_couplers_ARVALID,
      m_axi_rdata(31 downto 0) => s00_data_fifo_to_s00_couplers_RDATA(31 downto 0),
      m_axi_rlast => s00_data_fifo_to_s00_couplers_RLAST,
      m_axi_rready => s00_data_fifo_to_s00_couplers_RREADY,
      m_axi_rresp(1 downto 0) => s00_data_fifo_to_s00_couplers_RRESP(1 downto 0),
      m_axi_rvalid => s00_data_fifo_to_s00_couplers_RVALID,
      s_axi_araddr(31 downto 0) => s00_couplers_to_s00_data_fifo_ARADDR(31 downto 0),
      s_axi_arburst(1 downto 0) => s00_couplers_to_s00_data_fifo_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => s00_couplers_to_s00_data_fifo_ARCACHE(3 downto 0),
      s_axi_arlen(7 downto 0) => s00_couplers_to_s00_data_fifo_ARLEN(7 downto 0),
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => s00_couplers_to_s00_data_fifo_ARPROT(2 downto 0),
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => s00_couplers_to_s00_data_fifo_ARREADY,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s00_couplers_to_s00_data_fifo_ARSIZE(2 downto 0),
      s_axi_aruser(3 downto 0) => s00_couplers_to_s00_data_fifo_ARUSER(3 downto 0),
      s_axi_arvalid => s00_couplers_to_s00_data_fifo_ARVALID,
      s_axi_rdata(31 downto 0) => s00_couplers_to_s00_data_fifo_RDATA(31 downto 0),
      s_axi_rlast => s00_couplers_to_s00_data_fifo_RLAST,
      s_axi_rready => s00_couplers_to_s00_data_fifo_RREADY,
      s_axi_rresp(1 downto 0) => s00_couplers_to_s00_data_fifo_RRESP(1 downto 0),
      s_axi_rvalid => s00_couplers_to_s00_data_fifo_RVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dfx_controller_setup_axi_interconnect_0_0 is
  port (
    ACLK : in STD_LOGIC;
    ARESETN : in STD_LOGIC;
    M00_ACLK : in STD_LOGIC;
    M00_ARESETN : in STD_LOGIC;
    M00_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arready : in STD_LOGIC;
    M00_AXI_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_arvalid : out STD_LOGIC;
    M00_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_rlast : in STD_LOGIC;
    M00_AXI_rready : out STD_LOGIC;
    M00_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_rvalid : in STD_LOGIC;
    S00_ACLK : in STD_LOGIC;
    S00_ARESETN : in STD_LOGIC;
    S00_AXI_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_arready : out STD_LOGIC;
    S00_AXI_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_aruser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_arvalid : in STD_LOGIC;
    S00_AXI_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_rlast : out STD_LOGIC;
    S00_AXI_rready : in STD_LOGIC;
    S00_AXI_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_rvalid : out STD_LOGIC
  );
end dfx_controller_setup_axi_interconnect_0_0;

architecture STRUCTURE of dfx_controller_setup_axi_interconnect_0_0 is
  signal S00_ACLK_1 : STD_LOGIC;
  signal S00_ARESETN_1 : STD_LOGIC;
  signal axi_interconnect_0_ACLK_net : STD_LOGIC;
  signal axi_interconnect_0_ARESETN_net : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARUSER : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_RLAST : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_RREADY : STD_LOGIC;
  signal axi_interconnect_0_to_s00_couplers_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_to_s00_couplers_RVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s00_couplers_to_axi_interconnect_0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_ARVALID : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_RLAST : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_RREADY : STD_LOGIC;
  signal s00_couplers_to_axi_interconnect_0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s00_couplers_to_axi_interconnect_0_RVALID : STD_LOGIC;
  signal NLW_s00_couplers_S_AXI_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_s00_couplers_S_AXI_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_s00_couplers_S_AXI_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_s00_couplers_S_AXI_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  M00_AXI_araddr(31 downto 0) <= s00_couplers_to_axi_interconnect_0_ARADDR(31 downto 0);
  M00_AXI_arburst(1 downto 0) <= s00_couplers_to_axi_interconnect_0_ARBURST(1 downto 0);
  M00_AXI_arcache(3 downto 0) <= s00_couplers_to_axi_interconnect_0_ARCACHE(3 downto 0);
  M00_AXI_arlen(7 downto 0) <= s00_couplers_to_axi_interconnect_0_ARLEN(7 downto 0);
  M00_AXI_arlock(0) <= s00_couplers_to_axi_interconnect_0_ARLOCK(0);
  M00_AXI_arprot(2 downto 0) <= s00_couplers_to_axi_interconnect_0_ARPROT(2 downto 0);
  M00_AXI_arsize(2 downto 0) <= s00_couplers_to_axi_interconnect_0_ARSIZE(2 downto 0);
  M00_AXI_arvalid <= s00_couplers_to_axi_interconnect_0_ARVALID;
  M00_AXI_rready <= s00_couplers_to_axi_interconnect_0_RREADY;
  S00_ACLK_1 <= S00_ACLK;
  S00_ARESETN_1 <= S00_ARESETN;
  S00_AXI_arready <= axi_interconnect_0_to_s00_couplers_ARREADY;
  S00_AXI_rdata(31 downto 0) <= axi_interconnect_0_to_s00_couplers_RDATA(31 downto 0);
  S00_AXI_rlast <= axi_interconnect_0_to_s00_couplers_RLAST;
  S00_AXI_rresp(1 downto 0) <= axi_interconnect_0_to_s00_couplers_RRESP(1 downto 0);
  S00_AXI_rvalid <= axi_interconnect_0_to_s00_couplers_RVALID;
  axi_interconnect_0_ACLK_net <= M00_ACLK;
  axi_interconnect_0_ARESETN_net <= M00_ARESETN;
  axi_interconnect_0_to_s00_couplers_ARADDR(31 downto 0) <= S00_AXI_araddr(31 downto 0);
  axi_interconnect_0_to_s00_couplers_ARBURST(1 downto 0) <= S00_AXI_arburst(1 downto 0);
  axi_interconnect_0_to_s00_couplers_ARCACHE(3 downto 0) <= S00_AXI_arcache(3 downto 0);
  axi_interconnect_0_to_s00_couplers_ARLEN(7 downto 0) <= S00_AXI_arlen(7 downto 0);
  axi_interconnect_0_to_s00_couplers_ARPROT(2 downto 0) <= S00_AXI_arprot(2 downto 0);
  axi_interconnect_0_to_s00_couplers_ARSIZE(2 downto 0) <= S00_AXI_arsize(2 downto 0);
  axi_interconnect_0_to_s00_couplers_ARUSER(3 downto 0) <= S00_AXI_aruser(3 downto 0);
  axi_interconnect_0_to_s00_couplers_ARVALID <= S00_AXI_arvalid;
  axi_interconnect_0_to_s00_couplers_RREADY <= S00_AXI_rready;
  s00_couplers_to_axi_interconnect_0_ARREADY <= M00_AXI_arready;
  s00_couplers_to_axi_interconnect_0_RDATA(31 downto 0) <= M00_AXI_rdata(31 downto 0);
  s00_couplers_to_axi_interconnect_0_RLAST <= M00_AXI_rlast;
  s00_couplers_to_axi_interconnect_0_RRESP(1 downto 0) <= M00_AXI_rresp(1 downto 0);
  s00_couplers_to_axi_interconnect_0_RVALID <= M00_AXI_rvalid;
s00_couplers: entity work.s00_couplers_imp_F7J61P
     port map (
      M_ACLK => axi_interconnect_0_ACLK_net,
      M_ARESETN => axi_interconnect_0_ARESETN_net,
      M_AXI_araddr(31 downto 0) => s00_couplers_to_axi_interconnect_0_ARADDR(31 downto 0),
      M_AXI_arburst(1 downto 0) => s00_couplers_to_axi_interconnect_0_ARBURST(1 downto 0),
      M_AXI_arcache(3 downto 0) => s00_couplers_to_axi_interconnect_0_ARCACHE(3 downto 0),
      M_AXI_arlen(7 downto 0) => s00_couplers_to_axi_interconnect_0_ARLEN(7 downto 0),
      M_AXI_arlock(0) => s00_couplers_to_axi_interconnect_0_ARLOCK(0),
      M_AXI_arprot(2 downto 0) => s00_couplers_to_axi_interconnect_0_ARPROT(2 downto 0),
      M_AXI_arready => s00_couplers_to_axi_interconnect_0_ARREADY,
      M_AXI_arsize(2 downto 0) => s00_couplers_to_axi_interconnect_0_ARSIZE(2 downto 0),
      M_AXI_arvalid => s00_couplers_to_axi_interconnect_0_ARVALID,
      M_AXI_rdata(31 downto 0) => s00_couplers_to_axi_interconnect_0_RDATA(31 downto 0),
      M_AXI_rlast => s00_couplers_to_axi_interconnect_0_RLAST,
      M_AXI_rready => s00_couplers_to_axi_interconnect_0_RREADY,
      M_AXI_rresp(1 downto 0) => s00_couplers_to_axi_interconnect_0_RRESP(1 downto 0),
      M_AXI_rvalid => s00_couplers_to_axi_interconnect_0_RVALID,
      S_ACLK => S00_ACLK_1,
      S_ARESETN => S00_ARESETN_1,
      S_AXI_araddr(31 downto 0) => axi_interconnect_0_to_s00_couplers_ARADDR(31 downto 0),
      S_AXI_arburst(1 downto 0) => axi_interconnect_0_to_s00_couplers_ARBURST(1 downto 0),
      S_AXI_arcache(3 downto 0) => axi_interconnect_0_to_s00_couplers_ARCACHE(3 downto 0),
      S_AXI_arlen(7 downto 0) => axi_interconnect_0_to_s00_couplers_ARLEN(7 downto 0),
      S_AXI_arprot(2 downto 0) => axi_interconnect_0_to_s00_couplers_ARPROT(2 downto 0),
      S_AXI_arready => axi_interconnect_0_to_s00_couplers_ARREADY,
      S_AXI_arsize(2 downto 0) => axi_interconnect_0_to_s00_couplers_ARSIZE(2 downto 0),
      S_AXI_aruser(3 downto 0) => axi_interconnect_0_to_s00_couplers_ARUSER(3 downto 0),
      S_AXI_arvalid => axi_interconnect_0_to_s00_couplers_ARVALID,
      S_AXI_awready => NLW_s00_couplers_S_AXI_awready_UNCONNECTED,
      S_AXI_bresp(1 downto 0) => NLW_s00_couplers_S_AXI_bresp_UNCONNECTED(1 downto 0),
      S_AXI_bvalid => NLW_s00_couplers_S_AXI_bvalid_UNCONNECTED,
      S_AXI_rdata(31 downto 0) => axi_interconnect_0_to_s00_couplers_RDATA(31 downto 0),
      S_AXI_rlast => axi_interconnect_0_to_s00_couplers_RLAST,
      S_AXI_rready => axi_interconnect_0_to_s00_couplers_RREADY,
      S_AXI_rresp(1 downto 0) => axi_interconnect_0_to_s00_couplers_RRESP(1 downto 0),
      S_AXI_rvalid => axi_interconnect_0_to_s00_couplers_RVALID,
      S_AXI_wready => NLW_s00_couplers_S_AXI_wready_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dfx_controller_setup is
  port (
    dfx_status : out STD_LOGIC;
    dfx_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    hw_trig : in STD_LOGIC_VECTOR ( 1 downto 0 );
    icap_csib : out STD_LOGIC;
    icap_i : out STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_o : in STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_rdwrb : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of dfx_controller_setup : entity is "dfx_controller_setup,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=dfx_controller_setup,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=9,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=4,da_board_cnt=18,da_clkrst_cnt=22,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of dfx_controller_setup : entity is "dfx_controller_setup.hwdef";
end dfx_controller_setup;

architecture STRUCTURE of dfx_controller_setup is
  component dfx_controller_setup_dfx_controller_0_0 is
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
    vsm_VS_0_hw_triggers : in STD_LOGIC_VECTOR ( 1 downto 0 );
    vsm_VS_0_rm_shutdown_req : out STD_LOGIC;
    vsm_VS_0_rm_shutdown_ack : in STD_LOGIC;
    vsm_VS_0_rm_decouple : out STD_LOGIC;
    vsm_VS_0_rm_reset : out STD_LOGIC;
    vsm_VS_0_event_error : out STD_LOGIC;
    vsm_VS_0_m_axis_status_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    vsm_VS_0_m_axis_status_tvalid : out STD_LOGIC
  );
  end component dfx_controller_setup_dfx_controller_0_0;
  component dfx_controller_setup_blk_mem_gen_0_0 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 3 downto 0 );
    addra : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rsta_busy : out STD_LOGIC
  );
  end component dfx_controller_setup_blk_mem_gen_0_0;
  component dfx_controller_setup_axi_bram_ctrl_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC;
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 19 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC;
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    bram_rst_a : out STD_LOGIC;
    bram_clk_a : out STD_LOGIC;
    bram_en_a : out STD_LOGIC;
    bram_we_a : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bram_addr_a : out STD_LOGIC_VECTOR ( 19 downto 0 );
    bram_wrdata_a : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_rddata_a : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component dfx_controller_setup_axi_bram_ctrl_0_0;
  component dfx_controller_setup_rst_sys_clock_50M_0 is
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
  end component dfx_controller_setup_rst_sys_clock_50M_0;
  component dfx_controller_setup_ila_0_1 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component dfx_controller_setup_ila_0_1;
  component dfx_controller_setup_ila_1_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe17 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe20 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe21 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe23 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe24 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe25 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe26 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe27 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe31 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe34 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe37 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe38 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe39 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe40 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe41 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe42 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe43 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component dfx_controller_setup_ila_1_0;
  signal axi_bram_ctrl_0_BRAM_PORTA_ADDR : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal axi_bram_ctrl_0_BRAM_PORTA_CLK : STD_LOGIC;
  signal axi_bram_ctrl_0_BRAM_PORTA_DIN : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_bram_ctrl_0_BRAM_PORTA_DOUT : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_bram_ctrl_0_BRAM_PORTA_EN : STD_LOGIC;
  signal axi_bram_ctrl_0_BRAM_PORTA_RST : STD_LOGIC;
  signal axi_bram_ctrl_0_BRAM_PORTA_WE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARADDR : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARLOCK : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_interconnect_0_M00_AXI_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal axi_interconnect_0_M00_AXI_ARVALID : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal axi_interconnect_0_M00_AXI_RLAST : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RREADY : STD_LOGIC;
  signal axi_interconnect_0_M00_AXI_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal axi_interconnect_0_M00_AXI_RVALID : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
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
  signal dfx_controller_0_vsm_VS_0_m_axis_status_tdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dfx_controller_0_vsm_VS_0_m_axis_status_tvalid : STD_LOGIC;
  signal hw_trig_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rst_clk_wiz_0_100M_peripheral_aresetn : STD_LOGIC;
  signal rst_sys_clock_50M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_bram_ctrl_0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_bram_ctrl_0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_bram_ctrl_0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_bram_ctrl_0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_blk_mem_gen_0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_event_error_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_decouple_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_dfx_controller_0_vsm_VS_0_rm_shutdown_req_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_sys_clock_50M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_sys_clock_50M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_sys_clock_50M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_sys_clock_50M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of icap_csib : signal is "xilinx.com:interface:icap:1.0 icap csib";
  attribute X_INTERFACE_INFO of icap_rdwrb : signal is "xilinx.com:interface:icap:1.0 icap rdwrb";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, ASSOCIATED_RESET reset, CLK_DOMAIN dfx_controller_setup_sys_clock, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of icap_i : signal is "xilinx.com:interface:icap:1.0 icap i";
  attribute X_INTERFACE_INFO of icap_o : signal is "xilinx.com:interface:icap:1.0 icap o";
begin
  clk_wiz_0_clk_out1 <= sys_clock;
  dfx_controller_0_ICAP_o(31 downto 0) <= icap_o(31 downto 0);
  dfx_status <= dfx_controller_0_vsm_VS_0_m_axis_status_tvalid;
  dfx_tdata(31 downto 0) <= dfx_controller_0_vsm_VS_0_m_axis_status_tdata(31 downto 0);
  hw_trig_1(1 downto 0) <= hw_trig(1 downto 0);
  icap_csib <= dfx_controller_0_ICAP_csib;
  icap_i(31 downto 0) <= dfx_controller_0_ICAP_i(31 downto 0);
  icap_rdwrb <= dfx_controller_0_ICAP_rdwrb;
  rst_clk_wiz_0_100M_peripheral_aresetn <= reset;
axi_bram_ctrl_0: component dfx_controller_setup_axi_bram_ctrl_0_0
     port map (
      bram_addr_a(19 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_ADDR(19 downto 0),
      bram_clk_a => axi_bram_ctrl_0_BRAM_PORTA_CLK,
      bram_en_a => axi_bram_ctrl_0_BRAM_PORTA_EN,
      bram_rddata_a(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DOUT(31 downto 0),
      bram_rst_a => axi_bram_ctrl_0_BRAM_PORTA_RST,
      bram_we_a(3 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_WE(3 downto 0),
      bram_wrdata_a(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DIN(31 downto 0),
      s_axi_aclk => clk_wiz_0_clk_out1,
      s_axi_araddr(19 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(19 downto 0),
      s_axi_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      s_axi_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      s_axi_aresetn => rst_sys_clock_50M_peripheral_aresetn(0),
      s_axi_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      s_axi_arlock => axi_interconnect_0_M00_AXI_ARLOCK(0),
      s_axi_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      s_axi_arready => axi_interconnect_0_M00_AXI_ARREADY,
      s_axi_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      s_axi_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      s_axi_awaddr(19 downto 0) => B"00000000000000000000",
      s_axi_awburst(1 downto 0) => B"01",
      s_axi_awcache(3 downto 0) => B"0011",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awready => NLW_axi_bram_ctrl_0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"010",
      s_axi_awvalid => '0',
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_axi_bram_ctrl_0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_axi_bram_ctrl_0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      s_axi_rlast => axi_interconnect_0_M00_AXI_RLAST,
      s_axi_rready => axi_interconnect_0_M00_AXI_RREADY,
      s_axi_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      s_axi_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_axi_bram_ctrl_0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(3 downto 0) => B"1111",
      s_axi_wvalid => '0'
    );
axi_interconnect_0: entity work.dfx_controller_setup_axi_interconnect_0_0
     port map (
      ACLK => clk_wiz_0_clk_out1,
      ARESETN => rst_clk_wiz_0_100M_peripheral_aresetn,
      M00_ACLK => clk_wiz_0_clk_out1,
      M00_ARESETN => rst_clk_wiz_0_100M_peripheral_aresetn,
      M00_AXI_araddr(31 downto 0) => axi_interconnect_0_M00_AXI_ARADDR(31 downto 0),
      M00_AXI_arburst(1 downto 0) => axi_interconnect_0_M00_AXI_ARBURST(1 downto 0),
      M00_AXI_arcache(3 downto 0) => axi_interconnect_0_M00_AXI_ARCACHE(3 downto 0),
      M00_AXI_arlen(7 downto 0) => axi_interconnect_0_M00_AXI_ARLEN(7 downto 0),
      M00_AXI_arlock(0) => axi_interconnect_0_M00_AXI_ARLOCK(0),
      M00_AXI_arprot(2 downto 0) => axi_interconnect_0_M00_AXI_ARPROT(2 downto 0),
      M00_AXI_arready => axi_interconnect_0_M00_AXI_ARREADY,
      M00_AXI_arsize(2 downto 0) => axi_interconnect_0_M00_AXI_ARSIZE(2 downto 0),
      M00_AXI_arvalid => axi_interconnect_0_M00_AXI_ARVALID,
      M00_AXI_rdata(31 downto 0) => axi_interconnect_0_M00_AXI_RDATA(31 downto 0),
      M00_AXI_rlast => axi_interconnect_0_M00_AXI_RLAST,
      M00_AXI_rready => axi_interconnect_0_M00_AXI_RREADY,
      M00_AXI_rresp(1 downto 0) => axi_interconnect_0_M00_AXI_RRESP(1 downto 0),
      M00_AXI_rvalid => axi_interconnect_0_M00_AXI_RVALID,
      S00_ACLK => clk_wiz_0_clk_out1,
      S00_ARESETN => rst_clk_wiz_0_100M_peripheral_aresetn,
      S00_AXI_araddr(31 downto 0) => dfx_controller_0_M_AXI_MEM_ARADDR(31 downto 0),
      S00_AXI_arburst(1 downto 0) => dfx_controller_0_M_AXI_MEM_ARBURST(1 downto 0),
      S00_AXI_arcache(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARCACHE(3 downto 0),
      S00_AXI_arlen(7 downto 0) => dfx_controller_0_M_AXI_MEM_ARLEN(7 downto 0),
      S00_AXI_arprot(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARPROT(2 downto 0),
      S00_AXI_arready => dfx_controller_0_M_AXI_MEM_ARREADY,
      S00_AXI_arsize(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARSIZE(2 downto 0),
      S00_AXI_aruser(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARUSER(3 downto 0),
      S00_AXI_arvalid => dfx_controller_0_M_AXI_MEM_ARVALID,
      S00_AXI_rdata(31 downto 0) => dfx_controller_0_M_AXI_MEM_RDATA(31 downto 0),
      S00_AXI_rlast => dfx_controller_0_M_AXI_MEM_RLAST,
      S00_AXI_rready => dfx_controller_0_M_AXI_MEM_RREADY,
      S00_AXI_rresp(1 downto 0) => dfx_controller_0_M_AXI_MEM_RRESP(1 downto 0),
      S00_AXI_rvalid => dfx_controller_0_M_AXI_MEM_RVALID
    );
blk_mem_gen_0: component dfx_controller_setup_blk_mem_gen_0_0
     port map (
      addra(31 downto 20) => B"000000000000",
      addra(19 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_ADDR(19 downto 0),
      clka => axi_bram_ctrl_0_BRAM_PORTA_CLK,
      dina(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DIN(31 downto 0),
      douta(31 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_DOUT(31 downto 0),
      ena => axi_bram_ctrl_0_BRAM_PORTA_EN,
      rsta => axi_bram_ctrl_0_BRAM_PORTA_RST,
      rsta_busy => NLW_blk_mem_gen_0_rsta_busy_UNCONNECTED,
      wea(3 downto 0) => axi_bram_ctrl_0_BRAM_PORTA_WE(3 downto 0)
    );
dfx_controller_0: component dfx_controller_setup_dfx_controller_0_0
     port map (
      clk => clk_wiz_0_clk_out1,
      icap_clk => clk_wiz_0_clk_out1,
      icap_csib => dfx_controller_0_ICAP_csib,
      icap_i(31 downto 0) => dfx_controller_0_ICAP_o(31 downto 0),
      icap_o(31 downto 0) => dfx_controller_0_ICAP_i(31 downto 0),
      icap_rdwrb => dfx_controller_0_ICAP_rdwrb,
      icap_reset => rst_clk_wiz_0_100M_peripheral_aresetn,
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
      reset => rst_clk_wiz_0_100M_peripheral_aresetn,
      vsm_VS_0_event_error => NLW_dfx_controller_0_vsm_VS_0_event_error_UNCONNECTED,
      vsm_VS_0_hw_triggers(1 downto 0) => hw_trig_1(1 downto 0),
      vsm_VS_0_m_axis_status_tdata(31 downto 0) => dfx_controller_0_vsm_VS_0_m_axis_status_tdata(31 downto 0),
      vsm_VS_0_m_axis_status_tvalid => dfx_controller_0_vsm_VS_0_m_axis_status_tvalid,
      vsm_VS_0_rm_decouple => NLW_dfx_controller_0_vsm_VS_0_rm_decouple_UNCONNECTED,
      vsm_VS_0_rm_reset => NLW_dfx_controller_0_vsm_VS_0_rm_reset_UNCONNECTED,
      vsm_VS_0_rm_shutdown_ack => '1',
      vsm_VS_0_rm_shutdown_req => NLW_dfx_controller_0_vsm_VS_0_rm_shutdown_req_UNCONNECTED
    );
ila_1: component dfx_controller_setup_ila_0_1
     port map (
      clk => clk_wiz_0_clk_out1,
      probe0(0) => dfx_controller_0_vsm_VS_0_m_axis_status_tvalid,
      probe1(31 downto 0) => dfx_controller_0_vsm_VS_0_m_axis_status_tdata(31 downto 0)
    );
ila_2: component dfx_controller_setup_ila_1_0
     port map (
      clk => clk_wiz_0_clk_out1,
      probe0(0) => '0',
      probe1(31 downto 0) => B"00000000000000000000000000000000",
      probe10(31 downto 0) => dfx_controller_0_M_AXI_MEM_RDATA(31 downto 0),
      probe11(0) => '0',
      probe12(0) => '0',
      probe13(1 downto 0) => dfx_controller_0_M_AXI_MEM_RRESP(1 downto 0),
      probe14(31 downto 0) => B"00000000000000000000000000000000",
      probe15(3 downto 0) => B"1111",
      probe16(0) => dfx_controller_0_M_AXI_MEM_RVALID,
      probe17(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARPROT(2 downto 0),
      probe18(2 downto 0) => B"000",
      probe19(0) => '0',
      probe2(1 downto 0) => B"00",
      probe20(0) => '0',
      probe21(7 downto 0) => B"00000000",
      probe22(0) => '0',
      probe23(2 downto 0) => B"010",
      probe24(1 downto 0) => B"01",
      probe25(0) => '0',
      probe26(0) => '0',
      probe27(7 downto 0) => dfx_controller_0_M_AXI_MEM_ARLEN(7 downto 0),
      probe28(2 downto 0) => dfx_controller_0_M_AXI_MEM_ARSIZE(2 downto 0),
      probe29(1 downto 0) => dfx_controller_0_M_AXI_MEM_ARBURST(1 downto 0),
      probe3(0) => '0',
      probe30(0) => '0',
      probe31(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARCACHE(3 downto 0),
      probe32(3 downto 0) => B"0011",
      probe33(3 downto 0) => B"0000",
      probe34(3 downto 0) => B"0000",
      probe35(3 downto 0) => dfx_controller_0_M_AXI_MEM_ARUSER(3 downto 0),
      probe36(3 downto 0) => B"0000",
      probe37(3 downto 0) => B"0000",
      probe38(0) => '0',
      probe39(0) => '0',
      probe4(0) => '0',
      probe40(0) => dfx_controller_0_M_AXI_MEM_RLAST,
      probe41(0) => '0',
      probe42(0) => '0',
      probe43(0) => '0',
      probe5(31 downto 0) => dfx_controller_0_M_AXI_MEM_ARADDR(31 downto 0),
      probe6(0) => dfx_controller_0_M_AXI_MEM_RREADY,
      probe7(0) => '0',
      probe8(0) => dfx_controller_0_M_AXI_MEM_ARVALID,
      probe9(0) => dfx_controller_0_M_AXI_MEM_ARREADY
    );
rst_sys_clock_50M: component dfx_controller_setup_rst_sys_clock_50M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_sys_clock_50M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => rst_clk_wiz_0_100M_peripheral_aresetn,
      interconnect_aresetn(0) => NLW_rst_sys_clock_50M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_sys_clock_50M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_sys_clock_50M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_sys_clock_50M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_0_clk_out1
    );
end STRUCTURE;
