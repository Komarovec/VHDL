
library IEEE;
library IEEE_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

entity trimf is
  Port ( 
    clk: in std_logic;
  
    x: in sfixed(23 downto -8);
    s1: in sfixed(23 downto -8) := to_sfixed(5, 23, -8);
    s2: in sfixed(23 downto -8) := to_sfixed(5, 23, -8);
    c: in sfixed(23 downto -8)  := to_sfixed(5, 23, -8);
    y: out sfixed(1 downto -31)
  );
end trimf;

architecture Behavioral of trimf is
  signal y_buf: sfixed(34 downto -31);
begin
y <= y_buf(1 downto -31);

process(x, c, s1, s2)
    variable x_p, c_p, s1_p, s2_p : sfixed(23 downto -8);
begin
    --if(rising_edge(clk)) then
      if(c - s1 < x and x <= c) then
        -- sfixed(a downto b) / sfixed(c downto d) = sfixed(a-d+1 downto b-c)
        y_buf <= (x - c + s1) / s1; -- 25 dt -8 / 23 dt -8 = 33 dt -31
      elsif(c <= x and x < c + s2) then
        y_buf <= (c + s2 - x) / s2;
      else
        y_buf <= (others => '0');
      end if;
    --end if;
end process;

end Behavioral;
