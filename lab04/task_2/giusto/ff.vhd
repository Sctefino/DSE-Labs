library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff is
    Port (enter,ck,clear : in std_logic;
        q,qnon: out std_logic);
end ff;

architecture Behavioral of ff is
    signal q_reg : std_logic := '0';  -- internal signal
begin
 process(ck)
    begin
        if rising_edge(ck) then
            if clear = '1' then
                q_reg <= '0';  -- synch clear
            elsif enter = '1' then
                q_reg <= not q_reg;  --toggle condition
            end if;
        end if;
    end process;
q    <= q_reg;
qnon <= not q_reg;
end Behavioral;
