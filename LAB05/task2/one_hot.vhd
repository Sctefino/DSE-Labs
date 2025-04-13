library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_hot is
    Port ( KEY : in std_logic_vector(3 downto 0);
           SW : in std_logic_vector(1 downto 0);
           LEDR : out std_logic_vector(9 downto 0));
end one_hot;

architecture Structural of one_hot is

component ff
port ( ck,rst,a : in std_logic;
b : out std_logic);
end component;

component mux
	port(a,b,sel: in std_logic;
		  c: out std_logic
	);
end component;

signal state: STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal next_state: STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
signal x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9: std_logic;

begin

-- 9 flip-flop D one for each state
FF_A : FF port map (KEY(0),SW(0), next_state(0), state(0));
FF_B : FF port map (KEY(0),SW(0), next_state(1), state(1));
FF_C : FF port map (KEY(0),SW(0), next_state(2), state(2));
FF_D : FF port map (KEY(0),SW(0), next_state(3), state(3));
FF_E : FF port map (KEY(0),SW(0), next_state(4), state(4));
FF_F : FF port map (KEY(0),SW(0), next_state(5), state(5));
FF_G : FF port map (KEY(0),SW(0), next_state(6), state(6));
FF_H : FF port map (KEY(0),SW(0), next_state(7), state(7));
FF_I : FF port map (KEY(0),SW(0), next_state(8), state(8));

x_1 <= '1';
x_2 <= (not(sw(1)) and not(state(0))) or ((state(5) or state(6) or state(7) or state(8)) and not(sw(1)));
x_3 <= not(sw(1)) and state(1);
x_4 <= not(sw(1)) and state(2);
x_5 <= not(sw(1)) and (state(3) or state(4));
x_6 <= (sw(1) and not(state(0))) or ((state(1) or state(2) or state(3) or state(4))and sw(1));
x_7 <= sw(1) and state(5);
x_8 <= sw(1) and state(6);
x_9 <= sw(1) and (state(7) or state(8));

MUX_A : mux port map('0','1', x_1, next_state(0));

MUX_B : mux port map('0','1', x_2, next_state(1));
MUX_C : mux port map('0','1', x_3, next_state(2));
MUX_D : mux port map('0','1', x_4, next_state(3));
MUX_E : mux port map('0','1', x_5, next_state(4));

MUX_F : mux port map('0','1', x_6, next_state(5));
MUX_G : mux port map('0','1', x_7, next_state(6));
MUX_H : mux port map('0','1', x_8, next_state(7));
MUX_I : mux port map('0','1', x_9, next_state(8));

LEDR(0) <= '1' when (state(4) = '1' or state(8) = '1') else '0';
LEDR(9 downto 1) <= (others => '0');
--LEDR(9 downto 1) <= state;
end Structural;
