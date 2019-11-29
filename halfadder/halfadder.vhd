library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
    port (
        sw1 : in std_logic;
        sw2 : in std_logic;
        led1 : out std_logic;
        led2 : out std_logic
    );
end halfadder;

architecture behaviour of halfadder is
    signal sum : std_logic;
    signal overflow : std_logic;
begin
    sum <= sw1 xor sw2;
    overflow <= sw1 and sw2;
    led1 <= sum;
    led2 <= overflow;
end behaviour;