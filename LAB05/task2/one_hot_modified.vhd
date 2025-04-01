library ieee;
use ieee.std_logic_1164.all;

entity one_hot_modified is
	port(sw: in std_logic_vector(1 downto 0);
		  key: in std_logic_vector(3 downto 0);
		  ledr: out std_logic_vector(9 downto 0)
	);
end one_hot_modified;

architecture str of one_hot_modified is

component ff is
	port ( ck,rst,a : in std_logic;
			b : out std_logic);
end component;

signal A, Bin, Bout, Cin, Cout, Din, Dout, Ein, Eout, Fin, Fout, Gin, Gout, Hin, Hout, Iin, Iout: std_logic;
begin

Bin <= (A and not(sw(1))) or ((Fout or Gout or Hout or Iout) and not(sw(1)));
Cin <= Bout and not(sw(1));
Din <= Cout and not(sw(1));
Ein <= (Dout or Eout) and not(sw(1));
Fin <= (A and sw(1)) or ((Bout or Cout or Dout or Eout) and sw(1));
Gin <= Fout and sw(1);
Hin <= Gout and sw(1);
Iin <= (Hout or Iout) and sw(1);

ledr(9 downto 1) <= (others => '0');
ledr(0) <= Iout or Eout;

y0: ff port map(key(0),sw(0),'1',A);
y1: ff port map(key(0),sw(0),Bin,Bout);
y2: ff port map(key(0),sw(0),Cin,Cout);
y3: ff port map(key(0),sw(0),Din,Dout);
y4: ff port map(key(0),sw(0),Ein,Eout);
y5: ff port map(key(0),sw(0),Fin,Fout);
y6: ff port map(key(0),sw(0),Gin,Gout);
y7: ff port map(key(0),sw(0),Hin,Hout);
y8: ff port map(key(0),sw(0),Iin,Iout);

end str;