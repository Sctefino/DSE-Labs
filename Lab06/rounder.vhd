library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rounder is
port(a: in std_logic_vector(11 downto 0);
	  b: out std_logic_vector(7 downto 0)
	  );
end rounder;

architecture beh of rounder is

begin

process(a)
begin
	if signed(a) < "111110000000" then
		b <= "10000000";
	elsif signed(a) > "000001111111" then
		b <= "01111111";
	else
		b <= a(7 downto 0);
	end if;
end process;

end beh;