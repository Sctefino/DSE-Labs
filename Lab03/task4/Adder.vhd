LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Adder is
port ( a,b, c_in: in std_logic;
	s, c_o: out std_logic
	);
end Adder;

architecture beh of Adder is

component mux is
	port(a,b,sel: in std_logic;
		  c: out std_logic
	);
end component;
signal x: std_logic := '0';
begin
mux1: mux port map(a => b, b => c_in, sel => x, c => c_o);
x <= a xor b;
s <= x xor c_in; 
		
end beh;
