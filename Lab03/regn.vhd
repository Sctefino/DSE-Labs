LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity regn is
generic (N: integer:=4);
port (R: in signed(N-1 downto 0);
	CLK, Resetn: in std_logic;
	Q: out signed(N-1 downto 0));
end regn;

architecture beh of regn is
begin
process(CLK, Resetn)
begin
if (Resetn = '0') then
Q <= (others => '0');
elsif (CLK'event and CLK = '1') THEN
Q <= R;
end if;
end process;
end beh;

