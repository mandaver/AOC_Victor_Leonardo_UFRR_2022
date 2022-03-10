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
    PROCESS (portINA, portINB)
        VARIABLE produto : std_logic_vector(16 DOWNTO 0);
    BEGIN
        produto := "00000000" & portINB & "0";
        FOR i IN 0 TO 7 LOOP
            IF (produto(1) = '0' AND produto(0) = '1') THEN
                produto(16 DOWNTO 9) := produto(16 DOWNTO 9) + portINA;
            ELSIF (produto(1) = '1' AND produto(0) = '0') THEN
                produto(16 DOWNTO 9) := produto(16 DOWNTO 9) - portINA;
            END IF;
            produto(15 DOWNTO 0) := produto(16 DOWNTO 1);
        END LOOP;
        portOUT <= produto(16 DOWNTO 1);
    END PROCESS;
END behavior;