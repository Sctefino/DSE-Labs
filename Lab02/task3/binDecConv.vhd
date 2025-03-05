library IEEE;
USE ieee.std_logic_1164.all;

entity binDecConv is 
port (sw: in std_logic_vector(3 downto 0);
		hex1: out std_logic_vector(6 downto 0);
		hex0: out std_logic_vector(6 downto 0));
end binDecConv;

architecture str of binDecConv is 

component comp
	port (sw: in std_logic_vector(3 downto 0);
			z: out std_logic);
end component;

component circuit_A
	port (c: in std_logic_vector(2 downto 0);
			d: out std_logic_vector(2 downto 0));
end component;

component circuit_B
	port (z: in std_logic;
			hex1: out std_logic_vector(6 downto 0));
end component;

component mux2to1
	port (a, b, sel: in std_logic;
			m: out std_logic);
end component;

component seg_7
	port (sw: in std_logic_vector(3 downto 0);
			hex0: out std_logic_vector(6 downto 0));
end component;

signal z: std_logic;
signal outA: std_logic_vector(2 downto 0);
signal m: std_logic_vector(3 downto 0);
begin

comparator: comp port map(sw => sw, z => z);
circuitA: circuit_A port map(c => sw(2 downto 0), d => outA);
circuitB: circuit_B port map(z => z, hex1 => hex1);
mux1: mux2to1 port map(a => sw(3), b => '0', sel => z, m => m(3));
mux2: mux2to1 port map(a => sw(2), b => outA(2), sel => z, m => m(2));
mux3: mux2to1 port map(a => sw(1), b => outA(1), sel => z, m => m(1));
mux4: mux2to1 port map(a => sw(0), b => outA(0), sel => z, m => m(0));
seg_dec: seg_7 port map(sw => m, hex0 => hex0);

end str;