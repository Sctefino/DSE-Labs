library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
port(a: in std_logic;
b: in std_logic;
Ci: in stdlogic;
sum: out std_logic;
Co: out std_logic);
end fulladder;

architecture beh of fulladder is 
begin
process (a, b, Cin)
begin
sum  <= (a XOR b) XOR Ci;  -- Somma
Co <= (a AND b) OR (Ci AND (a XOR b)); -- Riporto; il secondo termine si può scrivere come (Ci and a) OR (Ci and b)
end process;

end beh;