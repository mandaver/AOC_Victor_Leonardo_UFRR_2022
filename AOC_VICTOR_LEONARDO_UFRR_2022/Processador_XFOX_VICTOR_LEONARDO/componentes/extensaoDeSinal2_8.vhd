LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY extensaoDeSinal2_8 IS
    PORT (
        portIN : IN std_logic_vector (1 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
END extensaoDeSinal2_8;

ARCHITECTURE behavior OF extensaoDeSinal2_8 IS

BEGIN
    PROCESS (portIN)
    BEGIN
        portOUT <= ("000000") & portIN;
    END PROCESS;
END behavior;