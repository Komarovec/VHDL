
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
    component top
      port ( 
        sw : in std_logic_vector(7 downto 4);
        ld : out std_logic_vector(7 downto 0);
        clk : in std_logic
      );
    end component;
    
    signal leds : std_logic_vector(7 downto 0);
    signal clk : std_logic := '0';
begin
    uut: top
    port map(
        sw => "0001",
        ld => leds,
        clk => clk
    );

    clk_gen: process
    begin
        clk <= '0';
        wait for 5ns;
        clk <= '1';
        wait for 5ns;
    end process;

end Behavioral;
