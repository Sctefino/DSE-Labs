library ieee;
use ieee.std_logic_1164.all;

entity Hello_fsm is
port (clock_50 : std_logic;
key: in std_logic_vector(3 downto 0);
ledr : out std_logic_vector(4 downto 0);
hex0,hex1,hex2,hex3,hex4,hex5 : out std_logic_vector(6 downto 0));
end hello_fsm;

architecture str of hello_fsm is

signal countout : std_logic;
signal state : std_logic_vector(3 downto 0);
signal combination : std_logic_vector(17 downto 0);


component seg_7 is
port( SW: in std_logic_vector(2 downto 0);
hex0 : out std_logic_vector (6 downto 0));
end component;

component word_encoder
port (a : in std_logic_vector(3 downto 0);
b : out std_logic_vector(17 downto 0));
end component;

component counter
port (ck : std_logic;
a : out std_logic);
end component;

begin
process(state)
begin
CASE state IS
 when "0000" => if (countout = '1' and KEY(0) = '1') then state <= "0001";
 END IF;
 
 when "0001" => if (countout = '1' and KEY(0) = '1') then state <= "0010";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "0010" => if (countout = '1' and KEY(0) = '1') then state <= "0011";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
 
 when "0011" => if (countout = '1' and KEY(0) = '1') then state <= "0100";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "0100" => if (countout = '1' and KEY(0) = '1') then state <= "0101"; --LOOP START
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "0101" => if (countout = '1' and KEY(0) = '1') then state <= "0110";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "0110" => if (countout = '1' and KEY(0) = '1') then state <= "0111";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "0111" => if (countout = '1' and KEY(0) = '1') then state <= "1000";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "1000" => if (countout = '1' and KEY(0) = '1') then state <= "1001";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "1001" => if (countout = '1' and KEY(0) = '1') then state <= "1010";
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
  
 when "1010" => if (countout = '1' and KEY(0) = '1') then state <= "0101"; --LOOP RESTART
  ELSif (countout = '1' and KEY(0) = '0') then state <= "0000";
  end if;
 when others => state <= "0000";
 end case;
 end process;
word_enc : word_encoder port map(state, combination);
count : counter port map(clock_50,countout);
hex_0 : seg_7 port map(combination(2 downto 0), hex0);
hex_1 : seg_7 port map(combination(5 downto 3), hex1);
hex_2 : seg_7 port map(combination(8 downto 6), hex2);
hex_3 : seg_7 port map(combination(11 downto 9), hex3);
hex_4 : seg_7 port map(combination(14 downto 12), hex4);
hex_5 : seg_7 port map(combination(17 downto 15), hex5);
ledr(3 downto 0) <= state;
ledr(4) <= countout;
end str;
