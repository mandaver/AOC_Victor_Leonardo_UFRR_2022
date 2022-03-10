LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ual IS
    PORT (
        clock : IN std_logic;
        ALUOP : IN std_logic_vector(3 DOWNTO 0);
        portINA : IN std_logic_vector(7 DOWNTO 0);
        portINB : IN std_logic_vector(7 DOWNTO 0);
        outUlaResultado : OUT std_logic_vector(7 DOWNTO 0);
        zero : OUT std_logic;
        overflow : OUT std_logic
    );
END ual;

ARCHITECTURE behavior OF ual IS

    COMPONENT tempZero IS
        PORT (
            portIN : IN std_logic;
            portOUT : OUT std_logic
        );
    END COMPONENT;

    COMPONENT multiplicar IS
        PORT (
            portINA : IN std_logic_vector(7 DOWNTO 0);
            portINB : IN std_logic_vector(7 DOWNTO 0);
            portOUT : OUT std_logic_vector(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT adicionador IS
        PORT (
            endA : IN std_logic_vector(7 DOWNTO 0);
            endB : IN std_logic_vector(7 DOWNTO 0);
            resultado : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT subtrair IS
        PORT (
            endA : IN std_logic_vector(7 DOWNTO 0);
            endB : IN std_logic_vector(7 DOWNTO 0);
            resultado : OUT std_logic_vector(7 DOWNTO 0)           
        );
    END COMPONENT;

    -- Para usar nas instruções beq e bne
    SIGNAL in_tempZero : std_logic;
    SIGNAL out_tempZero : std_logic;

    -- Usado no resultado da multiplicação
    SIGNAL out_multiplicar : std_logic_vector(15 DOWNTO 0);

    --Usados nas operações de adição e subtração
    SIGNAL resultadoAdicionador : std_logic_vector(7 DOWNTO 0);
    SIGNAL resultadotSubtrair : std_logic_vector(7 DOWNTO 0);    

BEGIN
    portMap_tempZero : tempZero PORT MAP(in_tempZero, out_tempZero);
    portMap_multiplicar : multiplicar PORT MAP(portINA, portINB, out_multiplicar);
    portMap_adicionador : adicionador PORT MAP(portINA, portINB, resultadoAdicionador);
    portMap_subtrair : subtrair PORT MAP(portINA, portINB, resultadotSubtrair);
    PROCESS (clock)
    BEGIN
        CASE ALUOP IS
            WHEN "0000" => --adicionar
                outUlaResultado <= resultadoAdicionador;
                

            WHEN "0011" => --add_ime
                outUlaResultado <= resultadoAdicionador;
                

            WHEN "0001" => --subtrair
                outUlaResultado <= resultadotSubtrair;

            WHEN "0100" => --sub_ime
                outUlaResultado <= resultadotSubtrair;

            WHEN "0110" => -- loadw
                outUlaResultado <= portINA;

            WHEN "0111" => -- storew
                outUlaResultado <= portINA;
            

            WHEN "0101" => -- load_ime
                outUlaResultado <= portINB;

            WHEN "1000" => -- beq
                IF out_tempZero = '1' THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
                outUlaResultado <= "00000000";

            WHEN "1001" => -- bne
                IF out_tempZero = '0' THEN
                    zero <= '1';
                ELSE
                    zero <= '0';
                END IF;
                outUlaResultado <= "00000000";
					 
				WHEN "1010" => -- if 
                IF portINA = portINB THEN
                    in_tempZero <= '1';
                ELSE
                    in_tempZero <= '0';
                END IF;
                outUlaResultado <= "00000000";

            
            WHEN "0010" => -- multiplicar
                outUlaResultado <= out_multiplicar(7 DOWNTO 0);                

            WHEN OTHERS =>
                outUlaResultado <= "00000000";
        END CASE;
    END PROCESS;
END behavior;