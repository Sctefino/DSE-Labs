library IEEE;
use ieee.std_logic_1164.all;

entity Gated_SR_Latch is
port(CLK, R, S: in std_logic;
	Q: out std_logic);
end Gated_SR_Latch;

architecture str of Gated_SR_Latch is

signal R_g, S_g, Q_a, Q_b: std_logic;
attribute keep : boolean;
attribute keep of R_g, S_g, Q_a, Q_b: signal is true;

begin
R_g <= R and CLK;
S_g <= S and CLK;
Q_a <= not (R_g or Q_b);
Q_b <= not (S_g or Q_a);
Q <= Q_a;

end str;
