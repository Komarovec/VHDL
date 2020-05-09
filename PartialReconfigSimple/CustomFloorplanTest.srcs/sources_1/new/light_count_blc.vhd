
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity light_count_mod is
  Port ( 
    ld : out std_logic_vector(3 downto 0);
    clk_1hz : in std_logic
  );
end light_count_mod;

architecture Behavioral of light_count_mod is
begin
end Behavioral;