library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Carry_Select_Add is
port(a,b: in signed(15 downto 0);
	  key: in std_logic_vector(1 downto 0);
	  s: out signed(15 downto 0);
	  LEDR: out std_logic_vector(9 downto 0)
	  );
end Carry_Select_Add;

architecture str of Carry_select_Add is

component Regn 
generic (N: integer:=4);
port (R: in signed(N-1 downto 0);
	CLK, Resetn: in std_logic;
	Q: out signed(N-1 downto 0));
end component;

component FA_4bit
port(a,b: in signed(3 downto 0);
	  c_in: in std_logic;
	  c_out: out std_logic;
	  s: out signed(3 downto 0)
	  );
end component;

component Flip_Flop
port (D, CLK, Resetn: in std_logic;
	OVF: out std_logic);
end component;

component ovf is
port(a_msb, b_msb, s_msb: in std_logic;
	      ov: out std_logic
	);
end component;

component mux_nbit is
generic(N : integer := 4);
port(a,b: in std_logic_vector(N-1 downto 0);
	  sel: in std_logic;
	  c: out std_logic_vector(N-1 downto 0)
);
end component;

component mux is
	port(a,b,sel: in std_logic;
		  c: out std_logic
	);
end component;

signal a_ff,b_ff, s_add: signed(15 downto 0);
signal temp0, temp1: signed(11 downto 0);
signal temp0_std, temp1_std: std_logic_vector(11 downto 0);
signal s_temp: std_logic_vector(11 downto 0);
signal c0: std_logic_vector(3 downto 0);
signal c1, cmux: std_logic_vector(2 downto 0);
signal d, e: std_logic := '0';

begin
temp0_std <= std_logic_vector(temp0);
temp1_std <= std_logic_vector(temp1);
s_add(15 downto 4) <= signed(s_temp);
Register_1: regn generic map ( N => 16) port map(R => a, CLK => key(1), Resetn => key(0), Q => a_ff);
Register_2: Regn generic map ( N => 16) port map(R => b, CLK => key(1), Resetn => key(0), Q => b_ff);

Block0: FA_4bit port map (a => a_ff(3 downto 0), b => b_ff(3 downto 0), c_in => '0', c_out => c0(0), s => s_add(3 downto 0));
Block1_0: FA_4bit port map (a => a_ff(7 downto 4), b => b_ff(7 downto 4), c_in => '0', c_out => c0(1), s => temp0(3 downto 0)); 
Block1_1: FA_4bit port map (a => a_ff(7 downto 4), b => b_ff(7 downto 4), c_in => '1', c_out => c1(0), s => temp1(3 downto 0)); 
Block2_0: FA_4bit port map (a => a_ff(11 downto 8), b => b_ff(11 downto 8), c_in => '0', c_out => c0(2), s => temp0(7 downto 4));
Block2_1: FA_4bit port map (a => a_ff(11 downto 8), b => b_ff(11 downto 8), c_in => '1', c_out => c1(1), s => temp1(7 downto 4));
Block3_0: FA_4bit port map (a => a_ff(15 downto 12), b => b_ff(15 downto 12), c_in => '0', c_out => c0(3), s => temp0(11 downto 8));
Block3_1: FA_4bit port map (a => a_ff(15 downto 12), b => b_ff(15 downto 12), c_in => '1', c_out => c1(2), s => temp1(11 downto 8));

muxs1: mux_nbit generic map(N => 4) port map(a => temp0_std(3 downto 0), b => temp1_std(3 downto 0), sel => c0(0), c => s_temp(3 downto 0));
muxs2: mux_nbit generic map(N => 4) port map(a => temp0_std(7 downto 4), b => temp1_std(7 downto 4), sel => cmux(0), c => s_temp(7 downto 4));
muxs3: mux_nbit generic map(N => 4) port map(a => temp0_std(11 downto 8), b => temp1_std(11 downto 8), sel => cmux(1), c => s_temp(11 downto 8));

muxc1: mux port map(a => c0(1), b => c1(0), sel => c0(0), c => cmux(0));
muxc2: mux port map(a => c0(2), b => c1(1), sel => cmux(0), c => cmux(1));
muxc3: mux port map(a => c0(3), b => c1(2), sel => cmux(1), c => cmux(2));

OVERF: ovf port map(a_msb => a_ff(15), b_msb => b_ff(15), s_msb => s_add(15), ov => d);
Register_3: Regn generic map ( N => 16) port map(R => s_add, CLK => key(1), Resetn => key(0), Q => s);
FF: Flip_Flop port map(D => d, CLK => key(1), Resetn => key(0), OVF => e);

process(key(1))
begin
if e='1' then
LEDR <= "1111111111";
elsif e='0' then
LEDR <= "0000000000";
end if;
end process;

end str;
