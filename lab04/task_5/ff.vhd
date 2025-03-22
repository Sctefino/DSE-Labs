library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ff is
port (a,sel,ck,rstn : in std_logic;
b : out std_logic);
end ff;

architecture beh of ff is
signal c : std_logic := '0';
begin
process(ck,rstn)
begin
if rstn = '1' then
b <= '0';
elsif ck = '1' and ck'event and sel = '1' then
c <= a;
end if;
b <= c;
end process;
end beh;