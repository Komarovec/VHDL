library ieee;
use ieee.std_logic_1164.all;

entity major is
    port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        Y : out std_logic
    );
end major;

architecture behaviour of major is
    signal and_gate_AB : std_logic;
    signal and_gate_AC : std_logic;
    signal and_gate_BC : std_logic;
    signal or_gate : std_logic;
begin
    and_gate_AB <= A and B;
    and_gate_AC <= A and C;
    and_gate_BC <= B and C;
    or_gate <= and_gate_AB or and_gate_AC or and_gate_BC;
    Y <= or_gate;
end behaviour;