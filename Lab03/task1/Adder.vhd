LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Adder is
port ( a,b: in signed(3 downto 0);
	c_in: in std_logic;
	s: out signed(3 downto 0);
	c_o: out std_logic);
end Adder;

architecture beh of Adder is
signal c,d,sum: unsigned(3 downto 0);
signal e: signed(3 downto 0);
begin 
process (c_in)
begin
if c_in = '1' then 
e <= "0001";
else 
e <= "0000";
end if;
end process;

s <= a + b + e;
c <= unsigned(a);
d <= unsigned(b);
sum <= c + d + unsigned(e);
process(sum)
begin
if sum > "0111" then 
c_o <= '1';
else 
c_o <= '0';
end if;

end process;
end beh;
