library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counterbeh is
port (SW : in std_logic_vector(1 downto 0);
key : in std_logic_vector(3 downto 0);
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end counterbeh;

architecture str of counterbeh is

component adder
port (a : in std_logic_vector(1 downto 0);
ck : std_logic;
b : out std_logic_vector(15 downto 0));
end component;

component seg_7
port (sw: in std_logic_vector(3 downto 0);
hex: out std_logic_vector(6 downto 0));
end component;

signal suma : std_logic_vector(15 downto 0);

begin

add : adder
port map(sw,key(0),suma);

hex_0 : seg_7
port map(suma(3 downto 0),hex0);

hex_1 : seg_7
port map(suma(7 downto 4),hex1);

hex_2 : seg_7
port map(suma(11 downto 8),hex2);

hex_3 : seg_7
port map(suma(15 downto 12),hex3);
end str;