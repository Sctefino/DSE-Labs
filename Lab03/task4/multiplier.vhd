library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
port(SW: in std_logic_vector(7 downto 0);
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end multiplier;

architecture str of multiplier is
signal a,b,c,d,e,f,g,h,i,l,m,n,o,p,q,r,s,t,u,v,z,j,k,W,x,y,z1,a1,b1,c1,d1,e1,f1,g1,h1,i1,l1,m1,n1,o1 : std_logic;
signal p1,p2 : std_logic_vector(3 downto 0);

component fulladder
port(a: in std_logic;
b: in std_logic;
Ci: in std_logic;
sum: out std_logic;
Co: out std_logic);
end component;

component seg_7
port (sw: in std_logic_vector(3 downto 0);
hex: out std_logic_vector(6 downto 0));
end component;

begin
a <= SW(1) and SW(4); --a1 and b0
b <= SW(0) and SW(5); --a0 and b1
e <= SW(2) and SW(4); --a2 and b0
f <= SW(1) and SW(5); --a1 and b1
i <= SW(3) and SW(4); --a3 and b0
l <= SW(2) and SW(5); --a2 and b1
o <= SW(3) and SW(5); --a3 and b1
r <= SW(0) and SW(6); --a0 and b2
u <= SW(1) and SW(6); --a1 and b2
j <= SW(2) and SW(6); --a2 and b2
x <= SW(3) and SW(6); --a3 and b2
b1 <= SW(0) and SW(7); --a0 and b3
e1 <= SW(1) and SW(7); --a1 and b3
h1 <= SW(2) and SW(7); --a2 and b3
m1 <= SW(3) and SW(7); --a3 and b3
fa1 : fulladder port map (a,b,'0',c,d);
fa2 : fulladder port map (e,f,d,g,h);
fa3 : fulladder port map (i,l,h,m,n);
fa4 : fulladder port map ('0',o,n,p,q);
fa5 : fulladder port map (g,r,'0',s,t);
fa6 : fulladder port map (m,u,t,v,z1);
fa7 : fulladder port map (p,j,z1,k,w);
fa8 : fulladder port map (q,x,w,y,a1);
fa9 : fulladder port map (v,b1,'0',c1,d1);
fa10 : fulladder port map (k,e1,d1,f1,g1);
fa11 : fulladder port map (y,h1,g1,i1,l1);
fa12 : fulladder port map (a1,m1,l1,n1,o1);
hexa : seg_7 port map (SW(3 downto 0),hex0);
hexb : seg_7 port map (sw(7 downto 4),hex1);
p1(0) <= SW(0) and SW(4);
p1(1) <= c;
p1(2) <= s;
p1(3) <= c1;
p2(0) <= f1;
p2(1) <= i1;
p2(2) <= n1;
p2(3) <= o1;
hexc : seg_7 port map (p1,hex2);
hexd : seg_7 port map (p2,hex3);
end str;