library ieee;
use ieee.std_logic_1164.all;

entity part1 is
	port( sw : in std_logic_vector(9 downto 0);
			ledr: out std_logic_vector(9 downto 0)
			);
end part1;

architecture beh of part1 is
begin
	ledr <= sw;
end beh;