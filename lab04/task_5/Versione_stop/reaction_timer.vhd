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

component counter
Generic (N : integer);
port (ck   : in std_logic;
rst : in std_logic;
clear : in std_logic;
enable : in std_logic;
b : out std_logic_vector(N-1 downto 0));
end component;

component ff_d
    Port (
        CLK, D, res : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end component;

component display
port ( a : in std_logic_vector(15 downto 0);
b,c,d,e : out std_logic_vector(3 downto 0));
end component;

component sr is
	port(s, r: in std_logic;
		  q: out std_logic);
end component;

signal cnt1out, cnt3out : std_logic_vector(15 downto 0);
signal cnt2out: std_logic_vector(7 downto 0);
signal ffout1, ffin1, compout1, compout2, res_ff1, stop_cnt2, key_3_n, cnt2_en, cnt3_en, stop: std_logic;
signal h0, h1, h2, h3 : std_logic_vector(3 downto 0);

begin

LEDR(0) <= ffout1;
LEDR(9 downto 1) <= (others => '0');
key_3_n <= not(key(3));
res_ff1 <= not(key(0)) or key_3_n;
ffin1 <= compout2 and stop;
stop_cnt2 <= not(compout2);
cnt2_en <= stop_cnt2 and compout1;
cnt3_en <= ffout1 and compout1;

comp1 : comparator
generic map ( N => 16)
port map(cnt1out,"1100001101010000",compout1);

comp2 : comparator
generic map ( N => 8)
port map(cnt2out,sw,compout2); --Problema: ad occhio spreca 1 ms

ff1: ff_d
port map(clock_50, ffin1, res_ff1 ,ffout1);

cnt1 : counter
generic map(N => 16)
port map(clock_50,key(0),compout1,'1',cnt1out);

cnt2 : counter
generic map(N => 8)
port map(clock_50,key(0),'0',cnt2_en,cnt2out);

cnt3 : counter
generic map(N => 16)
port map(clock_50,key(0),'0',cnt3_en,cnt3out);

dis : display
port map(cnt3out,h0,h1,h2,h3);

mem_sr: sr
port map(key(0), key(3), stop);



hex_0 : seg_7
port map(h0,hex0);

hex_1 : seg_7
port map(h1,hex1);

hex_2 : seg_7
port map(h2,hex2);

hex_3 : seg_7
port map(h3,hex3);

end str;