library ieee;
use ieee.std_logic_1164.all;

entity part1_tb is
end;

architecture beh of part1_tb is

component part1 is
	port(   sw: in std_logic_vector(9 downto 0);
		ledr: out std_logic_vector(9 downto 0)
	);
end component;
signal sw_tb, ledr: std_logic_vector(9 downto 0);
begin

process
begin
	sw_tb <= (others => '0');
	wait for 10 ns;
	sw_tb <= "0100000011";
	wait for 10 ns;
	sw_tb <= (others => '1');
	wait for 10 ns;
	sw_tb <= "0000110000";
	wait;
end process;

testbench: part1 port map(sw_tb, ledr);
end beh;