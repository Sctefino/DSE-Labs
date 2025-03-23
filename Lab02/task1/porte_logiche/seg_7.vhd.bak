library iEEE;
use ieee.std_logic_1164.all;

entity seg_7 is
port( SW: in std_logic_vector(2 downto 0);
hex0 : out std_logic_vector (6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin
process(sw(2 downto 0))
begin
if sw = "000" then
hex0 <= "0001001";
elsif sw = "001" then
hex0 <= "0000110";
elsif sw = "010" then
hex0 <= "1000111";
elsif sw = "011" then
hex0 <= "1000000";
else
hex0 <= "1111111";
end if;
end process;
end beh;


