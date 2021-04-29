----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2021 22:48:41
-- Design Name: 
-- Module Name: memcont - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memcont is
  Port (
    clk: in std_logic;
    ddr3_reset_n: in std_logic; -- rst
    
    -- IO pins of SDRAM
    ddr3_cke: out std_logic; -- Static high?
    ddr3_ck_p: out std_logic; -- sdram_clk
    ddr3_ck_n: out std_logic; -- sdram_cle
    --sdram_cs: out std_logic; -- No chip select?
    ddr3_cas_n: out std_logic; -- sdram_cas
    ddr3_dm: out std_logic_vector(1 downto 0); -- Static low masks written data
    ddr3_ras_n: out std_logic; -- sdram_ras
    ddr3_we_n: out std_logic; -- sdram_we
    sdram_dqm: out std_logic; -- WHAT IS DIS?!?!?!?
    ddr3_ba: out std_logic_vector(2 downto 0); -- sdram_ba 1 downto 0
    ddr3_addr: out std_logic_vector(14 downto 0); -- sdram_a 12 0
    ddr3_dq: in std_logic_vector(7 downto 0); -- sdram_dq 7 downto 0
    ddr3_dq2: in std_logic_vector(15 downto 8); -- sdram_dq second bus for input/output data
    -- DQS not connected data strobe
    -- ODT on die termination, can be disabled?
    
    -- User interface
    addr: in std_logic_vector(22 downto 0);
    rw: in std_logic;
    data_in: in std_logic_vector(31 downto 0);
    data_out: in std_logic_vector(31 downto 0);
    busy: out std_logic;
    in_valid: in std_logic;
    out_valid: out std_logic
  );
end memcont;

architecture Behavioral of memcont is
    -- RAS, CAS, WE
    constant mode_register_set_cmd: std_logic_vector(2 downto 0) := "000"; 
    constant refresh_cmd: std_logic_vector(2 downto 0) := "001";
    constant refresh_exit_cmd: std_logic_vector(2 downto 0) := "111"; 
    constant bank_precharge_cmd: std_logic_vector(2 downto 0) := "010";
    constant bank_activate_cmd: std_logic_vector(2 downto 0) := "011";
    constant write_cmd: std_logic_vector(2 downto 0) := "100";
    constant read_cmd: std_logic_vector(2 downto 0) := "101";
    constant no_operation_cmd: std_logic_vector(2 downto 0) := "111"; 
    constant power_down_entry_cmd: std_logic_vector(2 downto 0) := "111";
    constant power_down_exit_cmd: std_logic_vector(2 downto 0) := "111";
    constant zq_cal_cmd: std_logic_vector(2 downto 0) := "110"; -- depends on A10 

    -- FSM
    constant STATE_SIZE: integer := 4;
    constant INIT_S: integer := 0;
    constant WAIT_S: integer := 1;
    constant PRECHARGE_INIT_S: integer := 2;
    constant REFRESH_INIT_1_S: integer := 3;
    constant REFRESH_INIT_2_S: integer := 4;
    constant LOAD_MODE_REG_S: integer := 5;
    constant IDLE_S: integer := 6;
    constant REFRESH_S: integer := 7;
    constant ACTIVATE_S: integer := 8;
    constant READ_S: integer := 9;
    constant READ_RES_S: integer := 10;
    constant WRITE_S: integer := 11;
    constant PRECHARGE_S: integer := 12;

    -- Command signal
    signal cmd_q: std_logic_vector(2 downto 0) := no_operation_cmd;
    
    signal sdram_clk_ddr: std_logic;
begin
ddr3_ck_p <= sdram_clk_ddr;
ddr3_ck_n <= not sdram_clk_ddr;

ODDR_interface : ODDR
generic map(
  DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
  INIT => '0',   -- Initial value for Q port ('1' or '0')
  SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
port map (
  Q => sdram_clk_ddr,   -- 1-bit DDR output
  C => clk,    -- 1-bit clock input
  CE => '1',  -- 1-bit clock enable input
  D1 => '1',  -- 1-bit data input (positive edge)
  D2 => '1',  -- 1-bit data input (negative edge)
  R => '1',    -- 1-bit reset input
  S => '1'     -- 1-bit set input
);



-- Command op codes
ddr3_ras_n <= cmd_q(0);
ddr3_cas_n <= cmd_q(1);
ddr3_we_n <= cmd_q(2);

end Behavioral;
