LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY fsm IS
PORT (key : in std_logic_vector(3 downto 0);
sw : in std_logic_vector(1 downto 0);
ledr : out std_logic_vector(9 downto 0));
END fsm;

ARCHITECTURE Behavior OF fsm IS
TYPE State_type IS (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state


BEGIN

PROCESS (y_Q) -- state table

BEGIN
CASE y_Q IS
 when A => if (sw(1) = '0') then Y_D <= B;
 ELSE Y_D <= F;
 END IF; 
 
 when B => if (sw(1) = '0') then Y_D <= C;
 ELSE Y_D <= F;
 END IF;
 
 when C => if (sw(1) = '0') then Y_D <= D;
 ELSE Y_D <= F;
 END IF;
 
 when D => if (sw(1) = '0') then Y_D <= E;
 ELSE Y_D <= F;
 END IF;
 
 when E => if (sw(1) = '0') then Y_D <= F;
 END IF;
 
 when F => if (sw(1) = '0') then Y_D <= B;
 ELSE Y_D <= G;
 END IF;
 
 when G => if (sw(1) = '0') then Y_D <= B;
 ELSE Y_D <= H;
 END IF;
 
 when H => if (sw(1) = '0') then Y_D <= B;
 ELSE Y_D <= I;
 END IF;
 
 when I => if (sw(1) = '0') then Y_D <= B;
 END IF;
 
 when others => Y_D <= A;
END CASE;
END PROCESS; -- state table

PROCESS (KEY(0)) -- state flip-flops

BEGIN

if Key(0) = '1' and key(0)'event then
if sw(0) = '1' then
Y_Q <= A;
else
Y_Q <= Y_D;
end if;
end if;
END PROCESS;
ledr(9 downto 1) <= (others =>'0');
process(Y_Q)
begin
if Y_Q = I or Y_Q = E then
ledr(0) <= '1';
else
ledr(0) <= '0';
end if;
end process;
END Behavior; 
