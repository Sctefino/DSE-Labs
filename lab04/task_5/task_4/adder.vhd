library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
Generic (N : integer := 26);
port (ck, rstn, a: in std_logic;
		b: out std_logic_vector(N-1 downto 0));
end adder;

architecture beh of adder is

signal sum : unsigned(N-1 downto 0) := (others => '0');
signal add : unsigned(N-1 downto 0) := (others => '0');

begin
process (ck, rstn)
begin
if rstn = '0' then
sum <= (others => '0');
elsif rising_edge(ck) then
if a = '1' then
sum <= (others => '0');
else
add(0) <= '1';
sum <= sum + add;
end if;
end if;
end process;

b   <= std_logic_vector(sum);
end beh;