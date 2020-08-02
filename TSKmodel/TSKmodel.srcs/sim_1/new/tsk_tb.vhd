
library IEEE;
library IEEE_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;
use work.tsk;
use work.tsk_util.all;

entity tsk_tb is
end tsk_tb;

architecture Behavioral of tsk_tb is
    constant clock_period:            time     := 1000 ms / 100_000_000;

    signal x1: std_ulogic_vector(31 downto 0) := std_logic_vector(to_sfixed(80, 23, -8));
    signal x2: std_ulogic_vector(31 downto 0) := std_logic_vector(to_sfixed(0, 23, -8));
    signal x1_low_out, x1_avg_out, x1_high_out: sfixed(1 downto -31);
    signal y1_out, y2_out, y3_out: sfixed(23 downto -8);
    signal y_star: std_ulogic_vector(31 downto 0);

    signal x1_low_real, x1_avg_real, x1_high_real: real;
    signal y1_real, y2_real, y3_real: real;
    signal y_star_real: real;
    
    signal clk: std_logic := '0';
begin
    x1_low_real <= to_real(x1_low_out);
    x1_avg_real <= to_real(x1_avg_out); 
    x1_high_real <= to_real(x1_high_out); 

    y1_real <= to_real(y1_out);
    y2_real <= to_real(y2_out); 
    y3_real <= to_real(y3_out); 
    
    y_star_real <= to_real(to_sfixed(y_star, 23, -8));

    clk_out: process
    begin
        clk <= '1';
        wait for (clock_period / 2);
        clk <= '0';
        wait for (clock_period / 2);
    end process;

    tsk_model: entity work.tsk port map(
        clk => clk,
    
        x1_b => x1,
        x2_b => (others => '0'),
        y_star_b => y_star,
        
        x1_low_out => x1_low_out,
        x1_avg_out => x1_avg_out,
        x1_high_out => x1_high_out,
        y1_out => y1_out,
        y2_out => y2_out,
        y3_out => y3_out
    );
end Behavioral;
