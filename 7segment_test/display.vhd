library ieee;
use ieee.std_logic_1164.all;

entity display is
    port (
        seg : out std_logic_vector(6 downto 0);
        an : out std_logic_vector(1 downto 0);
        sw : in std_logic_vector(7 downto 0)
    );
end display;

architecture behaviour of display is
begin
    seg <= sw(6 downto 0);
    an(0) <= sw(7);
    an(1) <= not sw(7);
end behaviour;