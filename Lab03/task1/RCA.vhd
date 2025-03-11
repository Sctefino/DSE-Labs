LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA is
port (sw: in signed(7 downto 0);
	key: in std_logic_vector(1 downto 0);
	s: out signed(3 downto 0);
	hex0: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end RCA;

architecture str of RCA is

component Reg 
generic (N: integer:=4);
port (R: in signed(N-1 downto 0);
	CLK, Resetn: in std_logic;
	Q: out signed(N-1 downto 0));
end component;

component Adder
port (a,b: in signed(3 downto 0);
	c_in: in std_logic;
	s: out signed(3 downto 0);
	c_o: out std_logic);
end component;

component FF
port (D, CLK, Resetn: in std_logic;
	OVF: out std_logic);
end component;

component seg_7
port (sw: in signed(3 downto 0);
hex0: out std_logic_vector(6 downto 0));
end component;

signal a,b,c,g: signed(3 downto 0);
signal d,e: std_logic;

begin

Register_1: Reg port map(R => sw(3 downto 0), CLK => key(1), Resetn => key(0), Q => a);
Register_2: Reg port map(R => sw(7 downto 4), CLK => key(1), Resetn => key(0), Q => b);
Add: Adder port map(a => a, b => b, c_in => e, s => s, c_o => d);
Register_3: Reg port map(R => c, CLK => key(1), Resetn => key(0), Q => g);
FlipFlop: FF port map(D => d, CLK => key(1), Resetn => key(0), OVF => e);
Segment: seg_7 port map(sw => g, hex0 => hex0);

process(d)
begin
if d='1' then
LEDR <= "1111111111";
elsif d='0' then
LEDR <= "0000000000";
end if;
end process;

end str;
