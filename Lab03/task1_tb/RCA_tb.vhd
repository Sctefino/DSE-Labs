library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_tb is
end RCA_tb;

architecture beh of RCA_tb is
component RCA is
port (sw: in signed(7 downto 0);
	key: in std_logic_vector(1 downto 0);
	hex0,hex1,hex2: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end component;
signal sw_tb: signed(7 downto 0);
signal key_tb: std_logic_vector(1 downto 0);
signal hex0_tb, hex1_tb, hex2_tb: std_logic_vector(6 downto 0);
signal LEDR_tb: std_logic_vector(9 downto 0);
begin
clk: process --generazione clock
begin
key_tb(1) <= '0';
wait for 10 ns;
key_tb(1) <= '1';
wait for 10 ns;
end process;

values: process
begin
key_tb(0) <= '1';
sw_tb <= "00000001";
wait for 15 ns;
sw_tb <= "00010001";
wait for 20 ns;
sw_tb <= "01000011";
wait for 20 ns;
sw_tb <= "01000111";
wait for 5 ns;
key_tb(0) <= '0';
wait for 5 ns;
key_tb(0) <= '1';
wait for 10 ns;
sw_tb <= "10000011";
wait for 20 ns;
sw_tb <= "10001001";
wait for 20 ns;
sw_tb <= "11000111";
wait for 20 ns;
sw_tb <= "11111111";
wait for 20 ns;
sw_tb <= "10000001";
wait;
end process;

tb: RCA port map(sw_tb, key_tb, hex0_tb, hex1_tb, hex2_tb, LEDR_tb);
end beh;