library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
Generic (N : integer := 26);
port (ck   : in std_logic;
rst : in std_logic;
clear : in std_logic;
enable : in std_logic; --segnale che ferma conteggio
b : out std_logic_vector(N-1 downto 0));
end counter;

architecture beh of counter is
signal sum : unsigned(N-1 downto 0) := (others => '0');
begin
process (ck, rst)
begin
	if rst = '0' then --reset asincrono
		sum <= (others => '0');
	elsif rising_edge(ck) then
		if clear = '1' then --reset sincrono
			sum <= (others => '0');
		elsif enable = '1' then --se non devo fermarmi incremento di 1, altrimenti lascio fermo
			sum <= sum + 1;
		end if;
	end if;
end process;
b <= std_logic_vector(sum);
end beh;