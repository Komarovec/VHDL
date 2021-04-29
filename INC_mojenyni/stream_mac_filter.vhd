-- stream_mac_filter.vhd: Example of simple stream interface processing - packet filtering based on destination MAC address
-- Copyright (C) 2021 FIT VUT
-- Author(s): Lukas Kekely <ikekely@fit.vutbr.cz>
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;



entity stream_mac_filter is
    port(
        -- Basic control signals
        RESET     : in std_logic;
        CLK       : in std_logic;
        -- Stream input interface (NOTE: minimum frame length is 5B)
        RX_DATA   : in std_logic_vector(4*8-1 downto 0);
        RX_STROBE : in std_logic_vector(2-1 downto 0);
        RX_LAST   : in std_logic;
        RX_VALID  : in std_logic;
        RX_READY  : out std_logic;
        -- Stream output interface
        TX_DATA   : out std_logic_vector(4*8-1 downto 0);
        TX_STROBE : out std_logic_vector(2-1 downto 0);
        TX_LAST   : out std_logic;
        TX_VALID  : out std_logic;
        TX_READY  : in std_logic;
        -- Configuration MI interface
        MI_DI       : in  std_logic_vector(32-1 downto 0);
        MI_DO       : out std_logic_vector(32-1 downto 0);
        MI_ADDR     : in  std_logic_vector(4-1 downto 0);
        MI_RD       : in  std_logic;
        MI_WR       : in  std_logic;
        MI_DRDY     : out std_logic
    );
end entity;



architecture full of stream_mac_filter is

    signal reg1_data : std_logic_vector(4*8-1 downto 0);
    signal reg1_strobe : std_logic_vector(2-1 downto 0);
    signal reg1_last, reg1_valid : std_logic;
    signal reg2_data : std_logic_vector(4*8-1 downto 0);
    signal reg2_strobe : std_logic_vector(2-1 downto 0);
    signal reg2_last, reg2_valid : std_logic;
    
    signal input_mac : std_logic_vector(48-1 downto 0);
    signal mac_eq, forward, forward_ce, forward_stored : std_logic;
    
    type states is (word0, word1, word2p);
    signal state, state_next : states;
    signal hold1 : std_logic;

    signal register_we : std_logic_vector(4-1 downto 0);
    signal register_mac : std_logic_vector(48-1 downto 0);
    signal register_promisc : std_logic;

begin

    -- Two registers on data path
    data_reg1: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                reg1_valid <= '0';
            elsif TX_READY = '1' and hold1 = '0' then
                reg1_valid <= RX_VALID;
            end if;
            if TX_READY = '1' and hold1 = '0' then
                reg1_data <= RX_DATA;
                reg1_strobe <= RX_STROBE;
                reg1_last <= RX_LAST;
            end if;
        end if;
    end process;

    data_reg2: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                reg2_valid <= '0';
            elsif TX_READY = '1' then
                reg2_valid <= reg1_valid and not hold1;
            end if;
            if TX_READY = '1' then
                reg2_data <= reg1_data;
                reg2_strobe <= reg1_strobe;
                reg2_last <= reg1_last;
            end if;
        end if;
    end process;


    -- Forward decision storage
    forward_reg: process(CLK)
    begin
        if rising_edge(CLK) then
            if TX_READY = '1' and forward_ce = '1' then
                forward_stored <= forward;
            end if;
        end if;
    end process;


    -- MAC address compare
    input_mac <= RX_DATA(16-1 downto 0) & reg1_data;
    mac_eq <= '1' when input_mac = register_mac else '0';
    forward <= mac_eq or register_promisc;


    -- Stream interface TX connection
    TX_DATA   <= reg2_data;
    TX_STROBE <= reg2_strobe;
    TX_LAST   <= reg2_last;
    TX_VALID  <= forward_stored and reg2_valid;
    RX_READY  <= TX_READY;


    -- Control FSM
    fsm_reg: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                state <= word0;
            elsif TX_READY = '1' then
                state <= state_next;
            end if;
        end if;
    end process;
    
    fsm_logic: process(RX_VALID, RX_LAST)
    begin
        state_next <= state;
        forward_ce <= '0';
        hold1 <= '0';
        case state is
            when word0 =>
                if RX_VALID = '1' then
                    state_next <= word1;
                end if;
            when word1 =>
                if RX_VALID = '1' then
                    forward_ce <= '1';
                    if RX_LAST = '1' then 
                        state_next <= word0;
                    else
                        state_next <= word2p;
                    end if;
                else
                    hold1 <= '1';
                end if;
            when word2p =>
                if RX_VALID = '1' and RX_LAST = '1' then
                    state_next <= word0;
                end if;
        end case;
    end process;


    -- MI address decoder (write logic)
    write_enable_decoder: process(MI_WR, MI_ADDR)
    begin
        register_we <= "0000";
        if MI_WR='1' then
            case MI_ADDR(4-1 downto 2) is
                when "00" => register_we <= "0001";
                when "01" => register_we <= "0010";
                when "10" => register_we <= "0100";
                when "11" => register_we <= "1000"; 
            end case;
        end if;
    end process;


    -- MI address decoder (read logic)
    read_data_mux: process(MI_ADDR)
    begin
        MI_DO <= X"00000000";
        case MI_ADDR(4-1 downto 2) is
            when "00" => MI_DO <= register_mac(32-1 downto 0);
            when "01" => MI_DO <= X"0000" & register_mac(48-1 downto 32);
            when "10" => MI_DO <= X"0000000" & "000" & register_promisc;
            when "11" => MI_DO <= X"00000000"; -- reserved
        end case;
    end process;
    MI_DRDY <= MI_RD; -- zero latency (same cycle) read response
    
    
    -- MI address decoder (registers)
    config_registers: process(CLK)
    begin
        if rising_edge(CLK) then
            if register_we(0) = '1' then  -- register 0x00: first part of MAC address
                register_mac(32-1 downto 0) <= MI_DI;
            end if;
            if register_we(1) = '1' then  -- register 0x04: second part of MAC address
                register_mac(48-1 downto 32) <= MI_DI(16-1 downto 0);
            end if;
            if RESET='1' then -- register 0x08: MAC compare ignore flag
                register_promisc <= '1';
            elsif register_we(2) = '1' then
                register_promisc <= MI_DI(0);
            end if;
        end if;
    end process;
   
end architecture;

