
LIBRARY ieee, IEEE_proposed, work;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

use work.trimf;
use work.gaussmf;
use work.tsk_util.all;

entity tsk is
    Port ( 
        clk_in: in std_logic;
        
        x1_b, x2_b: in std_ulogic_vector(31 downto 0) := (others => '0'); -- Inputs
        y_star_b: out std_ulogic_vector(31 downto 0) := (others => '0'); -- Output
        
        raw_coefs: in RAW_COEF_ARRAY := COEFS_DEFAULT; -- LinReg coefs.
        raw_x1_mf_coefs: in RAW_X1_MF_COEF_ARRAY := X1_MF_COEFS_DEFAULT; -- Membership functions coefs.
        raw_x2_mf_coefs: in RAW_X2_MF_COEF_ARRAY := X2_MF_COEFS_DEFAULT -- Membership functions coefs.       
        
        -- /Debug output/
        --x1_low_out, x1_avg_out, x1_high_out: out sfixed(1 downto -31); -- Debug mbfs vals
        --y1_out, y2_out, y3_out: out sfixed(23 downto -8) -- Debug p vals
        -- /Debug output/
    );
end tsk;

architecture Behavioral of tsk is
    signal clk: std_logic := '0';
    signal clk_divider: integer := 0;

    -- Transfer signal
    signal x1, x2: sfixed(23 downto -8) := (others => '0'); -- Inputs
    signal y_star: sfixed(23 downto -8) := (others => '0'); -- Output
    
    -- Membership signals
    signal x1_mf_vals: MF_X1_ARRAY;
    signal x2_mf_vals: MF_X2_ARRAY;
    
    signal x1_mf_coefs: MF_X1_COEF_ARRAY;
    signal x2_mf_coefs: MF_X2_COEF_ARRAY;
    
    -- Antecedent signals
    signal rule_weights: RULE_WEIGHT_ARRAY;
    
    -- Consequent signals
    signal y_values: Y_ARRAY;
    signal coefs: COEF_ARRAY;
    
    -- Output signal
    signal weighted_sum: sfixed(23 downto -8);
    signal weights_sum:  sfixed(8 downto -24);
    
    signal y_mul_weight: Y_ARRAY;
    -- signal y_star: sfixed(24 downto -8) := (others => '0');
    
begin
--- Antecedent !- When changing number of rules you MUST change constant in tsk_util and keep track of coefs -!
-- Simple rules
rule_weights(0) <= x1_mf_vals(2); -- min(x1_low, x2_low) | max(x1_low, x2_low), ...
rule_weights(1) <= x1_mf_vals(1);
rule_weights(2) <= x1_mf_vals(0);

-- Advanced rules 
--rule_weights(0) <= minimum(x1_mf_vals(0), x2_mf_vals(0));
--rule_weights(1) <= minimum(x1_mf_vals(1), x2_mf_vals(1));
--rule_weights(2) <= minimum(x1_mf_vals(2), x2_mf_vals(2));

--rule_weights(3) <= minimum(x1_mf_vals(0), x2_mf_vals(1));
--rule_weights(4) <= minimum(x1_mf_vals(0), x2_mf_vals(2));

--rule_weights(5) <= minimum(x1_mf_vals(1), x2_mf_vals(0));
--rule_weights(6) <= minimum(x1_mf_vals(1), x2_mf_vals(2));

--rule_weights(7) <= minimum(x1_mf_vals(2), x2_mf_vals(0));
--rule_weights(8) <= minimum(x1_mf_vals(2), x2_mf_vals(1));
--- /Antecendent

-- Output y_star to std_logic_vector
y_star_b <= std_logic_vector(y_star);

-- Cast inputs from logic_vector to sfixed 
x1 <= to_sfixed(signed(x1_b));
x2 <= to_sfixed(signed(x2_b));

-- Cast coefs from logic_vector to sfixed 
cast_coefs_generate: for ii in 0 to (3*RULE_COUNT)-1 generate
    coefs(ii) <= to_sfixed(signed(raw_coefs(ii)));
end generate cast_coefs_generate;

