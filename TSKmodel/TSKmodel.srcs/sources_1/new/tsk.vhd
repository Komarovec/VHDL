
LIBRARY ieee, IEEE_proposed, work;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.numeric_std.all;
use ieee_proposed.fixed_pkg.all;

use work.trimf;
use work.tsk_util.all;

entity tsk is
    Port ( 
        clk_in: in std_logic;
        
        x1_b, x2_b: in std_ulogic_vector(31 downto 0) := (others => '0'); -- Inputs
        y_star_b: out std_ulogic_vector(31 downto 0) := (others => '0'); -- Output
        
        raw_coefs: in RAW_COEF_ARRAY := COEFS_DEFAULT; -- LinReg coefs.
        raw_mf_coefs: in RAW_MF_COEF_ARRAY := MF_COEFS_DEFAULT -- Membership functions coefs.
        
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
    signal x1_low, x1_avg, x1_high: sfixed(1 downto -31) := (others => '0');
    signal x2_low, x2_avg, x2_high: sfixed(1 downto -31) := (others => '0');
    signal mf_coefs: MF_COEF_ARRAY;
    
    -- Antecedent signals
    signal rule_weights: RULE_WEIGHT_ARRAY;
    
    -- Consequent signals
    signal y_values: Y_ARRAY;
    signal coefs: COEF_ARRAY;
    
    -- Output signal
    signal weighted_sum: sfixed(15 downto -2);
    signal weights_sum:  sfixed(15 downto -2);
    
    signal y_mul_weight: Y_ARRAY;
    -- signal y_star: sfixed(24 downto -8) := (others => '0');
    
begin

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
process(clk, coefs, x1, x2)
begin
    if(rising_edge(clk)) then
        for ii in 0 to RULE_COUNT-1 loop
            y_values(ii) <= resize((coefs(2*ii) * x1) + (coefs(2*ii + 1) * x2), 23, -8);
        end loop;
    end if;
end process;

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

-- X1 Membership functions
trimf_x1_low: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x1_low,
    s1 =>  mf_coefs(0),
    s2 =>  mf_coefs(1),
    c =>   mf_coefs(2)
);

trimf_x1_avg: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x1_avg,
    s1 =>  mf_coefs(3),
    s2 =>  mf_coefs(4),
    c =>   mf_coefs(5)
);

trimf_x1_high: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x1_high,
    s1 =>  mf_coefs(6),
    s2 =>  mf_coefs(7),
    c =>   mf_coefs(8)
);

-- X2 Membership functions
trimf_x2_low: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x2_low,
    s1 =>  mf_coefs(9),
    s2 =>  mf_coefs(10),
    c =>   mf_coefs(11)
);

trimf_x2_avg: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x2_avg,
    s1 =>  mf_coefs(12),
    s2 =>  mf_coefs(13),
    c =>   mf_coefs(14)
);

trimf_x2_high: entity work.trimf port map(
    clk => clk,

    x => x1,
    y => x2_high,
    s1 =>  mf_coefs(15),
    s2 =>  mf_coefs(16),
    c =>   mf_coefs(17)
);

end Behavioral;
