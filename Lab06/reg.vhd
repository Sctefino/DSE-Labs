library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
generic(N: integer);
port (ck,en,rst : in std_logic;
		a : in std_logic_vector(N-1 downto 0);
		b : out std_logic_vector(N-1 downto 0) := (others => '0'));
end reg;

architecture beh of reg is

begin

process(ck,rst)
begin
	if rst = '1' then
		b <= (others => '0');
	elsif ck = '1' and ck'event and en = '1' then
		b <= a;
	end if;
end process;

end beh;