library IEEE;
USE ieee.std_logic_1164.all;

entity bin_dec_converter is 
port (sw: in std_logic_vector(3 downto 0);
hex1: out std_logic_vector(6 downto 0);
hex0: out std_logic_vector(6 downto 0));
end bin_dec_converter;

architecture str of bin_dec_converter is 
begin
end str;