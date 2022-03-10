LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processador_XFOX IS
    PORT (
        clock : IN std_logic;
		  out_out_pc : OUT std_logic_vector (7 DOWNTO 0);        
        out_out_rom : OUT std_logic_vector (7 DOWNTO 0);
        out_opcode : OUT std_logic_vector (3 DOWNTO 0);
        out_rs : OUT std_logic_vector (1 DOWNTO 0);
        out_rt : OUT std_logic_vector (1 DOWNTO 0);
        out_endereco : OUT std_logic_vector (3 DOWNTO 0);
        out_out_br_reg_A : OUT std_logic_vector (7 DOWNTO 0);
        out_out_br_reg_B : OUT std_logic_vector (7 DOWNTO 0);
        out_out_ula_result : OUT std_logic_vector(7 DOWNTO 0);
        out_out_overflow : OUT std_logic;
        out_out_memAdress : OUT std_logic_vector(7 DOWNTO 0);
        out_out_mul_2X1_memAdress_ula : OUT std_logic_vector(7 DOWNTO 0)
    );
END processador_XFOX;

ARCHITECTURE behavior OF processador_XFOX IS

	COMPONENT pc IS
		PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT addPC IS
		PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0));		  
	END COMPONENT;
	
	COMPONENT memoriaInst IS
    PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector(7 DOWNTO 0);
        portOUT : OUT std_logic_vector(7 DOWNTO 0)
    );
	END COMPONENT;
	
	COMPONENT divisaoDeInstr IS PORT (
    portIN : IN std_logic_vector(7 DOWNTO 0);
    outOpCode : OUT std_logic_vector(3 DOWNTO 0);
    outRS : OUT std_logic_vector(1 DOWNTO 0);
    outRT : OUT std_logic_vector(1 DOWNTO 0);
    outJump : OUT std_logic_vector(3 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT controle IS
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
	END COMPONENT;
	
	COMPONENT registradores IS PORT (
    clock : IN std_logic;
    REGWRITE : IN std_logic;
    enderecoRegA : IN std_logic_vector(1 DOWNTO 0);
    enderecoRegB : IN std_logic_vector(1 DOWNTO 0);
    writeData : IN std_logic_vector (7 DOWNTO 0);
    regOutA : OUT std_logic_vector (7 DOWNTO 0);
    regOutB : OUT std_logic_vector (7 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT extensaoDeSinal2_8 IS
    PORT (
        portIN : IN std_logic_vector (1 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
	END COMPONENT;
	
	COMPONENT multiplexador_2X1_8bits IS
    PORT (
        portIN : IN std_logic;
        inA : IN std_logic_vector (7 DOWNTO 0);
        inB : IN std_logic_vector (7 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
	END COMPONENT;
	
	COMPONENT ual IS
    PORT (
        clock : IN std_logic;
        ALUOP : IN std_logic_vector(3 DOWNTO 0);
        portINA : IN std_logic_vector(7 DOWNTO 0);
        portINB : IN std_logic_vector(7 DOWNTO 0);
        outUlaResultado : OUT std_logic_vector(7 DOWNTO 0);
        zero : OUT std_logic;
        overflow : OUT std_logic
    );
	END COMPONENT;
	
	COMPONENT memoriaAdress IS
    PORT (
        clock : IN std_logic;
        MEMWRITE : IN std_logic;
        MEMREAD : IN std_logic;
        endereco : IN std_logic_vector(7 DOWNTO 0);
        portIN : IN std_logic_vector(7 DOWNTO 0);
        portOUT : OUT std_logic_vector(7 DOWNTO 0)
    );
	 
	END COMPONENT;
	
	COMPONENT extensaoDeSinal4_8 IS
    PORT (
        portIN : IN std_logic_vector (3 DOWNTO 0);
        portOUT : OUT std_logic_vector (7 DOWNTO 0)
    );
	END COMPONENT;
	
	COMPONENT portAND IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
	END COMPONENT;
	 
	 -- SOMADOR PC 
    SIGNAL out_addPC : std_logic_vector (7 DOWNTO 0);
	 
	 -- PC
    SIGNAL out_pc : std_logic_vector (7 DOWNTO 0);
	 
	 -- Memoria de instruçoes
    SIGNAL out_memoriaInst : std_logic_vector (7 DOWNTO 0);
	 
	 -- divisao de instrucoes
    SIGNAL out_di_7_4 : std_logic_vector (3 DOWNTO 0);
    SIGNAL out_di_3_2 : std_logic_vector (1 DOWNTO 0);
    SIGNAL out_di_1_0 : std_logic_vector (1 DOWNTO 0);
    SIGNAL out_di_3_0 : std_logic_vector (3 DOWNTO 0);
	 
	 -- unidade de controle
    SIGNAL out_uc_JUMP : std_logic;
    SIGNAL out_uc_BRANCH : std_logic;
    SIGNAL out_uc_MEMREAD : std_logic;
    SIGNAL out_uc_MEMTOREG : std_logic;
    SIGNAL out_uc_ALUOP : std_logic_vector (3 DOWNTO 0);
    SIGNAL out_uc_MEMWRITE : std_logic;
    SIGNAL out_uc_ALUSRC : std_logic;
    SIGNAL out_uc_REGWRITE : std_logic;
	 
	 -- banco de registradores
    SIGNAL out_enderecoRegA : std_logic_vector (7 DOWNTO 0);
    SIGNAL out_enderecoRegB : std_logic_vector (7 DOWNTO 0);
	 
	 -- extensor sinal 2 bits para 8 bits
    SIGNAL out_extensaoDeSinal2_8 : std_logic_vector (7 DOWNTO 0);
	 
	 -- multiplexador 2X1 8 bits, banco registradores e ula
    SIGNAL out_multiplexador_2X1_8bits : std_logic_vector (7 DOWNTO 0);
	 
	 -- ula
    SIGNAL out_ulaResultado : std_logic_vector (7 DOWNTO 0);
    SIGNAL out_ulaZero : std_logic;
    SIGNAL out_overflow : std_logic;
	 
	 -- memoria Adress
    SIGNAL out_memoriaAdress : std_logic_vector (7 DOWNTO 0);
	 
	 -- multiplexador 2X1 8 bits, ula e memoria adress
    SIGNAL out_mul_2X1_memAdress_ula : std_logic_vector (7 DOWNTO 0);
	 
	 -- extensor sinal 4 bits para 8 bits
    SIGNAL out_extensaoDeSinal4_8 : std_logic_vector (7 DOWNTO 0);
	 
	 -- porta and
    SIGNAL out_portAND : std_logic;
	 
	 -- multiplexador 2X1 8 bits, somador do pc e extensor de sinal 4 bits para 8 bits do jump
    SIGNAL out_mul_2X1_add_pc_jump : std_logic_vector (7 DOWNTO 0);
	 
	 -- multiplexador 2X1 8 bits, saida do multiplexador anterior e o extensor de sinal 4 bits para 8 bits do jump
    SIGNAL out_port_map_mul_2X1_jump : std_logic_vector (7 DOWNTO 0);
	 
	 	
BEGIN

	port_map_addPC : addPC PORT MAP(clock, out_pc, out_addPC);
	
	port_map_pc : pc PORT MAP(clock, out_port_map_mul_2X1_jump, out_pc);
	
	port_map_memoriaInst : memoriaInst PORT MAP(clock, out_pc, out_memoriaInst);
	
	port_map_divisaoDeInstr : divisaoDeInstr PORT MAP (out_memoriaInst, out_di_7_4, out_di_3_2, out_di_1_0, out_di_3_0);
	
	port_map_controle : controle PORT MAP (clock, out_di_7_4, out_uc_JUMP, out_uc_BRANCH, out_uc_MEMREAD, out_uc_MEMTOREG, out_uc_ALUOP, out_uc_MEMWRITE, out_uc_ALUSRC, out_uc_REGWRITE);
	
	port_map_registradores : registradores PORT MAP (clock, out_uc_REGWRITE, out_di_3_2, out_di_1_0, out_mul_2X1_memAdress_ula, out_enderecoRegA, out_enderecoRegB);
	
	port_map_extensaoDeSinal2_8: extensaoDeSinal2_8 PORT MAP (out_di_1_0, out_extensaoDeSinal2_8);
	
	port_map_multiplexador_2X1_8bits_br_ula : multiplexador_2X1_8bits PORT MAP (out_uc_ALUSRC, out_enderecoRegB, out_extensaoDeSinal2_8, out_multiplexador_2X1_8bits);
	
	port_map_ual : ual PORT MAP (clock, out_uc_ALUOP, out_enderecoRegA, out_multiplexador_2X1_8bits, out_ulaResultado, out_ulaZero, out_overflow);
	
	port_map_memoriaAdress : memoriaAdress PORT MAP (clock, out_uc_MEMWRITE, out_uc_MEMREAD, out_extensaoDeSinal2_8, out_ulaResultado, out_memoriaAdress);
	
	port_map_multiplexador_2X1_8bits_memAdress_ula : multiplexador_2X1_8bits PORT MAP (out_uc_MEMTOREG, out_ulaResultado, out_memoriaAdress, out_mul_2X1_memAdress_ula);
	
	port_map_extensaoDeSinal4_8 : extensaoDeSinal4_8 PORT MAP (out_di_3_0, out_extensaoDeSinal4_8);
	
	port_map_portAND : portAND PORT MAP (out_uc_BRANCH, out_ulaZero, out_portAND);
	
	port_map_multiplexador_2X1_8bits_add_pc_jump : multiplexador_2X1_8bits PORT MAP (out_portAND, out_addPC, out_extensaoDeSinal4_8, out_mul_2X1_add_pc_jump);
	
	port_map_multiplexador_2X1_8bits_jump : multiplexador_2X1_8bits PORT MAP (out_uc_JUMP, out_mul_2X1_add_pc_jump, out_extensaoDeSinal4_8, out_port_map_mul_2X1_jump); 
	
	-- Resultados das saidas
	
	out_out_pc 							<= out_pc;
	out_out_rom 						<= out_memoriaInst;
	out_opcode 							<= out_di_7_4;
	out_rs 								<= out_di_3_2;
	out_rt								<= out_di_1_0;
	out_endereco						<= out_di_3_0;
	out_out_br_reg_A					<= out_enderecoRegA;
	out_out_br_reg_B					<= out_enderecoRegb;
	out_out_ula_result				<= out_ulaResultado;
	out_out_overflow					<= out_overflow;
	out_out_memAdress					<= out_memoriaAdress;
	out_out_mul_2X1_memAdress_ula	<= out_mul_2X1_memAdress_ula;	
	
END behavior;