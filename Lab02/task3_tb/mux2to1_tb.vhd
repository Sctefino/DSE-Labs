library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_tb is
end entity;

architecture beh of mux2to1_tb is

component mux2to1
	port (a, b, sel: in std_logic;
	      m: out std_logic);
end component;

signal a_tb, b_tb, sel_tb, m_tb: std_logic;

begin
	process
	begin
	a_tb <= '0';
	b_tb <= '1';
	sel_tb <= '0';
	wait for 10 ns;
	sel_tb <= '1';
	wait for 10 ns;
	a_tb <= '1';
	wait for 10 ns;
	b_tb <= '0';
	wait for 10 ns;
	sel_tb <= '0';
	wait;
	end process;
	testbench: mux2to1 port map(a_tb, b_tb, sel_tb, m_tb);
end beh;
