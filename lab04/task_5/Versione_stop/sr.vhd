library ieee;
use ieee.std_logic_1164.all;

entity sr is
	port(s, r: in std_logic;
		  q: out std_logic);
end sr;

architecture str of sr is

component mux is
	port(a,b,sel: in std_logic;
		  c: out std_logic
	);
end component;

signal s_sr, q_sr: std_logic := '1';
signal q_n_sr: std_logic := '0';
begin

mux1: mux port map('1', s, r, s_sr); --mux inserted to avoid violation of teh sr latch

q_sr <= s_sr nand q_n_sr;
q_n_sr <= r nand q_sr;

q <= q_sr;

end str;
