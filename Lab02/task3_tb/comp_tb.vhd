library IEEE;
USE ieee.std_logic_1164.all;

entity comp_tb is
end comp_tb;

architecture beh of comp_tb is
component comp is 
port (sw: in std_logic_vector(3 downto 0);
z: out std_logic);
end component;

signal sw_tb: std_logic_vector(3 downto 0);
signal z_tb: std_logic;

begin 
process
begin
sw_tb <= "0000";
wait for 10 ns;
sw_tb <= "1001";
wait for 10 ns;
sw_tb <= "0110";
wait for 10 ns;
sw_tb <= "1110";
wait for 10 ns;
sw_tb <= "1010";
wait for 10 ns;
sw_tb <= "0111";
wait for 10 ns;
sw_tb <= "1111";
wait;
end process;
testbench: comp port map(sw_tb, z_tb);
end beh;