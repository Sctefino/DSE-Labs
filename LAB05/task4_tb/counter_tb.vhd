library ieee;
use ieee.std_logic_1164.all;

entity counter_tb is
end counter_tb;

architecture beh of counter_tb is

component counter is
port (
        ck : in std_logic;
        a  : out std_logic
    );
end component;
signal ck_tb, a_tb: std_logic;
begin

clock: process
begin
ck_tb <= '0';
wait for 10 ns;
ck_tb <= '1';
wait for 10 ns;
end process;

testbench: counter port map(ck_tb, a_tb);
end beh;