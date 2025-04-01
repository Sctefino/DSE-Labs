library ieee;
use ieee.std_logic_1164.all;

entity flash_digit_tb is
end entity;

architecture beh of flash_digit_tb is

component flash_digit is
port (clock_50 : in std_logic;
		key : in std_logic_vector(3 downto 0);
		hex0 : out std_logic_vector(6 downto 0));
end component;

signal clock_50_tb: std_logic;
signal key_tb: std_logic_vector(3 downto 0):= (others => '0');
signal hex0_tb: std_logic_vector(6 downto 0);
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
key_tb(0) <= '0';
wait for 5 ns;
key_tb(0) <= '1';
wait for 30 us;
key_tb(0) <= '0';
wait for 5 ns;
key_tb(0) <= '1';
wait;
end process;

testbench: flash_digit port map(clock_50_tb, key_tb, hex0_tb);
end beh;