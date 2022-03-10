LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY addPC IS

    PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0));
		  
END addPC;

ARCHITECTURE behavior OF addPC IS

BEGIN
    PROCESS (clock)
    BEGIN
        portOUT <= portIN + "00000001";
    END PROCESS;
	 
END behavior;