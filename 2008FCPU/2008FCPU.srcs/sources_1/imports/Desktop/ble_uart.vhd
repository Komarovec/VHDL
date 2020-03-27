
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ble_uart is
  Port (
        clk : in std_logic;
        uart_rx_out : out std_logic;
        uart_tx_in : in std_logic;  
        pmod_rx : out std_logic;
        pmod_tx : in std_logic;
        pmod_rst_n : out std_logic;
        pmod_conf : out std_logic
   );
end ble_uart;

architecture Behavioral of ble_uart is

begin
    pmod_rx <= uart_tx_in;
    uart_rx_out <= pmod_tx;
    pmod_rst_n <= '1';
    pmod_conf <= '1';

    --uart_rx_out <= uart_tx_in;$$$
end Behavioral;