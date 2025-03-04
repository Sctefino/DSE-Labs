library IEEE;
USE ieee.std_logic_1164.all;

entity circuit_b_tb is
end circuit_b_tb;

architecture beh of circuit_b_tb is
component circuit_B is 
port (z: in std_logic;
hex1: out std_logic_vector(6 downto 0));
end component;

signal z_tb: std_logic;
signal hex1_tb: std_logic_vector(6 downto 0);

begin 
process
begin
z_tb <= '0';
wait for 10 ns;
z_tb <= '1';
wait;
end process;
testbench: circuit_B port map(z_tb, hex1_tb);
end beh;
