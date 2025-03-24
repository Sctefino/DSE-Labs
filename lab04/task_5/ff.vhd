library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff is
    Port (
        A   : in  STD_LOGIC;
        B   : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end ff;

architecture Behavioral of ff is
    signal state : STD_LOGIC := '0';
begin
    process (A, B)
    begin
        if B = '1' then
            state <= '0';
        elsif A = '1' then
            state <= '1';
        end if;
    end process;
    
    Q <= state;
end Behavioral;