library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
port ( a : in std_logic_vector(15 downto 0);
en : in std_logic;
b,c,d,e : out std_logic_vector(3 downto 0));
end display;

architecture beh of display is
signal unit,dec,cent,sec : std_logic_vector(15 downto 0);
begin
process(en)
begin
if en = '0' then
unit <= std_logic_vector(unsigned(a) mod 10);
b <= unit(3 downto 0);
dec <= std_logic_vector((unsigned(a)/10) mod 10);
c <= dec(3 downto 0);
cent <= std_logic_vector((unsigned(a)/100) mod 10);
d <= cent(3 downto 0);
sec <= std_logic_vector((unsigned(a)/1000));
e <= sec(3 downto 0);
else
b <= (others => '0');
c <= (others => '0');
d <= (others => '0');
e <= (others => '0');
end if;
end process;
end beh;