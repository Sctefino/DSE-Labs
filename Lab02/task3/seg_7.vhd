library IEEE;
USE ieee.std_logic_1164.all;

entity seg_7 is
port (sw: in std_logic_vector(2 downto 0);
hex0: out std_logic_vector(6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin
process(sw(2 downto 0))
begin 
if sw = "000" then 
hex0 <= "1000000";
elsif sw = "001" then
hex0 <= "1111001";
elsif sw = "010" then
hex0 <= "0100100";
elsif sw = "011" then
hex0 <= "0110000";
elsif sw = "100" then
hex0 <= "0011001";
elsif sw = "101" then
hex0 <= "0010010";
else hex0 <= "1000000";
end if;
end process;
end beh;
