LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tempZero IS
    PORT (
        portIN : IN std_logic;
        portOUT : OUT std_logic
    );
END tempZero;

ARCHITECTURE behavior OF tempZero IS
BEGIN
    portOUT <= portIN;
END behavior;