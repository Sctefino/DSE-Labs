library IEEE;
USE ieee.std_logic_1164.all;

entity circuit_B is
port (z: in std_logic;
hex1: out std_logic_vector(6 downto 0));
end circuit_B;

architecture beh of circuit_B is
begin 
process (z)
begin
if z = '1' then 
hex1 <= "1111001";
else hex1 <= "1000000";
end if;
end process;
end beh;