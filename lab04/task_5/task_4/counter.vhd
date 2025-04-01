library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
Generic (N : integer := 26);
port (ck, rstn, clear: in std_logic;
		b: out std_logic_vector(N-1 downto 0));
end counter;

architecture beh of counter is

signal sum : unsigned(N-1 downto 0) := (others => '0');
signal add : unsigned(N-1 downto 0) := (others => '0');

begin
process (ck, rstn)
begin
if rstn = '0' then
sum <= (others => '0');
elsif rising_edge(ck) then
if clear = '1' then
sum <= (others => '0');
else
sum <= sum + add;
end if;
end if;
end process;
add(0) <= '1';
b <= std_logic_vector(sum);
end beh;