LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY decoder7 IS
PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END decoder7;
ARCHITECTURE Behavior OF decoder7 IS
begin
process(c(2 downto 0))
begin
if c = "000" then --H
display <= "0001001";
elsif c = "001" then -- E
display <= "0000110";
elsif c = "010" then -- L
display <= "1000111";
elsif c = "011" then --O
display <= "1000000";
elsif c = "100" then --F
display <= "0001110";
elsif c = "101" then -- C
display <= "1000110";
elsif c ="110" then  --P
display <= "0001100";
end if;
end process;
end behavior;
