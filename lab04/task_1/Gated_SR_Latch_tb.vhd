library IEEE;
use ieee.std_logic_1164.all;

entity Gated_SR_Latch_tb is
end Gated_SR_Latch_tb;

architecture beh of Gated_SR_Latch_tb is
component Gated_SR_Latch is
port(CLK, R, S: in std_logic;
	Q: out std_logic);
end component;

signal CLK_tb, S_tb, R_tb, Q_tb: std_logic;

begin
Clock: process 
begin
CLK_tb <='0';
wait for 10 ns;
CLK_tb <= '1';
wait for 10 ns;
end process;

process
begin
R_tb <= '0';
S_tb <= '1';
wait for 25 ns;
R_tb <= '0';
S_tb <= '0';
wait for 15 ns;
R_tb <= '1';
S_tb <= '0';
wait for 15 ns;
R_tb <= '0';
S_tb <= '1';
wait;
end process;

tb: Gated_SR_Latch port map(CLK_tb, R_tb, S_tb, Q_tb);
end beh;
