
library IEEE, ieee_proposed, work;
use IEEE.STD_LOGIC_1164.ALL;
use ieee_proposed.fixed_pkg.all;

package tsk_util is
    constant INPUT_COUNT: integer := 2;  -- Cannot be changed
    constant RULE_COUNT: integer := 9; -- Number of rules in TSK
    
    -- Memebership functions per inputs
    constant X1_MBFS_COUNT: integer := 3;
    constant X2_MBFS_COUNT: integer := 3;

    -- Membership functions coefs.
    type RAW_X1_MF_COEF_ARRAY is array ((3*X1_MBFS_COUNT)-1 downto 0) of std_ulogic_vector(31 downto 0);
    type MF_X1_COEF_ARRAY is array ((3*X1_MBFS_COUNT)-1 downto 0) of sfixed(23 downto -8);
    
    -- Membership functions coefs.
    type RAW_X2_MF_COEF_ARRAY is array ((3*X2_MBFS_COUNT)-1 downto 0) of std_ulogic_vector(31 downto 0);
    type MF_X2_COEF_ARRAY is array ((3*X2_MBFS_COUNT)-1 downto 0) of sfixed(23 downto -8);

    -- Membership values
    type MF_X1_ARRAY is array ((3*X1_MBFS_COUNT)-1 downto 0) of sfixed(1 downto -31);
    type MF_X2_ARRAY is array ((3*X2_MBFS_COUNT)-1 downto 0) of sfixed(1 downto -31);

    -- LinReg coefs.
    type RAW_COEF_ARRAY is array (0 to (3*RULE_COUNT)-1) of std_ulogic_vector(31 downto 0);
    type COEF_ARRAY is array (0 to (3*RULE_COUNT)-1) of sfixed(23 downto -8);
    
    -- LinReg output values
    type Y_ARRAY is array (RULE_COUNT-1 downto 0) of sfixed(23 downto -8);
    
    -- Rules output weights
    type RULE_WEIGHT_ARRAY is array (RULE_COUNT-1 downto 0) of sfixed(1 downto -31);
    
    -- Default values
    constant X2_MF_COEFS_DEFAULT: RAW_X2_MF_COEF_ARRAY := (
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
        std_logic_vector(to_sfixed(0, 23, -8)) -- s1
    );
    
    constant X1_MF_COEFS_DEFAULT: RAW_X1_MF_COEF_ARRAY := (
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
    
    -- Default for SIMPLE rules
--    constant COEFS_DEFAULT: RAW_COEF_ARRAY := ( -- (k1 * x1 + k2 * x2) + k3 ; (k4 * x1 + k5 x2) + k6 ; ...
--        std_logic_vector(to_sfixed(2, 23, -8)), -- k1  x1 -- RULE 1
--        std_logic_vector(to_sfixed(0, 23, -8)), -- k2  x2
--        std_logic_vector(to_sfixed(0, 23, -8)), -- k3  b
        
--        std_logic_vector(to_sfixed(0, 23, -8)), -- k4  x1 -- RULE 2
--        std_logic_vector(to_sfixed(0, 23, -8)), -- k5  x2
--        std_logic_vector(to_sfixed(100, 23, -8)), -- k6  b
        
--        std_logic_vector(to_sfixed(2, 23, -8)), -- k7  x1 -- RULE 3
--        std_logic_vector(to_sfixed(0, 23, -8)), -- k8  x2
--        std_logic_vector(to_sfixed(0, 23, -8))  -- k9  b
--    );
    
    -- Default for ADVANCED rules
    constant COEFS_DEFAULT: RAW_COEF_ARRAY := ( -- (k1 * x1 + k2 * x2) + k3 ; (k4 * x1 + k5 x2) + k6 ; ...
        std_logic_vector(to_sfixed(-2, 23, -8)), -- k1  x1 -- RULE 1
        std_logic_vector(to_sfixed(2, 23, -8)), -- k2  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k3  b
        
        std_logic_vector(to_sfixed(0, 23, -8)), -- k4  x1 -- RULE 2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k5  x2
        std_logic_vector(to_sfixed(100, 23, -8)), -- k6  b
        
        std_logic_vector(to_sfixed(2, 23, -8)), -- k7  x1 -- RULE 3
        std_logic_vector(to_sfixed(2, 23, -8)), -- k8  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k9  b
        
        std_logic_vector(to_sfixed(0, 23, -8)), -- k10  x1 -- RULE 4
        std_logic_vector(to_sfixed(0, 23, -8)), -- k11 x2
        std_logic_vector(to_sfixed(100, 23, -8)), -- k12  b
        
        std_logic_vector(to_sfixed(0, 23, -8)), -- k13  x1 -- RULE 5
        std_logic_vector(to_sfixed(2, 23, -8)), -- k14  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k15  b
        
        std_logic_vector(to_sfixed(0, 23, -8)), -- k16  x1 -- RULE 6
        std_logic_vector(to_sfixed(0, 23, -8)), -- k17  x2
        std_logic_vector(to_sfixed(100, 23, -8)), -- k18  b
        
        std_logic_vector(to_sfixed(0, 23, -8)), -- k19  x1 -- RULE 7
        std_logic_vector(to_sfixed(2, 23, -8)), -- k20  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k21  b
        
        std_logic_vector(to_sfixed(2, 23, -8)), -- k22  x1 -- RULE 8
        std_logic_vector(to_sfixed(0, 23, -8)), -- k23  x2
        std_logic_vector(to_sfixed(0, 23, -8)), -- k24  b
        
        std_logic_vector(to_sfixed(2, 23, -8)), -- k25  x1 -- RULE 9
        std_logic_vector(to_sfixed(0, 23, -8)), -- k26  x2
        std_logic_vector(to_sfixed(0, 23, -8))  -- k27  b
    );
    
    --type RAW_INPUT_ARRAY is array (INPUT_COUNT-1 downto 0) of std_ulogic_vector(31 downto 0);
    --type INPUT_ARRAY is array (INPUT_COUNT-1 downto 0) of sfixed(23 downto -8);
end package tsk_util;
