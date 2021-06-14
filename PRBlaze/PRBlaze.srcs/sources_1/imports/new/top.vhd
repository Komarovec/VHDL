
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

use work.clock_generator;

entity top is
  port ( 
    ld : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic;
    ddr3_sdram_addr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    ddr3_sdram_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    ddr3_sdram_cas_n : out STD_LOGIC;
    ddr3_sdram_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ddr3_sdram_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr3_sdram_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr3_sdram_ras_n : out STD_LOGIC;
    ddr3_sdram_reset_n : out STD_LOGIC;
    ddr3_sdram_we_n : out STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
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

    component light_count_shift
    port (
        ld: out std_logic_vector(7 downto 0);
        clk_1hz : in std_logic
    );
    end component;
    
    signal clk_1hz : std_logic := '0';
    signal clk_50mhz : std_logic := '0';
    
    signal rst: std_logic := '1';
begin  
    -- DEBUG
--    ila_debug : ila_0
--    PORT MAP (
--        clk => clk,
--        probe0 => hw_trigs,
--        probe1 => dfx_tdata,
--        probe2 => dfx_status_v,
--        probe3 => qspi_debug
--    );

    mb: entity work.design_1_wrapper 
    port map (
        ddr3_sdram_addr => ddr3_sdram_addr,
        ddr3_sdram_ba => ddr3_sdram_ba,
        ddr3_sdram_cas_n => ddr3_sdram_cas_n,
        ddr3_sdram_ck_n => ddr3_sdram_ck_n,
        ddr3_sdram_ck_p => ddr3_sdram_ck_p,
        ddr3_sdram_cke => ddr3_sdram_cke,
        ddr3_sdram_dm => ddr3_sdram_dm,
        ddr3_sdram_dq => ddr3_sdram_dq,
        ddr3_sdram_dqs_n => ddr3_sdram_dqs_n,
        ddr3_sdram_dqs_p => ddr3_sdram_dqs_p,
        ddr3_sdram_odt => ddr3_sdram_odt,
        ddr3_sdram_ras_n => ddr3_sdram_ras_n,
        ddr3_sdram_reset_n => ddr3_sdram_reset_n,
        ddr3_sdram_we_n => ddr3_sdram_we_n,
        reset => reset,
        sys_clock => clk,
        usb_uart_rxd => usb_uart_rxd,
        usb_uart_txd => usb_uart_txd
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
    light_count: light_count_shift
    port map(
        ld => ld,
        clk_1hz => clk_1hz
    );
  end Behavioral;
