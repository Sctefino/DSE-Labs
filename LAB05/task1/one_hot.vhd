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

signal state,next_state : STD_LOGIC_VECTOR(8 downto 0);

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

    -- state transistions
    process (state, sw(1))
    begin
        -- Default: tutti gli stati a 0
        next_state <= (others => '0');

        -- Stato A
        if state(0) = '1' then
            if sw(1) = '0' then next_state <= "000000010"; -- Vai in B
            else next_state <= "000100000"; -- Vai in F
            end if;
        end if;

        -- Stato B
        if state(1) = '1' then
            if sw(1) = '0' then next_state <= "000000100"; -- Vai in C
            else next_state<= "000100000"; -- Vai in F
            end if;
        end if;

        -- Stato C
        if state(2) = '1' then
            if sw(1) = '0' then next_state<= "000001000"; -- Vai in D
            else next_state <= "000100000"; -- Vai in F
            end if;
        end if;

        -- Stato D
        if state(3) = '1' then
            if sw(1) = '0' then next_state <= "000010000"; -- Vai in E
            else next_state <= "000100000"; -- Vai in F
            end if;
        end if;

        -- Stato E (uscita z = 1)
        if state(4) = '1' then
            if sw(1) = '0' then next_state <= "000100000"; -- Vai in F
            end if;
        end if;

        -- Stato F
        if state(5) = '1' then
            if sw(1) = '1' then next_state <= "001000000"; -- Vai in G
            else next_state <= "000000010"; -- Vai in B
            end if;
        end if;

        -- Stato G
        if state(6) = '1' then
            if sw(1) = '1' then next_state <= "010000000"; -- Vai in H
            else next_state <= "000000010"; -- Vai in B
            end if;
        end if;

        -- Stato H
        if state(7) = '1' then
            if sw(1) = '1' then next_state <= "100000000"; -- Vai in I
            else next_state <= "000000010"; -- Vai in B
            end if;
        end if;

        -- Stato I (uscita z = 1)
        if state(8) = '1' then
            if sw(1) = '1' then next_state <= "000000010"; -- Vai in B
            end if;
        end if;
    end process;

    -- Uscita z = 1 quando siamo in stato E o I
    LEDR(0) <= '1' when (state(4) = '1' or state(8) = '1') else '0';
    LEDR(9 downto 1) <= (others => '0');
end Structural;
