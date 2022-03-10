LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY divisaoDeInstr IS PORT (
    portIN : IN std_logic_vector(7 DOWNTO 0);
    outOpCode : OUT std_logic_vector(3 DOWNTO 0);
    outRS : OUT std_logic_vector(1 DOWNTO 0);
    outRT : OUT std_logic_vector(1 DOWNTO 0);
    outJump : OUT std_logic_vector(3 DOWNTO 0)
);
END divisaoDeInstr;

ARCHITECTURE behavior OF divisaoDeInstr IS

BEGIN

    outOpCode <= portIN(7 DOWNTO 4);
    outRS <= portIN(3 DOWNTO 2);
    outRT <= portIN(1 DOWNTO 0);
    outJump <= portIN(3 DOWNTO 0);

END behavior;