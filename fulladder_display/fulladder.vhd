library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder is
    port (
        clk : in std_logic;
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0);
        seg : out std_logic_vector(0 to 6) := "1111111";
        an : out std_logic_vector(7 downto 0) := "11111111"
    );
end fulladder;

architecture behaviour of fulladder is
    component display is
        port (
            clk : in std_logic;
            num : in integer; 
            seg : out std_logic_vector(0 to 6) := "1111111";
            an : out std_logic_vector(7 downto 0) := "11111111"
        );
    end component;

    signal num : integer;
begin
    dis: display
    port map(
        clk => clk,
        num => num,
        seg => seg,
        an => an
    );
    
    led <= sw;

    change: process(sw)
    begin
        num <= to_integer(unsigned(sw(15 downto 8))) + to_integer(unsigned(sw(7 downto 0)));
    end process;
end behaviour;