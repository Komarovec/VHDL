----------------------------------------------------------------------------------
-- Engineer: Denis Kurka
-- 
-- Create Date: 19.01.2021 15:15:16
-- Design Name: Memory controller
-- Module Name: top - Behavioral
-- Project Name: MIG_test
-- Target Devices: Nexys Video
-- Tool Versions: Vivado 2020.2 
-- 
-- Revision 0.01 - File Created
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
      clk: in std_logic;
      rstn: in std_logic;
      
      -- Switches
--      sw: in std_logic_vector(7 downto 0);
      btnu: in std_logic;
      btnd: in std_logic;
      led: out std_logic_vector(7 downto 0);
      
      -- RAM inteface
      ddr3_addr            : out   std_logic_vector(14 downto 0);
      ddr3_ba              : out   std_logic_vector(2 downto 0);
      ddr3_ras_n           : out   std_logic;
      ddr3_cas_n           : out   std_logic;
      ddr3_reset_n         : out   std_logic;
      ddr3_we_n            : out   std_logic;
      ddr3_ck_p            : out   std_logic_vector(0 downto 0);
      ddr3_ck_n            : out   std_logic_vector(0 downto 0);
      ddr3_cke             : out   std_logic_vector(0 downto 0);
      ddr3_dm              : out   std_logic_vector(1 downto 0);
      ddr3_odt             : out   std_logic_vector(0 downto 0);
      ddr3_dq              : inout std_logic_vector(15 downto 0);
      ddr3_dqs_p           : inout std_logic_vector(1 downto 0);
      ddr3_dqs_n           : inout std_logic_vector(1 downto 0)
  );
end top;

