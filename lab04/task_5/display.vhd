library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
port ( a : in std_logic_vector(15 downto 0);
b,c,d,e : out std_logic_vector(3 downto 0));
end display;

architecture beh of display is
signal unit,dec,cent,sec : std_logic_vector(15 downto 0);
begin

unit <= std_logic_vector(unsigned(a) mod 10); --stampo untà
b <= unit(3 downto 0);

dec <= std_logic_vector((unsigned(a)/10) mod 10); --stampo decine
c <= dec(3 downto 0);

cent <= std_logic_vector((unsigned(a)/100) mod 10); -- stampo centinaia
d <= cent(3 downto 0);

sec <= std_logic_vector((unsigned(a)/1000) mod 10); -- stampo migliaia
e <= sec(3 downto 0);
end beh;