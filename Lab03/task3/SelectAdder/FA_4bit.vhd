library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA_4bit is
port(a,b: in signed(3 downto 0);
	  c_in: in std_logic;
	  c_out: out std_logic;
	  s: out signed(3 downto 0)
	  );
end FA_4bit;

architecture str of FA_4bit is

component Adder is
port ( a,b, c_in: in std_logic;
	s, c_o: out std_logic
	);
end component;

signal c: std_logic_vector(3 downto 0) := (others => '0');

begin
FA1: Adder port map(a => a(0), b => b(0), c_in => c_in, s => s(0), c_o => c(0));
FA2: Adder port map(a => a(1), b => b(1), c_in => c(0), s => s(1), c_o => c(1));
FA3: Adder port map(a => a(2), b => b(2), c_in => c(1), s => s(2), c_o => c(2));
FA4: Adder port map(a => a(3), b => b(3), c_in => c(2), s => s(3), c_o => c(3));
c_out <= c(3); 
end str;