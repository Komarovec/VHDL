library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity clock_divider is
    port ( 
        clock_in: in std_logic;
        reset: in std_logic;
        divider: in integer := 50000;
        clock_out: out std_logic
    );
end clock_divider;
  
architecture behaviour of clock_divider is
    signal count: integer := 1;
    signal tmp: std_logic := '0';
    signal start: boolean := true;
begin
    process(clock_in,reset)
    begin
        if(reset = '1') then
            count <= 1;
            tmp <= '0';
        elsif(start) then
            start <= false;
            tmp <= '1';
            clock_out <= '1';
        elsif(clock_in'event and clock_in = '1') then
            count <= count+1;
            if(count = divider) then
                tmp <= not tmp;
                count <= 1;
            end if;
        end if;
        clock_out <= tmp;
    end process;
end behaviour;
