library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
port(a,b: in std_logic_vector(11 downto 0);
	  sel: in std_logic;
	  c: out std_logic_vector(11 downto 0)
	 );
end mux2to1;

architecture beh of mux2to1 is

begin

process(a,b,sel)
begin
	if sel = '0' then
		c <= a;
	else
		c <= b;
	end if;
end process;

end beh;
