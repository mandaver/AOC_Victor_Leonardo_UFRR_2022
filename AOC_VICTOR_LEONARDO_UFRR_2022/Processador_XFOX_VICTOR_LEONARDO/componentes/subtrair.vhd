LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY subtrair IS
    PORT (
        endA : IN std_logic_vector(7 DOWNTO 0);
        endB : IN std_logic_vector(7 DOWNTO 0);
        resultado : OUT std_logic_vector(7 DOWNTO 0)       
    );
END subtrair;

ARCHITECTURE behavior OF subtrair IS
BEGIN
    
    resultado <= endA - endB;
	 
END behavior;