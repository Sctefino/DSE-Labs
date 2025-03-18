library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA16Bit_tb is
end RCA16Bit_tb;

architecture beh of RCA16Bit_tb is
component RCA16Bit is
port (a_in,b_in: in signed(15 downto 0);
		key: in std_logic_vector(1 downto 0);
		t: out signed(15 downto 0);
		LEDR: out std_logic_vector(9 downto 0));
end component;

signal a_tb, b_tb, t_tb: signed(15 downto 0);
signal key_tb: std_logic_vector(1 downto 0);
signal LEDR_tb: std_logic_vector(9 downto 0);

begin
process
begin
a_tb <= "0011000100011100";
b_tb <= "0000000000000001";
wait for 15 ns;
a_tb <= "0011000100011100";
b_tb <= "0011010001001001";
wait for 20 ns;
a_tb <= "0111000100011100";
b_tb <= "0011010001001001";
wait for 20 ns;
a_tb <= "1010000100011100";
b_tb <= "0010010100000001";
wait for 20 ns;
a_tb <= "0011010100011100";
b_tb <= "0000100111000001";
wait for 20 ns;
a_tb <= "1111111111111111";
b_tb <= "0000000000000001";
wait for 20 ns;
a_tb <= "0011000100011100";
b_tb <= "0000000000000000";
wait for 20 ns;
a_tb <= "0011000100011100";
b_tb <= "0011000100011100";
wait;
end process;

process
begin
key_tb <= "01";
wait for 10 ns;
key_tb <= "11";
wait for 10 ns;
end process;

tb: RCA16Bit port map(a_tb, b_tb, key_tb, t_tb, LEDR_tb);
end beh;
