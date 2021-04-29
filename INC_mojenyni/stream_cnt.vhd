-- stream_cnt.vhd: Example of simple stream interface processing - transactions & bytes counters
-- Copyright (C) 2021 FIT VUT
-- Author(s): Lukas Kekely <ikekely@fit.vutbr.cz>
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;



entity stream_cnt is
    port(
        -- Basic control signals
        RESET     : in std_logic;
        CLK       : in std_logic;
        -- Stream input interface
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
        -- Counters values
        PACKET_COUNTER : out std_logic_vector(32-1 downto 0);
        BYTE_COUNTER   : out std_logic_vector(64-1 downto 0)
    );
end entity;



architecture full of stream_cnt is

    signal word_valid : std_logic;
    signal word_strobe : std_logic_vector(2-1 downto 0);
    signal word_length : std_logic_vector(3-1 downto 0); -- extra bit for +1 without overflow

begin

    -- Stream interface RX to TX connection (no change)
    TX_DATA   <= RX_DATA;
    TX_STROBE <= RX_STROBE;
    TX_LAST   <= RX_LAST;
    TX_VALID  <= RX_VALID;
    RX_READY  <= TX_READY;
    
    -- Valid data word on the bus
    word_valid <= RX_VALID and TX_READY;
    
    -- Number of valid data bytes in a given word
    strobe_mux: process(RX_LAST, RX_STROBE)
    begin
        if RX_LAST = '1' then
            word_strobe<= RX_STROBE;
        else
            word_strobe<= "11";
        end if;
    end process;
    word_length <= ('0' & word_strobe) + "001";

    -- Packet counter
    counter1: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                PACKET_COUNTER <= (others => '0');
            elsif word_valid = '1' and RX_LAST = '1' then
                PACKET_COUNTER <= PACKET_COUNTER + 1;
            end if;
        end if;
    end process;
    
    -- Byte counter
    counter2: process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                BYTE_COUNTER <= (others => '0');
            elsif word_valid = '1' then
                BYTE_COUNTER <= BYTE_COUNTER + word_length;
            end if;
        end if;
    end process;
   
end architecture;

