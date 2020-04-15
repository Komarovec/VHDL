
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
    port( 
        sensor : in std_logic;
        rst : in std_logic;
        clk : in std_logic;
        red_light : out std_logic;
        green_light : out std_logic;
        yellow_light : out std_logic);
end test;

architecture Behavioral of test is
    type StateType is (red, green, yellow);
    signal state : StateType;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            red_light <= '0';
            green_light <= '0';
            yellow_light <= '0';
            if rst = '0' then
                state <= red;
            else
                case state is
                    when red => 
                        if sensor = '1' then
                            state <= green;
                        else
                            state <= red;
                        end if;
                        red_light <= '1';
                    when green =>
                        state <= yellow;
                        green_light <= '1';
                    when yellow =>
                        state <= red;
                        yellow_light <= '1';
                end case;
            end if;
       end if;
   end process;
end Behavioral;
