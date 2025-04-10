library ieee;
use ieee.std_logic_1164.all;

entity cu is
port(status: in std_logic_vector(1 downto 0);
	  start: in std_logic;
	  done: out std_logic;
	  controls: out std_logic_vector(10 downto 0)
	  );
end cu;

architecture beh of cu is

begin

end beh;