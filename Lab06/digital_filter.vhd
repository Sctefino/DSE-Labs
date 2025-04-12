library ieee;
use ieee.std_logic_1164.all;

entity digital_filter is
port (data_in: in std_logic_vector(7 downto 0);
		start, clk: in std_logic;
		done : out std_logic);
end digital_filter;

architecture str of digital_filter is

component mem
	generic(N : integer;
		M : integer);
	port(add : in std_logic_vector(M-1 downto 0);
		  data_in : in std_logic_vector(N-1 downto 0);
		  WR, RD, clk, CS : in std_logic;
		  data_out : out std_logic_vector(N-1 downto 0)
	);
end component;

component datapath is 
port(data_A: in std_logic_vector(7 downto 0);
	  controls: in std_logic_vector(11 downto 0);
	  --reset, cntAen, cntBen, reg1en, reg2en, reg3en, reg4en, regaccen, sel1, sel2_1, sel2_0, sub
	  clk: in std_logic;
	  address_A, address_B: out std_logic_vector(9 downto 0);
	  data_B: out std_logic_vector(7 downto 0);
	  status: out std_logic_vector(1 downto 0)
	  --cntB_en, cntA_en
	  );
end component;

component cu is
port(status: in std_logic_vector(1 downto 0);
	  --compoutB, compoutA
	  start, clk: in std_logic;
	  done: out std_logic;
	  controls: out std_logic_vector(11 downto 0);
	  --reset, cntAen, cntBen, reg1en, reg2en, reg3en, reg4en, regaccen, sel1, sel2_1, sel2_0, sub
	  controls_mem: out std_logic_vector(5 downto 0)
	  --cs1, rd1, wr1, cs2, rd2, wr2
	  );
end component;

signal addA, addB: std_logic_vector(9 downto 0);
signal ctrl: std_logic_vector(11 downto 0);
signal ctrl_mem: std_logic_vector(5 downto 0);
signal dout, dpout, ignore: std_logic_vector(7 downto 0);
signal stat: std_logic_vector(1 downto 0);


begin

memA: mem generic map(N => 8, M => 10) port map(addA, data_in, ctrl_mem(3), ctrl_mem(4), clk, ctrl_mem(5), dout);
memB: mem generic map(N => 8, M => 10) port map(addB, dpout, ctrl_mem(0), ctrl_mem(1), clk, ctrl_mem(2), ignore);

control_unit: cu port map(stat, start, clk, done, ctrl, ctrl_mem);

dp: datapath port map(dout, ctrl, clk, addA, addB, dpout, stat);

end str;