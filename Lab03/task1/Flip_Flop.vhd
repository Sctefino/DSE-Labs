LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Flip_Flop is
port (D, CLK, Resetn: in std_logic;
	OVF: out std_logic);
end Flip_Flop;

architecture beh of Flip_Flop is
begin
process(CLK, Resetn)
begin
if (Resetn = '0') then -- asynchronous clear
OVF <= '0';
elsif (CLK'event and CLK = '1') then
OVF <= D;
end if;
end process;
end beh;
