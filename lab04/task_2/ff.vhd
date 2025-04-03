library ieee;
use ieee.std_logic_1164.all;

entity ff is
port (enter,ck,clear : in std_logic;
      q,qnon : out std_logic);
		end ff;
architecture beh of ff is
begin
process(ck)
begin
if ck = '1' and ck'event and clear = '0' then
q <= enter;
qnon <= not(enter);
elsif ck = '1' and ck'event and clear = '1' then
q <= '0';
qnon <= '1';
end if;
end process;
end beh;