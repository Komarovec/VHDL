
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

    signal x1: std_ulogic_vector(31 downto 0) := std_logic_vector(to_sfixed(26, 23, -8));
    signal x2: std_ulogic_vector(31 downto 0) := std_logic_vector(to_sfixed(0, 23, -8));

    signal y_star: std_ulogic_vector(31 downto 0);

    signal y_star_real: real;
    
    type RULE_REAL_WEIGHT_ARRAY is array (RULE_COUNT-1 downto 0) of real;
    
    signal weights: RULE_WEIGHT_ARRAY;
    signal weights_real: RULE_REAL_WEIGHT_ARRAY;
    
    signal clk: std_logic := '0';
begin
    weights_to_real: for ii in 0 to RULE_COUNT-1 generate
        weights_real(ii) <= to_real(weights(ii));
    end generate weights_to_real;
    
    y_star_real <= to_real(to_sfixed(y_star, 23, -8));

    clk_out: process
    begin
        clk <= '1';
        wait for (clock_period / 2);
        clk <= '0';
        wait for (clock_period / 2);
    end process;

    tsk_model: entity work.tsk port map(
        clk_in => clk,
    
        x1_b => x1,
        x2_b => (others => '0'),
        y_star_b => y_star,
        
        weights => weights
    );
end Behavioral;
