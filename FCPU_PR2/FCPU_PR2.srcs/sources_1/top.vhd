---------------------------------------------------------------------------------
--| @file top.vhd
--| @brief This file is the top level of the project.
--|  It presents an interface between the CPU,
--|  RAM, and all the I/O modules.
--|
--| @author     Richard James Howe.
--| @copyright  Copyright 2017 Richard James Howe.
--| @license    MIT
--| @email      howe.r.j.89@gmail.com
--|
---------------------------------------------------------------------------------

library ieee,work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.core_pkg.all;
use work.util.all;
use work.uart_pkg.all;
use work.ble_uart;
use work.custom_reg;
use work.tsk_util.all;

entity top is
	generic(
		g: common_generics         := default_settings;
		reset_period_us:  natural  := 100;
		uart_baud:        positive := 115200;
		uart_fifo_depth:  positive := 8;
		
		-- External registers
		ext_count:         natural := 128 -- Register count
		);
	port
	(
		-- synthesis translate_off
		debug:    out cpu_debug_interface;
		-- synthesis translate_on

		clk_in:   in  std_ulogic                    := 'X';  -- clock
		-- Buttons
		btnu:     in  std_ulogic                    := 'X';  -- button up
		btnd:     in  std_ulogic                    := 'X';  -- button down
		btnc:     in  std_ulogic                    := 'X';  -- button centre
		btnl:     in  std_ulogic                    := 'X';  -- button left
		btnr:     in  std_ulogic                    := 'X';  -- button right
		-- Switches
		sw:       in  std_ulogic_vector(7 downto 0) := (others => 'X'); -- switches
		-- Simple LED outputs
--		an:       out std_ulogic_vector(3 downto 0) := (others => '0'); -- anodes   7 segment display
--		ka:       out std_ulogic_vector(7 downto 0) := (others => '0'); -- cathodes 7 segment display

		ld:       out std_ulogic_vector(7 downto 0) := (others => '0'); -- leds

		-- UART
		rx:       in  std_ulogic                    := 'X';  -- uart rx
		tx:       inout std_ulogic                  := '0';  -- uart tx

        -- JA PMOD - BLE
        pmod_rx:  out std_logic;
        pmod_tx:  in std_logic;
        pmod_rst_n: out std_logic;
        pmod_conf:  out std_logic
	);
end;

