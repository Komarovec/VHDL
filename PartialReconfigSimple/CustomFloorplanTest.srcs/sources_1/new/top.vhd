
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

use work.dfx_controller_setup_wrapper;
use work.clock_generator;

entity top is
  port ( 
    sw : in std_logic_vector(7 downto 4);
    ld : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    qspi_dq : inout std_logic_vector(3 downto 0)
  );
end top;

architecture Behavioral of top is
    -- DEBUG
--    COMPONENT ila_0
--    PORT (
--        clk : IN STD_LOGIC;
--        probe0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
--        probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--        probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--        probe3 : IN STD_LOGIC_VECTOR(8 DOWNTO 0)
--    );
--    END COMPONENT;

    component light_count_mod
    port (
        ld: out std_logic_vector(3 downto 0);
        clk_1hz : in std_logic
    );
    end component;
    
    signal clk_1hz : std_logic := '0';
    signal clk_50mhz : std_logic := '0';
    
    signal rst: std_logic := '1';
    signal hw_trigs: std_logic_vector(1 downto 0);
    
        -- DEBUG
    signal dfx_status: std_logic;
    signal dfx_status_v: std_logic_vector(0 downto 0);
    signal dfx_tdata: std_logic_vector ( 31 downto 0 );
begin  
    hw_trigs <= sw(7 downto 6);
    dfx_status_v(0) <= dfx_status;

    -- DEBUG
--    ila_debug : ila_0
--    PORT MAP (
--        clk => clk,
--        probe0 => hw_trigs,
--        probe1 => dfx_tdata,
--        probe2 => dfx_status_v,
--        probe3 => qspi_debug
--    );

    dfx: entity dfx_controller_setup_wrapper
    port map(
        dfx_status => dfx_status,
        dfx_tdata => dfx_tdata,
        sys_clock => clk,
        hw_trig => hw_trigs,
        reset => rst
        
--        qspi_flash_io_debug => qspi_debug
    );

    clock_gen_1hz: entity clock_generator
    generic map(
        to_divide => 50000000
    )
    port map(
        clk_in => clk,
        clk_out => clk_1hz
    );

    -- Reconfig
    light_count: light_count_mod
    port map(
        ld => ld(3 downto 0),
        clk_1hz => clk_1hz
    );
  end Behavioral;
