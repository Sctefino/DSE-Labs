library ieee;
use ieee.std_logic_1164.all;

entity reaction_timer_tb is
end reaction_timer_tb;

architecture beh of reaction_timer_tb is

component reaction_timer is
port (clock_50 : in std_logic;
	sw : in std_logic_vector(7 downto 0);
	key : in std_logic_vector(3 downto 0);
	ledr : out std_logic_vector(9 downto 0);
	hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end component;

signal clock_50_tb: std_logic;
signal sw_tb: std_logic_vector(7 downto 0);
signal key_tb: std_logic_vector(3 downto 0):= (others => '1');
signal ledr_tb: std_logic_vector(9 downto 0);
signal hex0_tb, hex1_tb, hex2_tb, hex3_tb: std_logic_vector(6 downto 0);

begin
sw_tb <= "00001011"; --fisso ritardo iniziale a 11 ms
clock: process
begin
clock_50_tb <= '0';
wait for 10 ns;
clock_50_tb <= '1';
wait for 10 ns;
end process;

signals: process
begin
wait for 10 ms;
key_tb(0) <= '0';
wait for 10 ns;
key_tb(0) <= '1';
wait for 50 ms;
key_tb(3) <= '0';
wait for 5 ns;
key_tb(3) <= '1';
wait for 20 ms;
key_tb(0) <= '0';
wait for 20 ns;
key_tb(0) <= '1';
wait;
end process;

testbench: reaction_timer port map(clock_50_tb, sw_tb, key_tb, ledr_tb, hex0_tb, hex1_tb, hex2_tb, hex3_tb);
end beh;