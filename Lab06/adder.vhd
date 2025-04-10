library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (a,b: in std_logic_vector(11 downto 0);
		sub: in std_logic;
		c : out std_logic_vector(11 downto 0));
end adder;

architecture beh of adder is

signal a_sign, b_sign, sum : signed(11 downto 0);

begin

a_sign <= signed(a);
b_sign <= signed(b);

process(a,b,sub)
begin
	if sub = '1' then
		sum <= a_sign - b_sign;
	elsif sub = '0' then
		sum <= a_sign + b_sign;
	else
		sum <= (others => '0');
	end if;
end process;

c <= std_logic_vector(sum);

end beh;
