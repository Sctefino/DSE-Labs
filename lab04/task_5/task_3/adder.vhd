library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (a : in std_logic_vector(1 downto 0);
ck : std_logic;
b : out std_logic_vector(15 downto 0));
end adder;

architecture beh of adder is
signal c : unsigned(1 downto 0) ;
signal d : unsigned(15 downto 0);
signal sum : unsigned(15 downto 0) := "0000000000000000";
begin
process(ck)
begin
if ck = '1' and ck'event and a(0)='0' then
sum <= sum + "0000000000000001";
b <= std_logic_vector(sum);
elsif ck = '1' and ck'event and a(0)='1' then
b <= "0000000000000000";
sum <= "0000000000000000";
end if;
end process;
end beh;