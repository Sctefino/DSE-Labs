LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity regn is
generic (N: integer:=4);
port (R: in std_logic_vector(N-1 downto 0);
	CLK, Resetn, enable: in std_logic;
	Q: out std_logic_vector(N-1 downto 0));
end regn;

architecture beh of regn is
begin
process(CLK, Resetn)
begin
	if (Resetn = '0') then
		Q <= (others => '1');
	elsif (CLK'event and CLK = '1') THEN
		if enable = '1' then
			Q <= R;
		end if;
	end if;
end process;
end beh;

