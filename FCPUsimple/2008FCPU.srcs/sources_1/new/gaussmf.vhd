
library IEEE;
library IEEE_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

-- Gaussian member ship function
-- e^x aproxiated with 2 term taylor series.
-- Inefficient, if possible use triangular function
--
-- Example of parameters.
-- c: 4000, s2: 60000, s1: 800
-- c, center of gfmf
-- s1, width of left gfmf
-- s2, width of right gfmf
-- if s1 or s2 is set to high value is set to high enough value,
-- it acts as constant 1.
entity gaussmf is
  Port ( 
    clk: in std_logic;
  
    x: in sfixed(23 downto -8);
    s1: in sfixed(23 downto -8) := to_sfixed(5, 23, -8);
    s2: in sfixed(23 downto -8) := to_sfixed(5, 23, -8);
    c: in sfixed(23 downto -8)  := to_sfixed(5, 23, -8);
    y: out sfixed(1 downto -31)
  );
end gaussmf;

architecture Behavioral of gaussmf is
  constant eul: sfixed(2 downto -16) := to_sfixed(2.718281828, 2, -16);
  signal exp: sfixed(15 downto -16);
  signal exp_pow2: sfixed(15 downto -32);
  signal xc_pow2: sfixed(32 downto 0);
  signal s1_pow2: sfixed(32 downto 0);
  signal s2_pow2: sfixed(32 downto 0);
  signal y_buf: sfixed(1 downto -31);
begin
y <= y_buf(1 downto -31);

-- Prepare exponent for taylor series - numaretor and denumarator of exponent
process(x, c, s1, s2)
begin
    xc_pow2 <= resize((x-c)*(x-c), xc_pow2);
    s1_pow2 <= resize(s1*s1, s1_pow2);
    s2_pow2 <= resize(s2*s2, s2_pow2);
end process;

-- Prepare exponent for taylor series - calc exponent itself
process(xc_pow2, s1_pow2, s2_pow2)
begin
    if(x < c) then
        exp <= resize(-( xc_pow2 / (2*s1_pow2) ), exp);
    else
        exp <= resize(-( xc_pow2 / (2*s2_pow2) ), exp);
    end if;
end process;

-- Prepare exponent for taylor series - calculate second power of exp
process(exp)
begin
    exp_pow2 <= resize(exp*exp, exp_pow2);
end process;

process(exp_pow2)
begin
      -- Calculate e^x with Taylor series, if negative use positive aprox.
      -- Only 2 terms, low prec, maybe lookup table instead of aprox?
      -- 
      y_buf <= resize(1 / (1 - exp + exp_pow2/2), y_buf);
end process;

end Behavioral;
