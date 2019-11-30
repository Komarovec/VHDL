library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    port (
        clk : in std_logic;
        seg : out std_logic_vector(0 to 6) := "1111111";
        an : out std_logic_vector(7 downto 0) := "11111111";
        sw : in std_logic_vector(3 downto 0)
    );
end display;

architecture behaviour of display is
    component clock_divider is
        port( 
            clock_in: in std_logic;
            reset: in std_logic;
            clock_out: out std_logic
        );
    end component;
    signal clk_out : std_logic := '0';
    signal index: integer := 0;
begin
    clk_div: clock_divider
    port map(
        clock_in => clk,
        reset => '0',
        clock_out => clk_out
    );

    refresh: process(clk_out)
    begin
        if(clk_out'event and clk_out = '1') then
            if(index = 0) then
                an(7 downto 0) <= "11111110";
            elsif(index = 1) then
                an(7 downto 0) <= "11111101";
            elsif(index = 2) then
                an(7 downto 0) <= "11111011";
            elsif(index = 3) then
                an(7 downto 0) <= "11110111";
            elsif(index = 4) then
                an(7 downto 0) <= "11101111";
            elsif(index = 5) then
                an(7 downto 0) <= "11011111";
            elsif(index = 6) then
                an(7 downto 0) <= "10111111";
            elsif(index = 7) then
                an(7 downto 0) <= "01111111";
            end if;
            
            if(index = 7) then
                index <= 0;
            else
                index <= index + 1;
            end if;
        end if;
    end process;
    
    process(sw)
    begin
        case sw is
            when "0000" => seg <= "0000001"; ---0
            when "0001" => seg <= "1001111"; ---1
            when "0010" => seg <= "0010010"; ---2
            when "0011" => seg <= "0000110"; ---3
            when "0100" => seg <= "1001100"; ---4
            when "0101" => seg <= "0100100"; ---5
            when "0110" => seg <= "0100000"; ---6
            when "0111" => seg <= "0001111"; ---7
            when "1000" => seg <= "0000000"; ---8
            when "1001" => seg <= "0000100"; ---9
            when others => seg <= "1111111"; ---null
        end case;
    end process;
end behaviour;