architecture Behavioral of top is
    COMPONENT ila_0
    PORT (
        clk : IN STD_LOGIC;
        
        probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
        probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe5 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
        probe6 : IN STD_LOGIC_VECTOR(21 DOWNTO 0); 
        probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
        probe12 : IN STD_LOGIC_VECTOR(21 DOWNTO 0); 
        probe13 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
        probe14 : IN STD_LOGIC_VECTOR(21 DOWNTO 0); 
        probe15 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        probe16 : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT main_cont
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
    END COMPONENT;

    component memory_control
    port
    (
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
        ram_a: out    std_logic_vector(25 downto 0);
        ram_cen              : out    std_logic;
        ram_oen              : out    std_logic;
        ram_wen              : out    std_logic;
        data_valid           : in     std_logic
    );
    end component;

    component DDRcontrol
    port
    (
        -- Common
        clk_200MHz_i         : in    std_logic; -- 200 MHz system clock
        rst_i                : in    std_logic; -- active high system reset
        
        -- RAM interface
        ram_a                : in    std_logic_vector(25 downto 0);
        ram_dq_i             : in    std_logic_vector(63 downto 0);
        ram_dq_o             : out   std_logic_vector(63 downto 0);
        ram_cen              : in    std_logic;
        ram_oen              : in    std_logic;
        ram_wen              : in    std_logic;
        data_valid           : out   std_logic;
        
        -- DDR3 interface
        ddr3_addr            : out   std_logic_vector(14 downto 0);
        ddr3_ba              : out   std_logic_vector(2 downto 0);
        ddr3_ras_n           : out   std_logic;
        ddr3_cas_n           : out   std_logic;
        ddr3_reset_n         : out   std_logic;
        ddr3_we_n            : out   std_logic;
        ddr3_ck_p            : out   std_logic_vector(0 downto 0);
        ddr3_ck_n            : out   std_logic_vector(0 downto 0);
        ddr3_cke             : out   std_logic_vector(0 downto 0);
        ddr3_dm              : out   std_logic_vector(1 downto 0);
        ddr3_odt             : out   std_logic_vector(0 downto 0);
        ddr3_dq              : inout std_logic_vector(15 downto 0);
        ddr3_dqs_p           : inout std_logic_vector(1 downto 0);
        ddr3_dqs_n           : inout std_logic_vector(1 downto 0)
    );
    end component;

    component clk_wiz_0
    port
    (
        -- Clock in ports
        -- Clock out ports
        clk_out1          : out    std_logic;
        clk_out2          : out    std_logic;
        -- Status and control signals
        --reset             : in     std_logic;
        --locked            : out    std_logic;
        clk_in1           : in     std_logic
    );
    end component;
    
    -- 200MHz clock for DDR controller
    signal ddr_clk: std_logic;
    
    -- 100Mhz clock for mem_contoller
    signal mem_cont_clk: std_logic;
    
    -- Rest
    signal rst: std_logic;
    
    -- RAM interface
    signal ram_a                : std_logic_vector(25 downto 0); -- Address
    signal ram_dq_i             : std_logic_vector(63 downto 0); -- Input data
    signal ram_dq_o             : std_logic_vector(63 downto 0); -- Output data
    signal ram_cen              : std_logic; -- Dont know
    signal ram_oen              : std_logic; -- Dont know
    signal ram_wen              : std_logic; -- Write signal?
    signal data_valid           : std_logic; -- OUT signal
    
    -- Memory controller signals
    signal pulse: std_logic;
    
    -- Inputs
    signal playing: std_logic_vector(15 downto 0);
    signal recording: std_logic_vector(15 downto 0);
    
    signal read_data_valid: std_logic;
    
    signal delete: std_logic;
    signal delete_bank: std_logic_vector(3 downto 0);
    
    signal max_block: std_logic_vector(21 downto 0);
    
    -- Output
    signal delete_clear: std_logic;
    signal write_zero: std_logic;
    signal get_data: std_logic;
    signal data_ready: std_logic;
    signal mix_data: std_logic;
    
    signal addrblock: std_logic_vector(21 downto 0);
    signal mem_bank: std_logic_vector(3 downto 0);
    signal mem_block_addr: std_logic_vector(21 downto 0);
begin
    rst <= not rstn;

    main_controller: main_cont
    PORT MAP (
        clk => mem_cont_clk,
        rst => rst,
        
        btnu => btnu,
        btnd => btnd,
        led => led,
        
        pulse => pulse,
        
        -- Ram data
        ram_dq_i => ram_dq_i,
        ram_dq_o => ram_dq_o,
        
        -- Inputs to ram_cont
        playing => playing,
        recording => recording,
        read_data_valid => read_data_valid,
        
        delete => delete,
        delete_bank => delete_bank,
        
        max_block => max_block,
        
        -- Output
        delete_clear => delete_clear, 
        write_zero => write_zero,
        get_data => get_data,
        data_ready => data_ready,
        mix_data => mix_data,
        
        addrblock => addrblock,
        mem_bank => mem_bank,
        mem_block_addr => mem_block_addr
    );

    debug_core : ila_0
    PORT MAP (
        clk => clk,

        -- Inputs
        probe0(0) => pulse,
        probe1 => playing,
        probe2 => recording,
        
        probe3(0) => read_data_valid,
        
        probe4(0) => delete,
        probe5 => delete_bank,
        
        probe6 => max_block,
        
        -- Output
        probe7(0) => delete_clear,
        probe8(0) => write_zero,
        probe9(0) => get_data,
        probe10(0) => data_ready,
        probe11(0) => mix_data,
        
        probe12 => addrblock,
        probe13 => mem_bank,
        probe14 => mem_block_addr,
        probe15 => ram_dq_i,
        probe16 => ram_dq_o
    );

    mem_cont: memory_control
    port map ( 
          clk => mem_cont_clk,
          rst => rst,
          pulse => pulse,
          
          -- Inputs
          playing => playing,
          recording => recording,
          
          read_data_valid => read_data_valid,
          
          delete => delete,
          delete_bank => delete_bank,
          
          max_block => max_block,
          
          -- Output
          delete_clear => delete_clear,
          write_zero => write_zero,
          get_data => get_data,
          data_ready => data_ready,
          mix_data => mix_data,
        
          addrblock => addrblock,
          mem_bank => mem_bank,
          mem_block_addr => mem_block_addr,
          
          -- Ram interface
          ram_a => ram_a,
          ram_cen => ram_cen,
          ram_oen => ram_oen,
          ram_wen => ram_wen,
          data_valid => data_valid
     );

    ddr_controller : DDRcontrol
       port map ( 
          -- Common
          clk_200MHz_i     => ddr_clk,
          rst_i            => rst,
          
          -- RAM interface
          ram_a            => ram_a,
          ram_dq_i         => ram_dq_i,
          ram_dq_o         => ram_dq_o,
          ram_cen          => ram_cen,
          ram_oen          => ram_oen,
          ram_wen          => ram_wen,
          data_valid       => data_valid,
          
          -- DDR3 interface
          ddr3_addr        => ddr3_addr,
          ddr3_ba          => ddr3_ba,
          ddr3_ras_n       => ddr3_ras_n,
          ddr3_cas_n       => ddr3_cas_n,
          ddr3_reset_n     => ddr3_reset_n,
          ddr3_we_n        => ddr3_we_n,
          ddr3_ck_p        => ddr3_ck_p,
          ddr3_ck_n        => ddr3_ck_n,
          ddr3_cke         => ddr3_cke,
          ddr3_dm          => ddr3_dm,
          ddr3_odt         => ddr3_odt,
          ddr3_dq          => ddr3_dq,
          ddr3_dqs_p       => ddr3_dqs_p,
          ddr3_dqs_n       => ddr3_dqs_n
     );

    ddr_clock : clk_wiz_0
       port map ( 
      -- Clock out ports  
       clk_out1 => ddr_clk,
       clk_out2 => mem_cont_clk,
      -- Status and control signals                
       --reset => rstn,
       -- Clock in ports
       clk_in1 => clk
     );

end Behavioral;
