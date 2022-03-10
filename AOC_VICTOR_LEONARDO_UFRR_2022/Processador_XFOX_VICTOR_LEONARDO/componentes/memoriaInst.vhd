LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY memoriaInst IS
    PORT (
        clock : IN std_logic;
        portIN : IN std_logic_vector(7 DOWNTO 0);
        portOUT : OUT std_logic_vector(7 DOWNTO 0)
    );
END memoriaInst;

ARCHITECTURE behavior OF memoriaInst IS
    TYPE memoria_Isnt IS ARRAY (0 TO 255) OF std_logic_vector(7 DOWNTO 0);
    CONSTANT rom : memoria_Isnt := (
	 		 
	 --teste load_ime, add_ime, adicionar, subtrair, sub_ime, multiplicar
	 
    0 => "01010010", -- load_ime S0 2 -- s0 = 2
    1 => "00110111", -- add_ime S1 3 -- s1 = 3
	 2 => "00000001", -- adicionar S0 S1 -- S0 = 5
	 3 => "01010101", -- load_ime S1 1 -- s1 = 1
	 4 => "00010001", -- subtrair s0 s1 -- s0 = 4
	 5 => "01000010", -- sub_ime s0 2 -- s0 = 2
	 6 => "01010111", -- load_ime S1 2 -- s1 = 3
	 7 => "00100001", -- multiplicar s0 s1 -- s0 = 6
	 8 => "10110000", -- jump 0000
	
	-- Teste storew e loadw
	
	 --0 => "01010011", -- load_ime S0 3 
	 --1 => "01110000", -- storew S0 ram(00)  ==  3
	 --2 => "01010010", -- load_ime S0 2
	 --3 => "01110001", -- storew S0 ram(01)  ==  2
	 --4 => "01010101", -- load_ime S1 1
	 --5 => "01100000", -- loadw S0 ram(00) = 3
	 --6 => "00000001", -- adicionar S0 S1 = S0 == 4
	 --7 => "01110000", -- storew S0 ram(00)  ==  5	 
	-- 8 => "10110000", -- jump 0000 
	
	 --Teste beq
	
	 --0 => "01010010", -- load_ime S0 2 -- s0 = 2
    --1 => "01010110", -- load_ime S1 2 -- s1 = 2
    --2 => "10100001", -- if S0 == S1
    --3 => "10000110", -- beq S0 == S1 jump 0110
    --4 => "00110011", -- add_ime S0 3 s0 = 5
    --5 => "00110011", -- add_ime S0 3 s0 = 8
    --6 => "00000001", -- adicionar S0 S1
	 
	 -- Teste bne
    --0 => "01010010", -- load_ime S0 3 -- s0 = 2
    --1 => "01010111", -- load_ime S1 3 -- s1 = 3
    --2 => "10100001", -- if S0 != S1
    --3 => "10010110", -- bne S0 != S1 jump 0110
    --4 => "00110011", -- add_ime S0 3 -- s0 = 6
    --5 => "00110011", -- add_ime S0 3 -- s0 = 9
    --6 => "00000001", -- adicionar S0 S1     

	 -- Teste Fibonacci
    
    -- S2 == i do for
    -- S3 == numero para calcular o fibonacci
    -- variaveis
    -- a == memoria(00)
    -- b == memoria(01)
    -- S0 usado para loadw e storew
    -- S1 == aux
    --0 => "01011111", -- load_ime S3 3
    --1 => "00101111", -- multiplicar S3 S3 == 9
    --2 => "00111111", -- add_ime S3 3  == 12
    --3 => "00111110", -- add_ime S3 2  == 14
   -- 4 => "00111110", -- add_ime S3 2  == 16
   -- 5 => "01011000", -- load_ime S2 0
   -- 6 => "01010000", -- load_ime S0 0 
   -- 7 => "01110000", -- storew S0 ram(00)  ==  a = 0
   -- 8 => "01010001", -- load_ime S0 1
   -- 9 => "01110001", -- storew S0 ram(01) == b = 1
    
   -- 10 => "01100000", -- loadw S0 ram(00)
   -- 11 => "00000100", -- adicionar S1 S0
   --12 => "01100001", -- loadw S0 ram(01)
   -- 13 => "00000100", -- adicionar S1 S0
    --14 => "01110000", -- storew S0 ram(00)  ==  a = b
    --15 => "01110101", -- storew s1 ram(01) == b = aux
    
    --16 => "00111001", -- add_ime s2 1
    --17 => "10101011", -- if S2 == S3
    --18 => "10011010", -- bne S2 != S3 jump 0101
	 
    --19 => "01010000", -- load_ime S0 0
    --20 => "01010100", -- load_ime S1 0
    --21 => "01011000", -- load_ime S2 0
    --22 => "01011100", -- load_ime S3 0	 
	 OTHERS => "00000000");	 
	 
BEGIN
    PROCESS (clock)
    BEGIN
        portOUT <= rom(conv_integer(unsigned(portIN)));
    END PROCESS;
END behavior;