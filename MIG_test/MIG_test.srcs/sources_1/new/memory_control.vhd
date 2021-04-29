----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 20:32:23
-- Design Name: 
-- Module Name: memory_control - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_control is
  Port ( 
      clk: in std_logic;
      rst: in std_logic;
      pulse: in std_logic;
      
      -- Inputs
      playing: in std_logic_vector(15 downto 0);
      recording: in std_logic_vector(15 downto 0);
      
      read_data_valid: in std_logic;
      
      delete: in std_logic;
      delete_bank: in std_logic_vector(3 downto 0);
      
      max_block: in std_logic_vector(21 downto 0);
      
      -- Output
      delete_clear: out std_logic;
      write_zero: buffer std_logic;
      get_data: out std_logic;
      data_ready: out std_logic;
      mix_data: out std_logic;
    
      addrblock: buffer std_logic_vector(21 downto 0);
      mem_bank: buffer std_logic_vector(3 downto 0);
      mem_block_addr: buffer std_logic_vector(21 downto 0);
      
      -- Ram interface
      ram_a                : out    std_logic_vector(25 downto 0);
      ram_cen              : out    std_logic;
      ram_oen              : out    std_logic;
      ram_wen              : out    std_logic;
      data_valid           : in     std_logic
  );
end memory_control;

architecture Behavioral of memory_control is
    -- FSM
    type STATE is (
        BANK_ST,
        FLAG_ST,
        WRITE_ACK_ST,
        INC_BLOCK_ST,
        WAIT_ST,
        DELETE_ST,
        DELETE_ACK_ST,
        DELETE_INC_ST,
        ONECYCLE_ST,
        ENTERDELETE_ST,
        LEAVEDELETE_ST,
        READ_ACK_ST
    );

    signal address_enable: std_logic_Vector(15 downto 0); -- Assign write here
    
    signal count: std_logic_vector(12 downto 0) := (others => '0');
    signal pstate: STATE;
    signal nstate: STATE;
    
    signal delay_done: std_logic := '0';
    signal counter_enable: std_logic := '0';
    signal increment: std_logic := '0';
    
    signal counter: integer := 0;
    
    signal max_delete_block : std_logic_vector(21 downto 0) := (others => '0');
    signal delete_address : std_logic_vector(21 downto 0) := (others => '0');
    
    signal WEn_d1: std_logic;
