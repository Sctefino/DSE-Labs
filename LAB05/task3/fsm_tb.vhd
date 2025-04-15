LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fsm_tb is
end fsm_tb;

architecture mytest of fsm_tb is

component fsm
PORT (key : in std_logic_vector(3 downto 0);
sw : in std_logic_vector(1 downto 0);
ledr : out std_logic_vector(9 downto 0));
END component;

signal key_tb : std_logic_vector(3 downto 0);
signal sw_tb : std_logic_vector(1 downto 0);
signal ledr_tb : std_logic_vector(9 downto 0);

begin

uut : fsm port map (key_tb,sw_tb,ledr_tb);

key_tb(3 downto 1) <= "000";
Clock: process
begin
key_tb(0) <= '0';
wait for 10 ns;
key_tb(0) <= '1';
wait for 10 ns;
end process;

Signals: process
begin
sw_tb(0) <= '1';
sw_tb(1) <= '0';
wait for 20 ns;
sw_tb(1) <= '1';
wait for 30 ns;
sw_tb(0) <= '0';
wait; 
end process;
end mytest;