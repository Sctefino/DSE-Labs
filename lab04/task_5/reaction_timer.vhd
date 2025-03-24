library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reaction_timer is
port (clock_50 : in std_logic;
sw : in std_logic_vector(7 downto 0);
key : in std_logic_vector(3 downto 0);
ledr : out std_logic_vector(9 downto 0);
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end reaction_timer;

architecture str of reaction_timer is 

component seg_7 
port (sw: in std_logic_vector(3 downto 0);
hex: out std_logic_vector(6 downto 0));
end component;

component comparator
generic ( N : integer);
port (a,b : in std_logic_vector(N-1 downto 0);
c : out std_logic);
end component;

component adder
Generic (N : integer);
port (ck   : in std_logic;
rstn : in std_logic;
a : in std_logic;
c : in std_logic;
b : out std_logic_vector(N-1 downto 0));
end component;

component ff
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end component;

component display
port ( a : in std_logic_vector(15 downto 0);
en : in std_logic;
b,c,d,e : out std_logic_vector(3 downto 0));
end component;

signal switches : unsigned(23 downto 0);
signal thr,add1out : std_logic_vector(23 downto 0);
signal thr1 : std_logic_vector(47 downto 0);
signal add2out, add3out : std_logic_vector(15 downto 0);
signal ffout1, ffout2,compout1,compout2 : std_logic;
signal h0,h1,h2,h3 : std_logic_vector(3 downto 0);

begin

switches <= resize(unsigned(sw),24);
thr1 <= std_logic_vector( "000000001100001101010000" * switches);
thr <= thr1(23 downto 0);
LEDR(0) <= compout1 and not(key(3));
LEDR(9 downto 1) <= (others => '0');

comp1 : comparator
generic map ( N => 24)
port map(add1out,thr,compout1);

comp2 : comparator
generic map ( N => 16)
port map(add2out,"1100001101010000",compout2);

ff1: ff
port map(compout1,key(0),ffout1);

ff2 : ff
port map(key(3),key(0),ffout2);

add1 : adder
generic map(N => 24)
port map(clock_50,key(0),ffout1,compout1,add1out);

add2 : adder
generic map(N => 16)
port map(clock_50,key(0),compout2,'0',add2out);

add3 : adder
generic map(N => 16)
port map(compout2,key(0),ffout2,not(key(3)),add3out);

dis : display
port map(add3out,key(3),h0,h1,h2,h3);

hex_0 : seg_7
port map(h0,hex0);

hex_1 : seg_7
port map(h1,hex1);

hex_2 : seg_7
port map(h2,hex2);

hex_3 : seg_7
port map(h3,hex3);

end str;