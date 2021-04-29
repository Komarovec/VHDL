----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.01.2021 17:22:52
-- Design Name: 
-- Module Name: main_cont - Behavioral
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

entity main_cont is
  Port ( 
      clk: in std_logic;
      rst: in std_logic;
  
      btnu: in std_logic;
      btnd: in std_logic;
      led: out std_logic_vector(7 downto 0);
  
      pulse: out std_logic;
      
      -- Ram data
      ram_dq_i             : out    std_logic_vector(63 downto 0); -- IN RAM
      ram_dq_o             : in   std_logic_vector(63 downto 0); -- OUT OF RAM
      
      -- Inputs to ram_cont
      playing: out std_logic_vector(15 downto 0);
      recording: out std_logic_vector(15 downto 0);
      read_data_valid: out std_logic;
      
      delete: out std_logic;
      delete_bank: out std_logic_vector(3 downto 0);
      
      max_block: out std_logic_vector(21 downto 0);
      
      -- Output
      delete_clear: in std_logic;
      write_zero: in std_logic;
      get_data: in std_logic;
      data_ready: in std_logic;
      mix_data: in std_logic;
    
      addrblock: in std_logic_vector(21 downto 0);
      mem_bank: in std_logic_vector(3 downto 0);
      mem_block_addr: in std_logic_vector(21 downto 0)
  );
end main_cont;

architecture Behavioral of main_cont is
    type state is (READ, WRITE, IDLE);
    signal pstate: state := IDLE;
    signal nstate: state := IDLE;
begin
    ram_dq_i <= (others => '1');
    max_block <= (others => '1');
    read_data_valid <= '1';
    delete <= '0';
    delete_bank <= (others => '0');
    
    fsm: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                pulse <= '0';
                pstate <= IDLE;
                playing <= (others => '0');
                recording <= (others => '0');
            end if;
            case pstate is
                when IDLE =>
                    pulse <= '0';
                
                    playing <= (others => '0');
                    recording <= (others => '0');
                
                    if(btnu = '1') then
                        pstate <= WRITE;
                    elsif(btnd = '1') then
                        pstate <= READ;
                    end if;
                    
                when WRITE =>
                    pulse <= '1';
                
                    playing <= (others => '0');
                    recording <= (others => '1');
                    
                    if(btnu = '0') then
                        pstate <= IDLE;
                    end if;
                when READ =>
                    playing <= (others => '1');
                    recording <= (others => '0');
                    
                    if(btnd = '0') then
                        pstate <= IDLE;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
