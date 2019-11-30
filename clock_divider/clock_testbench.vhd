library ieee;
use ieee.std_logic_1164.all;
 
entity Tb_clock_divider is
end Tb_clock_divider;

architecture behavior of Tb_clock_divider is
    component clock_divider
        port (
            clk : in std_logic;
            reset : in std_logic;
            clock_out : out std_logic
        );
    end component;
    --Inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    
    --Outputs
    signal clock_out : std_logic;
    
    -- Clock period definitions
    constant clk_period : time := 20 ns;
begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Clock_Divider PORT MAP (
        clk => clk,
        reset => reset,
        clock_out => clock_out
    );
 
    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
 
    -- Stimulus process
    stim_proc: process
    begin
        wait for 100 ns;
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;
end;
