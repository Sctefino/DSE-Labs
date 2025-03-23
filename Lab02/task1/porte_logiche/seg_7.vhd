library iEEE;
use ieee.std_logic_1164.all;

entity seg_7 is
port( SW: in std_logic_vector(2 downto 0);
hex0 : out std_logic_vector (6 downto 0));
end seg_7;

architecture beh of seg_7 is
begin

--output assignments according to karnaugh map
hex0(0) <= sw(2) or not(sw(0));
hex0(1) <= sw(2) or (not(sw(1)) and sw(0)) or (sw(1) and not(sw(0)));
hex0(2) <= sw(2) or (not(sw(1)) and sw(0)) or (sw(1) and not(sw(0)));
hex0(3) <= sw(2) or (not(sw(1)) and not(sw(0)));
hex0(4) <= sw(2);
hex0(5) <= sw(2);
hex0(6) <= sw(2) or sw(1);

end beh;


