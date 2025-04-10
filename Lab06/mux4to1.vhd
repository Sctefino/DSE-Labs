library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
port(a,b,c,d: in std_logic_vector(7 downto 0);
	  sel: in std_logic_vector(1 downto 0);
	  e: out std_logic_vector(7 downto 0)
	 );
end mux4to1;

architecture beh of mux4to1 is

begin

process(a,b,c,d,sel)
begin
	if sel = "00" then
		e <= a;
	elsif sel = "01" then
		e <= b;
	elsif sel = "10" then
		e <= c;
	else
		e <= d;
	end if;
end process;

end beh;