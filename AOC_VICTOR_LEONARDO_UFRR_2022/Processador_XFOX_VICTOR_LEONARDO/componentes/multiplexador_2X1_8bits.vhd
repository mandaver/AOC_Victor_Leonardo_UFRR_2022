LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiplexador_2X1_8bits IS
    PORT (
        portIN : IN std_logic;
        inA : IN std_logic_vector (7 DOWNTO 0);
        inB : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
END multiplexador_2X1_8bits;

ARCHITECTURE behavior OF multiplexador_2X1_8bits IS
BEGIN
    PROCESS (portIN, inA, inB)
    BEGIN
        CASE portIN IS
            WHEN '0' => portOUT <= inA;
            WHEN '1' => portOUT <= inB;
        END CASE;
    END PROCESS;
END behavior;