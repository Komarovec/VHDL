----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2020 10:59:22
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
library IEEE_proposed;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port 
    ( 
    sw: in  std_ulogic_vector(7 downto 0) := (others => 'X'); -- switches
    ld: out std_ulogic_vector(7 downto 0) := (others => '0') -- leds
    );
end top;

architecture Behavioral of top is
    constant num1: sfixed(7 downto 0) := to_sfixed(115, 7, 0);
    signal sw_sf: sfixed(7 downto 0);
    signal ld_sf: sfixed(7 downto 0);
begin

ld <= to_stdlogicvector(ld_sf);
sw_sf <= to_sfixed(sw, 7, 0);

process(sw)
begin
    ld_sf <= resize(sw_sf*num1, ld_sf);
end process;

end Behavioral;
