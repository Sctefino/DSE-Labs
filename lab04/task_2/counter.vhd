library ieee;
use ieee.std_logic_1164.all;

entity counter is
port (SW : in std_logic_vector(1 downto 0);
key : in std_logic_vector(3 downto 0); --declared as vector because of board functioning purposes
hex0,hex1,hex2,hex3 : out std_logic_vector(6 downto 0));
end counter;
architecture str of counter is

component ff
port (enter,ck,clear : in std_logic;
q,qnon : out std_logic);
end component;

component seg_7
port (sw: in std_logic_vector(3 downto 0);
hex: out std_logic_vector(6 downto 0));
end component;

signal a,b,c,d,e,f,g,h,i,l,m,n,o,p,q,r,s,t,u,v,z,j,k,w,x,y,a1,b1,c1,d1,e1,f1,g1,h1,i1,l1,m1,n1,o1,p1,q1,r1,s1,t1,u1,v1,z1: std_logic;

signal j1,k1,w1,x1 : std_logic_vector(3 downto 0);

begin --creation of components
ff1 : ff
port map (SW(1),key(0),SW(0),a,b);
c <= a and SW(1);
ff2 : ff
port map (c,key(0),SW(0),d,e);
f <= d and c;
ff3 : ff
port map (f,key(0),SW(0),g,h);
i <= g and f;
ff4 : ff
port map(i,key(0),sw(0),l,m);
n <= l and i;
ff5 : ff
port map(n,key(0),sw(0),o,p);
q <= n and o;
ff6 : ff
port map(q,key(0),sw(0),r,s);
t <= q and r;
ff7 : ff
port map(t,key(0),sw(0),u,v);
z <= t and u;
ff8 : ff
port map(z,key(0),sw(0),j,k);
w <= z and j;
ff9 : ff
port map(w,key(0),sw(0),x,y);
a1 <= w and x;
ff10 : ff
port map(a1,key(0),sw(0),b1,c1);
d1 <= a1 and b1;
ff11 : ff 
port map(d1,key(0),sw(0),e1,f1);
g1 <= d1 and e1;
ff12 : ff
port map(g1,key(0),sw(0),h1,i1);
l1 <= g1 and h1;
ff13 : ff
port map(l1,key(0),sw(0),m1,n1);
o1 <= l1 and m1;
ff14 : ff
port map(o1,key(0),sw(0),p1,q1);
r1 <= o1 and p1;
ff15 : ff
port map(r1,key(0),sw(0),s1,t1);
u1 <= r1 and s1;
ff16 : ff
port map(u1,key(0),sw(0),v1,z1);

j1(0) <= a;
j1(1) <= d;
j1(2) <= g;
j1(3) <= l;

k1(0) <= o;
k1(1) <= r;
k1(2) <= u;
k1(3) <= j;

w1(0) <= x;
w1(1) <= b1;
w1(2) <= e1;
w1(3) <= h1;

x1(0) <= m1;
x1(1) <= p1;
x1(2) <= s1;
x1(3) <= v1;

h_1 : seg_7
port map(j1,hex0);
h_2 : seg_7
port map(k1,hex1);
h_3 : seg_7
port map(w1,hex2);
h_4 : seg_7
port map(x1,hex3);

end str;
