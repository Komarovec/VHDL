
LIBRARY ieee, IEEE_proposed, work;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

use work.trimf;
use work.tsk_util.all;

entity tsk is
    Port ( 
        --clk: in std_logic; -- Currently not needed
        
        x1_b, x2_b: in std_ulogic_vector(31 downto 0) := (others => '0'); -- Inputs
        y_star_b: out std_ulogic_vector(31 downto 0) := (others => '0'); -- Output
        
        raw_coefs: in RAW_COEF_ARRAY := COEFS_DEFAULT; -- LinReg coefs.
        raw_mf_coefs: in RAW_MF_COEF_ARRAY := MF_COEFS_DEFAULT; -- Membership functions coefs.
        
        -- /Debug output/
        x1_low_out, x1_avg_out, x1_high_out: out sfixed(1 downto -31); -- Debug mbfs vals
        y1_out, y2_out, y3_out: out sfixed(23 downto -8) -- Debug p vals
        -- /Debug output/
    );
end tsk;

architecture Behavioral of tsk is
    -- Transfer signal
    signal x1, x2: sfixed(23 downto -8) := (others => '0'); -- Inputs
    signal y_star: sfixed(23 downto -8) := (others => '0'); -- Output
    
    -- Membership signals
    signal x1_low, x1_avg, x1_high: sfixed(1 downto -31) := (others => '0');
    signal x2_low, x2_avg, x2_high: sfixed(1 downto -31) := (others => '0');
    signal mf_coefs: MF_COEF_ARRAY;
    
    -- Antecedent signals
    signal rule_weights: RULE_WEIGHT_ARRAY;
    
    -- Consequent signals
    signal y_values: Y_ARRAY;
    signal coefs: COEF_ARRAY;
    
    -- Output signal
    signal weighted_sum : sfixed(47 downto -16);
    signal weights_sum : sfixed(47 downto -16);
    -- signal y_star: sfixed(24 downto -8) := (others => '0');
begin
-- /Debug output/
x1_low_out <= x1_low;
x1_avg_out <= x1_avg;
x1_high_out <= x1_high;

y1_out <= y_values(0);
y2_out <= y_values(1);
y3_out <= y_values(2);
-- /Debug output/

-- Output y_star to std_logic_vector
y_star_b <= std_logic_vector(y_star);

-- Cast inputs from logic_vector to sfixed 
x1 <= to_sfixed(signed(x1_b));
x2 <= to_sfixed(signed(x2_b));

-- Cast coefs from logic_vector to sfixed 
cast_coefs_generate: for ii in 0 to (2*RULE_COUNT)-1 generate
    coefs(ii) <= to_sfixed(signed(raw_coefs(ii)));
end generate cast_coefs_generate;

-- Cast membership coefs from logic_vector to sfixed 
cast_mf_coefs_generate: for ii in 0 to 17 generate
    mf_coefs(ii) <= to_sfixed(signed(raw_mf_coefs(ii)));
end generate cast_mf_coefs_generate;

--- Antecedent !- When changing number of rules you MUST change constant in tsk_util and keep track of coefs -!
rule_weights(0) <= x1_low; -- min(x1_low, x2_low) | max(x1_low, x2_low), ...
rule_weights(1) <= x1_avg;
rule_weights(2) <= x1_high;

-- Consequent
rules_generate: for ii in 0 to RULE_COUNT-1 generate
    y_values(ii) <= resize((coefs(2*ii) * x1) + (coefs(2*ii + 1) * x2), 23, -8);
end generate rules_generate;

-- Crisp output value Weighted sum / Weight sum
y_star <= resize(weighted_sum / weights_sum, y_star);

-- Weighted sum y1 * w1 + y2 * w2 + ...
process(rule_weights, y_values)
  variable wsum : sfixed(47 downto -16);
begin
    wsum := (others => '0');
    for ii in 0 to RULE_COUNT-1 loop
        wsum := resize(wsum + (rule_weights(ii) * y_values(ii)), wsum);
    end loop;
    weighted_sum <= wsum;
end process;

-- Rule Weight sum w1 + w2 + w3 + ...
process(rule_weights)
  variable wsum: sfixed(47 downto -16);
begin
    wsum := (others => '0');
    for ii in 0 to RULE_COUNT-1 loop
        wsum := resize(wsum + rule_weights(ii), wsum);
    end loop;
    weights_sum <= wsum;
end process;

-- X1 Membership functions
trimf_x1_low: entity work.trimf port map(
    x => x1,
    y => x1_low,
    s1 =>  mf_coefs(0),
    s2 =>  mf_coefs(1),
    c =>   mf_coefs(2)
);

trimf_x1_avg: entity work.trimf port map(
    x => x1,
    y => x1_avg,
    s1 =>  mf_coefs(3),
    s2 =>  mf_coefs(4),
    c =>   mf_coefs(5)
);

trimf_x1_high: entity work.trimf port map(
    x => x1,
    y => x1_high,
    s1 =>  mf_coefs(6),
    s2 =>  mf_coefs(7),
    c =>   mf_coefs(8)
);

-- X2 Membership functions
trimf_x2_low: entity work.trimf port map(
    x => x1,
    y => x2_low,
    s1 =>  mf_coefs(9),
    s2 =>  mf_coefs(10),
    c =>   mf_coefs(11)
);

trimf_x2_avg: entity work.trimf port map(
    x => x1,
    y => x2_avg,
    s1 =>  mf_coefs(12),
    s2 =>  mf_coefs(13),
    c =>   mf_coefs(14)
);

trimf_x2_high: entity work.trimf port map(
    x => x1,
    y => x2_high,
    s1 =>  mf_coefs(15),
    s2 =>  mf_coefs(16),
    c =>   mf_coefs(17)
);

end Behavioral;
