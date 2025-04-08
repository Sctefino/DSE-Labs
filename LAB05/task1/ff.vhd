library ieee;
use ieee.std_logic_1164.all;

entity ff is
port ( ck,rst,a : in std_logic;
b : out std_logic);
end ff;

architecture beh of ff is
begin
process (ck)
begin
if ck ='1' and ck'event then
if rst = '1' then
b <= '0';
else 
b <= a;
end if;
end if;
end process;
end beh;