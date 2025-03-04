library IEEE;
USE ieee.std_logic_1164.all;

entity mux is 
port ( SW : in std_logic_vector(8 downto 0);
LEDR : out std_logic_vector(3 downto 0));
end mux;

architecture beh of mux is 
begin
process (SW(8 downto 0))
begin 
if SW(8) = '1' then 
LEDR(3 downto 0) <= SW(7 downto 4);
else
LEDR(3 downto 0) <= SW(3 downto 0);
end if;
end process;
LEDR(9 downto 4) <= "000000"; --spengo led non usati
end beh;
