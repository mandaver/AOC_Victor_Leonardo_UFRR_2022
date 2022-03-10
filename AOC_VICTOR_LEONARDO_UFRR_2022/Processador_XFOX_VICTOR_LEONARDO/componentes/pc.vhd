LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY pc IS
    PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
END pc;

ARCHITECTURE behavior OF pc IS
BEGIN
    PROCESS (clock)
    BEGIN
        IF rising_edge(clock) THEN
            portOUT <= portIN;
        END IF;
    END PROCESS;
END behavior;