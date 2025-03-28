library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
Generic (N : integer := 26);
port (ck   : in std_logic;
rst : in std_logic;
a : in std_logic;
stop : in std_logic; --segnale che ferma conteggio
b : out std_logic_vector(N-1 downto 0));
end adder;

architecture beh of adder is
signal sum : unsigned(N-1 downto 0) := (others => '0');
signal add : unsigned(N-1 downto 0) := (others => '0');
begin
process (ck, rst)
begin
if rst = '1' then --reset asincrono
sum <= (others => '0');
elsif rising_edge(ck) then
if a = '1' then --reset sincrono
sum <= (others => '0');
elsif stop = '1' then --se non devo fermarmi incremento di 1, altrimenti lascio fermo
add(0) <= '1';
sum <= sum + add;
end if;
end if;
end process;
b <= std_logic_vector(sum);
end beh;