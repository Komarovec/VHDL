library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_generator is
    port (
        clk_in : in std_logic;
        clk_out : out std_logic := '0'
    );
end clock_generator;

architecture Behavioral of clock_generator is
    constant to_divide : integer := 50000000;
    signal divisions : integer := 0;
    signal clk_out_buf : std_logic := '0';
begin
    clock_div: process(clk_in)
    begin
        if rising_edge(clk_in) then
            if divisions = to_divide then
                clk_out_buf <= not clk_out_buf;
                clk_out <= clk_out_buf;
                divisions <= 0;
            else
                divisions <= divisions + 1;
            end if;
        end if;        
    end process;
end Behavioral;
