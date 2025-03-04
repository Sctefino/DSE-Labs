library IEEE;
USE ieee.std_logic_1164.all;

entity circuit_A is
port (c: in std_logic_vector(2 downto 0);
d: out std_logic_vector(2 downto 0));
end circuit_A;

architecture beh of circuit_A is
begin 
process(c)
begin
if c = "010" then
d <= "000";
elsif c = "011" then
d <= "001";
elsif c = "100" then
d <= "010";
elsif c = "101" then
d <= "011";
elsif c = "110" then
d <= "100";
elsif c = "111" then
d <= "101";
else d <= "000";
end if;
end process;
end beh;
