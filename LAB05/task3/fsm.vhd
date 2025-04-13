LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fsm IS
    PORT (
        key  : in std_logic_vector(3 downto 0);
        sw   : in std_logic_vector(1 downto 0);
        ledr : out std_logic_vector(9 downto 0)
    );
END fsm;

ARCHITECTURE Behavior OF fsm IS
    TYPE State_type IS (A, B, C, D, E, F, G, H, I);
    SIGNAL y_Q, Y_D : State_type := A;  -- declare type
BEGIN
PROCESS (y_Q, sw)
BEGIN
Y_D <= y_Q; --get rid of latches
CASE y_Q IS
WHEN A =>
IF sw(1) = '0' THEN
Y_D <= B;
ELSE
Y_D <= F;
END IF;
WHEN B =>
IF sw(1) = '0' THEN
Y_D <= C;
ELSE
Y_D <= F;
END IF;
WHEN C =>
IF sw(1) = '0' THEN
Y_D <= D;
ELSE
Y_D <= F;
END IF;
WHEN D =>
IF sw(1) = '0' THEN
Y_D <= E;
ELSE
Y_D <= F;
END IF;
WHEN E =>
IF sw(1) = '0' THEN
Y_D <= F;
ELSE
Y_D <= E;
END IF;
WHEN F =>
IF sw(1) = '0' THEN
Y_D <= B;
ELSE
Y_D <= G;
END IF;
WHEN G =>
IF sw(1) = '0' THEN
Y_D <= B;
ELSE
Y_D <= H;
END IF;
WHEN H =>
IF sw(1) = '0' THEN
Y_D <= B;
ELSE
Y_D <= I;
END IF;
WHEN I =>
IF sw(1) = '0' THEN
Y_D <= B;
ELSE
Y_D <= I;
END IF;
WHEN OTHERS =>
Y_D <= A;
END CASE;
END PROCESS;

 --synchronize FF
PROCESS (key(0))
BEGIN
IF rising_edge(key(0)) THEN
IF sw(0) = '1' THEN
y_Q <= A;  -- reset
ELSE
y_Q <= Y_D;
END IF;
END IF;
END PROCESS;

-- Output LEDR
ledr(9 downto 1) <= (others => '0');
PROCESS (y_Q)
BEGIN
IF y_Q = E OR y_Q = I THEN
ledr(0) <= '1';
ELSE
ledr(0) <= '0';
END IF;
END PROCESS;
END Behavior;
