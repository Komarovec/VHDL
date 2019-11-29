library ieee;
use ieee.std_logic_1164.all;

entity halfadder_testbench is
end halfadder_testbench;

architecture behaviour of halfadder_testbench is
    component halfadder is
        port (
            sw1 : in std_logic;
            sw2 : in std_logic;
            led1 : out std_logic;
            led2 : out std_logic
        );
    end component;
    signal input : std_logic_vector(1 downto 0);
    signal output : std_logic_vector(1 downto 0);
begin
    uut: halfadder port map (
        sw1 => input(0),
        sw2 => input(1),
        led1 => output(0),
        led2 => output(1)
    );
    
    stim_proc: process
    begin
        input <= "11"; wait for 10 ns; assert output = "10" report "1 + 1 = 10 failed";
        report "halfadder finished";
        wait;
    end process;
end behaviour;