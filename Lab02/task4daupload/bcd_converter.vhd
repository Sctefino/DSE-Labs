library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_converter is
port (SW: in std_logic_vector(5 downto 0);
Hex0, hex1 : out std_logic_vector(6 downto 0));
end bcd_converter;

architecture beh of bcd_converter is

signal c,d : std_logic_vector(3 downto 0);
signal e : std_logic_vector(2 doWnto 0);

component seg_7 is
port (a: in std_logic_vector(3 downto 0);
b: out std_logic_vector(6 downto 0));
end component;

component comparator is
port (a : in std_logic_vector(5 downto 0);
b : out std_logic_vector(3 downto 0);
sel : out std_logic_vector(2 downto 0));
end component;

component unit_mux is
Port (initial : in std_logic_vector (5 downto 0);
sel : in std_logic_vector (2 downto 0);
result : out std_logic_vector (3 downto 0));
end component;

begin

displayunit : seg_7
port map (c,HEX0);

displaydec : seg_7
port map (d,HEX1);

comp: comparator
port map(SW,d,e);

multiplexer : unit_mux
port map(SW,e,c);

end beh;
