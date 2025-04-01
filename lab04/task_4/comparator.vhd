library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is 
generic (N: integer := 26);
port (a,c: in std_logic_vector(N-1 downto 0);
		b: out std_logic);
end comparator;

architecture beh of comparator is

begin
process(a,c)
begin
if a = c then
b <= '1';
else
b <= '0';
end if;
end process;

end beh;