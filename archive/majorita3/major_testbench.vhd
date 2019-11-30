library ieee;
use ieee.std_logic_1164.all;

entity major_testbench is
end major_testbench;

architecture behaviour of major is
    component major is
        port (
            A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            Y : out std_logic
        );
    end component;
    signal input : std_logic_vector(2 downto 0);
    signal output : std_logic_vector(1 downto 0);
begin
    uut: major port map (
        A => input(0),
        B => input(1),
        C => input(2),
        Y => output(0)
    );
    
    stim_proc: process
    begin
        input <= "111"; wait for 10 ns; assert output = "1" report "1x1+1x1+1x1 failed";
        report "major finished"
end behaviour;