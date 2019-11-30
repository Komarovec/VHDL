library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity display_testbench is
end display_testbench;

architecture Behavioral of display_testbench is
    component display
        port (
            clk : in std_logic;
            seg : out std_logic_vector(0 to 6);
            an : out std_logic_vector(7 downto 0) := "11111110";
            sw : in std_logic_vector(3 downto 0)
        );
    end component;
    
    signal clk : std_logic := '0';
    signal seg : std_logic_vector(0 to 6);
    signal an : std_logic_vector(7 downto 0);
    signal sw : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;
begin
    uut: display port map (
        clk => clk,
        seg => seg,
        an => an,
        sw => sw
    );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
end Behavioral;
