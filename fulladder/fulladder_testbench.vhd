library ieee;
use ieee.std_logic_1164.all;

entity fulladder_testbench is
end fulladder_testbench;

architecture behaviour of fulladder_testbench is
    component fulladder is
        port (
            sw : in std_logic_vector(3 downto 0);
            led : out std_logic_vector(2 downto 0)
        );
    end component;
    signal input : std_logic_vector(3 downto 0);
    signal output : std_logic_vector(2 downto 0);
begin
    uut: fulladder port map (
        sw => input,
        led => output
    );
    
    stim_proc: process
    begin
        input <= "0000"; wait for 10 ns; assert output = "000" report "00 + 00 = 000 failed";
        input <= "0101"; wait for 10 ns; assert output = "010" report "01 + 01 = 010 failed";
        input <= "1011"; wait for 10 ns; assert output = "101" report "10 + 11 = 101 failed";
        input <= "1010"; wait for 10 ns; assert output = "100" report "10 + 10 = 100 failed";
        input <= "1111"; wait for 10 ns; assert output = "110" report "11 + 11 = 110 failed";
        report "fulladder finished";
        wait;
    end process;
end behaviour;