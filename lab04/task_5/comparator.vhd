library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
generic ( N :integer);
port (a,b : in std_logic_vector(N-1 downto 0);
c : out std_logic);
end comparator;

architecture beh of comparator is
begin
process (a,b)
begin
if a < b then
c <= '0';
else 
c <= '1';
end if;
end process;
end beh;