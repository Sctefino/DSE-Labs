LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY shifter IS
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
sel: IN STD_LOGIC_VECTOR(2 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;
ARCHITECTURE Behavior OF shifter IS
begin
process(sel)
begin
if sel = "000" then
output <= input;
elsif sel = "001" then
output(2 downto 0) <= input(14 downto 12);
output(5 downto 3) <= input(2 downto 0);
output(8 downto 6) <= input(5 downto 3);
output(11 downto 9) <= input(8 downto 6);
output(14 downto 12) <= input(11 downto 9);
elsif sel = "010" then
output(2 downto 0) <= input(11 downto 9);
output(5 downto 3) <= input(14 downto 12);
output(8 downto 6) <= input(2 downto 0);
output(11 downto 9) <= input(5 downto 3);
output(14 downto 12) <= input(8 downto 6);
elsif sel = "011" then
output(2 downto 0) <= input(8 downto 6);
output(5 downto 3) <= input(11 downto 9);
output(8 downto 6) <= input(14 downto 12);
output(11 downto 9) <= input(2 downto 0);
output(14 downto 12) <= input(5 downto 3);
elsif sel = "100" then
output(2 downto 0) <= input(5 downto 3);
output(5 downto 3) <= input(8 downto 6);
output(8 downto 6) <= input(11 downto 9);
output(11 downto 9) <= input(14 downto 12);
output(14 downto 12) <= input(2 downto 0);
end if;
end process;
END Behavior;
