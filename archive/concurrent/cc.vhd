-- 
entity logic_op is
    port (a, b, c, d: in bit; m: out bit);
end logic_op;

architecture example of logic_op is
    signal e: bit;
begin
    m <= (a and b) or e;
    e <= c xor d;
end example;


entity logic_op_2 is
    port (a, b: in bit_vector (0 to 3); m: in bit_vector (0 to 3));
end logic_op_2;

architecture example2 of logic_op_2  is
begin
    m <= a and b;
end example2;