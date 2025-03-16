library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA_4bit_tb is
end FA_4bit_tb;

architecture beh of FA_4bit_tb is
component FA_4bit is
port(a,b: in signed(3 downto 0);
	  c_in: in std_logic;
	  c_out: out std_logic;
	  s: out signed(3 downto 0)
	  );
end component;
signal a_tb,b_tb, s_tb: signed(3 downto 0);
signal c_in_tb, c_out_tb: std_logic;
begin

process
begin
a_tb <= "0000";
b_tb <= "0000";
c_in_tb <= '0';
wait for 10 ns;
a_tb <= "0001";
wait for 10 ns;
c_in_tb <= '1';
wait for 10 ns;
b_tb <= "0110";
wait for 10 ns;
a_tb <= "1001";
wait;
end process;

tb: FA_4bit port map(a_tb, b_tb, c_in_tb, c_out_tb, s_tb);
end beh; 
