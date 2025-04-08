library ieee;
use ieee.std_logic_1164.all;

entity reg is
port (ck,en,rst : in std_logic;
a : in std_logic_vector(7 downto 0);
b : out std_logic_vector(7 downto 0));
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