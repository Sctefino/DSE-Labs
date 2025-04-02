library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8to1_nbit is
	generic(N: integer := 7);
	port(a: in std_logic_vector(N-1 downto 0);
		  sel: in std_logic_vector(2 downto 0);
		  q: out std_logic_vector(N-1 downto 0)
	);
end mux8to1_nbit;

architecture beh of mux8to1_nbit is

begin

process(sel)
begin
	if sel = "000" then
		q <= "0001001"; --H
	elsif sel = "001" then
		q <= "0000110"; --E
	elsif sel = "010" then
		q <= "1000111"; --L
	elsif sel = "011" then
		q <= "1000000"; --O
	elsif sel = "100" then
		q <= "1111111"; --Spazio
	elsif sel = "101" then
		q <= a;
	else
		q <= "1111111"; --Errore -> stampo vuoto
	end if;
end process;

end beh;