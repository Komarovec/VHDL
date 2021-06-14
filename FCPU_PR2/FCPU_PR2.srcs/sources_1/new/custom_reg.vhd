library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library ieee, work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- External registers --
-- Starting with address 401E, 4020, 4022, ...; Last register address is 2*register_count(hex) + 401C
-- For reading use @; For writing use !; Example: 401E @ -> Stores value to stack; 55 401E ! -> Stores value 55 to register with address 401E (first register)
-- Register has 32 bits, but now only 16 bits are used (FCPU is 16bit) -> used in future?; Maybe transfer low and then high bytes?

entity custom_reg is
	port (
		clk: in  std_ulogic;
		rst: in  std_ulogic;
		we:  in  std_ulogic; -- Write enabled
		di:  in  std_ulogic_vector(15 downto 0); -- Data in
		do:  out std_ulogic_vector(15 downto 0) -- Data out
	);
end entity;

architecture rtl of custom_reg is
	signal r_c, r_n: std_ulogic_vector(31 downto 0) := (others => '0'); -- 32 bit register with buffer --> Only 16 bits used
begin
	do <= r_c(23 downto 8); -- Use only middle 16 bits

	process(rst, clk) -- Reset and transfer from buffer
	begin
		if rst = '1' then
			r_c <= (others => '0');
		elsif rising_edge(clk) then
			r_c <= r_n;
		end if;
	end process;

	process(r_c, di, we) -- Write to buffer when write enabled
	begin
		if we = '1' then
			r_n(23 downto 8) <= di;  -- Use only middle 16 bits
		else
			r_n <= r_c;
		end if;
	end process;
end;