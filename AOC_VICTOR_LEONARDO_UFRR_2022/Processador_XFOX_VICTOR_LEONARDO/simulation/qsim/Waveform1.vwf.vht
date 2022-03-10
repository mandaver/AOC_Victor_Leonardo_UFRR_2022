-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/11/2021 00:42:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          processador_mason
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY processador_mason_vhd_vec_tst IS
END processador_mason_vhd_vec_tst;
ARCHITECTURE processador_mason_arch OF processador_mason_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL out_endereco : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL out_opcode : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL out_out_br_reg_A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_br_reg_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_memAdress : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_mul_2X1_memAdress_ula : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_overflow : STD_LOGIC;
SIGNAL out_out_pc : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_rom : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_out_ula_result : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL out_rs : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL out_rt : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT processador_mason
	PORT (
	clock : IN STD_LOGIC;
	out_endereco : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	out_opcode : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	out_out_br_reg_A : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_br_reg_B : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_memAdress : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_mul_2X1_memAdress_ula : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_overflow : BUFFER STD_LOGIC;
	out_out_pc : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_rom : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_out_ula_result : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	out_rs : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	out_rt : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : processador_mason
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	out_endereco => out_endereco,
	out_opcode => out_opcode,
	out_out_br_reg_A => out_out_br_reg_A,
	out_out_br_reg_B => out_out_br_reg_B,
	out_out_memAdress => out_out_memAdress,
	out_out_mul_2X1_memAdress_ula => out_out_mul_2X1_memAdress_ula,
	out_out_overflow => out_out_overflow,
	out_out_pc => out_out_pc,
	out_out_rom => out_out_rom,
	out_out_ula_result => out_out_ula_result,
	out_rs => out_rs,
	out_rt => out_rt
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 100000 ps;
	clock <= '1';
	WAIT FOR 100000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;
END processador_mason_arch;
