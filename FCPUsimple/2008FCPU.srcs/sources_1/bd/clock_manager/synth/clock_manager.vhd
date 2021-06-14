--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Tue Aug  4 21:48:34 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target clock_manager.bd
--Design      : clock_manager
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_manager is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
  attribute core_generation_info : string;
  attribute core_generation_info of clock_manager : entity is "clock_manager,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clock_manager,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of clock_manager : entity is "clock_manager.hwdef";
end clock_manager;

architecture STRUCTURE of clock_manager is
  component clock_manager_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component clock_manager_clk_wiz_0_0;
  signal clk_100MHz_1 : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal reset_rtl_0_1 : STD_LOGIC;
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk_100MHz : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk_100MHz : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN clock_manager_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of clk_out : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_OUT CLK";
  attribute x_interface_parameter of clk_out : signal is "XIL_INTERFACENAME CLK.CLK_OUT, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute x_interface_info of reset_rtl_0 : signal is "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0 RST";
  attribute x_interface_parameter of reset_rtl_0 : signal is "XIL_INTERFACENAME RST.RESET_RTL_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
begin
  clk_100MHz_1 <= clk_100MHz;
  clk_out <= clk_wiz_0_clk_out1;
  reset_rtl_0_1 <= reset_rtl_0;
clk_wiz_0: component clock_manager_clk_wiz_0_0
     port map (
      clk_in1 => clk_100MHz_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      reset => reset_rtl_0_1
    );
end STRUCTURE;
