library IEEE;
USE ieee.std_logic_1164.all;

entity seg_7 is
port (sw: in std_logic_vector(3 downto 0);
hex0: out std_logic_vector(6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin
process(sw)
begin 
if sw = "0000" then 
hex0 <= "1000000";
elsif sw = "0001" or sw =  "1111" then
hex0 <= "1111001";
elsif sw = "0010" or sw =  "1110" then
hex0 <= "0100100";
elsif sw = "0011" or sw =  "1101" then
hex0 <= "0110000";
elsif sw = "0100" or sw = "1100" then
hex0 <= "0011001";
elsif sw = "0101" or sw = "1011" then
hex0 <= "0010010";
elsif sw = "0110" or sw = "1010" then
hex0 <= "0000010";
elsif sw = "0111" or sw = "1001" then
hex0 <= "1111000";
elsif sw = "1000" then
hex0 <= "0000000";
else hex0 <= "1111111"; --se non tra 0 e 15, spengo
end if;
end process;
end beh;
