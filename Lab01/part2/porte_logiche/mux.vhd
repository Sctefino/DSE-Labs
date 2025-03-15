library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(SW: in std_logic_vector(8 downto 0);--sw(8) -> s
						 --sw(7 downto 4) -> y
						 --sw(3 downto 0) -> x
	     LEDR: out std_logic_vector(3 downto 0)
	);
end mux;

architecture str of mux is
begin
	LEDR(0) <= (NOT(SW(8)) AND SW(0)) OR (SW(8) AND SW(4));
	LEDR(1) <= (NOT(SW(8)) AND SW(1)) OR (SW(8) AND SW(5));
	LEDR(2) <= (NOT(SW(8)) AND SW(2)) OR (SW(8) AND SW(6));
	LEDR(3) <= (NOT(SW(8)) AND SW(3)) OR (SW(8) AND SW(7));
end str;