begin
    address_enable <= playing or recording;
    mem_block_addr <= addrblock when write_zero = '0' else delete_address;

    increment_addr_block: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                addrblock <= (others => '0');
            elsif address_enable = (address_enable'range => '0') then
                addrblock <= (others => '0');
            elsif increment = '1' then
                if(max_block = (max_block'range => '0') or addrblock < max_block) then
                    addrblock <= std_logic_vector(unsigned(addrblock) + 1);
                else
                    addrblock <= (others => '0');
                end if;
            end if;
        end if;
    end process;

    write_signal: process(clk)
    begin
        if rising_edge(clk) then
            ram_wen <= WEn_d1;
        end if;
    end process;
    
    state_machine: process(clk)
    begin
        if rising_edge(clk) then
            --pstate <= nstate;
            if(rst = '1') then -- Reset default values
                pstate <= WAIT_ST;
                counter_enable <= '0';
                write_zero <= '0';
                get_data <= '0';
                data_ready <= '0';
                mem_bank <= (others => '0');
            else
                if pulse = '1' then
                    nstate <= LEAVEDELETE_ST;
                end if;
                case pstate is
                
                when BANK_ST =>
                    if mem_bank = (mem_bank'range => '1') then
                        nstate <= INC_BLOCK_ST;
                    else 
                        nstate <= BANK_ST;
                    end if;
                    
                    if recording(to_integer(unsigned(mem_bank))) = '1' then
                        get_data <= '1';
                        counter_enable <= '1';
                        ram_cen <= '0';
                        ram_oen <= '1';
                        WEn_d1 <= '0';
                        pstate <= WRITE_ACK_ST;
                    elsif playing(to_integer(unsigned(mem_bank))) = '1' then
                        get_data <= '0';
                        ram_cen <= '0';
                        ram_oen <= '0';
                        WEn_d1 <= '1';
                        pstate <= READ_ACK_ST;
                    else
                        get_data <= '0';
                        ram_cen <= '1';
                        ram_oen <= '1';
                        WEn_d1 <= '1';
                        data_ready <= '1';
                        pstate <= FLAG_ST;
                    end if;
                    
                when FLAG_ST =>
                    data_ready <= '0';
                    if mem_bank /= (mem_bank'range => '1') then
                        mem_bank <= std_logic_vector(unsigned(mem_bank) + 1);
                    end if;
                    pstate <= nstate;
                    
                when READ_ACK_ST =>
                    if read_data_valid = '1' then
                        data_ready <= '1';
                        ram_cen <= '1';
                        ram_oen <= '1';
                        WEn_d1 <= '1';
                        pstate <= FLAG_ST;
                        counter_enable <= '0';
                    end if;
                    
                when WRITE_ACK_ST =>
                    get_data <= '0';
                    if counter = 60 then
                        data_ready <= '1';
                        ram_cen <= '1';
                        ram_oen <= '1';
                        WEn_d1 <= '1';
                    else 
                        data_ready <= '0';
                    end if;
                    if delay_done = '1' then
                        pstate <= nstate;
                        mem_bank <= std_logic_vector(unsigned(mem_bank) + 1);
                        counter_enable <= '0';
                    end if;
                    
                when INC_BLOCK_ST =>
                    increment <= '1';
                    mix_data <= '1';
                    nstate <= WAIT_ST;
                    pstate <= WAIT_ST;
                
                when WAIT_ST =>
                    mix_data <= '0';
                    increment <= '0'; -- Stop incrementing addrblock
                    mem_bank <= (others => '0');
                    if pulse = '1' then
                        pstate <= BANK_ST;
                    elsif delete = '1' then
                        pstate <= ENTERDELETE_ST;
                    else
                        pstate <= WAIT_ST;
                    end if;
                    
                when ENTERDELETE_ST =>
                    if max_delete_block = (max_delete_block'range => '0') then
                        if max_block = (max_block'range => '0') then
                            max_delete_block <= mem_block_addr;
                        else
                            max_delete_block <= max_block;
                        end if;
                    end if;
                    nstate <= DELETE_ST;
                    mem_bank <= delete_bank;
                    write_zero <= '1';
                    pstate <= DELETE_ST;
                    
                when DELETE_ST =>
                    ram_cen <= '0';
                    ram_oen <= '1';
                    WEn_d1 <= '0';
                    counter_enable <= '1';
                    pstate <= DELETE_ACK_ST;
                    
                when DELETE_ACK_ST =>
                    if delay_done = '1' then
                        pstate <= DELETE_INC_ST;
                        ram_cen <= '1';
                        ram_oen <= '1';
                        WEn_d1 <= '1';
                        counter_enable <= '0';
                    end if;
                    
                when DELETE_INC_ST =>
                    if delete_address < max_delete_block then -- Not done erasing
                        delete_address <= std_logic_vector(unsigned(delete_address) + 1);
                        pstate <= nstate; -- Will either go to DELETE, or will go to LEAVEDELETE if a pulse was triggered during erasing
                    else -- Done erasing
                        delete_clear <= '1'; -- Flag to clear the delete signal
                        delete_address <= (others => '0');
                        write_zero <= '0';
                        max_delete_block <= (others => '0');
                        mem_bank <= (others => '0');
                        pstate <= ONECYCLE_ST;
                    end if;

                when ONECYCLE_ST => -- To kill the delete_clear pulse
                    delete_clear <= '0';
                    pstate <= WAIT_ST;
                
                when LEAVEDELETE_ST =>
                    mem_bank <= (others => '0');
                    write_zero <= '0';
                    counter_enable <= '1';
                    if delay_done = '1' then
                        counter_enable <= '0';
                        pstate <= BANK_ST;
                    end if;
                end case; 
            end if;      
        end if;
    end process;
    
    counter_inc: process(clk)
    begin
        if rising_edge(clk) then
            if counter_enable = '0' then
                counter <= 0;
                delay_done <= '0';
            elsif counter < 62 then
                counter <= counter + 1;
                delay_done <= '0';
            else
                counter <= 0;
                delay_done <= '1';
            end if;
        end if;
    end process;
end Behavioral;