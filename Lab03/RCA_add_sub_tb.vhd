LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RCA_add_sub_tb is
end RCA_add_sub_tb;

architecture mytest of RCA_add_sub_tb is

component RCA_add_sub
port (sw: in std_logic_vector(8 downto 0);
	key: in std_logic_vector(1 downto 0);
	hex0,hex1,hex2: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector(9 downto 0));
end component;
signal sw_tb : std_logic_vector(78 downto 0);
signal key_tb : std_logic_vector(1 downto 0);
signal hex0_tb,hex1_tb,hex2_tb : std_logic_vector(6 downto 0);
signal LEDR_tb : std_logic_vector(9 downto 0);
begin
uut : RCA_add_sub port map(sw_tb,key_tb,hex0_tb,hex1_tb,hex2_tb,ledr_tb);
process
begin
sw_tb <= "101110111";
key_tb <= "10";
wait for 10 ns;
sw_tb <= "101110111";
key_tb <= "00";
wait for 10 ns;
sw_tb <= "010000101";
key_tb <= "10";
wait for 10 ns;
sw_tb <= "010000101";
key_tb <= "00";
wait for 10 ns;
sw_tb <= "010110111";
key_tb <= "10";
wait for 10 ns;
sw_tb <= "010110111";
key_tb <= "00";
wait for 10 ns;
wait;
end process;
end mytest;