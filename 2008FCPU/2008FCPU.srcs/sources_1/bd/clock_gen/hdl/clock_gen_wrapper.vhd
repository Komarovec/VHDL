--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Mon Apr 20 17:57:16 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target clock_gen_wrapper.bd
--Design      : clock_gen_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clock_gen_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
end clock_gen_wrapper;

architecture STRUCTURE of clock_gen_wrapper is
  component clock_gen is
  port (
    clk_100MHz : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    clk_out : out STD_LOGIC
  );
  end component clock_gen;
begin
clock_gen_i: component clock_gen
     port map (
      clk_100MHz => clk_100MHz,
      clk_out => clk_out,
      reset_rtl_0 => reset_rtl_0
    );
end STRUCTURE;
