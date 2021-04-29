--      ODDR       : In order to incorporate this function into the design,
--      VHDL       : the following instance declaration needs to be placed
--    instance     : in the architecture body of the design code.  The
--   declaration   : instance name (ODDR_inst) and/or the port declarations
--      code       : after the "=>" assignment maybe changed to properly
--                 : connect this function to the design. All inputs  
--                 : and outputs must be connected.

--     Library     : In addition to adding the instance declaration, a use
--   declaration   : statement for the UNISIM.vcomponents library needs to be
--       for       : added before the entity declaration.  This library
--     Xilinx      : contains the component declarations for all Xilinx
--    primitives   : primitives and points to the models that will be used
--                 : for simulation.

--  Copy the following two statements and paste them before the
--  Entity declaration, unless they already exist.

Library UNISIM;
use UNISIM.vcomponents.all;

--  <-----Cut code below this line and paste into the architecture body---->

   -- ODDR: Output Double Data Rate Output Register with Set, Reset
   --       and Clock Enable. 
   --       Artix-7
   -- Xilinx HDL Language Template, version 2020.2
   
   ODDR_inst : ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => Q,   -- 1-bit DDR output
      C => C,    -- 1-bit clock input
      CE => CE,  -- 1-bit clock enable input
      D1 => D1,  -- 1-bit data input (positive edge)
      D2 => D2,  -- 1-bit data input (negative edge)
      R => R,    -- 1-bit reset input
      S => S     -- 1-bit set input
   );
  
   -- End of ODDR_inst instantiation
