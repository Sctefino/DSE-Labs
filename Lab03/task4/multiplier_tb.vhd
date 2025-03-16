library ieee;
use ieee.std_logic_1164.all;

entity multiplier_tb is
end multiplier_tb;

architecture mytest of multiplier_tb is
component multiplier
port(SW: in std_logic_vector(7 downto 0);
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end component;
signal SW_tb : std_logic_vector(7 downto 0);
signal hex0_tb,hex1_tb,hex2_tb,hex3_tb : std_logic_vector(6 downto 0);
begin
uut : multiplier port map(SW_tb,hex0_tb,hex1_tb,hex2_tb,hex3_tb);
process
begin
SW_tb <= "00001111";
wait for 10 ns;
SW_tb <= "11110000";
wait for 10 ns;
SW_tb <= "10101010";
wait for 10 ns;
SW_tb <= "00110011";
wait;
end process;
end mytest;