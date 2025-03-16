library ieee;
use ieee.std_logic_1164.all;

entity mux_nbit is
generic(N : integer := 4);
port(a,b: in std_logic_vector(N-1 downto 0);
	  sel: in std_logic;
	  c: out std_logic_vector(N-1 downto 0)
);
end mux_nbit;

architecture beh of mux_nbit is

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