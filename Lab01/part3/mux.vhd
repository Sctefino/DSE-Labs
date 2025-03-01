library IEEE;
USE ieee.std_logic_1164.all;

entity mux is 
port ( A : in std_logic_vector(2 downto 0);
B : in std_logic_vector(2 downto 0);
C: in std_logic;
D : out std_logic_vector(2 downto 0));
end mux;

architecture beh of mux is 
begin
process (A,B,C)
begin 
if C = '1' then 
D <= B;
else
D <= A;
end if;
end process;
end beh;
