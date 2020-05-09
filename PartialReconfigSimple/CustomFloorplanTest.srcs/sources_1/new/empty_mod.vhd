
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity empty_mod is
  Port ( 
    ld : out std_logic_vector(3 downto 0);
    clk_1hz : in std_logic
  );
end empty_mod;

architecture Behavioral of empty_mod is

begin
end Behavioral;
