library ieee;
use ieee.std_logic_1164.all;

entity cu is
port(status: in std_logic_vector(1 downto 0);
	  --compoutB, compoutA
	  start, clk: in std_logic;
	  done: out std_logic;
	  controls: out std_logic_vector(11 downto 0);
	  --reset, cntAen, cntBen, reg1en, reg2en, reg3en, reg4en, regaccen, sel1, sel2_1, sel2_0, sub
	  controls_mem: out std_logic_vector(5 downto 0)
	  --cs1, rd1, wr1, cs2, rd2, wr2
	  );
end cu;

architecture beh of cu is

type state_type is (RST,IDLE,A,B,C,D,E,F);
signal ps, ns: state_type := RST;


begin

process(clk)
begin
	if clk'event and clk = '1' then
		ps <= ns;
	end if;
end process;

process(ps, start, status)
begin
	done <= '0';
	case ps is
		when RST =>
			controls <= "100000000000"; --reset
			controls_mem <= "000000";
			ns <= IDLE;
		when IDLE =>
			controls <= "000000000000"; --idle
			controls_mem <= "000000";
			if start = '1' then
				ns <= A;
			end if;
		when A =>
			controls <= "010000000000"; --scrivo su memoria A
			controls_mem <= "101000";
			if status(0) = '1' then
				ns <= B;
			end if;
		when B => -- leggo da mem A e scrivo su registri
			controls <= "010111100000";
			controls_mem <= "110100";
			ns <= C;
		when C =>
			controls <= "000000011001"; -- 4X(n-2) - 0.5X(n)
			controls_mem <= "100100";
			ns <= D;
		when D =>
			controls <= "000000010011"; -- 4X(n-2) - 0.5X(n) - 2 X(n-1)
			controls_mem <= "100100";
			ns <= E;
		when E =>
			controls <= "000000010110"; -- 4X(n-2) - 0.5X(n) - 2 X(n-1) + 0.25 X(n-3)
			controls_mem <= "100100";
			ns <= F;
		when F =>
			controls <= "011111100000"; -- leggo da mem A, scrivo su registri e mem B
			controls_mem <= "110101";
			if status(1) = '1' then
				done <= '1';
				ns <= RST;
			else
				ns <= C;
			end if;
		when others =>
			controls <= (others => '0');
			controls_mem <= (others => '0');
			ns <= RST;
	end case;
			
end process;

end beh;