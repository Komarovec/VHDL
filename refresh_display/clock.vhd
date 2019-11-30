library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity clock_divider is
    port ( 
        clock_in: in std_logic;
        reset: in std_logic;
        clock_out: out std_logic
    );
end clock_divider;
  
architecture behaviour of clock_divider is
    signal count: integer := 1;
    signal tmp: std_logic := '0';
begin
    process(clock_in,reset)
    begin
        if(reset = '1') then
            count <= 1;
            tmp <= '0';
        elsif(clock_in'event and clock_in = '1') then
            count <= count+1;
            if(count = 50000) then
                tmp <= not tmp;
                count <= 1;
            end if;
        end if;
        clock_out <= tmp;
    end process;
end behaviour;
