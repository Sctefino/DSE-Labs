library IEEE;
USE ieee.std_logic_1164.all;

entity mux5to1 is 
port ( SW : in std_logic_vector(8 downto 0);
LEDR : out std_logic_vector(2 downto 0));
end mux5to1;

architecture str of mux5to1 is
component mux
port ( A : in std_logic_vector(2 downto 0);
B : in std_logic_vector(2 downto 0);
C: in std_logic;
D : out std_logic_vector(2 downto 0));
end component;

signal l,m,n : std_logic_vector(2 downto 0);
begin

m1 : mux
port map (A => "101",
B => "010",
C => SW(6),
D=>l);

m2 : mux
port map (A => "111",
B => SW(2 downto 0),
C => SW(6),
D=>m);

m3 : mux
port map (A => l,
B => m,
C => SW(7),
D=>n);

m4 : mux
port map (A => n,
B => SW(5 downto 3),
C => SW(8),
D=>LEDR(2 downto 0));

end str;