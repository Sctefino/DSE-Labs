library IEEE;
USE ieee.std_logic_1164.all;

entity seg_7 is
port (a: in std_logic_vector(3 downto 0);
b: out std_logic_vector(6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin
process(a)
begin 
if a = "0000" then 
b <= "1000000";
elsif a = "0001" then
b <= "1111001";
elsif a = "0010" then
b <= "0100100";
elsif a = "0011" then
b <= "0110000";
elsif a = "0100" then
b <= "0011001";
elsif a = "0101" then
b <= "0010010";
elsif a = "0110" then
b <= "0000010";
elsif a = "0111" then
b <= "1111000";
elsif a = "1000" then
b <= "0000000";
elsif a = "1001" then
b <= "0010000";
else b <= "1111111"; --se non tra 0 e 9, spengo
end if;
end process;
end beh;