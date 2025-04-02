library ieee;
use ieee.std_logic_1164.all;

entity hello_fsm_tb is
end hello_fsm_tb;

architecture beh of hello_fsm_tb is

component hello_fsm is
port (clock_50 : std_logic;
key: in std_logic_vector(3 downto 0);
hex0,hex1,hex2,hex3,hex4,hex5 : out std_logic_vector(6 downto 0));
end component;

signal clock_50_tb: std_logic;
signal key_tb: std_logic_vector(3 downto 0) := (others => '1');
signal hex0_tb, hex1_tb, hex2_tb, hex3_tb, hex4_tb, hex5_tb: std_logic_vector(6 downto 0);
 
begin

clock: process
begin
clock_50_tb <= '0';
wait for 10 ns;
clock_50_tb <= '1';
wait for 10 ns;
end process;

segnali: process
begin
wait for 30 ns;
key_tb(0) <= '0';
wait for 30 ns;
key_tb(0) <= '1';
wait;
end process;

testbench: hello_fsm port map(clock_50_tb, key_tb, hex0_tb, hex1_tb, hex2_tb, hex3_tb, hex4_tb, hex5_tb);
end beh;