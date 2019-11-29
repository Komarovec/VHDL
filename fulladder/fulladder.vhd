library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
    port (
        sw : in std_logic_vector(3 downto 0);
        led : out std_logic_vector(2 downto 0)
    );
end fulladder;

architecture behaviour of fulladder is
    signal cast0 : std_logic;
    signal halfsum1 : std_logic;
begin
    led(0) <= sw(0) xor sw(2);
    cast0 <= sw(0) and sw(2);
    halfsum1 <= sw(1) xor sw(3);
    led(1) <= cast0 xor halfsum1;
    led(2) <= (cast0 and halfsum1) or (sw(1) and sw(3));
end behaviour;