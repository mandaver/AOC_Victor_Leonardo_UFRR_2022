LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY registradores IS PORT (
    clock : IN std_logic;
    REGWRITE : IN std_logic;
    enderecoRegA : IN std_logic_vector(1 DOWNTO 0);
    enderecoRegB : IN std_logic_vector(1 DOWNTO 0);
    writeData : IN std_logic_vector (7 DOWNTO 0);
    regOutA : OUT std_logic_vector (7 DOWNTO 0);
    regOutB : OUT std_logic_vector (7 DOWNTO 0)
);
END registradores;

ARCHITECTURE behavior OF registradores IS

    TYPE bancoDeRegistrador IS ARRAY(0 TO 3) OF std_logic_vector (7 DOWNTO 0);
    SIGNAL registrador : bancoDeRegistrador;

BEGIN
    PROCESS (clock)
    BEGIN
        IF rising_edge(clock) THEN
            IF (REGWRITE = '1') THEN
                registrador(to_integer(unsigned(enderecoRegA))) <= writeData;
            END IF;
        END IF;
        regOutA <= registrador(to_integer(unsigned(enderecoRegA)));
        regOutB <= registrador(to_integer(unsigned(enderecoRegB)));
    END PROCESS;
END behavior;