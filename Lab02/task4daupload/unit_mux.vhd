library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unit_mux is
    Port (
        initial : in STD_LOGIC_VECTOR (5 downto 0);
        sel : in STD_LOGIC_VECTOR (2 downto 0);
        result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end unit_mux;

architecture Behavioral of unit_mux is
signal num, unit : unsigned(5 downto 0);
signal intermediate : std_logic_vector(5 downto 0);
begin
num <= unsigned(initial);
    process(sel, num)
    begin
        case sel is
            when "000" => unit <= num(5 downto 0);  -- 0-9
            when "001" => unit <= num - "001010";  -- 10-19
            when "010" => unit <= num - "010100";  -- 20-29
            when "011" => unit <= num - "011110";  -- 30-39
            when "100" => unit <= num - "101000";  -- 40-49
            when "101" => unit <= num - "110010";  -- 50-59
            when "110" => unit <= num - "111100";  -- 60-63
            when others => unit <= "000000";
        end case;
    end process;
intermediate <= std_logic_vector(unit);
result <= intermediate(3 downto 0);
end Behavioral;
