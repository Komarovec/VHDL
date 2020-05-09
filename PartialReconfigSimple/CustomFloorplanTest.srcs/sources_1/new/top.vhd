
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
  port ( 
    sw : in std_logic_vector(7 downto 4);
    ld : out std_logic_vector(7 downto 0);
    clk : in std_logic
  );
end top;

architecture Behavioral of top is
    component light_count_mod
    port (
        ld: out std_logic_vector(3 downto 0);
        clk_1hz : in std_logic
    );
    end component;
    
    component clock_generator
    port (
        clk_in : in std_logic;
        clk_out : out std_logic
    );
    end component;
    
    signal clk_1hz : std_logic := '0';
begin
    ld(7 downto 4) <= sw(7 downto 4);

    clock_gen_mod: clock_generator
    port map(
        clk_in => clk,
        clk_out => clk_1hz
    );

    -- Reconfig
    light_count: light_count_mod
    port map(
        ld => ld(3 downto 0),
        clk_1hz => clk_1hz
    );
end Behavioral;
