LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
    PORT (
        clock : IN std_logic;
        OPcode : IN std_logic_vector (3 DOWNTO 0);
        JUMP : OUT std_logic;
        BRANCH : OUT std_logic;
        MEMREAD : OUT std_logic;
        MEMTOREG : OUT std_logic;
        ALUOP : OUT std_logic_vector (3 DOWNTO 0);
        MEMWRITE : OUT std_logic;
        ALUSRC : OUT std_logic;
        REGWRITE : OUT std_logic
    );
END controle;

ARCHITECTURE behavior OF controle IS
BEGIN
    PROCESS (clock)
    BEGIN
        CASE OPcode IS
		  
				WHEN "0000" => -- adicionar
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0000";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '1';
					 
            WHEN "0001" => -- subtrair
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0001";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '1';
					 
				WHEN "0010" => -- multiplicar
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0010";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '1';
					 
				WHEN "0011" => -- add_ime
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0011";
                MEMWRITE <= '0';
                ALUSRC <= '1';
                REGWRITE <= '1';
					 	 
				WHEN "0100" => -- sub_ime
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0100";
                MEMWRITE <= '0';
                ALUSRC <= '1';
                REGWRITE <= '1';
					 
				WHEN "0101" => -- load_ime
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0101";
                MEMWRITE <= '0';
                ALUSRC <= '1';
                REGWRITE <= '1';
					 
				WHEN "0110" => -- loadw
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '1';
                MEMTOREG <= '1';
                ALUOP <= "0110";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '1';
					 
				WHEN "0111" => -- storew
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "0111";
                MEMWRITE <= '1';
                ALUSRC <= '0';
                REGWRITE <= '0';
					 
				WHEN "1000" => -- beq
                JUMP <= '0';
                BRANCH <= '1';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "1000";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '0';
					
				WHEN "1001" => -- bne
                JUMP <= '0';
                BRANCH <= '1';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "1001";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '0';		
			
				WHEN OTHERS =>
                JUMP <= '0';
                BRANCH <= '0';
                MEMREAD <= '0';
                MEMTOREG <= '0';
                ALUOP <= "1111";
                MEMWRITE <= '0';
                ALUSRC <= '0';
                REGWRITE <= '0';
				
        END CASE;
    END PROCESS;
END behavior;