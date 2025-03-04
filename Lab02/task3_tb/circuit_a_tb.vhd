library IEEE;
USE ieee.std_logic_1164.all;

entity circuit_a_tb is
end circuit_a_tb;

architecture beh of circuit_a_tb is
component circuit_A is 
port (c: in std_logic_vector(2 downto 0);
d: out std_logic_vector(2 downto 0));
end component;

signal c_tb: std_logic_vector(2 downto 0);
signal d_tb: std_logic_vector(2 downto 0);

begin 
process
begin
c_tb <= "000";
wait for 10 ns;
c_tb <= "011";
wait for 10 ns;
c_tb <= "101";
wait for 10 ns;
c_tb <= "010";
wait for 10 ns;
c_tb <= "111";
wait for 10 ns;
c_tb <= "001";
wait;
end process;
testbench: circuit_A port map(c_tb, d_tb);
end beh;