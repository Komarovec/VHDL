----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2021 23:59:17
-- Design Name: 
-- Module Name: top_tb - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is
    signal clk : std_logic := '0';
    signal rstn : std_logic := '0';
begin

clk_stim: process
begin
    clk <= not clk;
    wait for 10ns;
end process;

stimulus: process
begin
    rstn <= '0';
    wait for 100ns;
    rstn <= '1';
    wait;
end process;

uut: entity work.top
port map(
    clk => clk, -- 25 MHz !!
    rstn => rstn
    
--    hdmi_tx_cec => hdmi_tx_cec,
--    hdmi_tx_clk_n => hdmi_tx_clk_n,
--    hdmi_tx_clk_p => hdmi_tx_clk_p,
--    hdmi_tx_hpd => hdmi_tx_hpd,
--    hdmi_tx_rscl => hdmi_tx_rscl,
--    hdmi_tx_rsda => hdmi_tx_rsda,
--    hdmi_tx_n => hdmi_tx_n,
--    hdmi_tx_p => hdmi_tx_p
);

end Behavioral;
