library ieee;
use ieee.std_logic_1164.all;

entity binDecConv_tb is
end binDecConv_tb;

architecture beh of binDecConv_tb is

component binDecConv
port (sw: in std_logic_vector(3 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex0: out std_logic_vector(6 downto 0));
end component;

signal sw_tb: std_logic_vector(3 downto 0);
signal hex1_tb, hex0_tb: std_logic_vector(6 downto 0);

begin
	process
	begin
		sw_tb <= "0000";
		wait for 10 ns;
		sw_tb <= "1111";
		wait for 10 ns;
		sw_tb <= "0000";
		wait for 10 ns;
		sw_tb <= "0110";
		wait for 10 ns;
		sw_tb <= "1001";
		wait for 10 ns;
		sw_tb <= "1100";
		wait for 10 ns;
		sw_tb <= "1010";
		wait;
	end process;
testbench: binDecConv port map(sw_tb, hex1_tb, hex0_tb);
end beh;