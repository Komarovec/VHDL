
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity light_count_up is
  Port ( 
    ld : out std_logic_vector(3 downto 0);
    clk_1hz : in std_logic
  );
end light_count_up;

architecture Behavioral of light_count_up is
    signal leds_out : integer := 0;
begin
    increment: process(clk_1hz)
    begin
        if rising_edge(clk_1hz) then
            leds_out <= leds_out + 1; -- Converts leds to int; increments it; and then converts it back to vector;
            if leds_out >= 8 then
                leds_out <= 0;
            end if;
            ld <= std_logic_vector(to_unsigned(leds_out, ld'length));
        end if;
    end process;
end Behavioral;
