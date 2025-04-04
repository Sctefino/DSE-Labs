library ieee;
use ieee.std_logic_1164.all;

entity mem_tb is
end mem_tb;

architecture beh of mem_tb is

component mem is
	generic(N : integer := 8;
		M : integer := 10); -- N parallelismo dati, M parallelismo indirizzo 
	port(add : in std_logic_vector(M-1 downto 0);
		  data_in : in std_logic_vector(N-1 downto 0);
		  WR, RD, clk, CS : in std_logic;
		  data_out : out std_logic_vector(N-1 downto 0)
	);
end component;

signal add_tb : std_logic_vector(9 downto 0);
signal din_tb, dout_tb: std_logic_vector(7 downto 0);
signal clk_tb, CS_tb, WR_tb, RD_tb: std_logic;

begin

clock: process
begin
clk_tb <= '0';
wait for 10 ns;
clk_tb <= '1';
wait for 10 ns;
end process;

segnali: process
begin
WR_tb <= '1';
RD_tb <= '0';
CS_tb <= '1';
din_tb <= (others => '1');
add_tb <= (others => '0');
wait for 20 ns;
add_tb(0) <= '1';
din_tb <= "11001011";
wait for 20 ns;
add_tb(1 downto 0) <= "10";
din_tb <= "11110011";
wait for 20 ns;
add_tb(0) <= '1';
din_tb <= "00011010";
wait for 20 ns;
WR_tb <= '0';
add_tb <= (others => '0');
wait for 5 ns;
RD_tb <= '1';
wait for 5 ns;
add_tb(0) <= '1';
wait for 5 ns;
CS_tb <= '0';
wait for 5 ns;
add_tb(1 downto 0) <= "10";
wait for 15 ns;
CS_tb <= '1';
wait for 5 ns;
RD_tb <= '0';
WR_tb <= '1';
add_tb(2 downto 0) <= "100";
din_tb <= "10110010";
wait;
end process;

testbench: mem generic map(N => 8, M => 10) 
	       port map(add_tb, din_tb, WR_tb, RD_tb, clk_tb, CS_tb, dout_tb);
end beh;