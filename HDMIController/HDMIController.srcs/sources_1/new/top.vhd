----------------------------------------------------------------------------------
-- Company: None
-- Engineer: Denis Kurka
-- 
-- Create Date: 11.06.2021 22:47:47
-- Design Name: Top module
-- Module Name: top - Behavioral
-- Project Name: HDMIController
-- Target Devices: Nexys Video
-- Tool Versions: 
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

entity top is
  Port ( 
    clk : in std_logic;
    rstn : in std_logic;
  
    hdmi_tx_cec : out std_logic;
    hdmi_tx_clk_n : out std_logic;
    hdmi_tx_clk_p : out std_logic;
    hdmi_tx_hpd : out std_logic;
    hdmi_tx_rscl : out std_logic;
    hdmi_tx_rsda : out std_logic;
    hdmi_tx_n : out std_logic_vector(2 downto 0);
    hdmi_tx_p : out std_logic_vector(2 downto 0)
  );
end top;

architecture Behavioral of top is
    component clk_25MHz
    port
    (   -- Clock in ports
        -- Clock out ports
        clk_out1          : out    std_logic;
        -- Status and control signals
        resetn             : in     std_logic;
        clk_in1           : in     std_logic
    );
    end component;
    
    signal pixclk : std_logic;
begin

pixcloking : clk_25MHz
port map ( 
  -- Clock out ports  
   clk_out1 => pixclk,
  -- Status and control signals                
   resetn => rstn,
   -- Clock in ports
   clk_in1 => clk
);

hdmi_inst : entity work.hdmi
port map(
    pixclk => pixclk, -- 25 MHz !!
    rstn => rstn,
    
    hdmi_tx_cec => hdmi_tx_cec,
    hdmi_tx_clk_n => hdmi_tx_clk_n,
    hdmi_tx_clk_p => hdmi_tx_clk_p,
    hdmi_tx_hpd => hdmi_tx_hpd,
    hdmi_tx_rscl => hdmi_tx_rscl,
    hdmi_tx_rsda => hdmi_tx_rsda,
    hdmi_tx_n => hdmi_tx_n,
    hdmi_tx_p => hdmi_tx_p
);

end Behavioral;
