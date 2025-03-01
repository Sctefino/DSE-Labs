LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux5to1_tb is
end entity;

architecture mytest of mux5to1_tb is
component mux5to1 
port ( SW : in std_logic_vector(8 downto 0);
LEDR : out std_logic_vector(2 downto 0));
end component;

signal SW_tb : std_logic_vector(8 downto 0);
signal LEDR_tb : std_logic_vector(2 downto 0);

begin
uut : mux5to1 port map (SW_tb, LEDR_tb);

process
begin
SW_tb <= "110101001";
wait for 10 ns;
SW_tb <= "111000110";
wait for 10 ns;
SW_tb <= "010001111";
wait;
end process;

end mytest;