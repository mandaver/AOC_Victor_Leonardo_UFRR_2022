LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY extensaoDeSinal4_8 IS
    PORT (
        portIN : IN std_logic_vector (3 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
END extensaoDeSinal4_8;

ARCHITECTURE behavior OF extensaoDeSinal4_8 IS

BEGIN
    PROCESS (portIN)
    BEGIN
        portOUT <= ("0000") & portIN;
    END PROCESS;
END behavior;