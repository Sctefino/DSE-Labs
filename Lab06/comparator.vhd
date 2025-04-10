library ieee;
use ieee.std_logic_1164.all;

entity comparator is
port (a,b : in std_logic_vector(9 downto 0);
		c : out std_logic);
end comparator;

architecture beh of comparator is
begin

process(a,b)
begin
	if a = b then
		c <= '1';
	else
		c <= '0';
	end if;
end process;

end beh;