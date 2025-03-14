LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Adder is
port ( a,b: in signed(3 downto 0);
	c_in: in std_logic;
        p : in std_logic;
	s: out signed(3 downto 0);
	c_o: out std_logic);
end Adder;

architecture beh of Adder is
signal c,d,sum: unsigned(4 downto 0);
signal e,f: signed(3 downto 0);
begin 
process (c_in)
begin
if c_in = '1' then 
e <= "0001";
else 
e <= "0000";
end if;
end process;
process(p)
begin
if p = '0' then
s <= a + b + e;
else 
s <= a + not(b) + 1 + e;
end if;
end process;
c<=resize(unsigned(a),5);
d<=resize(unsigned(b),5);
sum <= c+d+unsigned(e);
process(sum,a,b)
begin
if (sum(4) = '1' and a(3) = '0' and b(3) = '0') or (sum(4) = '0' and a(3) = '1' and d(3) = '1') then 
c_o <= '1';
else 
c_o <= '0';
end if;

end process;
end beh;
