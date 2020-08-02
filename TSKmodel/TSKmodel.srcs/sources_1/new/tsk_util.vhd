
library IEEE, ieee_proposed, work;
use IEEE.STD_LOGIC_1164.ALL;
use ieee_proposed.fixed_pkg.all;

package tsk_util is
    --constant INPUT_COUNT: integer := 2;
    constant RULE_COUNT: integer := 3;

    -- Membership functions coefs.
    type RAW_MF_COEF_ARRAY is array (17 downto 0) of std_ulogic_vector(31 downto 0);
    type MF_COEF_ARRAY is array (17 downto 0) of sfixed(23 downto -8);

    -- LinReg coefs.
    type RAW_COEF_ARRAY is array (0 to (2*RULE_COUNT)-1) of std_ulogic_vector(31 downto 0);
    type COEF_ARRAY is array (0 to (2*RULE_COUNT)-1) of sfixed(23 downto -8);
    
    -- LinReg output values
    type Y_ARRAY is array (RULE_COUNT-1 downto 0) of sfixed(23 downto -8);
    
    -- Rules output weights
    type RULE_WEIGHT_ARRAY is array (RULE_COUNT-1 downto 0) of sfixed(1 downto -31);
    
    -- Default values
    constant MF_COEFS_DEFAULT: RAW_MF_COEF_ARRAY := (
        -- x2 high
        std_logic_vector(to_sfixed(100, 23, -8)), -- c
        std_logic_vector(to_sfixed(0, 23, -8)), -- s2
        std_logic_vector(to_sfixed(50, 23, -8)), -- s1
              
        -- x2 avg
        std_logic_vector(to_sfixed(50, 23, -8)), -- c
        std_logic_vector(to_sfixed(50, 23, -8)), -- s2
        std_logic_vector(to_sfixed(50, 23, -8)), -- s1
        
        -- x2 low
        std_logic_vector(to_sfixed(0, 23, -8)), -- c
        std_logic_vector(to_sfixed(50, 23, -8)), -- s2
        std_logic_vector(to_sfixed(0, 23, -8)), -- s1
        
        -- x1 high
        std_logic_vector(to_sfixed(100, 23, -8)), -- c
        std_logic_vector(to_sfixed(0, 23, -8)), -- s2
        std_logic_vector(to_sfixed(50, 23, -8)), -- s1
        
        -- x1 avg
        std_logic_vector(to_sfixed(50, 23, -8)), -- c
        std_logic_vector(to_sfixed(50, 23, -8)), -- s2
        std_logic_vector(to_sfixed(50, 23, -8)), -- s1
        
        -- x1 low
        std_logic_vector(to_sfixed(0, 23, -8)),-- c
        std_logic_vector(to_sfixed(50, 23, -8)),-- s2
        std_logic_vector(to_sfixed(0, 23, -8)) -- s1
    );
    
    constant COEFS_DEFAULT: RAW_COEF_ARRAY := (
        std_logic_vector(to_sfixed(2, 23, -8)), -- k1  x1
        std_logic_vector(to_sfixed(0, 23, -8)), -- k2  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k3  x1
        std_logic_vector(to_sfixed(0, 23, -8)), -- k4  x2
        std_logic_vector(to_sfixed(2, 23, -8)), -- k5  x1
        std_logic_vector(to_sfixed(0, 23, -8))  -- k6  x2y
    );
    
    --type RAW_INPUT_ARRAY is array (INPUT_COUNT-1 downto 0) of std_ulogic_vector(31 downto 0);
    --type INPUT_ARRAY is array (INPUT_COUNT-1 downto 0) of sfixed(23 downto -8);
end package tsk_util;
