LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA is
port (sw: in signed(7 downto 0);
	key: in std_logic_vector(1 downto 0);
	hex0,hex1,hex2: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end RCA;

architecture str of RCA is

component Regn 
generic (N: integer:=4);
port (R: in signed(N-1 downto 0);
	CLK, Resetn: in std_logic;
	Q: out signed(N-1 downto 0));
end component;

component Adder
port ( a,b, c_in: in std_logic;
	s, c_o: out std_logic
	);
end component;

component Flip_Flop
port (D, CLK, Resetn: in std_logic;
	OVF: out std_logic);
end component;

component seg_7
port (sw: in std_logic_vector(3 downto 0);
hex0: out std_logic_vector(6 downto 0));
end component;

component ovf is
port(c_o, a_msb, b_msb, s_msb: in std_logic;
	      ov: out std_logic
	);
end component;

signal a,b,c,s, g: signed(3 downto 0);
signal d,e: std_logic := '0';

begin

Register_1: regn generic map ( N => 4) port map(R => sw(3 downto 0), CLK => key(1), Resetn => key(0), Q => a);
Register_2: Regn generic map ( N => 4) port map(R => sw(7 downto 4), CLK => key(1), Resetn => key(0), Q => b);
FA1: Adder port map(a => a(0), b => b(0), c_in => '0', s => s(0), c_o => c(0));
FA2: Adder port map(a => a(1), b => b(1), c_in => c(0), s => s(1), c_o => c(1));
FA3: Adder port map(a => a(2), b => b(2), c_in => c(1), s => s(2), c_o => c(2));
FA4: Adder port map(a => a(3), b => b(3), c_in => c(2), s => s(3), c_o => c(3));
OVERF: ovf port map(c_o => c(3), a_msb => a(3), b_msb => b(3), s_msb => s(3), ov => d);
Register_3: Regn generic map ( N => 4) port map(R => s, CLK => key(1), Resetn => key(0), Q => g);
FF: Flip_Flop port map(D => d, CLK => key(1), Resetn => key(0), OVF => e);
Segment: seg_7 port map(sw => std_logic_vector(g), hex0 => hex2);
Segment1: seg_7 port map(sw => std_logic_vector(a), hex0 => hex0);
Segment2: seg_7 port map(sw => std_logic_vector(b), hex0 => hex1);

process(key(1))
begin
if e='1' then
LEDR <= "1111111111";
elsif e='0' then
LEDR <= "0000000000";
end if;
end process;

end str;
