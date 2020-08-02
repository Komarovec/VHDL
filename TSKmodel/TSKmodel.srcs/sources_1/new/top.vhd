
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.tsk;

entity top is
    Port (
        clk: in std_logic;
    
        sw: in std_ulogic_vector(7 downto 0);
        led: out std_ulogic_vector(7 downto 0)
    );
end top;

architecture Behavioral of top is
    signal x1: std_ulogic_vector(31 downto 0);
    signal y_star: std_ulogic_vector(31 downto 0);
begin
x1(15 downto 8) <= sw;
x1(31 downto 16) <= (others => '0');
x1(7 downto 0) <= (others => '0');

led <= y_star(15 downto 8);

tsk_reg: entity work.tsk port map(
    clk => clk,
    x1_b => x1,
    x2_b => (others => '0'),
    y_star_b => y_star
);

end Behavioral;
