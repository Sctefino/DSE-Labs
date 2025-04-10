library ieee;
use ieee.std_logic_1164.all;

entity shifter is
port(a: in std_logic_vector(7 downto 0);
	  sel: in std_logic_vector(1 downto 0);
	  b: out std_logic_vector(11 downto 0)
 	 );
end shifter;

architecture beh of shifter is

signal a_ext: std_logic_vector(11 downto 0);

begin

a_ext <= a(7) & a(7) & a(7) & a(7) & a; --estensione del segno

process(a,sel)
begin	 
	if sel = "00" then
		b <= a_ext(11) & a_ext(11 downto 1);
	elsif sel = "01" then
		b <= a_ext(10 downto 0) & '0';
	elsif sel = "10" then
		b <= a_ext(9 downto 0) & "00";
	else
		b <= a_ext(11) & a_ext(11) & a_ext(11 downto 2);
	end if;
end process;

end beh;