library ieee;
use ieee.std_logic_1164.all;

entity one_hot is
port (sw : in std_logic_vector(1 downto 0);
key : in std_logic_vector(3 downto 0);
ledr : out std_logic_vector(9 downto 0));
end one_hot;

architecture str of one_hot is

component ff
port ( ck,rst,a : in std_logic;
b : out std_logic);
end component;

signal A,B,C,D,E,F,G,H,I,L,M,N,O,P,Q,R,S : std_logic;

begin

ledr( 9 downto 1) <= (others=> '0');
B <= A and M and O and Q and S;
D <= C or sw(1);
F <= E or SW(1);
H <= G or sw(1);
L <= A or C or E or G or I;
N <= M and sw(1);
P <= O and sw(1);
R <= Q and sw(1);
LEDR(0) <= S or not(I);

STATE_A : ff
port map( KEY(0),sw(0),sw(1),A);

STATE_B : ff
port map( KEY(0),sw(0),B,C);

STATE_C : ff
port map( KEY(0),sw(0),D,E);

STATE_D : ff
port map( KEY(0),sw(0),F,G);

STATE_E : ff
port map( KEY(0),sw(0),H,I);

STATE_F : ff
port map( KEY(0),sw(0),L,M);

STATE_G : ff
port map( KEY(0),sw(0),N,O);

STATE_H : ff
port map( KEY(0),sw(0),P,Q);

STATE_I : ff
port map( KEY(0),sw(0),R,S);

end str;