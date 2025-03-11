library ieee;
use ieee.std_logic_1164.all;

entity part2_tb is
end part2_tb;

architecture beh of part2_tb is

component part2 is
PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0));
END component;

signal sw_tb: std_logic_vector(4 downto 0);
signal hex0_tb, hex1_tb, hex2_tb, hex3_tb, hex4_tb: std_logic_vector(6 downto 0);

begin

process
begin
sw_tb <= "00000";
wait for 20 ns;
sw_tb <= "01000";
wait for 20 ns;
sw_tb <= "10000";
wait for 20 ns;
sw_tb <= "00011";
wait for 20 ns;
sw_tb <= "01111";
wait for 20 ns;
sw_tb <= "00110";
wait for 20 ns;
sw_tb <= "10001";
wait for 20 ns;
sw_tb <= "01110";
wait;
end process;

testbench: part2 port map(sw_tb, hex0_tb, hex1_tb, hex2_tb, hex3_tb, hex4_tb);

end beh;