library ieee;
use ieee.std_logic_1164.all;

entity word_encoder is
port (a : in std_logic_vector(3 downto 0);
b : out std_logic_vector(17 downto 0));
end word_encoder;

architecture beh of word_encoder is
begin
process(a)
begin
if a = "0000" then
b <= (others =>'1');
elsif a = "0001" then --H
b <= "000111111111111111";
elsif a = "0010" then --E
b <= "001111111111111111";
elsif a = "0010" then --L
b <= "010111111111111111";
elsif a = "0011" then --L
b <= "010111111111111111";
elsif a = "0100" then --O
b <= "011111111111111111";
elsif a = "0101" then --HELLO-
b <= "000001010010011111";
elsif a = "0110" then --ELLO-H
b <= "001010010011111000";
elsif a = "0111" then --LLO-HE
b <= "010010011111000001";
elsif a = "1000" then --LO-HEL
b <= "010011111000001010";
elsif a = "1001" then --O_HELL
b <= "011111000001010010";
elsif a = "1010" then ---HELLO
b <= "111000001010010011";
else --VOID
b <= "111111111111111111";
end if;
end process;
end beh;