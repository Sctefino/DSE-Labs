library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flash_digit is
port (clock_50 : in std_logic;
		key : in std_logic_vector(3 downto 0);
		hex0 : out std_logic_vector(6 downto 0));
end flash_digit;

architecture str of flash_digit is 

component counter
Generic (N : integer := 26);
port (ck, rstn, clear, enable: in std_logic;
		b: out std_logic_vector(N-1 downto 0));
end component;

component comparator 
generic (N: integer);
port (a,c: in std_logic_vector(N-1 downto 0);
		b: out std_logic);
end component;

component seg_7 
port (sw: in std_logic_vector(3 downto 0);
		hex: out std_logic_vector(6 downto 0));
end component;

signal add1out: std_logic_vector(25 downto 0);
signal add2out: std_logic_vector(3 downto 0);
signal clear1, clear2: std_logic;
begin

count1: counter
generic map (N => 26)
port map (clock_50, key(0), clear1, '1', add1out);

count2: counter
generic map (N => 4)
port map (clear1, key(0), clear2, clear1, add2out);

comp1: comparator
generic map (N => 26)
port map (add1out, "00000000000000000000110001", clear1); --conto da 0 a 49 -> 50 valori, ottengo 1 MHz



comp2: comparator
generic map (N => 4)
port map (add2out, "1010", clear2);

display: seg_7
port map (add2out, hex0);

end str;