architecture behav of top is
	constant timer_length:           positive := 16; -- Def: 16
	constant number_of_interrupts:   positive := 8; -- Def: 8
	constant number_of_led_displays: positive := 4; -- Def: 4
	constant timer_period_us:        positive := 20000; -- Def: 20000
	constant use_sine:               boolean  := false;

    -- Components
    component ble_uart
        port (
            clk : in std_logic;
            uart_rx_out : out std_logic;
            uart_tx_in : in std_logic;  
            pmod_rx : out std_logic;
            pmod_tx : in std_logic;
            pmod_rst_n : out std_logic;
            pmod_conf : out std_logic
        );
    end component;
    
    component tsk_mod
    Port ( 
        clk_in: in std_logic;
        
        x1_b, x2_b: in std_ulogic_vector(31 downto 0); -- Inputs
        y_star_b: out std_ulogic_vector(31 downto 0) -- Output

        -- LinRef coefs. [cannot use user defined types beacuse of OOC, maybe custom stubs?]
--        raw_coefs_r1x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r1x2: in std_ulogic_vector(31 downto 0); -- RULE 1
--        raw_coefs_r1b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r2x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r2x2: in std_ulogic_vector(31 downto 0); -- RULE 2
--        raw_coefs_r2b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r3x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r3x2: in std_ulogic_vector(31 downto 0); -- RULE 3
--        raw_coefs_r3b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r4x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r4x2: in std_ulogic_vector(31 downto 0); -- RULE 4
--        raw_coefs_r4b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r5x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r5x2: in std_ulogic_vector(31 downto 0); -- RULE 5
--        raw_coefs_r5b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r6x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r6x2: in std_ulogic_vector(31 downto 0); -- RULE 6
--        raw_coefs_r6b: in std_ulogic_vector(31 downto 0);
      
--        raw_coefs_r7x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r7x2: in std_ulogic_vector(31 downto 0); -- RULE 7
--        raw_coefs_r7b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r8x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r8x2: in std_ulogic_vector(31 downto 0); -- RULE 8
--        raw_coefs_r8b: in std_ulogic_vector(31 downto 0);
        
--        raw_coefs_r9x1: in std_ulogic_vector(31 downto 0);
--        raw_coefs_r9x2: in std_ulogic_vector(31 downto 0); -- RULE 9
--        raw_coefs_r9b: in std_ulogic_vector(31 downto 0)

        -- NOT IMPLEMENTED MUST BE SPLIT IN BASIC STD_LOGIC_VECTORS
--        raw_x1_mf_coefs: in RAW_X1_MF_COEF_ARRAY; -- Membership functions coefs.
--        raw_x2_mf_coefs: in RAW_X2_MF_COEF_ARRAY -- Membership functions coefs.       
        
        -- /Debug output/
        --x1_low_out, x1_avg_out, x1_high_out: out sfixed(1 downto -31); -- Debug mbfs vals
        --y1_out, y2_out, y3_out: out sfixed(23 downto -8) -- Debug p vals
        -- /Debug output/
    );
    end component;
    
    component clock_manager
    port
     (-- Clock in ports
      -- Clock out ports
      clk_out1          : out    std_logic;
      -- Status and control signals
      reset             : in     std_logic;
      clk_in1           : in     std_logic
     );
    end component;
    
	-- Signals
	signal rst:      std_ulogic := '0';
	-- CPU H2 IO interface signals.
	signal cpu_wait: std_ulogic := '0';
	signal io_wr:    std_ulogic := '0';
	signal io_re:    std_ulogic := '0';
	signal io_din:   std_ulogic_vector(15 downto 0) := (others => '0'); -- Def: 15, 0
	signal io_dout:  std_ulogic_vector(15 downto 0) := (others => '0'); -- Def: 15, 0
	signal io_daddr: std_ulogic_vector(15 downto 0) := (others => '0'); -- Def: 15, 0

	-- CPU H2 Interrupts
	signal cpu_irc:         std_ulogic_vector(number_of_interrupts - 1 downto 0) := (others => '0');
	signal cpu_irc_mask_we: std_ulogic := '0';

	signal clk25MHz: std_ulogic:= '0';
	signal clk50MHz: std_ulogic:= '0';

	attribute buffer_type: string;
	attribute buffer_type of clk50MHz: signal is "BUFG";
	attribute buffer_type of clk25MHz: signal is "BUFG";

	-- Basic IO register

	---- LEDs/Switches
	signal ld_we:             std_ulogic := '0';

	---- VGA
	signal vga_data:          std_ulogic_vector(7 downto 0) := (others => '0');
	signal vga_data_we:       std_ulogic                    := '0';
	signal vga_data_busy:     std_ulogic                    := '0';

	---- UART
	signal rx_data:           std_ulogic_vector(7 downto 0) := (others => '0');
	signal rx_fifo_empty:     std_ulogic := '0';
	signal rx_fifo_full:      std_ulogic := '0';
	signal rx_data_re:        std_ulogic := '0';

	signal tx_fifo_full:      std_ulogic := '0';
	signal tx_fifo_empty:     std_ulogic := '0';
	signal tx_data_we:        std_ulogic := '0';

	signal uart_clock_tx_we:  std_ulogic := '0';
	signal uart_clock_rx_we:  std_ulogic := '0';
	signal uart_control_we:   std_ulogic := '0';
	---- Timer
	signal timer_control_we:  std_ulogic := '0';
	signal timer_counter_o:   std_ulogic_vector(timer_length - 4 downto 0) := (others =>'0');
	signal timer_irq:         std_ulogic;

	---- PS/2
	signal kbd_char_buf_new:  std_ulogic := '0';
	signal kbd_char_buf:      std_ulogic_vector(6 downto 0) := (others => '0'); -- ASCII char
	signal kbd_char_re:       std_ulogic := '0';

	---- 8 Segment Display
	signal leds_reg_we:       std_ulogic := '0';

	---- Buttons
	signal btnu_d:            std_ulogic := '0'; -- button up
	signal btnd_d:            std_ulogic := '0'; -- button down
	signal btnc_d:            std_ulogic := '0'; -- button centre
	signal btnl_d:            std_ulogic := '0'; -- button left
	signal btnr_d:            std_ulogic := '0'; -- button right
	signal button_changed:    std_ulogic := '0'; -- Any of the buttons have changed state

	-- Switches
	signal sw_d:              std_ulogic_vector(sw'range) := (others => '0');

    -- External registers, outputs, write enable
    type CR_WE is array (ext_count-1 downto 0) of std_ulogic; -- Write enable signal
    type CR_DO is array (ext_count-1 downto 0) of std_ulogic_vector(15 downto 0); -- Data out signals
    
    signal cr_we_arr: CR_WE := (others => '0');
    signal cr_do_arr: CR_DO := (others => (others => '0'));
    
	-- Memory
	signal mem_addr_26_17_we: std_ulogic := '0';
	signal mem_addr_16_1_we:  std_ulogic := '0';
	signal mem_data_i_we:     std_ulogic := '0';
	signal mem_data_o:        std_ulogic_vector(15 downto 0) := (others => '0');
	signal mem_control_we:    std_ulogic := '0';

	signal sine_we: std_ulogic := '0';
	signal sine: std_ulogic_vector(15 downto 0) := (others => '0');

    -- RX of UART (BLE or PC)
    signal ble_rx: std_logic := 'X';
    signal rx_cpu: std_logic := '1';
    
    -- Signal clock
    signal clk: std_logic := 'X';
    
    -- TSK signals
    signal x1, x2: std_ulogic_vector(31 downto 0);
    signal y_star: std_ulogic_vector(31 downto 0);
    
    signal linreg_coefs: RAW_COEF_ARRAY;
    signal x1_membership_coefs: RAW_X1_MF_COEF_ARRAY;
    signal x2_membership_coefs: RAW_X2_MF_COEF_ARRAY;
begin
    -- TSK inputs
    x1(23 downto 8) <= cr_do_arr(0); -- Input for TSK Address: 4020; Reg.num. 0
    x1(31 downto 24) <= (others => '0');
    x1(7 downto 0) <= (others => '0');

    x2(23 downto 8) <= cr_do_arr(1); -- Input for TSK Address: 4022; Reg.num. 1
    x2(31 downto 24) <= (others => '0');
    x2(7 downto 0) <= (others => '0');

    -- TSK membership coefs x1                                                   - Address example for 3 mbfs
    x1_membership_coefs_generate: for ii in 0 to (3*X1_MBFS_COUNT)-1 generate -- Address: 4024 - 4034 => 4024, 4026, 4028, 402A, 402C, 402E, 4030, 4032, 4034
        x1_membership_coefs(ii)(23 downto 8) <= cr_do_arr(INPUT_COUNT+ii);        -- Reg. num.: 2 - 10 =>   2,    3,    4,    5,    6,    7,    8,    9,   10
        x1_membership_coefs(ii)(31 downto 24) <= (others =>  cr_do_arr(INPUT_COUNT+ii)(15));
        x1_membership_coefs(ii)(7 downto 0) <= (others => '0');
    end generate;

    -- TSK membership coefs x2                                                   - Address example for 3 mbfs
    x2_membership_coefs_generate: for ii in 0 to (3*X2_MBFS_COUNT)-1 generate                   -- Address: 4036 - 4046 => 4036, 4038, 403A, 403C, 403E, 4040, 4042, 4044, 4046
        x2_membership_coefs(ii)(23 downto 8) <= cr_do_arr(INPUT_COUNT+(3*X1_MBFS_COUNT)+ii);    -- Reg. num.:   11 - 19 =>   11,   12,   13,   14,   15,   16,   17,   18,   19
        x2_membership_coefs(ii)(31 downto 24) <= (others => cr_do_arr(INPUT_COUNT+(3*X1_MBFS_COUNT)+ii)(15));
        x2_membership_coefs(ii)(7 downto 0) <= (others => '0');
    end generate;

    -- TSK linreg coefs
    -- If number of inputs/ number of membership fs changed you MUST change number of registers and recalculate offset address.
    -- Reg 0 -> 4020
    -- Example of address calculation
    -- 2 inputs, 3 mbfs per inputs, 3 fuzzy sets per mbf => 9 registers per input, 18 + 0 + 1 (input regs) = 19, 19 * 2 = 38 Address offset 26(hex) + 4020(hex) = 4046 <- last mbfs register  
    linreg_coefs_generate: for ii in 0 to (3*RULE_COUNT)-1 generate                                            -- Address: 4048 - 4051 => 4048, 404A, 404C, 404E, 4050, 4052, 4054, 4056, 4058, 405A
        linreg_coefs(ii)(23 downto 8) <= cr_do_arr(INPUT_COUNT + (3*X1_MBFS_COUNT) + (3*X2_MBFS_COUNT) + ii);  -- Reg. num.:   20 - 28 =>   20,   21,   22,   23,   24,   25,   26,   27,   28,   29 
        linreg_coefs(ii)(31 downto 24) <= (others => cr_do_arr(INPUT_COUNT + (3*X1_MBFS_COUNT) + (3*X2_MBFS_COUNT) + ii)(15)); -- Negative numbers handle
        linreg_coefs(ii)(7 downto 0) <= (others => '0');
    end generate;

    -- TSK
--    tsk_reg: entity work.tsk port map(
--        clk_in => clk,
--        x1_b => x1,
--        x2_b => x2,
--        y_star_b => y_star
        
--        -- Comment coefs transfer for default values
--        --raw_coefs => linreg_coefs
--        --raw_x1_mf_coefs => x1_membership_coefs,
--        --raw_x2_mf_coefs => x2_membership_coefs
--    );

    -- TSK Partilly reconfigured
    tsk_reg: tsk_mod
    port map(
        clk_in => clk,
        x1_b => x1,
        x2_b => x2,
        y_star_b => y_star
        
--        raw_coefs_r1x1 => linreg_coefs(0),
--        raw_coefs_r1x2 => linreg_coefs(1),
--        raw_coefs_r1b => linreg_coefs(2),
        
--        raw_coefs_r2x1 => linreg_coefs(3),
--        raw_coefs_r2x2 => linreg_coefs(4),
--        raw_coefs_r2b => linreg_coefs(5),
        
--        raw_coefs_r3x1 => linreg_coefs(6),
--        raw_coefs_r3x2 => linreg_coefs(7),
--        raw_coefs_r3b => linreg_coefs(8),
        
--        raw_coefs_r4x1 => linreg_coefs(9),
--        raw_coefs_r4x2 => linreg_coefs(10),
--        raw_coefs_r4b => linreg_coefs(11),
        
--        raw_coefs_r5x1 => linreg_coefs(12),
--        raw_coefs_r5x2 => linreg_coefs(13),
--        raw_coefs_r5b => linreg_coefs(14),
        
--        raw_coefs_r6x1 => linreg_coefs(15),
--        raw_coefs_r6x2 => linreg_coefs(16),
--        raw_coefs_r6b => linreg_coefs(17),
        
--        raw_coefs_r7x1 => linreg_coefs(18),
--        raw_coefs_r7x2 => linreg_coefs(19),
--        raw_coefs_r7b => linreg_coefs(20),
        
--        raw_coefs_r8x1 => linreg_coefs(21),
--        raw_coefs_r8x2 => linreg_coefs(22),
--        raw_coefs_r8b => linreg_coefs(23),
        
--        raw_coefs_r9x1 => linreg_coefs(24),
--        raw_coefs_r9x2 => linreg_coefs(25),
--        raw_coefs_r9b => linreg_coefs(26)
        
        -- NOT IMPLEMENTED MUST BE SPLIT IN BASIC STD_LOGIC_VECTORS
--        raw_x1_mf_coefs => x1_membership_coefs_def, --x1_membership_coefs,
--        raw_x2_mf_coefs => x2_membership_coefs_def --x2_membership_coefs
    );

    -- External registers generation --
    -- Starting with address 4020, 4022, ...; Last register address is 2*register_count(hex) + 401E
    -- For reading use @; For writing use !; Example: 4020 @ -> Stores value to stack; 55 4020 ! -> Stores value 55 to register with address 4020 (first register)
    cr_generate: for ii in 0 to ext_count-1 generate
        cus_reg: entity work.custom_reg
            port map (
                clk => clk,
                rst => rst,
                we  => cr_we_arr(ii),
                di  => io_dout(15 downto 0),
                do  => cr_do_arr(ii));
    end generate cr_generate;

    -- Variable Clocking
    cm: clock_manager
    port map (
        clk_in1 => clk_in,
        reset => '0',
        clk_out1 => clk
    );
    
-------------------------------------------------------------------------------
-- The Main CPU components
-------------------------------------------------------------------------------
	cpu_wait   <= btnc_d; -- temporary testing measure only!
	
	system_reset: work.util.reset_generator
	generic map (g => g, reset_period_us => reset_period_us)
	port map (
		clk        => clk,
		rst        => rst);

	-- TODO: Add interrupts on video blanking periods, which should
	-- make writing graphics code easier.
	cpu_irc(0) <= btnu_d; -- configurable CPU reset (can mask this)
	cpu_irc(1) <= not rx_fifo_empty;
	cpu_irc(2) <= rx_fifo_full;
	cpu_irc(3) <= not tx_fifo_empty;
	cpu_irc(4) <= tx_fifo_full;
	cpu_irc(5) <= kbd_char_buf_new;
	cpu_irc(6) <= timer_irq;
	cpu_irc(7) <= button_changed;

    -- Bluetooth uart
    ble_uart_0: ble_uart port map (
        clk => clk,
        uart_rx_out => ble_rx,
        uart_tx_in => tx, 
        pmod_rx => pmod_rx,
        pmod_tx => pmod_tx,
        pmod_rst_n => pmod_rst_n,
        pmod_conf => pmod_conf
    );
    
    -- PC UART RX or BLE RX
    rx_cpu <= ble_rx and rx;

	core_0: entity work.core
	generic map (g => g, number_of_interrupts => number_of_interrupts)
	port map (
-- synthesis translate_off
	debug            => debug,
-- synthesis translate_on
		clk              => clk, -- clock
		rst              => rst, -- reset
		stop             => cpu_wait, -- stop?
		io_wr            => io_wr, -- IO Write
		io_re            => io_re, -- IO Read
		io_din           => io_din, -- Data in
		io_dout          => io_dout, -- Data out
		io_daddr         => io_daddr, -- Data address
		cpu_irc          => cpu_irc, -- Interrupts
		cpu_irc_mask     => io_dout(number_of_interrupts - 1 downto 0),
		cpu_irc_mask_we  => cpu_irc_mask_we);

	-------------------------------------------------------------------------------
	-- IO
	-------------------------------------------------------------------------------

	-- NOTE: A Wishbone Interface on each of the components would simplify the
	-- system overall. However, each peripheral would need an interface
	-- specifying. This module could be made to be much smaller.
	-- See: <https://en.wikipedia.org/wiki/Wishbone_(computer_bus)>
	-- And: <http://cdn.opencores.org/downloads/wbspec_b4.pdf>

	-- Xilinx Application Note:
	-- It seems like it buffers the clock correctly here, so no need to
	-- use a DCM. However, see:
	-- http://electronics.stackexchange.com/questions/112534/using-digital-clock-manager-with-verilog-to-generate-25mhz-clock-from-32mhz-inte
	---- Clock divider /2.
	clk50MHz <= '0' when rst = '1' else not clk50MHz when rising_edge(clk);

	---- Clock divider /2. Pixel clock is 25MHz
	clk25MHz <= '0' when rst = '1' else not clk25MHz when rising_edge(clk50MHz);

	-- It possible for CPU to issue both signals at the same time, but it should
	-- not happen with a standard instruction.
	assert not(io_wr = '1' and io_re = '1') report "IO Read/Write issued at same time" severity error;

	vga_data <= io_dout(vga_data'range);

	-- TODO: Raise trap (interrupt with bus error) on invalid memory access.
	io_write: block
		signal selector: std_ulogic_vector(7 downto 0) := (others => '0');
		signal is_write: boolean := false;
	begin
		selector          <= io_daddr(8 downto 1);
		is_write          <= true when io_wr = '1' else false;

		tx_data_we        <= io_dout(13) when is_write and selector = "00000000" else '0';
		rx_data_re        <= io_dout(10) when is_write and selector = "00000000" else '0';

		vga_data_we       <= io_dout(13) when is_write and selector = "00000001" else '0';
		kbd_char_re       <= io_dout(10) when is_write and selector = "00000001" else '0';

		timer_control_we  <= '1'         when is_write and selector = "00000010" else '0';
		ld_we             <= '1'         when is_write and selector = "00000011" else '0';
		mem_data_i_we     <= '1'         when is_write and selector = "00000100" else '0';

		mem_addr_26_17_we <= '1'         when is_write and selector = "00000101" else '0';
		mem_control_we    <= '1'         when is_write and selector = "00000101" else '0';

		mem_addr_16_1_we  <= '1'         when is_write and selector = "00000110" else '0';

		leds_reg_we       <= '1'         when is_write and selector = "00000111" else '0';
		cpu_irc_mask_we   <= '1'         when is_write and selector = "00001000" else '0';

		uart_clock_tx_we  <= '1'         when is_write and selector = "00001001" else '0';
		uart_clock_rx_we  <= '1'         when is_write and selector = "00001010" else '0';
		uart_control_we   <= '1'         when is_write and selector = "00001011" else '0';

        -- External registers -> write enable; Starting with address 4020, 4022, ...; Last register address is 2*register_count + 401E
        cr_w_generate: for ii in 0 to ext_count-1 generate
            cr_we_arr(ii) <= '1' when is_write and selector = std_ulogic_vector(to_unsigned(16+ii, selector'length)) else '0';
        end generate cr_w_generate;

		sine_o: if use_sine generate
		sine_we           <= '1'         when is_write and selector = "00001100" else '0';
		sine_we           <= '1'         when is_write and selector = "00001101" else '0';
		end generate sine_o;
	end block;

	io_read: process(
		io_wr, io_re, io_daddr,
		sw_d, btnu_d, btnd_d, btnl_d, btnr_d, btnc_d,
		kbd_char_buf_new, kbd_char_buf,

		rx_data,
		rx_fifo_empty,
		rx_fifo_full,

		tx_fifo_full,
		tx_fifo_empty,

		timer_counter_o,

		vga_data_busy,
		sine,

		mem_data_o,
		
		cr_do_arr,
		
		y_star)
		
		variable no_addr : std_ulogic := '0'; -- No address match -> write zeroes to io_din
	begin
		io_din <= (others => '0');

		-- The signal io_re is not needed as none of the reads have
		-- any side effects
		   
		case io_daddr(8 downto 1) is
		when "00000000" => -- buttons, plus direct access to UART bit.
			io_din(7 downto 0) <= rx_data;
			io_din(8)          <= rx_fifo_empty;
			io_din(9)          <= rx_fifo_full;
			io_din(11)         <= tx_fifo_empty;
			io_din(12)         <= tx_fifo_full;
		when "00000001" => -- VT100 status and Keyboard
			io_din(6 downto 0) <= kbd_char_buf;
			io_din(8)          <= not kbd_char_buf_new;
			io_din(9)          <= kbd_char_buf_new;
			io_din(11)         <= not vga_data_busy;
			io_din(12)         <= vga_data_busy;
		when "00000010" => -- Timer in
			io_din(timer_counter_o'range) <= timer_counter_o;
		when "00000011" => -- Switches and buttons
			io_din <= "000" & btnu_d & btnd_d & btnl_d & btnr_d & btnc_d & sw_d;
		when "00000100" =>
			io_din             <= mem_data_o;
		when "00000101" =>
			if use_sine then
				io_din <= sine;
			end if;
		when "00001111" => -- Output value from TSK reg 401E
		    io_din <= y_star(23 downto 8);
		when others => -- Custom registers -> Read
		    no_addr := '0';
            for i in 0 to ext_count-1 loop -- Search custom registers
                if io_daddr(8 downto 1) = std_ulogic_vector(to_unsigned(16+i, 8)) then
                    io_din <= cr_do_arr(i);
                    no_addr := '1';
                end if;
            end loop;
            if no_addr = '0' then -- If no address match -> zero bus io_din
                io_din <= (others => '0');
            end if;
		end case;
	end process;

	--- Sine ----------------------------------------------------------
	sine_gen_0: if use_sine generate
		sine_0: work.util.sine 
			generic map(g => g) 
			port map(clk => clk, rst => rst, xwe => sine_we, x => io_dout, s => sine);
	end generate;
	--- Sine ----------------------------------------------------------

	--- UART ----------------------------------------------------------
	uart_fifo_0: work.uart_pkg.uart_top
		generic map (g => g, baud => uart_baud, use_fifo => true)
		port map (
			clk => clk, 
			rst => rst,

			tx            => tx,
			tx_fifo_full  => tx_fifo_full,
			tx_fifo_empty => tx_fifo_empty,
			tx_fifo_we    => tx_data_we,
			tx_fifo_data  => io_dout(7 downto 0),

            -- Data rx
			rx            => rx_cpu,
			rx_fifo_re    => rx_data_re,
			rx_fifo_data  => rx_data,
			rx_fifo_full  => rx_fifo_full,
			rx_fifo_empty => rx_fifo_empty,

			reg             => io_dout,
			clock_reg_tx_we => uart_clock_tx_we,
			clock_reg_rx_we => uart_clock_rx_we,
			control_reg_we  => uart_control_we);
	--- UART ----------------------------------------------------------

	--- LED Output ----------------------------------------------------
	led_output_reg_0: entity work.reg
		generic map (g => g, N => ld'length)
		port map (
			clk => clk,
			rst => rst,
			we  => ld_we,
			di  => io_dout(ld'range),
			do  => ld);
	--- LED Output ----------------------------------------------------


	--- Timer ---------------------------------------------------------
	timer_0: entity work.timer
	generic map (g => g, timer_length => timer_length)
	port map (
		clk       => clk,
		rst       => rst,
		we        => timer_control_we,
		control_i => io_dout,
		counter_o => timer_counter_o,
		irq       => timer_irq);
	--- Timer ---------------------------------------------------------

	--- Buttons -------------------------------------------------------
	button_debouncer: work.util.debounce_block_us
	generic map (g => g, N => 5, timer_period_us    => timer_period_us)
	port map (
		clk   => clk,
		di(0) => btnu,
		di(1) => btnd,
		di(2) => btnc,
		di(3) => btnl,
		di(4) => btnr,
		do(0) => btnu_d,
		do(1) => btnd_d,
		do(2) => btnc_d,
		do(3) => btnl_d,
		do(4) => btnr_d);

	dpad_changed: block
		signal changed_signals:     std_ulogic_vector(4 downto 0) := (others => '0');
		signal any_changed_signals: std_ulogic := '0';
	begin
		state_changed: work.util.state_block_changed
		generic map (g => g, N => changed_signals'length)
		port map (
			clk   => clk,
			rst   => rst,
			di(0) => btnu_d,
			di(1) => btnd_d,
			di(2) => btnc_d,
			di(3) => btnl_d,
			di(4) => btnr_d,
			do    => changed_signals);

		any_changed_signals <= '1' when changed_signals /= "00000" else '0';

		state_changed_reg: work.util.reg
		generic map (g => g, N => 1)
		port map (
			clk   => clk,
			rst   => rst,
			di(0) => any_changed_signals,
			we    => '1',
			do(0) => button_changed);
	end block;

	--- Buttons -------------------------------------------------------

	--- Switches ------------------------------------------------------
	sw_debouncer: work.util.debounce_block_us
		generic map (g => g, N => sw'length, timer_period_us => timer_period_us)
		port map (clk => clk, di => sw, do => sw_d);
	--- Switches ------------------------------------------------------

-------------------------------------------------------------------------------
end architecture;

