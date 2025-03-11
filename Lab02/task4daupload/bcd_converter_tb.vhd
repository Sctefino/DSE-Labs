library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_converter_tb is
end entity;

architecture mytest of bcd_converter_tb is
component bcd_converter is
port (SW: in std_logic_vector(5 downto 0);
Hex0, hex1 : out std_logic_vector(6 downto 0));
end component;
signal sw_tb : std_logic_vector(5 downto 0);
signal hex0_tb,hex1_tb : std_logic_vector(6 downto 0);
begin

uut : bcd_converter port map (SW_tb, Hex0_tb, HEx1_tb);
 process
 begin
 sw_tb <= "010101";
 wait for 10 ns;
 sw_tb <= "111100";
 wait for 10 ns;
 sw_tb <= "000101";
 wait for 10 ns;
 sw_tb <= "000011";
 wait;
 end process;
 end mytest;