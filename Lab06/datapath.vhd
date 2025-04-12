library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
port(data_A: in std_logic_vector(7 downto 0);
	  controls: in std_logic_vector(11 downto 0);
	  --reset, cntAen, cntBen, reg1en, reg2en, reg3en, reg4en, regaccen, sel1, sel2_1, sel2_0, sub
	  clk: in std_logic;
	  address_A, address_B: out std_logic_vector(9 downto 0);
	  data_B: out std_logic_vector(7 downto 0);
	  status: out std_logic_vector(1 downto 0)
	  --cntB_en, cntA_en
	  );
end datapath;

architecture str of datapath is

component reg is
generic(N: integer);
port (ck,en,rst : in std_logic;
		a : in std_logic_vector(N-1 downto 0);
		b : out std_logic_vector(N-1 downto 0));
end component;

component mux4to1 is
port(a,b,c,d: in std_logic_vector(7 downto 0);
	  sel: in std_logic_vector(1 downto 0);
	  e: out std_logic_vector(7 downto 0)
	 );
end component;

component mux2to1 is
port(a,b: in std_logic_vector(11 downto 0);
	  sel: in std_logic;
	  c: out std_logic_vector(11 downto 0)
	 );
end component;

component shifter is
port(a: in std_logic_vector(7 downto 0);
	  sel: in std_logic_vector(1 downto 0);
	  b: out std_logic_vector(11 downto 0)
 	 );
end component;

component adder is
port (a,b: in std_logic_vector(11 downto 0);
		sub: in std_logic;
		c : out std_logic_vector(11 downto 0));
end component;

component rounder is
port(a: in std_logic_vector(11 downto 0);
	  b: out std_logic_vector(7 downto 0)
	  );
end component;

component counter is
port (ck,en,rst : in std_logic;
		count : out std_logic_vector(9 downto 0));
end component;

component comparator is
port (a,b : in std_logic_vector(9 downto 0);
		c : out std_logic);
end component;

signal cntA_out, cntB_out: std_logic_vector(9 downto 0);
signal reg1_out, reg2_out, reg3_out, reg4_out, mux2_out: std_logic_vector(7 downto 0);
signal regacc_out, shift1_out, shift2_out, mux1_out, add_out: std_logic_vector(11 downto 0);

begin

address_A <= cntA_out;
address_B <= cntB_out;

cntA: counter port map(clk, controls(10), controls(11), cntA_out);
compA: comparator port map(cntA_out, "1111111111", status(0));

cntB: counter port map(clk, controls(9), controls(11), cntB_out);
compB: comparator port map(cntB_out, "1111111111", status(1)); 

reg1: reg generic map(N => 8) port map(clk, controls(8), controls(11), data_A, reg1_out);
reg2: reg generic map(N => 8) port map(clk, controls(7), controls(11), reg1_out, reg2_out);
reg3: reg generic map(N => 8) port map(clk, controls(6), controls(11), reg2_out, reg3_out);
reg4: reg generic map(N => 8) port map(clk, controls(5), controls(11), reg3_out, reg4_out);
regacc: reg generic map(N => 12) port map(clk, controls(4), controls(11), add_out, regacc_out);

shift1: shifter port map(reg3_out, "10", shift1_out);
shift2: shifter port map(mux2_out, controls(2 downto 1), shift2_out);

mux1: mux2to1 port map(regacc_out, shift1_out, controls(3), mux1_out);
mux2: mux4to1 port map(reg1_out, reg2_out, "00000000", reg4_out, controls(2 downto 1), mux2_out);

addsub: adder port map(mux1_out, shift2_out, controls(0), add_out);

satur: rounder port map(regacc_out, data_B);

end str;
	  