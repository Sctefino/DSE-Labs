library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_hot_tb is
end entity;

architecture beh of one_hot_tb is
component one_hot is
Port ( KEY : in std_logic_vector(3 downto 0);
       SW : in std_logic_vector(1 downto 0);
       LEDR : out std_logic_vector(9 downto 0));
end component;

signal key_tb: std_logic_vector(3 downto 0):= (others => '0');
signal sw_tb: std_logic_vector(1 downto 0);
signal LEDR_tb: std_logic_vector(9 downto 0);

begin
Clock: process
begin
key_tb(0) <= '0';
wait for 10 ns;
key_tb(0) <= '1';
wait for 10 ns;
end process;

Signals: process
begin
sw_tb(0) <= '1';
sw_tb(1) <= '0';
wait for 15 ns;
sw_tb(1) <= '1';
wait for 5 ns;
sw_tb(0) <= '1';
wait for 15 ns;
sw_tb(0) <= '0';
wait for 50 ns;
sw_tb(1) <= '0';
wait for 40 ns;
sw_tb(0) <= '1';
wait;
end process;

tb: one_hot port map(key_tb, sw_tb, LEDR_tb);

end beh;