LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA16Bit is
port (a_in,b_in: in signed(15 downto 0);
		key: in std_logic_vector(1 downto 0);
		t: out signed(15 downto 0));
end RCA16Bit;

architecture str of RCA16Bit is

component Reg 
generic (N: integer:=16);
port (R: in signed(N-1 downto 0);
		CLK, Resetn: in std_logic;
		Q: out signed(N-1 downto 0));
end component;

component Adder
port (a,b,c_in: in std_logic;
		s, c_o: out std_logic);
end component;

component FLip_Flop
port (D, CLK, Resetn: in std_logic;
		OVF: out std_logic);
end component;

component ovf 
port(a_msb, b_msb, s_msb: in std_logic;
	  ov: out std_logic);
end component;

signal a,b,c,s,g: signed(15 downto 0);
signal d,e,q: std_logic;

begin

Register_1: Reg generic map(N => 16) port map(R => a_in, CLK => key(1), Resetn => key(0), Q => a);
Register_2: Reg generic map(N => 16) port map(R => b_in, CLK => key(1), Resetn => key(0), Q => b);
FA_1: Adder port map(a => a(0), b => b(0), c_in => '0', s => s(0), c_o => c(0));
FA_2: Adder port map(a => a(1), b => b(1), c_in => c(0), s => s(1), c_o => c(1));
FA_3: Adder port map(a => a(2), b => b(2), c_in => c(1), s => s(2), c_o => c(2));
FA_4: Adder port map(a => a(3), b => b(3), c_in => c(2), s => s(3), c_o => c(3));
FA_5: Adder port map(a => a(4), b => b(4), c_in => c(3), s => s(4), c_o => c(4));
FA_6: Adder port map(a => a(5), b => b(5), c_in => c(4), s => s(5), c_o => c(5));
FA_7: Adder port map(a => a(6), b => b(6), c_in => c(5), s => s(6), c_o => c(6));
FA_8: Adder port map(a => a(7), b => b(7), c_in => c(6), s => s(7), c_o => c(7));
FA_9: Adder port map(a => a(8), b => b(8), c_in => c(7), s => s(8), c_o => c(8));
FA_10: Adder port map(a => a(9), b => b(9), c_in => c(8), s => s(9), c_o => c(9));
FA_11: Adder port map(a => a(10), b => b(10), c_in => c(9), s => s(10), c_o => c(10));
FA_12: Adder port map(a => a(11), b => b(11), c_in => c(10), s => s(11), c_o => c(11));
FA_13: Adder port map(a => a(12), b => b(12), c_in => c(11), s => s(12), c_o => c(12));
FA_14: Adder port map(a => a(13), b => b(13), c_in => c(12), s => s(13), c_o => c(13));
FA_15: Adder port map(a => a(14), b => b(14), c_in => c(13), s => s(14), c_o => c(14));
FA_16: Adder port map(a => a(15), b => b(15), c_in => c(14), s => q, c_o => c(15));
s(15) <= q;
t <= s;
OVERF: ovf port map(a_msb => a(15), b_msb => b(15), s_msb => q, ov => d);
Register_3: Reg generic map(N => 16) port map(R => s, CLK => key(1), Resetn => key(0), Q => g);
FF: Flip_Flop port map(D => d, CLK => key(1), Resetn => key(0), OVF => e);

end str;
