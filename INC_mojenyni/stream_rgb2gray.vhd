-- stream_rgb2gray.vhd: Example of simple stream interface processing - convert RGB color to grayscale
-- Copyright (C) 2021 FIT VUT
-- Author(s): Lukas Kekely <ikekely@fit.vutbr.cz>
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;



entity stream_rgb2gray is
    generic (
        PIPELINED : boolean := true
    );
    port(
        -- Basic control signals
        RESET     : in std_logic;
        CLK       : in std_logic;
        -- Stream input interface
        RX_DATA   : in std_logic_vector(4*8-1 downto 0);
        RX_VALID  : in std_logic;
        RX_READY  : out std_logic;
        -- Stream output interface
        TX_DATA   : out std_logic_vector(4*8-1 downto 0);
        TX_VALID  : out std_logic;
        TX_READY  : in std_logic
    );
end entity;



architecture full of stream_rgb2gray is

    --   Grayscale formula: gray = 0.299*R + 0.587*G + 0.114*B
    -- Remove real numbers: gray = (77*R + 150*G + 29*B) / 256
    constant RC: std_logic_vector(8-1 downto 0) := std_logic_vector(to_unsigned(77, 8));
    constant GC: std_logic_vector(8-1 downto 0) := std_logic_vector(to_unsigned(150, 8));
    constant BC: std_logic_vector(8-1 downto 0) := std_logic_vector(to_unsigned(29, 8));

    signal red, green, blue : std_logic_vector(8-1 downto 0);
    signal red_mult, green_mult, blue_mult : std_logic_vector(16-1 downto 0);
    signal s1_red_mult, s1_green_mult, s1_blue_mult : std_logic_vector(16-1 downto 0);
    signal sum : std_logic_vector(16-1 downto 0);
    signal gray, s2_gray : std_logic_vector(8-1 downto 0);
    signal alpha, s1_alpha, s2_alpha : std_logic_vector(8-1 downto 0);
    signal s1_valid, s2_valid : std_logic;

begin
   
    -- Decode colors from input data word
    red   <= RX_DATA(8-1 downto 0);
    green <= RX_DATA(16-1 downto 8);
    blue  <= RX_DATA(24-1 downto 16);
    alpha <= RX_DATA(32-1 downto 24);
    
    -- Multiply colors by coeficients
    red_mult <= red * RC;
    green_mult <= green * GC;
    blue_mult <= blue * BC;
    
    -- Sum and divide the result
    sum <= s1_red_mult + s1_green_mult + s1_blue_mult;
    gray <= sum(16-1 downto 8); -- div by 256 is the same as shift right by 8

    -- Encode resulting gray color into data word
    TX_DATA   <= s2_alpha & s2_gray & s2_gray & s2_gray;
    TX_VALID  <= s2_valid;
    RX_READY <= TX_READY; -- NOTE: ready used as clock enable, not pipelined
    
    -- Architecture without pipelines
    direct_gen: if not PIPELINED generate
        -- Equation computation
        sum <= red*RC + green*GC + blue*BC;
        gray <= sum(16-1 downto 8); -- div by 256 is the same as shift left 8
        -- Interface signals connection
        TX_DATA   <= alpha & gray & gray & gray;
        TX_VALID  <= RX_VALID;
    end generate;
    
    -- Middle pipeline
    mid_pipe_gen: if PIPELINED generate
        middle_pipeline: process(CLK)
        begin
            if rising_edge(CLK) then
                if RESET = '1' then  -- OPT: reset can only clear valid flag
                    s1_valid <= '0';
                elsif TX_READY = '1' then
                    s1_valid <= RX_VALID;
                end if;
                if TX_READY = '1' then
                    s1_red_mult <= red_mult;
                    s1_green_mult <= green_mult;
                    s1_blue_mult <= blue_mult;
                    s1_alpha <= alpha;
                end if;
            end if;
        end process;
    end generate;
    mid_direct_gen: if not PIPELINED generate
        s1_valid <= RX_VALID;
        s1_red_mult <= red_mult;
        s1_green_mult <= green_mult;
        s1_blue_mult <= blue_mult;
        s1_alpha <= alpha;
    end generate;
        
    -- Output pipeline
    out_pipe_gen: if PIPELINED generate
        output_pipeline: process(CLK)
        begin
            if rising_edge(CLK) then
                if RESET = '1' then  -- OPT: reset can only clear valid flag
                    s2_valid <= '0';
                elsif TX_READY = '1' then
                    s2_valid <= s1_valid;
                end if;
                if TX_READY = '1' then
                    s2_gray <= gray;
                    s2_alpha <= s1_alpha;
                end if;
            end if;
        end process;
    end generate;    
    out_direct_gen: if not PIPELINED generate
        s2_valid <= s1_valid;
        s2_gray <= gray;
        s2_alpha <= s1_alpha;
    end generate;
    
end architecture;

