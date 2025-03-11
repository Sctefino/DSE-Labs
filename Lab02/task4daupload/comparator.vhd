library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
port (a : in std_logic_vector(5 downto 0);
b : out std_logic_vector(3 downto 0);
sel : out std_logic_vector(2 downto 0));
end comparator;

architecture beh of comparator is
signal c : unsigned(5 downto 0);
begin
c <= unsigned(a);
process (c)
begin
if c < "001010" then -- < 10
b <= "0000";
sel <= "000";
elsif c < "010100" and c > "001001" then  -- 10<= x < 20
b <= "0001";
sel <= "001";
elsif c < "011110" and c > "010011" then  -- 20<= x < 30
b <= "0010";
sel <= "010";
elsif c < "101000" and c > "011101" then  -- 30<= x < 40
b <= "0011";
sel <= "011";
elsif c < "110010" and c > "100111" then  -- 40<= x < 50
b <= "0100";
sel <= "100";
elsif c < "111100" and c > "110001" then  -- 50<= x < 60 
b <= "0101";
sel <= "101";
elsif (c < "111111" and c > "111011") or c = "111111" then  -- 60<= x < 64 
b <= "0110";
sel <= "110";
else 
b <= "0000";
sel <= "111";
end if;
end process;
end beh;