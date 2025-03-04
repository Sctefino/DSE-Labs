library IEEE;
USE ieee.std_logic_1164.all;

entity comp is
port (sw: in std_logic_vector(3 downto 0);
z: out std_logic);
end comp;

architecture beh of comp is
begin 
z <= (sw(3) and sw(1)) or (sw(3) and sw(2));
end beh;