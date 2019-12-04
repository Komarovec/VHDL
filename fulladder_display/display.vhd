library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    port (
        clk : in std_logic;
        num : in integer; 
        seg : out std_logic_vector(0 to 6) := "1111111";
        an : out std_logic_vector(7 downto 0) := "11111111"
    );
end display;

architecture behaviour of display is
    component clock_divider is
        port( 
            clock_in: in std_logic;
            reset: in std_logic;
            divider: in integer;
            clock_out: out std_logic
        );
    end component;
    signal clk_out : std_logic := '0'; -- Refresh clock
    signal index: integer := 0;  -- Refesh display index
    
    signal tmp_vector : std_logic_vector(3 downto 0); -- Current refresh BCD code for one digit
    signal num_vector : std_logic_vector(31 downto 0); -- Number in binary vector to show on display
    alias first_digit is num_vector(3 downto 0);
    alias second_digit is num_vector(7 downto 4);
    alias third_digit is num_vector(11 downto 8);
    alias fourth_digit is num_vector(15 downto 12);
    alias fifth_digit is num_vector(19 downto 16);
    alias sixth_digit is num_vector(23 downto 20);
    alias seventh_digit is num_vector(27 downto 24);
    alias eight_digit is num_vector(31 downto 28);
begin
    clk_div: clock_divider
    port map(
        clock_in => clk,
        reset => '0',
        divider => 50000,
        clock_out => clk_out
    );

    refresh: process(clk_out)
    begin
        if(clk_out'event and clk_out = '1') then
            num_vector <= std_logic_vector(to_unsigned(num, num_vector'length));
            if(index = 0) then
                an(7 downto 0) <= "11111110";
                tmp_vector <= first_digit;
            elsif(index = 1) then
                an(7 downto 0) <= "11111101";
                tmp_vector <= second_digit;
            elsif(index = 2) then
                an(7 downto 0) <= "11111011";
                tmp_vector <= third_digit;
            elsif(index = 3) then
                an(7 downto 0) <= "11110111";
                tmp_vector <= fourth_digit;
            elsif(index = 4) then
                an(7 downto 0) <= "11101111";
                tmp_vector <= fifth_digit;
            elsif(index = 5) then
                an(7 downto 0) <= "11011111";
                tmp_vector <= sixth_digit;
            elsif(index = 6) then
                an(7 downto 0) <= "10111111";
                tmp_vector <= seventh_digit;
            elsif(index = 7) then
                an(7 downto 0) <= "01111111";
                tmp_vector <= eight_digit;
            end if;
            
            if(index = 7) then
                index <= 0;
            else
                index <= index + 1;
            end if;
        end if;
    end process;
    
    process(index) --BCD to 7S
    begin
        case tmp_vector is
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
            when "1010" => seg <= "0001000"; ---A
            when "1011" => seg <= "1100000"; ---B
            when "1100" => seg <= "0110001"; ---C
            when "1101" => seg <= "1000010"; ---D
            when "1110" => seg <= "0110000"; ---E
            when "1111" => seg <= "0111000"; ---F
            when others => seg <= "1111111"; ---null
        end case;
    end process;
end behaviour;