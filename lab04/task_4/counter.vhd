library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
Generic (N : integer := 26);
port (ck, rstn, clear, enable: in std_logic;
		b: out std_logic_vector(N-1 downto 0));
end counter;

architecture beh of counter is

signal sum : unsigned(N-1 downto 0) := (others => '0');

begin
process (ck, rstn)
begin
	if rstn = '0' then --asynchronous reset
		sum <= (others => '0');
	elsif rising_edge(ck) then
		if clear = '1' then --synchronous clear
			sum <= (others => '0');
		elsif enable = '1' then --addition
			sum <= sum + 1;		
		end if;
	end if;

end process;

b <= std_logic_vector(sum);
end beh;
