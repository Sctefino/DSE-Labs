library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counterbeh_tb is
end counterbeh_tb;

architecture str of counterbeh_tb is
component counterbeh is
port (SW : in std_logic_vector(1 downto 0);
key : in std_logic;
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end component;

signal sw_tb: std_logic_vector(1 downto 0);
signal key_tb: std_logic;
signal hex0_tb, hex1_tb, hex2_tb, hex3_tb : std_logic_vector(6 downto 0);
begin

Clock: process
begin
key_tb <= '0';
wait for 10 ps;
key_tb <= '1';
wait for 10 ps;
end process;

Signals: process
begin
sw_tb(0) <= '1';
sw_tb(1) <= '1';
wait for 15 ps;
sw_tb(0) <= '0';
wait for 100 ps;
sw_tb(0) <= '1';
wait for 5 ps;
sw_tb(0) <= '0';
wait for 30 ns;
sw_tb(0) <= '1';
wait for 5 ps;
sw_tb(0) <= '0';
wait;
end process;

tb: counterbeh port map(sw_tb, key_tb, hex0_tb, hex1_tb, hex2_tb, hex3_tb);

end str;