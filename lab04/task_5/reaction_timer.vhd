library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reaction_timer is
port (clock_50 : in std_logic;
sw : in std_logic_vector(7 downto 0);
key : in std_logic_vector(3 downto 0);
ledr : out std_logic_vector(9 downto 0);
--clk_kHz: out std_logic;
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

--signal switches : unsigned(23 downto 0);
--signal thr,add1out : std_logic_vector(23 downto 0);
--signal thr1 : std_logic_vector(47 downto 0);
signal add1out, add3out : std_logic_vector(15 downto 0);
signal add2out: std_logic_vector(7 downto 0);
signal ffout1, compout1, compout2, res_ff1, stop_add2, key_3_n, cnt2_en, cnt3_en: std_logic;
signal h0, h1, h2, h3 : std_logic_vector(3 downto 0);

begin

--switches <= resize(unsigned(sw),24);
--thr1 <= std_logic_vector( "000000001100001101010000" * switches);
--thr <= thr1(23 downto 0);
LEDR(0) <= ffout1;
LEDR(9 downto 1) <= (others => '0');
key_3_n <= not(key(3));
res_ff1 <= not(key(0)) or key_3_n;
stop_add2 <= not(compout2);
--clk_kHz <= compout1;
cnt2_en <= stop_add2 and compout1;
cnt3_en <= ffout1 and compout1;

comp1 : comparator
generic map ( N => 16)
port map(add1out,"1100001101010000",compout1); --25000 -> chiedi a Gab se lui capisce il perché

comp2 : comparator
generic map ( N => 8)
port map(add2out,sw,compout2); --Problema: ad occhio spreca 1 ms

ff1: ff_d
port map(clock_50, compout2, res_ff1 ,ffout1);

--ff2 : ff
--port map(key(3),key(0),ffout2);

cnt1 : counter
generic map(N => 16)
port map(clock_50,key(0),compout1,'1',add1out);

cnt2 : counter
generic map(N => 8)
port map(clock_50,key(0),key_3_n,cnt2_en,add2out);

cnt3 : counter
generic map(N => 16)
port map(clock_50,key(0),'0',cnt3_en,add3out);

dis : display
port map(add3out,h0,h1,h2,h3);

hex_0 : seg_7
port map(h0,hex0);

hex_1 : seg_7
port map(h1,hex1);

hex_2 : seg_7
port map(h2,hex2);

hex_3 : seg_7
port map(h3,hex3);

end str;