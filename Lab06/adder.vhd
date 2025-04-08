library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (a,b,c,d : in std_logic_vector(7 downto 0);
e : out std_logic_vector(7 downto 0));
end adder;

architecture beh of adder is
signal a_int,b_int,c_int,d_int: std_logic_vector(11 downto 0) := (others => '0');
signal sum : signed(11 downto 0);
begin
a_int(6 downto 0) <= a(7 downto 1);
a_int(11 downto 7) <= (others => a(7));
b_int(8 downto 1) <= b;
b_int(11 downto 9) <= (others => b(7));
c_int(9 downto 2) <= c;
c_int(11 downto 10) <= (others => c(7));
d_int(5 downto 0) <= d(7 downto 2);
d_int(11 downto 6) <= (others => d(7));

sum <= signed(c_int) + signed(d_int) - signed(a_int) - signed(b_int);

process(sum)
begin
if sum < "111110000000" then
e <= "10000000";
elsif sum > "000001111111" then
e <= "01111111";
else
e <= std_logic_vector(sum(7 downto 0));
end if;
end process;
end beh;
