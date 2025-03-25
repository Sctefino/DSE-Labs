library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_d is
    Port (
        CLK, D, res : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end ff_d;

architecture Behavioral of ff_d is
begin
	process(CLK, res)
	begin
		if res = '1' then
			Q <= '0';
		elsif(CLK = '1' and CLK'event) then
			Q <= D;
		end if;
	end process;
end Behavioral;