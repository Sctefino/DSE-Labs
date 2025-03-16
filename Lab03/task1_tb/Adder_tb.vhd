library ieee;
use ieee.std_logic_1164.all;

entity Adder_tb is
end Adder_tb;

architecture beh of Adder_tb is
component Adder is
port ( a,b, c_in: in std_logic;
	s, c_o: out std_logic
	);
end component;

signal a_tb, b_tb, c_in_tb, s_tb, c_o_tb: std_logic;

begin

process
begin
a_tb <= '1';
b_tb <= '0';
c_in_tb <= '0';
wait for 10 ns;
b_tb <= '1';
wait for 10 ns;
c_in_tb <= '1';
wait for 10 ns;
a_tb <= '0';
wait for 10 ns;
c_in_tb <= '0';
wait;
end process;
tb: Adder port map(a_tb, b_tb, c_in_tb, s_tb, c_o_tb);
end beh;