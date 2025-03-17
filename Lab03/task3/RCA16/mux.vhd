library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(a,b,sel: in std_logic;
		c: out std_logic);
end mux;

architecture beh of mux is
begin
process(a,b,sel)
begin
if(sel = '0') then
c <= a;
else
c <= b;
end if;
end process;
end beh;
		