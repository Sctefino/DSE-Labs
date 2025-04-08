library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port (ck,en,rst : in std_logic;
count : out std_logic_vector(9 downto 0));
end counter;

architecture beh of counter is
signal sum : unsigned(9 downto 0) := (others => '0');
begin
process(ck,rst)
begin
if rst = '1' then
sum <= (others => '0');
count <= (others => '0');
elsif ck'event and ck = '1' then
if en = '1' then
count <= std_logic_vector(sum);
sum <= sum + "0000000001";
end if;
end if;
end process;
end beh;