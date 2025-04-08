library ieee;
use ieee.std_logic_1164.all;

entity digital_filter is
port ( start : in std_logic;
clock_50,rst : in std_logic;
data_in1: in std_logic_vector(7 downto 0);
done : out std_logic);
end digital_filter;

architecture str of digital_filter is
component mem
	generic(N : integer;
		M : integer);
	port(add : in std_logic_vector(M-1 downto 0);
		  data_in : in std_logic_vector(N-1 downto 0);
		  WR, RD, clk, CS : in std_logic;
		  data_out : out std_logic_vector(N-1 downto 0)
	);
end component;

component comparator
port (a,b : in std_logic_vector(9 downto 0);
c : out std_logic);
end component;

component counter
port (ck,en,rst : in std_logic;
count : out std_logic_vector(9 downto 0));
end component;

component adder
port (a,b,c,d : in std_logic_vector(7 downto 0);
e : out std_logic_vector(7 downto 0));
end component;

component reg
port (ck,en,rst : in std_logic;
a : in std_logic_vector(7 downto 0);
b : out std_logic_vector(7 downto 0));
end component;

signal present_state,next_state : std_logic_vector(2 downto 0) := (others => '0');
signal en1,en2,en3,wr1,rd1,cs1,wr2,rd2,cs2,compout1,compout3,reg_en : std_logic;
signal count1,count3,count2 : std_logic_vector(9 downto 0);
signal data_in2 : std_logic_vector(7 downto 0);
signal data_out1,data_out2,regout1,regout2,regout3,regout4 : std_logic_vector(7 downto 0) := (others => '0');

begin

mem1 : mem
generic map (8,10)
port map (count1,data_in1,WR1,RD1,clock_50,CS1,Data_out1);

mem2 : mem
generic map (8,10)
port map(count3,data_in2,WR2,RD2,clock_50,CS2,Data_out2);

counter1 : counter
port map(clock_50,en1,rst,count1);

counter2 : counter --da togliere
port map(clock_50,en2,rst,count2);

counter3 : counter
port map(clock_50,en3,rst,count3);

comp1 : comparator
port map(count1, (others => '1'), compout1);

comp3 : comparator 
port map(count3, (others => '1'), compout3);

reg1 : reg
port map(clock_50,reg_en,rst,data_out1,regout1);

reg2 : reg
port map(clock_50,reg_en,rst,regout1,regout2);

reg3 : reg
port map(clock_50,reg_en,rst,regout2,regout3);

reg4 : reg
port map(clock_50,reg_en,rst,regout3,regout4);

add : adder
port map(regout1,regout2,regout3,regout4,data_in2);

process(clock_50,rst)

begin

if rst = '1' then
present_state <= "000";
elsif clock_50'event and clock_50= '1' then
present_state <= next_state;
end if;
end process;

process(present_state, start, compout1, compout3)
begin
case present_state is
when "000" => WR1 <= '0';
RD1 <= '0';
CS1 <= '0';
WR2 <= '0';
RD2 <= '0';
CS2 <= '0';
EN1 <= '0';
EN2 <= '0';
EN3 <= '0';
reg_en <= '0';
DONE <= '0';
if START ='1' then next_state <= "001";
end if;

when "001" => CS1 <= '1';
WR1 <= '1';
RD1 <= '0';
EN1 <= '1';
CS2 <= '0';
WR2 <= '0';
RD2 <= '0';
EN2 <= '0';
EN3 <= '0';
reg_en <= '0';
DONE <= '0';
if compout1 = '1' then
next_state <= "010";
end if;

when "010" => CS1 <= '1';
WR1 <= '0';
RD1 <= '1';
EN2 <= '1';
EN1 <= '1';
EN3 <= '0';
CS2 <= '0';
RD2 <= '0';
WR2 <= '0';
reg_en <= '0';
DONE <= '0';
next_state <= "011";


when "011" =>  reg_en <= '1';
WR1 <= '0';
RD1 <= '1';
CS1 <= '1';
WR2 <= '0';
RD2 <= '0';
CS2 <= '0';
EN1 <= '1';
EN2 <= '1';
EN3 <= '0';
DONE <= '0';
next_state <= "100";

when "100" => CS2 <= '1';
WR2 <= '1';
RD2 <= '0';
EN3 <= '1';
CS1 <= '1';
WR1 <= '0';
RD1 <= '1';
EN1 <= '1';
EN2 <= '1';
reg_en <= '1';
DONE <= '0';
if compout3 = '1' then
next_state <= "000";
DONE <= '1';
end if;

when others => WR1 <= '0';
RD1 <= '0';
CS1 <= '0';
WR2 <= '0';
RD2 <= '0';
CS2 <= '0';
EN1 <= '0';
EN2 <= '0';
EN3 <= '0';
reg_en <= '0';
DONE <= '0';
next_state <= "000";
end case;
end process;
end str;