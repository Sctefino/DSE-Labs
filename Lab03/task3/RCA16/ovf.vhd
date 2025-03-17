library ieee;
use ieee.std_logic_1164.all;

entity ovf is
	port(a_msb, b_msb, s_msb: in std_logic;
	      ov: out std_logic);
end ovf;

architecture beh of ovf is
begin
	ov <= (not(a_msb) and not(b_msb) and s_msb) or (a_msb and b_msb and not(s_msb)); -- overflow se somma di valori concordi da risultato di segno opposto
																												-- altrimenti no overflow
end beh;