LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_add_sub is
port (sw: in std_logic_vector(8 downto 0);
	key: in std_logic_vector(1 downto 0);
	hex0,hex1,hex2: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end RCA_add_sub;

architecture str of RCA_add_sub is

component Regn 
generic (N: integer:=4);
port (R: in signed(N-1 downto 0);
	CLK, Resetn: in std_logic;
	Q: out signed(N-1 downto 0));
end component;

component Adder
port (a,b: in signed(3 downto 0);
	c_in: in std_logic;
        p : in std_logic;
	s: out signed(3 downto 0);
	c_o: out std_logic);
end component;

component Flip_Flop
port (D, CLK, Resetn: in std_logic;
	OVF: out std_logic);
end component;

component seg_7
port (sw: in signed(3 downto 0);
hex0: out std_logic_vector(6 downto 0));
end component;

signal a,b,c,g,h,i: signed(3 downto 0);
signal d,e: std_logic;

begin
h<= signed(sw(3 downto 0));
i<=signed(sw(7 downto 4));
Register_1: regn generic map ( N => 4) port map(R => h, CLK => key(1), Resetn => key(0), Q => a);
Register_2: Regn generic map ( N => 4) port map(R => i, CLK => key(1), Resetn => key(0), Q => b);
Add: Adder port map(a => a, b => b, c_in => e,p => sw(8), s => c, c_o => d);
Register_3: Regn generic map ( N => 4) port map(R => c, CLK => key(1), Resetn => key(0), Q => g);
FF: Flip_Flop port map(D => d, CLK => key(1), Resetn => key(0), OVF => e);
Segment: seg_7 port map(sw => g, hex0 => hex2);
Segment1: seg_7 port map(sw => a, hex0 => hex0);
Segment2: seg_7 port map(sw => b, hex0 => hex1);

process(key)
begin
if e='1' then
LEDR <= "1111111111";
elsif e='0' then
LEDR <= "0000000000";
end if;
end process;

end str;
