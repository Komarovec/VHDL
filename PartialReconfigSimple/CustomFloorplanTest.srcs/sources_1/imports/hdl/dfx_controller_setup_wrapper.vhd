--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
--Date        : Sun Sep 20 13:53:06 2020
--Host        : KomaroKomp running 64-bit major release  (build 9200)
--Command     : generate_target dfx_controller_setup_wrapper.bd
--Design      : dfx_controller_setup_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dfx_controller_setup_wrapper is
  port (
    dfx_status : out STD_LOGIC;
    dfx_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    hw_trig : in STD_LOGIC_VECTOR ( 1 downto 0 );
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end dfx_controller_setup_wrapper;

architecture STRUCTURE of dfx_controller_setup_wrapper is
  component dfx_controller_setup is
  port (
    hw_trig : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sys_clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    dfx_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dfx_status : out STD_LOGIC;
    icap_csib : out STD_LOGIC;
    icap_i : out STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_o : in STD_LOGIC_VECTOR ( 31 downto 0 );
    icap_rdwrb : out STD_LOGIC
  );
  end component dfx_controller_setup;

  -- ICAP
  signal icap_csib: std_logic;
  signal icap_i: std_logic_vector(31 downto 0);
  signal icap_o: std_logic_vector(31 downto 0);
  signal icap_rdwrb: std_logic;
begin

ICAPE2_inst : ICAPE2
generic map (
    DEVICE_ID => X"3651093", -- Specifies the pre-programmed Device ID value to be used for simulation
    -- purposes.
    ICAP_WIDTH => "X32", -- Specifies the input and output data width.
    SIM_CFG_FILE_NAME => "NONE" -- Specifies the Raw Bitstream (RBT) file to be parsed by the simulation
    -- model.
)
port map (
    O => icap_o, -- 32-bit output: Configuration data output bus
    CLK => sys_clock, -- 1-bit input: Clock Input
    CSIB => icap_csib, -- 1-bit input: Active-Low ICAP Enable
    I => icap_i, -- 32-bit input: Configuration data input bus
    RDWRB => icap_rdwrb -- 1-bit input: Read/Write Select input
);

dfx_controller_setup_i: component dfx_controller_setup
     port map (
      dfx_status => dfx_status,
      dfx_tdata(31 downto 0) => dfx_tdata(31 downto 0),
      hw_trig(1 downto 0) => hw_trig(1 downto 0),
      icap_csib => icap_csib,
      icap_i(31 downto 0) => icap_i(31 downto 0),
      icap_o(31 downto 0) => icap_o(31 downto 0),
      icap_rdwrb => icap_rdwrb,
      reset => reset,
      sys_clock => sys_clock
    );
end STRUCTURE;
