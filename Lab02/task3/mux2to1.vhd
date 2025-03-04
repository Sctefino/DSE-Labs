library IEEE;
USE ieee.std_logic_1164.all;

entity mux2to1 is 
port (a, b, sel: in std_logic;
m: out std_logic);
end mux2to1;

architecture beh of mux2to1 is
begin 
process(a, b, sel)
begin
if sel = '0' then
m <= a;
else m <= b;
end if;
end process;
end beh;

