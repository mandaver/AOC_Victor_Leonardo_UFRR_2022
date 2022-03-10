LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY multiplicar IS
    PORT (
        portINA : IN std_logic_vector(7 DOWNTO 0);
        portINB : IN std_logic_vector(7 DOWNTO 0);
        portOUT : OUT std_logic_vector(15 DOWNTO 0)
    );
END multiplicar;

ARCHITECTURE behavior OF multiplicar IS
BEGIN
    
	 portOUT <= portINA * portINB;
	 
END behavior;