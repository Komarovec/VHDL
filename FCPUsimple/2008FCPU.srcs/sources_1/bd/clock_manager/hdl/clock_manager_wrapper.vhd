--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Tue Aug  4 21:48:34 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target clock_manager_wrapper.bd
--Design      : clock_manager_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_manager_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
end clock_manager_wrapper;

architecture STRUCTURE of clock_manager_wrapper is
  component clock_manager is
  port (
    clk_100MHz : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    clk_out : out STD_LOGIC
  );
  end component clock_manager;
begin
clock_manager_i: component clock_manager
     port map (
      clk_100MHz => clk_100MHz,
      clk_out => clk_out,
      reset_rtl_0 => reset_rtl_0
    );
end STRUCTURE;
