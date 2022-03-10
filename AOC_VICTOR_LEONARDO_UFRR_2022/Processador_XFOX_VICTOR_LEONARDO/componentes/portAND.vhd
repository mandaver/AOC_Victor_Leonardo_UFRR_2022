LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY portAND IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
END portAND;

ARCHITECTURE behavior OF portAND IS
BEGIN
    out_port <= in_port_A AND in_port_B;
END behavior;