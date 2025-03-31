LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Carry_Bypass_Adder is
port (a,b: in signed(15 downto 0);
		key: in std_logic_vector(1 downto 0);
		t: out signed(15 downto 0);
		LEDR: out std_logic_vector(9 downto 0)); --OVERFLOW
end Carry_Bypass_Adder;

architecture str of Carry_Bypass_Adder is

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

component mux 
port(a,b,sel: in std_logic;
		c: out std_logic);
end component;

component FA_4Bit 
port(a,b: in signed(3 downto 0);
	  c_in: in std_logic;
	  c_out: out std_logic;
	  s: out signed(3 downto 0));
end component;

signal a_r, b_r, t_r: signed(15 downto 0);
signal c, sel, c_mux: std_logic_vector(3 downto 0);
signal d, ov: std_logic;

begin

Block_0: FA_4Bit port map(a => a_r(3 downto 0), b => b_r(3 downto 0), c_in => '0', c_out => c(0), s => t_r(3 downto 0));
Block_1: FA_4Bit port map(a => a_r(7 downto 4), b => b_r(7 downto 4), c_in => c_mux(0), c_out => c(1), s => t_r(7 downto 4));
Block_2: FA_4Bit port map(a => a_r(11 downto 8), b => b_r(11 downto 8), c_in => c_mux(1), c_out => c(2), s => t_r(11 downto 8));
Block_3: FA_4Bit port map(a => a_r(15 downto 12), b => b_r(15 downto 12), c_in => c_mux(2), c_out => c(3), s => t_r(15 downto 12));
mux_0: mux port map(a => c(0), b => '0', sel => sel(0), c => c_mux(0));
mux_1: mux port map(a => c(1), b => c_mux(0), sel => sel(1), c => c_mux(1));
mux_2: mux port map(a => c(2), b => c_mux(1), sel => sel(2), c => c_mux(2));
mux_3: mux port map(a => c(3), b => c_mux(2), sel => sel(3), c => c_mux(3));
sel(0) <= (a(0) xor b(0)) and (a(1) xor b(1)) and (a(2) xor b(2)) and (a(3) xor b(3));
sel(1) <= (a(4) xor b(4)) and (a(5) xor b(5)) and (a(6) xor b(6)) and (a(7) xor b(7));
sel(2) <= (a(8) xor b(8)) and (a(9) xor b(9)) and (a(10) xor b(10)) and (a(11) xor b(11));
sel(3) <= (a(12) xor b(12)) and (a(13) xor b(13)) and (a(14) xor b(14)) and (a(15) xor b(15));
FF: Flip_Flop port map(D => ov, CLK => key(1), Resetn => key(0), OVF => d);
Reg_0: Reg generic map(N => 16) port map(R => a, CLK => key(1), Resetn => key(0), Q => a_r);
Reg_1: Reg generic map(N => 16) port map(R => b, CLK => key(1), Resetn => key(0), Q => b_r);
Reg_2: Reg generic map(N => 16) port map(R => t_r, CLK => key(1), Resetn => key(0), Q => t);
Overflow: ovf port map(a_msb => a_r(15), b_msb => b_r(15), s_msb => t_r(15), ov => ov);

process(key(1)) --Key(1) is the clock
begin
if d = '1' then
LEDR <= "1111111111";
elsif d = '0' then
LEDR <= "0000000000";
end if;
end process;

end str;
