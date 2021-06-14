----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2021 22:47:47
-- Design Name: 
-- Module Name: hdmi - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity hdmi is
  Port (
    pixclk : in std_logic; -- 25 MHz
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
end hdmi;

architecture Behavioral of hdmi is
    component clk_250MHz
    port
    (-- Clock in ports
        -- Clock out ports
        clk_out1          : out    std_logic;
        -- Status and control signals
        resetn             : in     std_logic;
        clk_in1           : in     std_logic
    );
    end component;

    signal counterX : integer range 0 to 799; -- counts from 0 to 799
    signal counterY : integer range 0 to 524; -- counts from 0 to 524
    
    signal hSync : std_logic;
    signal vSync : std_logic;
    signal drawArea : std_logic;
    signal clk250MHz : std_logic;
    
    signal red, green, blue : std_logic_vector(7 downto 0);
    
    signal TMDSred, TMDSgreen, TMDSblue : std_logic_vector(9 downto 0); 
    signal TMDSshiftRed, TMDSshiftGreen, TMDSshiftBlue : std_logic_vector(9 downto 0);

    signal TMDSmod10 : integer range 0 to 9;
    signal TMDSshiftLoad : std_logic;
begin
    RED_IBUFDS : OBUFDS 
    port map (
        I => TMDSshiftRed(0),
        O => hdmi_tx_p(2),
        OB => hdmi_tx_n(2)
    );
    
    GREEN_IBUFDS : OBUFDS 
    port map (
        I => TMDSshiftGreen(0),
        O => hdmi_tx_p(1),
        OB => hdmi_tx_n(1)
    );
    
    BLUE_IBUFDS : OBUFDS 
    port map (
        I => TMDSshiftBlue(0),
        O => hdmi_tx_p(0),
        OB => hdmi_tx_n(0)
    );
    
    CLK_IBUFDS : OBUFDS 
    port map (
        I => pixclk,
        O => hdmi_tx_clk_p,
        OB => hdmi_tx_clk_n
    );

    red <= (others => '1');
    green <= (others => '1');
    blue <= (others => '1');

    hSync <= '1' when (counterX >= 656) and (counterX < 752) else '0';
    vSync <= '1' when (counterY >= 490) and (counterY < 492) else '0';
    drawArea <= '1' when (counterX < 640) and (counterY < 480) else '0';
    
    fastclocking : clk_250MHz
    port map ( 
        -- Clock out ports  
        clk_out1 => clk250MHz,
        -- Status and control signals                
        resetn => rstn,
        -- Clock in ports
        clk_in1 => pixclk
    );
    
    redEncoder: entity work.tmds_encoder
    port map (
        clk => pixclk,
        disp_ena => drawArea,
        control => "00",
        d_in => red,
        q_out => TMDSred
    );
    
    greenEncoder: entity work.tmds_encoder
    port map (
        clk => pixclk,
        disp_ena => drawArea,
        control => "00",
        d_in => green,
        q_out => TMDSgreen
    );
    
    blueEncoder: entity work.tmds_encoder
    port map (
        clk => pixclk,
        disp_ena => drawArea,
        control => vSync & hSync,
        d_in => blue,
        q_out => TMDSblue
    );

    mod10: process(clk250MHz, rstn)
    begin
        if rstn = '0' then
            TMDSmod10 <= 0;
        elsif rising_edge(clk250MHz) then
            TMDSmod10 <= 0 when TMDSmod10 = 9 else TMDSmod10 + 1;
        end if;
    end process;

    shiftLoadSignal: process(clk250MHz, rstn)
    begin
        if rstn = '0' then
            TMDSshiftLoad <= '0';
        elsif rising_edge(clk250MHz) then
            TMDSshiftLoad <= '1' when TMDSmod10 = 9 else '0';
        end if;
    end process;

    shiftLoader: process(clk250MHz, rstn)
    begin
        if rstn = '0' then
            TMDSshiftRed <= (others => '0');
            TMDSshiftBlue <= (others => '0');
            TMDSshiftGreen <= (others => '0');
        elsif rising_edge(clk250MHz) then
            TMDSshiftRed <= TMDSred when TMDSshiftLoad = '1' else '0' & TMDSshiftRed(9 downto 1);
            TMDSshiftBlue <= TMDSblue when TMDSshiftLoad = '1' else '0' & TMDSshiftBlue(9 downto 1);
            TMDSshiftGreen <= TMDSgreen when TMDSshiftLoad = '1' else '0' & TMDSshiftGreen(9 downto 1);
        end if;
    end process;

    CX: process(pixclk, rstn)
    begin
        if rstn = '0' then
            counterX <= 0;
        elsif rising_edge(pixclk) then
            counterX <= 0 when counterX = 799 else counterX + 1;    
        end if;
    end process;

    CY: process(pixclk, rstn)
    begin
        if rstn = '0' then
            counterY <= 0;
        elsif rising_edge(pixclk) then
            if counterX = 799 then
                counterY <= 0 when counterY = 524 else counterY + 1;    
            end if;
        end if;
    end process;

end Behavioral;
