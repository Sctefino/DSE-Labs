library IEEE;
USE ieee.std_logic_1164.all;

entity seg_7 is
port (sw: in std_logic_vector(3 downto 0);
hex: out std_logic_vector(6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin
process(sw)
begin 
if sw = "0000" then --0
hex <= "1000000";
elsif sw = "0001" then --1
hex <= "1111001";
elsif sw = "0010" then --2
hex <= "0100100";
elsif sw = "0011" then --3
hex <= "0110000";
elsif sw = "0100" then --4
hex <= "0011001";
elsif sw = "0101" then --5
hex <= "0010010";
elsif sw = "0110" then --6
hex <= "0000010";
elsif sw = "0111" then --7
hex <= "1111000";
elsif sw = "1000" then --8
hex <= "0000000";
elsif sw = "1001" then --9
hex <= "0011000";
elsif sw = "1010" then --A
hex <= "0001000";
elsif sw ="1011" then --b
hex <= "0000011";
elsif sw = "1100" then --C
hex <= "1000110";
elsif sw ="1101" then --d
hex <= "0100001";
elsif sw ="1110" then --E
hex <= "0000110";
else --F
hex <= "0001110";
end if;
end process;
end beh;
