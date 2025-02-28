LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_tb is
end entity;

architecture mytest of mux_tb is
component mux 
port ( SW : in std_logic_vector(8 downto 0);
LEDR : out std_logic_vector(3 downto 0));
end component;

signal SW_tb : std_logic_vector(8 downto 0);
signal LEDR_tb : std_logic_vector(3 downto 0);

begin
uut : mux port map (SW_tb, LEDR_tb);

process
begin
SW_tb <= "101011001";
wait for 10 ns;
SW_tb <= "111000110";
wait for 10 ns;
SW_tb <= "000011111";
wait;
end process;
end mytest;