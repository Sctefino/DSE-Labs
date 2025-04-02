library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    port (
        ck : in std_logic;
        a  : out std_logic
    );
end counter;

architecture Behavioral of counter is
    signal count : integer range 0 to 50000000 := 0;
    signal a_internal : std_logic := '0';
begin
    process(ck)
    begin
        if rising_edge(ck) then
            if count = 50000000 then
                count <= 0;
                a_internal <= '1';
            else
                count <= count + 1;
                a_internal <= '0';
            end if;
        end if;
    end process;
    
    -- Assegna il valore del segnale interno all'output
    a <= a_internal;

end Behavioral;