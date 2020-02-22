----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2020 13:28:26
-- Design Name: 
-- Module Name: led_indicator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.util.all;

--Module for testing outputs of the cpu
--for Nexys Video with no 7 segment display

entity led_indicator is
	generic (
		g:                      common_generics;
		use_bcd_not_hex:        boolean  := true;
		refresh_rate_us:        natural  := 250000;
		number_of_led_displays: positive := 4);
	port (
		clk:      in   std_ulogic;
		rst:      in   std_ulogic;

		leds_we:  in   std_ulogic;
		leds:     in   std_ulogic_vector((number_of_led_displays * led_7_segment_character_length) - 1 downto 0);

		-- Physical outputs
		ld: out std_ulogic_vector(7 downto 0) := "00000000");
end led_indicator;

architecture Behavioral of led_indicator is
    signal clock_out: std_ulogic := '0';
begin
	timer: entity work.timer_us
		generic map (g => g, timer_period_us => refresh_rate_us)
		port map (
			clk             => clk,
			rst             => rst,
			co              => clock_out);

	process(clock_out)
	begin
		if rising_edge(clock_out) then
			ld <= leds(7 downto 0);
		end if;
	end process;





end Behavioral;
