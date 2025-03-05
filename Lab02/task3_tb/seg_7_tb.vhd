library IEEE;
USE ieee.std_logic_1164.all;

entity seg_7_tb is
end seg_7_tb;

architecture beh of seg_7_tb is
component seg_7 is
port (sw: in std_logic_vector(2 downto 0);
hex0: out std_logic_vector(6 downto 0));
end component;

signal sw_tb: std_logic_vector(2 downto 0);
signal hex0_tb: std_logic_vector(6 downto 0);

begin 
process
begin
sw_tb <= "000";
wait for 10 ns;
sw_tb <= "001";
wait for 10 ns;
sw_tb <= "011";
wait for 10 ns;
sw_tb <= "100";
wait for 10 ns;
sw_tb <= "101";
wait for 10 ns;
sw_tb <= "000";
wait;
end process;

testbench: seg_7 port map(sw_tb, hex0_tb);
end beh;
