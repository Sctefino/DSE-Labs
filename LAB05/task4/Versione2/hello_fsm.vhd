library ieee;
use ieee.std_logic_1164.all;

entity hello_fsm is
	port (clock_50 : std_logic;
			key: in std_logic_vector(3 downto 0);
			hex0,hex1,hex2,hex3,hex4,hex5 : out std_logic_vector(6 downto 0));
end hello_fsm;

architecture str of hello_fsm is

component counter
	port (ck : std_logic;
			a : out std_logic);
end component;

component regn is
	generic (N: integer:=4);
	port (R: in std_logic_vector(N-1 downto 0);
		   CLK, Resetn, enable: in std_logic;
			Q: out std_logic_vector(N-1 downto 0)
	);
end component;

component mux8to1_nbit is
	generic(N: integer := 7);
	port(a: in std_logic_vector(N-1 downto 0);
		  sel: in std_logic_vector(2 downto 0);
		  q: out std_logic_vector(N-1 downto 0)
	);
end component;

type state_type is (A, B, C, D, E, F, G);
signal ps, ns: state_type := A;
signal sel: std_logic_vector(2 downto 0) := (others => '0');
signal r1in, r2in, r3in, r4in, r5in, r6in, r6out: std_logic_vector(6 downto 0);
signal en: std_logic;

begin

process(clock_50)
begin
	if(clock_50'event and clock_50 = '1') then
		if key(0) = '0' then
			ps <= A; --a reset torno a primo stato
		elsif en = '1' then
			ps <= ns;
		end if;
	end if;
end process;

process(ps)
begin
	case ps is
		when A =>
			sel <= "000"; --H
			ns <= B;
		when B =>
			sel <= "001"; --E
			ns <= C;
		when C =>
			sel <= "010"; --L
			ns <= D;
		when D =>
			sel <= "010"; --L
			ns <= E;
		when E =>
			sel <= "011"; --O
			ns <= F;
		when F =>
			sel <= "100"; --' '
			ns <= G;
		when G =>
			sel <= "101"; --loop
			ns <= G;
	end case;
end process;
cont: counter port map(clock_50, en);

regn1: regn generic map(7) port map(r1in, clock_50, key(0), en, r2in);
regn2: regn generic map(7) port map(r2in, clock_50, key(0), en, r3in);
regn3: regn generic map(7) port map(r3in, clock_50, key(0), en, r4in);
regn4: regn generic map(7) port map(r4in, clock_50, key(0), en, r5in);
regn5: regn generic map(7) port map(r5in, clock_50, key(0), en, r6in);
regn6: regn generic map(7) port map(r6in, clock_50, key(0), en, r6out);

mux: mux8to1_nbit generic map(7) port map(r6out, sel, r1in);

hex0 <= r2in;
hex1 <= r3in;
hex2 <= r4in;
hex3 <= r5in;
hex4 <= r6in;
hex5 <= r6out;

end str;
