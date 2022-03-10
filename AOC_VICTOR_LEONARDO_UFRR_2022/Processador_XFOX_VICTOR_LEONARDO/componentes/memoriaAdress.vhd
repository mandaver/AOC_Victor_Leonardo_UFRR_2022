LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY memoriaAdress IS
    PORT (
        clock : IN std_logic;
        MEMWRITE : IN std_logic;
        MEMREAD : IN std_logic;
        endereco : IN std_logic_vector(7 DOWNTO 0);
        portIN : IN std_logic_vector(7 DOWNTO 0);
        portOUT : OUT std_logic_vector(7 DOWNTO 0)
    );
	 
END memoriaAdress;

ARCHITECTURE behavior OF memoriaAdress IS

    TYPE memoria_int IS ARRAY (0 TO 7) OF std_logic_vector(7 DOWNTO 0);
    SIGNAL ram : memoria_int := (OTHERS => "00000000");
	 
BEGIN

    PROCESS (clock)
    BEGIN
        IF rising_edge(clock) THEN
            IF (MEMWRITE = '1') THEN
                ram(to_integer(unsigned(endereco))) <= portIN;
            END IF;
            IF (MEMREAD = '1') THEN
                portOUT <= ram(to_integer(unsigned(endereco)));
            END IF;
        END IF;
    END PROCESS;
	 
END behavior;