-- Cast membership coefs from logic_vector to sfixed 
cast_x1_mf_coefs_generate: for ii in 0 to (3*X1_MBFS_COUNT)-1 generate
    x1_mf_coefs(ii) <= to_sfixed(signed(raw_x1_mf_coefs(ii)));
end generate cast_x1_mf_coefs_generate;

cast_x2_mf_coefs_generate: for ii in 0 to (3*X2_MBFS_COUNT)-1 generate
    x2_mf_coefs(ii) <= to_sfixed(signed(raw_x2_mf_coefs(ii)));
end generate cast_x2_mf_coefs_generate;

-- Consequent -> COEFS ARE NOT HERE -> tsk_util for defaults or FCPU
process(clk, coefs, x1, x2)
begin
    if(rising_edge(clk)) then
        for ii in 0 to RULE_COUNT-1 loop
            y_values(ii) <= resize(((coefs(3*ii) * x1) + (coefs(3*ii + 1) * x2)) + coefs(3*ii + 2), 23, -8);
        end loop;
    end if;
end process;

-- Partial Weighted sum
process(clk, rule_weights, y_values)
begin
    if(rising_edge(clk)) then
        for ii in 0 to RULE_COUNT-1 loop
            y_mul_weight(ii) <= resize(rule_weights(ii) * y_values(ii), y_mul_weight(ii));
        end loop;
    end if;
end process;

-- Weighted sum y1 * w1 + y2 * w2 + ...
process(clk, y_mul_weight)
  variable wsum : sfixed(23 downto -8);
begin
    if(rising_edge(clk)) then
        wsum := (others => '0');
        for ii in 0 to RULE_COUNT-1 loop
            wsum := resize(wsum + y_mul_weight(ii), wsum);
        end loop;
        weighted_sum <= resize(wsum, weighted_sum);
    end if;
end process;

-- Rule Weight sum w1 + w2 + w3 + ...
process(clk, rule_weights)
  variable wsum : sfixed(23 downto -8);
begin
    if(rising_edge(clk)) then
        wsum := (others => '0');
        for ii in 0 to RULE_COUNT-1 loop
            wsum := resize(wsum + rule_weights(ii), wsum);
        end loop;
        weights_sum <= resize(wsum, weights_sum);
    end if;
end process;

-- Crisp output value Weighted sum / Weight sum
process(clk, weighted_sum, weights_sum)
begin
    if(rising_edge(clk)) then
        y_star <= resize(weighted_sum / weights_sum, y_star);
    end if;
end process;

-- Generate membership functions
-- To change membership fun. change entity type. work.trimf for triangular
x1_mbfs_generate: for ii in 0 to X1_MBFS_COUNT-1 generate
    msfx1: entity work.trimf port map(
        clk => clk,
    
        x => x1,
        y => x1_mf_vals(ii),
        s1 =>  x1_mf_coefs(3*ii),
        s2 =>  x1_mf_coefs(3*ii + 1),
        c =>   x1_mf_coefs(3*ii + 2)
    );
end generate x1_mbfs_generate;

x2_mbfs_generate: for ii in 0 to X2_MBFS_COUNT-1 generate
    msfx2: entity work.trimf port map(
        clk => clk,
    
        x => x2,
        y => x2_mf_vals(ii),
        s1 =>  x2_mf_coefs(3*ii),
        s2 =>  x2_mf_coefs(3*ii + 1),
        c =>   x2_mf_coefs(3*ii + 2)
    );
end generate x2_mbfs_generate;

-- /Debug output/
--x1_low_out <= x1_low;
--x1_avg_out <= x1_avg;
--x1_high_out <= x1_high;

--y1_out <= y_values(0);
--y2_out <= y_values(1);
--y3_out <= y_values(2);
-- /Debug output/

-- Clock divider
process(clk_in)
begin
    if(rising_edge(clk_in)) then
        if(clk_divider = 3) then
            clk_divider <= 0;
            clk <= not clk;
        else
            clk_divider <= 1 + clk_divider;
        end if;
    end if;
end process;

end Behavioral;
