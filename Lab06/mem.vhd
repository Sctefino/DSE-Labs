library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
	generic(N : integer := 8;
		M : integer := 10); -- N parallelismo dati, M parallelismo indirizzo 
	port(add : in std_logic_vector(M-1 downto 0);
		  data_in : in std_logic_vector(N-1 downto 0);
		  WR, RD, clk, CS : in std_logic;
		  data_out : out std_logic_vector(N-1 downto 0)
	);
end;

architecture beh of mem is

type mem_array is array (0 to 2**M - 1) of std_logic_vector(N-1 downto 0);
signal cell : mem_array := (others => (others => '0'));

begin

process(clk, RD, CS)
begin
	if(CS = '1') then
		if(RD = '1') then
			data_out <= cell(to_integer(unsigned(add)));
		elsif (clk'event and clk = '1' and WR = '1') then
			cell(to_integer(unsigned(add))) <= data_in;
	end if;
end if;
end process;


end beh;