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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/17/2021 17:48:39"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	processador_mason IS
    PORT (
	clock : IN std_logic;
	out_out_pc : BUFFER std_logic_vector(7 DOWNTO 0);
	out_out_rom : BUFFER std_logic_vector(7 DOWNTO 0);
	out_opcode : BUFFER std_logic_vector(3 DOWNTO 0);
	out_rs : BUFFER std_logic_vector(1 DOWNTO 0);
	out_rt : BUFFER std_logic_vector(1 DOWNTO 0);
	out_endereco : BUFFER std_logic_vector(3 DOWNTO 0);
	out_out_br_reg_A : BUFFER std_logic_vector(7 DOWNTO 0);
	out_out_br_reg_B : BUFFER std_logic_vector(7 DOWNTO 0);
	out_out_ula_result : BUFFER std_logic_vector(7 DOWNTO 0);
	out_out_overflow : BUFFER std_logic;
	out_out_memAdress : BUFFER std_logic_vector(7 DOWNTO 0);
	out_out_mul_2X1_memAdress_ula : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END processador_mason;

ARCHITECTURE structure OF processador_mason IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_out_out_pc : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_out_rom : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_opcode : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_out_rs : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_out_rt : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_out_endereco : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_out_out_br_reg_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_out_br_reg_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_out_ula_result : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_out_overflow : std_logic;
SIGNAL ww_out_out_memAdress : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_out_out_mul_2X1_memAdress_ula : std_logic_vector(7 DOWNTO 0);
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~mac_AX_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~mac_AY_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~8\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~9\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~10\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~11\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~12\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~13\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~14\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~15\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~16\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~17\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~18\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~19\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~20\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~21\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~22\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~23\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~24\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~25\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~26\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~27\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~28\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~29\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~30\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~31\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~32\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~33\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~34\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~35\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~36\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~37\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~38\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~39\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~40\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~41\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~42\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~43\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~44\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~45\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~46\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~47\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~48\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~49\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~50\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~51\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~52\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~53\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~54\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~55\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~56\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~57\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~58\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~59\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~60\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~61\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~62\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|Mult0~63\ : std_logic;
SIGNAL \out_out_pc[0]~output_o\ : std_logic;
SIGNAL \out_out_pc[1]~output_o\ : std_logic;
SIGNAL \out_out_pc[2]~output_o\ : std_logic;
SIGNAL \out_out_pc[3]~output_o\ : std_logic;
SIGNAL \out_out_pc[4]~output_o\ : std_logic;
SIGNAL \out_out_pc[5]~output_o\ : std_logic;
SIGNAL \out_out_pc[6]~output_o\ : std_logic;
SIGNAL \out_out_pc[7]~output_o\ : std_logic;
SIGNAL \out_out_rom[0]~output_o\ : std_logic;
SIGNAL \out_out_rom[1]~output_o\ : std_logic;
SIGNAL \out_out_rom[2]~output_o\ : std_logic;
SIGNAL \out_out_rom[3]~output_o\ : std_logic;
SIGNAL \out_out_rom[4]~output_o\ : std_logic;
SIGNAL \out_out_rom[5]~output_o\ : std_logic;
SIGNAL \out_out_rom[6]~output_o\ : std_logic;
SIGNAL \out_out_rom[7]~output_o\ : std_logic;
SIGNAL \out_opcode[0]~output_o\ : std_logic;
SIGNAL \out_opcode[1]~output_o\ : std_logic;
SIGNAL \out_opcode[2]~output_o\ : std_logic;
SIGNAL \out_opcode[3]~output_o\ : std_logic;
SIGNAL \out_rs[0]~output_o\ : std_logic;
SIGNAL \out_rs[1]~output_o\ : std_logic;
SIGNAL \out_rt[0]~output_o\ : std_logic;
SIGNAL \out_rt[1]~output_o\ : std_logic;
SIGNAL \out_endereco[0]~output_o\ : std_logic;
SIGNAL \out_endereco[1]~output_o\ : std_logic;
SIGNAL \out_endereco[2]~output_o\ : std_logic;
SIGNAL \out_endereco[3]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[0]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[1]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[2]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[3]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[4]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[5]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[6]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_A[7]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[0]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[1]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[2]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[3]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[4]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[5]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[6]~output_o\ : std_logic;
SIGNAL \out_out_br_reg_B[7]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[0]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[1]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[2]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[3]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[4]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[5]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[6]~output_o\ : std_logic;
SIGNAL \out_out_ula_result[7]~output_o\ : std_logic;
SIGNAL \out_out_overflow~output_o\ : std_logic;
SIGNAL \out_out_memAdress[0]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[1]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[2]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[3]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[4]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[5]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[6]~output_o\ : std_logic;
SIGNAL \out_out_memAdress[7]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[0]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[1]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[2]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[3]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[4]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[5]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[6]~output_o\ : std_logic;
SIGNAL \out_out_mul_2X1_memAdress_ula[7]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \port_map_addPC|Add0~18\ : std_logic;
SIGNAL \port_map_addPC|Add0~21_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[5]~6_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~22\ : std_logic;
SIGNAL \port_map_addPC|Add0~25_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[6]~7_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux6~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux5~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux5~1_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~2\ : std_logic;
SIGNAL \port_map_addPC|Add0~5_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[1]~2_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux4~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux0~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux4~1_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~6\ : std_logic;
SIGNAL \port_map_addPC|Add0~9_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~3_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~10\ : std_logic;
SIGNAL \port_map_addPC|Add0~13_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[3]~4_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~14\ : std_logic;
SIGNAL \port_map_addPC|Add0~17_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[4]~5_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux3~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux3~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux2~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux2~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux1~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux1~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux0~1_combout\ : std_logic;
SIGNAL \port_map_controle|Mux5~0_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~7_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~2_combout\ : std_logic;
SIGNAL \port_map_controle|Mux7~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux6~0_combout\ : std_logic;
SIGNAL \port_map_controle|Mux8~0_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~60_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~11_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~51_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux6~3_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~1_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux5~4_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~65_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~17_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~68_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~64_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~16_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~69_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~63_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~15_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~70_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~62_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~14_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~71_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~61_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~13_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~72_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~12_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~52_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux5~2_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~2\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~6\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~10\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~14\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~18\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~22\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~25_sumout\ : std_logic;
SIGNAL \port_map_controle|Mux6~0_combout\ : std_logic;
SIGNAL \port_map_controle|Mux3~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~34_cout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~2\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~6\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~10\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~14\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~18\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~22\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~25_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux5~3_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~66_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~18_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~67_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~26\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~29_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~26\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~29_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~53_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~54_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~55_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~56_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~57_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[6]~6_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~58_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|portOUT[7]~7_combout\ : std_logic;
SIGNAL \port_map_ual|Mux4~0_combout\ : std_logic;
SIGNAL \port_map_ual|Mux4~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \port_map_ual|Mux4~2_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~59_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~26_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~50_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~5_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~6_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \port_map_ual|Mux5~8_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~25_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~49_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~21_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux6~0_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~0_combout\ : std_logic;
SIGNAL \port_map_ual|Mux5~1_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~21_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux6~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux6~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~24_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~48_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~17_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux7~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~17_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux7~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux7~3_combout\ : std_logic;
SIGNAL \port_map_ual|Mux7~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~23_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~47_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~13_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux8~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~13_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux8~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux8~3_combout\ : std_logic;
SIGNAL \port_map_ual|Mux8~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~22_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~46_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~9_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux9~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~9_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux9~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux9~3_combout\ : std_logic;
SIGNAL \port_map_ual|Mux9~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~21_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~45_combout\ : std_logic;
SIGNAL \port_map_ual|Mux11~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~1_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux11~1_combout\ : std_logic;
SIGNAL \port_map_ual|Mux11~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux11~3_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~19_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~43_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|Add0~5_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux10~0_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|Add0~5_sumout\ : std_logic;
SIGNAL \port_map_ual|Mux10~2_combout\ : std_logic;
SIGNAL \port_map_ual|Mux10~3_combout\ : std_logic;
SIGNAL \port_map_ual|Mux10~1_combout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\ : std_logic;
SIGNAL \port_map_registradores|registrador~20_q\ : std_logic;
SIGNAL \port_map_registradores|registrador~44_combout\ : std_logic;
SIGNAL \port_map_ual|Equal0~0_combout\ : std_logic;
SIGNAL \port_map_ual|Equal0~1_combout\ : std_logic;
SIGNAL \port_map_ual|Equal0~2_combout\ : std_logic;
SIGNAL \port_map_ual|Equal0~3_combout\ : std_logic;
SIGNAL \port_map_ual|Equal0~4_combout\ : std_logic;
SIGNAL \port_map_ual|Mux2~0_combout\ : std_logic;
SIGNAL \port_map_ual|in_tempZero~combout\ : std_logic;
SIGNAL \port_map_ual|Mux1~0_combout\ : std_logic;
SIGNAL \port_map_ual|Mux0~0_combout\ : std_logic;
SIGNAL \port_map_ual|zero~combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~26\ : std_logic;
SIGNAL \port_map_addPC|Add0~29_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[7]~8_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|Mux6~2_combout\ : std_logic;
SIGNAL \port_map_addPC|Add0~1_sumout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|portOUT[0]~1_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|portOUT\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \port_map_pc|portOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \port_map_ual|ALT_INV_in_tempZero~combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_zero~combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~72_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~71_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~70_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~69_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~68_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~67_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux7~3_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux11~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux8~3_combout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux9~3_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux10~3_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~66_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~65_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~64_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~63_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~62_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~61_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux5~2_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux6~3_combout\ : std_logic;
SIGNAL \port_map_controle|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux4~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~8_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux6~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux8~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux9~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux10~2_combout\ : std_logic;
SIGNAL \port_map_controle|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux11~1_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~7_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~5_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~4_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~3_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[5]~5_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[4]~4_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[3]~3_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[2]~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[1]~1_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[0]~0_combout\ : std_logic;
SIGNAL \port_map_controle|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~2_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \port_map_ual|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \port_map_controle|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~58_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~57_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~56_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~55_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~54_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~53_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~52_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~51_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~50_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~18_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~26_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~49_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~17_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~25_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~48_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~16_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~24_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~47_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~15_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~23_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~46_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~14_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~22_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~45_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~13_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~21_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~44_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~12_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~20_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~43_combout\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~11_q\ : std_logic;
SIGNAL \port_map_registradores|ALT_INV_registrador~19_q\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux6~2_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \port_map_memoriaInst|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \port_map_pc|ALT_INV_portOUT\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \port_map_addPC|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \port_map_addPC|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ : std_logic;
SIGNAL \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_adicionador|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_subtrair|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clock <= clock;
out_out_pc <= ww_out_out_pc;
out_out_rom <= ww_out_out_rom;
out_opcode <= ww_out_opcode;
out_rs <= ww_out_rs;
out_rt <= ww_out_rt;
out_endereco <= ww_out_endereco;
out_out_br_reg_A <= ww_out_out_br_reg_A;
out_out_br_reg_B <= ww_out_out_br_reg_B;
out_out_ula_result <= ww_out_out_ula_result;
out_out_overflow <= ww_out_out_overflow;
out_out_memAdress <= ww_out_out_memAdress;
out_out_mul_2X1_memAdress_ula <= ww_out_out_mul_2X1_memAdress_ula;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\port_map_ual|portMap_multiplicar|Mult0~mac_AX_bus\ <= (\port_map_registradores|registrador~50_combout\ & \port_map_registradores|registrador~49_combout\ & \port_map_registradores|registrador~48_combout\ & \port_map_registradores|registrador~47_combout\
& \port_map_registradores|registrador~46_combout\ & \port_map_registradores|registrador~45_combout\ & \port_map_registradores|registrador~44_combout\ & \port_map_registradores|registrador~43_combout\);

\port_map_ual|portMap_multiplicar|Mult0~mac_AY_bus\ <= (\port_map_multiplexador_2X1_8bits_br_ula|portOUT[7]~7_combout\ & \port_map_multiplexador_2X1_8bits_br_ula|portOUT[6]~6_combout\ & \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\ & 
\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\ & \port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\ & \port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\ & 
\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\ & \port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\);

\port_map_ual|portMap_multiplicar|portOUT\(0) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(0);
\port_map_ual|portMap_multiplicar|portOUT\(1) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(1);
\port_map_ual|portMap_multiplicar|portOUT\(2) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(2);
\port_map_ual|portMap_multiplicar|portOUT\(3) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(3);
\port_map_ual|portMap_multiplicar|portOUT\(4) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(4);
\port_map_ual|portMap_multiplicar|portOUT\(5) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(5);
\port_map_ual|portMap_multiplicar|portOUT\(6) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(6);
\port_map_ual|portMap_multiplicar|portOUT\(7) <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(7);
\port_map_ual|portMap_multiplicar|Mult0~8\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(8);
\port_map_ual|portMap_multiplicar|Mult0~9\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(9);
\port_map_ual|portMap_multiplicar|Mult0~10\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(10);
\port_map_ual|portMap_multiplicar|Mult0~11\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(11);
\port_map_ual|portMap_multiplicar|Mult0~12\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(12);
\port_map_ual|portMap_multiplicar|Mult0~13\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(13);
\port_map_ual|portMap_multiplicar|Mult0~14\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(14);
\port_map_ual|portMap_multiplicar|Mult0~15\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(15);
\port_map_ual|portMap_multiplicar|Mult0~16\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(16);
\port_map_ual|portMap_multiplicar|Mult0~17\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(17);
\port_map_ual|portMap_multiplicar|Mult0~18\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(18);
\port_map_ual|portMap_multiplicar|Mult0~19\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(19);
\port_map_ual|portMap_multiplicar|Mult0~20\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(20);
\port_map_ual|portMap_multiplicar|Mult0~21\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(21);
\port_map_ual|portMap_multiplicar|Mult0~22\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(22);
\port_map_ual|portMap_multiplicar|Mult0~23\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(23);
\port_map_ual|portMap_multiplicar|Mult0~24\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(24);
\port_map_ual|portMap_multiplicar|Mult0~25\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(25);
\port_map_ual|portMap_multiplicar|Mult0~26\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(26);
\port_map_ual|portMap_multiplicar|Mult0~27\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(27);
\port_map_ual|portMap_multiplicar|Mult0~28\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(28);
\port_map_ual|portMap_multiplicar|Mult0~29\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(29);
\port_map_ual|portMap_multiplicar|Mult0~30\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(30);
\port_map_ual|portMap_multiplicar|Mult0~31\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(31);
\port_map_ual|portMap_multiplicar|Mult0~32\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(32);
\port_map_ual|portMap_multiplicar|Mult0~33\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(33);
\port_map_ual|portMap_multiplicar|Mult0~34\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(34);
\port_map_ual|portMap_multiplicar|Mult0~35\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(35);
\port_map_ual|portMap_multiplicar|Mult0~36\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(36);
\port_map_ual|portMap_multiplicar|Mult0~37\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(37);
\port_map_ual|portMap_multiplicar|Mult0~38\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(38);
\port_map_ual|portMap_multiplicar|Mult0~39\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(39);
\port_map_ual|portMap_multiplicar|Mult0~40\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(40);
\port_map_ual|portMap_multiplicar|Mult0~41\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(41);
\port_map_ual|portMap_multiplicar|Mult0~42\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(42);
\port_map_ual|portMap_multiplicar|Mult0~43\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(43);
\port_map_ual|portMap_multiplicar|Mult0~44\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(44);
\port_map_ual|portMap_multiplicar|Mult0~45\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(45);
\port_map_ual|portMap_multiplicar|Mult0~46\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(46);
\port_map_ual|portMap_multiplicar|Mult0~47\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(47);
\port_map_ual|portMap_multiplicar|Mult0~48\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(48);
\port_map_ual|portMap_multiplicar|Mult0~49\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(49);
\port_map_ual|portMap_multiplicar|Mult0~50\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(50);
\port_map_ual|portMap_multiplicar|Mult0~51\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(51);
\port_map_ual|portMap_multiplicar|Mult0~52\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(52);
\port_map_ual|portMap_multiplicar|Mult0~53\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(53);
\port_map_ual|portMap_multiplicar|Mult0~54\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(54);
\port_map_ual|portMap_multiplicar|Mult0~55\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(55);
\port_map_ual|portMap_multiplicar|Mult0~56\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(56);
\port_map_ual|portMap_multiplicar|Mult0~57\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(57);
\port_map_ual|portMap_multiplicar|Mult0~58\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(58);
\port_map_ual|portMap_multiplicar|Mult0~59\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(59);
\port_map_ual|portMap_multiplicar|Mult0~60\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(60);
\port_map_ual|portMap_multiplicar|Mult0~61\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(61);
\port_map_ual|portMap_multiplicar|Mult0~62\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(62);
\port_map_ual|portMap_multiplicar|Mult0~63\ <= \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\(63);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \port_map_ual|Mux11~3_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \port_map_ual|Mux10~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \port_map_ual|Mux9~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \port_map_ual|Mux8~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \port_map_ual|Mux7~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \port_map_ual|Mux6~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \port_map_ual|Mux5~6_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \port_map_ual|Mux4~1_combout\;

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\port_map_memoriaInst|Mux5~1_combout\ & \port_map_memoriaInst|Mux6~2_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);
\port_map_ual|ALT_INV_in_tempZero~combout\ <= NOT \port_map_ual|in_tempZero~combout\;
\port_map_ual|ALT_INV_zero~combout\ <= NOT \port_map_ual|zero~combout\;
\port_map_registradores|ALT_INV_registrador~72_combout\ <= NOT \port_map_registradores|registrador~72_combout\;
\port_map_registradores|ALT_INV_registrador~71_combout\ <= NOT \port_map_registradores|registrador~71_combout\;
\port_map_registradores|ALT_INV_registrador~70_combout\ <= NOT \port_map_registradores|registrador~70_combout\;
\port_map_registradores|ALT_INV_registrador~69_combout\ <= NOT \port_map_registradores|registrador~69_combout\;
\port_map_registradores|ALT_INV_registrador~68_combout\ <= NOT \port_map_registradores|registrador~68_combout\;
\port_map_registradores|ALT_INV_registrador~67_combout\ <= NOT \port_map_registradores|registrador~67_combout\;
\port_map_ual|ALT_INV_Mux7~3_combout\ <= NOT \port_map_ual|Mux7~3_combout\;
\port_map_ual|ALT_INV_Mux11~2_combout\ <= NOT \port_map_ual|Mux11~2_combout\;
\port_map_ual|ALT_INV_Mux8~3_combout\ <= NOT \port_map_ual|Mux8~3_combout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~1_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~1_sumout\;
\port_map_ual|ALT_INV_Mux9~3_combout\ <= NOT \port_map_ual|Mux9~3_combout\;
\port_map_ual|ALT_INV_Mux10~3_combout\ <= NOT \port_map_ual|Mux10~3_combout\;
\port_map_memoriaInst|ALT_INV_Mux1~1_combout\ <= NOT \port_map_memoriaInst|Mux1~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux2~1_combout\ <= NOT \port_map_memoriaInst|Mux2~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux3~1_combout\ <= NOT \port_map_memoriaInst|Mux3~1_combout\;
\port_map_ual|ALT_INV_Mux2~0_combout\ <= NOT \port_map_ual|Mux2~0_combout\;
\port_map_ual|ALT_INV_Equal0~4_combout\ <= NOT \port_map_ual|Equal0~4_combout\;
\port_map_ual|ALT_INV_Equal0~3_combout\ <= NOT \port_map_ual|Equal0~3_combout\;
\port_map_ual|ALT_INV_Equal0~2_combout\ <= NOT \port_map_ual|Equal0~2_combout\;
\port_map_ual|ALT_INV_Equal0~1_combout\ <= NOT \port_map_ual|Equal0~1_combout\;
\port_map_ual|ALT_INV_Equal0~0_combout\ <= NOT \port_map_ual|Equal0~0_combout\;
\port_map_ual|ALT_INV_Mux0~0_combout\ <= NOT \port_map_ual|Mux0~0_combout\;
\port_map_ual|ALT_INV_Mux1~0_combout\ <= NOT \port_map_ual|Mux1~0_combout\;
\port_map_registradores|ALT_INV_registrador~66_combout\ <= NOT \port_map_registradores|registrador~66_combout\;
\port_map_registradores|ALT_INV_registrador~65_combout\ <= NOT \port_map_registradores|registrador~65_combout\;
\port_map_registradores|ALT_INV_registrador~64_combout\ <= NOT \port_map_registradores|registrador~64_combout\;
\port_map_registradores|ALT_INV_registrador~63_combout\ <= NOT \port_map_registradores|registrador~63_combout\;
\port_map_registradores|ALT_INV_registrador~62_combout\ <= NOT \port_map_registradores|registrador~62_combout\;
\port_map_registradores|ALT_INV_registrador~61_combout\ <= NOT \port_map_registradores|registrador~61_combout\;
\port_map_memoriaInst|ALT_INV_Mux5~2_combout\ <= NOT \port_map_memoriaInst|Mux5~2_combout\;
\port_map_memoriaInst|ALT_INV_Mux6~3_combout\ <= NOT \port_map_memoriaInst|Mux6~3_combout\;
\port_map_controle|ALT_INV_Mux8~0_combout\ <= NOT \port_map_controle|Mux8~0_combout\;
\port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\ <= NOT \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\;
\port_map_ual|ALT_INV_Mux4~2_combout\ <= NOT \port_map_ual|Mux4~2_combout\;
\port_map_ual|ALT_INV_Mux5~8_combout\ <= NOT \port_map_ual|Mux5~8_combout\;
\port_map_ual|ALT_INV_Mux6~2_combout\ <= NOT \port_map_ual|Mux6~2_combout\;
\port_map_ual|ALT_INV_Mux7~2_combout\ <= NOT \port_map_ual|Mux7~2_combout\;
\port_map_ual|ALT_INV_Mux8~2_combout\ <= NOT \port_map_ual|Mux8~2_combout\;
\port_map_ual|ALT_INV_Mux9~2_combout\ <= NOT \port_map_ual|Mux9~2_combout\;
\port_map_ual|ALT_INV_Mux10~2_combout\ <= NOT \port_map_ual|Mux10~2_combout\;
\port_map_controle|ALT_INV_Mux3~0_combout\ <= NOT \port_map_controle|Mux3~0_combout\;
\port_map_ual|ALT_INV_Mux11~1_combout\ <= NOT \port_map_ual|Mux11~1_combout\;
\port_map_ual|ALT_INV_Mux5~7_combout\ <= NOT \port_map_ual|Mux5~7_combout\;
\port_map_ual|ALT_INV_Mux4~0_combout\ <= NOT \port_map_ual|Mux4~0_combout\;
\port_map_ual|ALT_INV_Mux5~5_combout\ <= NOT \port_map_ual|Mux5~5_combout\;
\port_map_ual|ALT_INV_Mux5~4_combout\ <= NOT \port_map_ual|Mux5~4_combout\;
\port_map_ual|ALT_INV_Mux5~3_combout\ <= NOT \port_map_ual|Mux5~3_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[5]~5_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\;
\port_map_ual|ALT_INV_Mux6~0_combout\ <= NOT \port_map_ual|Mux6~0_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[4]~4_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\;
\port_map_ual|ALT_INV_Mux7~0_combout\ <= NOT \port_map_ual|Mux7~0_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[3]~3_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\;
\port_map_ual|ALT_INV_Mux8~0_combout\ <= NOT \port_map_ual|Mux8~0_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[2]~2_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\;
\port_map_ual|ALT_INV_Mux9~0_combout\ <= NOT \port_map_ual|Mux9~0_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[1]~1_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\;
\port_map_ual|ALT_INV_Mux10~0_combout\ <= NOT \port_map_ual|Mux10~0_combout\;
\port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[0]~0_combout\ <= NOT \port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\;
\port_map_controle|ALT_INV_Mux7~0_combout\ <= NOT \port_map_controle|Mux7~0_combout\;
\port_map_ual|ALT_INV_Mux11~0_combout\ <= NOT \port_map_ual|Mux11~0_combout\;
\port_map_ual|ALT_INV_Mux5~2_combout\ <= NOT \port_map_ual|Mux5~2_combout\;
\port_map_ual|ALT_INV_Mux5~1_combout\ <= NOT \port_map_ual|Mux5~1_combout\;
\port_map_ual|ALT_INV_Mux5~0_combout\ <= NOT \port_map_ual|Mux5~0_combout\;
\port_map_controle|ALT_INV_Mux5~0_combout\ <= NOT \port_map_controle|Mux5~0_combout\;
\port_map_registradores|ALT_INV_registrador~58_combout\ <= NOT \port_map_registradores|registrador~58_combout\;
\port_map_registradores|ALT_INV_registrador~57_combout\ <= NOT \port_map_registradores|registrador~57_combout\;
\port_map_registradores|ALT_INV_registrador~56_combout\ <= NOT \port_map_registradores|registrador~56_combout\;
\port_map_registradores|ALT_INV_registrador~55_combout\ <= NOT \port_map_registradores|registrador~55_combout\;
\port_map_registradores|ALT_INV_registrador~54_combout\ <= NOT \port_map_registradores|registrador~54_combout\;
\port_map_registradores|ALT_INV_registrador~53_combout\ <= NOT \port_map_registradores|registrador~53_combout\;
\port_map_registradores|ALT_INV_registrador~52_combout\ <= NOT \port_map_registradores|registrador~52_combout\;
\port_map_registradores|ALT_INV_registrador~51_combout\ <= NOT \port_map_registradores|registrador~51_combout\;
\port_map_registradores|ALT_INV_registrador~50_combout\ <= NOT \port_map_registradores|registrador~50_combout\;
\port_map_registradores|ALT_INV_registrador~18_q\ <= NOT \port_map_registradores|registrador~18_q\;
\port_map_registradores|ALT_INV_registrador~26_q\ <= NOT \port_map_registradores|registrador~26_q\;
\port_map_registradores|ALT_INV_registrador~49_combout\ <= NOT \port_map_registradores|registrador~49_combout\;
\port_map_registradores|ALT_INV_registrador~17_q\ <= NOT \port_map_registradores|registrador~17_q\;
\port_map_registradores|ALT_INV_registrador~25_q\ <= NOT \port_map_registradores|registrador~25_q\;
\port_map_registradores|ALT_INV_registrador~48_combout\ <= NOT \port_map_registradores|registrador~48_combout\;
\port_map_registradores|ALT_INV_registrador~16_q\ <= NOT \port_map_registradores|registrador~16_q\;
\port_map_registradores|ALT_INV_registrador~24_q\ <= NOT \port_map_registradores|registrador~24_q\;
\port_map_registradores|ALT_INV_registrador~47_combout\ <= NOT \port_map_registradores|registrador~47_combout\;
\port_map_registradores|ALT_INV_registrador~15_q\ <= NOT \port_map_registradores|registrador~15_q\;
\port_map_registradores|ALT_INV_registrador~23_q\ <= NOT \port_map_registradores|registrador~23_q\;
\port_map_registradores|ALT_INV_registrador~46_combout\ <= NOT \port_map_registradores|registrador~46_combout\;
\port_map_registradores|ALT_INV_registrador~14_q\ <= NOT \port_map_registradores|registrador~14_q\;
\port_map_registradores|ALT_INV_registrador~22_q\ <= NOT \port_map_registradores|registrador~22_q\;
\port_map_registradores|ALT_INV_registrador~45_combout\ <= NOT \port_map_registradores|registrador~45_combout\;
\port_map_registradores|ALT_INV_registrador~13_q\ <= NOT \port_map_registradores|registrador~13_q\;
\port_map_registradores|ALT_INV_registrador~21_q\ <= NOT \port_map_registradores|registrador~21_q\;
\port_map_registradores|ALT_INV_registrador~44_combout\ <= NOT \port_map_registradores|registrador~44_combout\;
\port_map_registradores|ALT_INV_registrador~12_q\ <= NOT \port_map_registradores|registrador~12_q\;
\port_map_registradores|ALT_INV_registrador~20_q\ <= NOT \port_map_registradores|registrador~20_q\;
\port_map_registradores|ALT_INV_registrador~43_combout\ <= NOT \port_map_registradores|registrador~43_combout\;
\port_map_registradores|ALT_INV_registrador~11_q\ <= NOT \port_map_registradores|registrador~11_q\;
\port_map_registradores|ALT_INV_registrador~19_q\ <= NOT \port_map_registradores|registrador~19_q\;
\port_map_memoriaInst|ALT_INV_Mux0~1_combout\ <= NOT \port_map_memoriaInst|Mux0~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux1~0_combout\ <= NOT \port_map_memoriaInst|Mux1~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux2~0_combout\ <= NOT \port_map_memoriaInst|Mux2~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux3~0_combout\ <= NOT \port_map_memoriaInst|Mux3~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux4~1_combout\ <= NOT \port_map_memoriaInst|Mux4~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux0~0_combout\ <= NOT \port_map_memoriaInst|Mux0~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux4~0_combout\ <= NOT \port_map_memoriaInst|Mux4~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux5~1_combout\ <= NOT \port_map_memoriaInst|Mux5~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux5~0_combout\ <= NOT \port_map_memoriaInst|Mux5~0_combout\;
\port_map_memoriaInst|ALT_INV_Mux6~2_combout\ <= NOT \port_map_memoriaInst|Mux6~2_combout\;
\port_map_memoriaInst|ALT_INV_Mux6~1_combout\ <= NOT \port_map_memoriaInst|Mux6~1_combout\;
\port_map_memoriaInst|ALT_INV_Mux6~0_combout\ <= NOT \port_map_memoriaInst|Mux6~0_combout\;
\port_map_pc|ALT_INV_portOUT\(7) <= NOT \port_map_pc|portOUT\(7);
\port_map_pc|ALT_INV_portOUT\(6) <= NOT \port_map_pc|portOUT\(6);
\port_map_pc|ALT_INV_portOUT\(5) <= NOT \port_map_pc|portOUT\(5);
\port_map_pc|ALT_INV_portOUT\(4) <= NOT \port_map_pc|portOUT\(4);
\port_map_pc|ALT_INV_portOUT\(3) <= NOT \port_map_pc|portOUT\(3);
\port_map_pc|ALT_INV_portOUT\(2) <= NOT \port_map_pc|portOUT\(2);
\port_map_pc|ALT_INV_portOUT\(1) <= NOT \port_map_pc|portOUT\(1);
\port_map_pc|ALT_INV_portOUT\(0) <= NOT \port_map_pc|portOUT\(0);
\port_map_addPC|ALT_INV_Add0~29_sumout\ <= NOT \port_map_addPC|Add0~29_sumout\;
\port_map_addPC|ALT_INV_Add0~25_sumout\ <= NOT \port_map_addPC|Add0~25_sumout\;
\port_map_addPC|ALT_INV_Add0~21_sumout\ <= NOT \port_map_addPC|Add0~21_sumout\;
\port_map_addPC|ALT_INV_Add0~17_sumout\ <= NOT \port_map_addPC|Add0~17_sumout\;
\port_map_addPC|ALT_INV_Add0~13_sumout\ <= NOT \port_map_addPC|Add0~13_sumout\;
\port_map_addPC|ALT_INV_Add0~9_sumout\ <= NOT \port_map_addPC|Add0~9_sumout\;
\port_map_addPC|ALT_INV_Add0~5_sumout\ <= NOT \port_map_addPC|Add0~5_sumout\;
\port_map_addPC|ALT_INV_Add0~1_sumout\ <= NOT \port_map_addPC|Add0~1_sumout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\;
\port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~29_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~29_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~29_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~29_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~25_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~25_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~25_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~25_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~21_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~21_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~21_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~21_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~17_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~17_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~17_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~17_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~13_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~13_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~13_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~13_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~9_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~9_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~9_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~9_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~5_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~5_sumout\;
\port_map_ual|portMap_adicionador|ALT_INV_Add0~5_sumout\ <= NOT \port_map_ual|portMap_adicionador|Add0~5_sumout\;
\port_map_ual|portMap_subtrair|ALT_INV_Add0~1_sumout\ <= NOT \port_map_ual|portMap_subtrair|Add0~1_sumout\;
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(7) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(7);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(6) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(6);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(5) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(5);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(4) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(4);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(3) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(3);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(2) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(2);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(1) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(1);
\port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(0) <= NOT \port_map_ual|portMap_multiplicar|portOUT\(0);

\out_out_pc[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(0),
	devoe => ww_devoe,
	o => \out_out_pc[0]~output_o\);

\out_out_pc[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(1),
	devoe => ww_devoe,
	o => \out_out_pc[1]~output_o\);

\out_out_pc[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(2),
	devoe => ww_devoe,
	o => \out_out_pc[2]~output_o\);

\out_out_pc[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(3),
	devoe => ww_devoe,
	o => \out_out_pc[3]~output_o\);

\out_out_pc[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(4),
	devoe => ww_devoe,
	o => \out_out_pc[4]~output_o\);

\out_out_pc[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(5),
	devoe => ww_devoe,
	o => \out_out_pc[5]~output_o\);

\out_out_pc[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(6),
	devoe => ww_devoe,
	o => \out_out_pc[6]~output_o\);

\out_out_pc[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_pc|portOUT\(7),
	devoe => ww_devoe,
	o => \out_out_pc[7]~output_o\);

\out_out_rom[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux6~2_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[0]~output_o\);

\out_out_rom[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[1]~output_o\);

\out_out_rom[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[2]~output_o\);

\out_out_rom[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_out_rom[3]~output_o\);

\out_out_rom[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[4]~output_o\);

\out_out_rom[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[5]~output_o\);

\out_out_rom[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[6]~output_o\);

\out_out_rom[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux0~1_combout\,
	devoe => ww_devoe,
	o => \out_out_rom[7]~output_o\);

\out_opcode[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \out_opcode[0]~output_o\);

\out_opcode[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \out_opcode[1]~output_o\);

\out_opcode[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \out_opcode[2]~output_o\);

\out_opcode[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux0~1_combout\,
	devoe => ww_devoe,
	o => \out_opcode[3]~output_o\);

\out_rs[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \out_rs[0]~output_o\);

\out_rs[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_rs[1]~output_o\);

\out_rt[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux6~2_combout\,
	devoe => ww_devoe,
	o => \out_rt[0]~output_o\);

\out_rt[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \out_rt[1]~output_o\);

\out_endereco[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux6~2_combout\,
	devoe => ww_devoe,
	o => \out_endereco[0]~output_o\);

\out_endereco[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \out_endereco[1]~output_o\);

\out_endereco[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaInst|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \out_endereco[2]~output_o\);

\out_endereco[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_endereco[3]~output_o\);

\out_out_br_reg_A[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~43_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[0]~output_o\);

\out_out_br_reg_A[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~44_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[1]~output_o\);

\out_out_br_reg_A[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~45_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[2]~output_o\);

\out_out_br_reg_A[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~46_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[3]~output_o\);

\out_out_br_reg_A[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~47_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[4]~output_o\);

\out_out_br_reg_A[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~48_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[5]~output_o\);

\out_out_br_reg_A[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~49_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[6]~output_o\);

\out_out_br_reg_A[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~50_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_A[7]~output_o\);

\out_out_br_reg_B[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~51_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[0]~output_o\);

\out_out_br_reg_B[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~52_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[1]~output_o\);

\out_out_br_reg_B[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~53_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[2]~output_o\);

\out_out_br_reg_B[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~54_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[3]~output_o\);

\out_out_br_reg_B[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~55_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[4]~output_o\);

\out_out_br_reg_B[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~56_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[5]~output_o\);

\out_out_br_reg_B[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~57_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[6]~output_o\);

\out_out_br_reg_B[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_registradores|registrador~58_combout\,
	devoe => ww_devoe,
	o => \out_out_br_reg_B[7]~output_o\);

\out_out_ula_result[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux11~3_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[0]~output_o\);

\out_out_ula_result[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux10~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[1]~output_o\);

\out_out_ula_result[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux9~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[2]~output_o\);

\out_out_ula_result[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux8~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[3]~output_o\);

\out_out_ula_result[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux7~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[4]~output_o\);

\out_out_ula_result[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[5]~output_o\);

\out_out_ula_result[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux5~6_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[6]~output_o\);

\out_out_ula_result[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_ual|Mux4~1_combout\,
	devoe => ww_devoe,
	o => \out_out_ula_result[7]~output_o\);

\out_out_overflow~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_out_overflow~output_o\);

\out_out_memAdress[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[0]~output_o\);

\out_out_memAdress[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[1]~output_o\);

\out_out_memAdress[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[2]~output_o\);

\out_out_memAdress[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[3]~output_o\);

\out_out_memAdress[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[4]~output_o\);

\out_out_memAdress[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[5]~output_o\);

\out_out_memAdress[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[6]~output_o\);

\out_out_memAdress[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	devoe => ww_devoe,
	o => \out_out_memAdress[7]~output_o\);

\out_out_mul_2X1_memAdress_ula[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[0]~output_o\);

\out_out_mul_2X1_memAdress_ula[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[1]~output_o\);

\out_out_mul_2X1_memAdress_ula[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[2]~output_o\);

\out_out_mul_2X1_memAdress_ula[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[3]~output_o\);

\out_out_mul_2X1_memAdress_ula[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[4]~output_o\);

\out_out_mul_2X1_memAdress_ula[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[5]~output_o\);

\out_out_mul_2X1_memAdress_ula[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[6]~output_o\);

\out_out_mul_2X1_memAdress_ula[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\,
	devoe => ww_devoe,
	o => \out_out_mul_2X1_memAdress_ula[7]~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\port_map_addPC|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~17_sumout\ = SUM(( \port_map_pc|portOUT\(4) ) + ( GND ) + ( \port_map_addPC|Add0~14\ ))
-- \port_map_addPC|Add0~18\ = CARRY(( \port_map_pc|portOUT\(4) ) + ( GND ) + ( \port_map_addPC|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(4),
	cin => \port_map_addPC|Add0~14\,
	sumout => \port_map_addPC|Add0~17_sumout\,
	cout => \port_map_addPC|Add0~18\);

\port_map_addPC|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~21_sumout\ = SUM(( \port_map_pc|portOUT\(5) ) + ( GND ) + ( \port_map_addPC|Add0~18\ ))
-- \port_map_addPC|Add0~22\ = CARRY(( \port_map_pc|portOUT\(5) ) + ( GND ) + ( \port_map_addPC|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(5),
	cin => \port_map_addPC|Add0~18\,
	sumout => \port_map_addPC|Add0~21_sumout\,
	cout => \port_map_addPC|Add0~22\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[5]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[5]~6_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & \port_map_addPC|Add0~21_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datab => \port_map_addPC|ALT_INV_Add0~21_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[5]~6_combout\);

\port_map_pc|portOUT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(5));

\port_map_addPC|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~25_sumout\ = SUM(( \port_map_pc|portOUT\(6) ) + ( GND ) + ( \port_map_addPC|Add0~22\ ))
-- \port_map_addPC|Add0~26\ = CARRY(( \port_map_pc|portOUT\(6) ) + ( GND ) + ( \port_map_addPC|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(6),
	cin => \port_map_addPC|Add0~22\,
	sumout => \port_map_addPC|Add0~25_sumout\,
	cout => \port_map_addPC|Add0~26\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[6]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[6]~7_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & \port_map_addPC|Add0~25_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datab => \port_map_addPC|ALT_INV_Add0~25_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[6]~7_combout\);

\port_map_pc|portOUT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[6]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(6));

\port_map_memoriaInst|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux6~1_combout\ = (!\port_map_pc|portOUT\(4) & (!\port_map_pc|portOUT\(5) & !\port_map_pc|portOUT\(6)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(4),
	datab => \port_map_pc|ALT_INV_portOUT\(5),
	datac => \port_map_pc|ALT_INV_portOUT\(6),
	combout => \port_map_memoriaInst|Mux6~1_combout\);

\port_map_memoriaInst|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux5~0_combout\ = (!\port_map_pc|portOUT\(3) & (!\port_map_pc|portOUT\(1) $ (((!\port_map_pc|portOUT\(0) & \port_map_pc|portOUT\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100011000000000110001100000000011000110000000001100011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	combout => \port_map_memoriaInst|Mux5~0_combout\);

\port_map_memoriaInst|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux5~1_combout\ = (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~1_combout\ & \port_map_memoriaInst|Mux5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000010000000100000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	combout => \port_map_memoriaInst|Mux5~1_combout\);

\port_map_addPC|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~1_sumout\ = SUM(( \port_map_pc|portOUT\(0) ) + ( VCC ) + ( !VCC ))
-- \port_map_addPC|Add0~2\ = CARRY(( \port_map_pc|portOUT\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(0),
	cin => GND,
	sumout => \port_map_addPC|Add0~1_sumout\,
	cout => \port_map_addPC|Add0~2\);

\port_map_addPC|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~5_sumout\ = SUM(( \port_map_pc|portOUT\(1) ) + ( GND ) + ( \port_map_addPC|Add0~2\ ))
-- \port_map_addPC|Add0~6\ = CARRY(( \port_map_pc|portOUT\(1) ) + ( GND ) + ( \port_map_addPC|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(1),
	cin => \port_map_addPC|Add0~2\,
	sumout => \port_map_addPC|Add0~5_sumout\,
	cout => \port_map_addPC|Add0~6\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[1]~2_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & ((\port_map_addPC|Add0~5_sumout\))) # (\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & 
-- (\port_map_memoriaInst|Mux5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux5~1_combout\,
	datab => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datac => \port_map_addPC|ALT_INV_Add0~5_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[1]~2_combout\);

\port_map_pc|portOUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(1));

\port_map_memoriaInst|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux4~0_combout\ = (!\port_map_pc|portOUT\(3) & ((!\port_map_pc|portOUT\(0) & (\port_map_pc|portOUT\(1) & \port_map_pc|portOUT\(2))) # (\port_map_pc|portOUT\(0) & ((!\port_map_pc|portOUT\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001000000000010100100000000001010010000000000101001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	combout => \port_map_memoriaInst|Mux4~0_combout\);

\port_map_memoriaInst|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux0~0_combout\ = (!\port_map_pc|portOUT\(4) & (!\port_map_pc|portOUT\(5) & (!\port_map_pc|portOUT\(6) & !\port_map_pc|portOUT\(7))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(4),
	datab => \port_map_pc|ALT_INV_portOUT\(5),
	datac => \port_map_pc|ALT_INV_portOUT\(6),
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_memoriaInst|Mux0~0_combout\);

\port_map_memoriaInst|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux4~1_combout\ = (\port_map_memoriaInst|Mux4~0_combout\ & \port_map_memoriaInst|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	combout => \port_map_memoriaInst|Mux4~1_combout\);

\port_map_addPC|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~9_sumout\ = SUM(( \port_map_pc|portOUT\(2) ) + ( GND ) + ( \port_map_addPC|Add0~6\ ))
-- \port_map_addPC|Add0~10\ = CARRY(( \port_map_pc|portOUT\(2) ) + ( GND ) + ( \port_map_addPC|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(2),
	cin => \port_map_addPC|Add0~6\,
	sumout => \port_map_addPC|Add0~9_sumout\,
	cout => \port_map_addPC|Add0~10\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~3_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & ((\port_map_addPC|Add0~9_sumout\))) # (\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & 
-- (\port_map_memoriaInst|Mux4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~1_combout\,
	datab => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datac => \port_map_addPC|ALT_INV_Add0~9_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~3_combout\);

\port_map_pc|portOUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(2));

\port_map_addPC|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~13_sumout\ = SUM(( \port_map_pc|portOUT\(3) ) + ( GND ) + ( \port_map_addPC|Add0~10\ ))
-- \port_map_addPC|Add0~14\ = CARRY(( \port_map_pc|portOUT\(3) ) + ( GND ) + ( \port_map_addPC|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	cin => \port_map_addPC|Add0~10\,
	sumout => \port_map_addPC|Add0~13_sumout\,
	cout => \port_map_addPC|Add0~14\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[3]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[3]~4_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & \port_map_addPC|Add0~13_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datab => \port_map_addPC|ALT_INV_Add0~13_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[3]~4_combout\);

\port_map_pc|portOUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(3));

\port_map_multiplexador_2X1_8bits_jump|portOUT[4]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[4]~5_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & \port_map_addPC|Add0~17_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datab => \port_map_addPC|ALT_INV_Add0~17_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[4]~5_combout\);

\port_map_pc|portOUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[4]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(4));

\port_map_memoriaInst|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux3~1_combout\ = (!\port_map_pc|portOUT\(0) & ((!\port_map_pc|portOUT\(2) & (!\port_map_pc|portOUT\(1))) # (\port_map_pc|portOUT\(2) & ((!\port_map_pc|portOUT\(3)))))) # (\port_map_pc|portOUT\(0) & (((!\port_map_pc|portOUT\(2) & 
-- !\port_map_pc|portOUT\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101101010000000110110101000000011011010100000001101101010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	combout => \port_map_memoriaInst|Mux3~1_combout\);

\port_map_memoriaInst|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux3~0_combout\ = ( \port_map_memoriaInst|Mux3~1_combout\ & ( (!\port_map_pc|portOUT\(4) & (!\port_map_pc|portOUT\(5) & (!\port_map_pc|portOUT\(6) & !\port_map_pc|portOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(4),
	datab => \port_map_pc|ALT_INV_portOUT\(5),
	datac => \port_map_pc|ALT_INV_portOUT\(6),
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	datae => \port_map_memoriaInst|ALT_INV_Mux3~1_combout\,
	combout => \port_map_memoriaInst|Mux3~0_combout\);

\port_map_memoriaInst|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux2~1_combout\ = (!\port_map_pc|portOUT\(0) & (!\port_map_pc|portOUT\(1) & (!\port_map_pc|portOUT\(2) & \port_map_pc|portOUT\(3)))) # (\port_map_pc|portOUT\(0) & (!\port_map_pc|portOUT\(3) & (!\port_map_pc|portOUT\(1) $ 
-- (\port_map_pc|portOUT\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000110000000010000011000000001000001100000000100000110000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	combout => \port_map_memoriaInst|Mux2~1_combout\);

\port_map_memoriaInst|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux2~0_combout\ = ( \port_map_memoriaInst|Mux2~1_combout\ & ( (!\port_map_pc|portOUT\(4) & (!\port_map_pc|portOUT\(5) & (!\port_map_pc|portOUT\(6) & !\port_map_pc|portOUT\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(4),
	datab => \port_map_pc|ALT_INV_portOUT\(5),
	datac => \port_map_pc|ALT_INV_portOUT\(6),
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	datae => \port_map_memoriaInst|ALT_INV_Mux2~1_combout\,
	combout => \port_map_memoriaInst|Mux2~0_combout\);

\port_map_memoriaInst|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux1~1_combout\ = !\port_map_pc|portOUT\(0) $ (!\port_map_pc|portOUT\(1) $ (!\port_map_pc|portOUT\(2)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001011010010110100101101001011010010110100101101001011010010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	combout => \port_map_memoriaInst|Mux1~1_combout\);

\port_map_memoriaInst|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux1~0_combout\ = ( !\port_map_pc|portOUT\(3) & ( \port_map_memoriaInst|Mux1~1_combout\ & ( (!\port_map_pc|portOUT\(4) & (!\port_map_pc|portOUT\(5) & (!\port_map_pc|portOUT\(6) & !\port_map_pc|portOUT\(7)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(4),
	datab => \port_map_pc|ALT_INV_portOUT\(5),
	datac => \port_map_pc|ALT_INV_portOUT\(6),
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	datae => \port_map_pc|ALT_INV_portOUT\(3),
	dataf => \port_map_memoriaInst|ALT_INV_Mux1~1_combout\,
	combout => \port_map_memoriaInst|Mux1~0_combout\);

\port_map_memoriaInst|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux0~1_combout\ = ( \port_map_memoriaInst|Mux0~0_combout\ & ( (!\port_map_pc|portOUT\(0) & (!\port_map_pc|portOUT\(1) & (!\port_map_pc|portOUT\(2) & \port_map_pc|portOUT\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001000000000000000000000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	datae => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	combout => \port_map_memoriaInst|Mux0~1_combout\);

\port_map_controle|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_controle|Mux5~0_combout\ = (!\port_map_memoriaInst|Mux0~1_combout\ & (!\port_map_memoriaInst|Mux3~0_combout\)) # (\port_map_memoriaInst|Mux0~1_combout\ & (!\port_map_memoriaInst|Mux1~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010110000101010101011000010101010101100001010101010110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_controle|Mux5~0_combout\);

\port_map_ual|Mux5~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~7_combout\ = (!\port_map_memoriaInst|Mux0~1_combout\ & (((!\port_map_memoriaInst|Mux1~0_combout\ & \port_map_controle|Mux5~0_combout\)) # (\port_map_memoriaInst|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011010000010100001101000001010000110100000101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~7_combout\);

\port_map_ual|Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~2_combout\ = (!\port_map_memoriaInst|Mux1~0_combout\ & (!\port_map_memoriaInst|Mux2~0_combout\ $ (((\port_map_controle|Mux5~0_combout\))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (!\port_map_memoriaInst|Mux2~0_combout\ & 
-- (!\port_map_memoriaInst|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100001100100101010000110010010101000011001001010100001100100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~2_combout\);

\port_map_controle|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_controle|Mux7~0_combout\ = (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux3~0_combout\ & 
-- !\port_map_memoriaInst|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110000000000000111000000000000011100000000000001110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_controle|Mux7~0_combout\);

\port_map_memoriaInst|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux6~0_combout\ = (!\port_map_pc|portOUT\(3) & ((!\port_map_pc|portOUT\(0) $ (!\port_map_pc|portOUT\(2))) # (\port_map_pc|portOUT\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111101100000000011110110000000001111011000000000111101100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(0),
	datab => \port_map_pc|ALT_INV_portOUT\(1),
	datac => \port_map_pc|ALT_INV_portOUT\(2),
	datad => \port_map_pc|ALT_INV_portOUT\(3),
	combout => \port_map_memoriaInst|Mux6~0_combout\);

\port_map_controle|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_controle|Mux8~0_combout\ = (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # ((!\port_map_memoriaInst|Mux2~0_combout\) # (!\port_map_memoriaInst|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111000000000111111100000000011111110000000001111111000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_controle|Mux8~0_combout\);

\port_map_registradores|registrador~60\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~60_combout\ = (!\port_map_memoriaInst|Mux4~1_combout\ & \port_map_controle|Mux8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~1_combout\,
	datab => \port_map_controle|ALT_INV_Mux8~0_combout\,
	combout => \port_map_registradores|registrador~60_combout\);

\port_map_registradores|registrador~11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~11_q\);

\port_map_registradores|registrador~51\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~51_combout\ = ( \port_map_registradores|registrador~19_q\ & ( \port_map_registradores|registrador~11_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~19_q\ & ( \port_map_registradores|registrador~11_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~19_q\ & ( !\port_map_registradores|registrador~11_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~19_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~11_q\,
	combout => \port_map_registradores|registrador~51_combout\);

\port_map_memoriaInst|Mux6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux6~3_combout\ = (\port_map_memoriaInst|Mux6~0_combout\ & \port_map_memoriaInst|Mux6~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	combout => \port_map_memoriaInst|Mux6~3_combout\);

\port_map_ual|portMap_adicionador|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~1_sumout\ = SUM(( \port_map_registradores|registrador~43_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((\port_map_registradores|registrador~51_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (!\port_map_pc|portOUT\(7) & ((\port_map_memoriaInst|Mux6~3_combout\)))) ) + ( !VCC ))
-- \port_map_ual|portMap_adicionador|Add0~2\ = CARRY(( \port_map_registradores|registrador~43_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((\port_map_registradores|registrador~51_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (!\port_map_pc|portOUT\(7) & ((\port_map_memoriaInst|Mux6~3_combout\)))) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011011000100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datab => \port_map_pc|ALT_INV_portOUT\(7),
	datac => \port_map_registradores|ALT_INV_registrador~51_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~43_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux6~3_combout\,
	cin => GND,
	sumout => \port_map_ual|portMap_adicionador|Add0~1_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~2\);

\port_map_ual|Mux5~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~4_combout\ = (!\port_map_memoriaInst|Mux1~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & (!\port_map_memoriaInst|Mux2~0_combout\ $ (!\port_map_controle|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000010000000010000001000000001000000100000000100000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~4_combout\);

\port_map_registradores|registrador~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~65_combout\ = ( \port_map_registradores|registrador~25_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~25_q\,
	combout => \port_map_registradores|registrador~65_combout\);

\port_map_registradores|registrador~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~17_q\);

\port_map_registradores|registrador~68\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~68_combout\ = (\port_map_registradores|registrador~17_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~17_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~68_combout\);

\port_map_registradores|registrador~64\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~64_combout\ = ( \port_map_registradores|registrador~24_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~24_q\,
	combout => \port_map_registradores|registrador~64_combout\);

\port_map_registradores|registrador~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~16_q\);

\port_map_registradores|registrador~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~69_combout\ = (\port_map_registradores|registrador~16_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~16_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~69_combout\);

\port_map_registradores|registrador~63\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~63_combout\ = ( \port_map_registradores|registrador~23_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~23_q\,
	combout => \port_map_registradores|registrador~63_combout\);

\port_map_registradores|registrador~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~15_q\);

\port_map_registradores|registrador~70\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~70_combout\ = (\port_map_registradores|registrador~15_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~15_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~70_combout\);

\port_map_registradores|registrador~62\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~62_combout\ = ( \port_map_registradores|registrador~22_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~22_q\,
	combout => \port_map_registradores|registrador~62_combout\);

\port_map_registradores|registrador~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~14_q\);

\port_map_registradores|registrador~71\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~71_combout\ = (\port_map_registradores|registrador~14_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~14_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~71_combout\);

\port_map_registradores|registrador~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~61_combout\ = ( \port_map_registradores|registrador~21_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~21_q\,
	combout => \port_map_registradores|registrador~61_combout\);

\port_map_registradores|registrador~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~13_q\);

\port_map_registradores|registrador~72\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~72_combout\ = (\port_map_registradores|registrador~13_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~13_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~72_combout\);

\port_map_registradores|registrador~12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~12_q\);

\port_map_registradores|registrador~52\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~52_combout\ = ( \port_map_registradores|registrador~20_q\ & ( \port_map_registradores|registrador~12_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~20_q\ & ( \port_map_registradores|registrador~12_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~20_q\ & ( !\port_map_registradores|registrador~12_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~20_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~12_q\,
	combout => \port_map_registradores|registrador~52_combout\);

\port_map_memoriaInst|Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux5~2_combout\ = (!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	combout => \port_map_memoriaInst|Mux5~2_combout\);

\port_map_ual|portMap_adicionador|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~5_sumout\ = SUM(( \port_map_registradores|registrador~44_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((\port_map_registradores|registrador~52_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (!\port_map_pc|portOUT\(7) & ((!\port_map_memoriaInst|Mux5~2_combout\)))) ) + ( \port_map_ual|portMap_adicionador|Add0~2\ ))
-- \port_map_ual|portMap_adicionador|Add0~6\ = CARRY(( \port_map_registradores|registrador~44_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((\port_map_registradores|registrador~52_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (!\port_map_pc|portOUT\(7) & ((!\port_map_memoriaInst|Mux5~2_combout\)))) ) + ( \port_map_ual|portMap_adicionador|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101100011111010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datab => \port_map_pc|ALT_INV_portOUT\(7),
	datac => \port_map_registradores|ALT_INV_registrador~52_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~44_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux5~2_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~2\,
	sumout => \port_map_ual|portMap_adicionador|Add0~5_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~6\);

\port_map_ual|portMap_adicionador|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~9_sumout\ = SUM(( \port_map_registradores|registrador~45_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~72_combout\) # (\port_map_registradores|registrador~61_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~6\ ))
-- \port_map_ual|portMap_adicionador|Add0~10\ = CARRY(( \port_map_registradores|registrador~45_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~72_combout\) # (\port_map_registradores|registrador~61_combout\))) ) + 
-- ( \port_map_ual|portMap_adicionador|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~61_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~45_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~72_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~6\,
	sumout => \port_map_ual|portMap_adicionador|Add0~9_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~10\);

\port_map_ual|portMap_adicionador|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~13_sumout\ = SUM(( \port_map_registradores|registrador~46_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~71_combout\) # (\port_map_registradores|registrador~62_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~10\ ))
-- \port_map_ual|portMap_adicionador|Add0~14\ = CARRY(( \port_map_registradores|registrador~46_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~71_combout\) # (\port_map_registradores|registrador~62_combout\))) ) + 
-- ( \port_map_ual|portMap_adicionador|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~62_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~46_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~71_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~10\,
	sumout => \port_map_ual|portMap_adicionador|Add0~13_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~14\);

\port_map_ual|portMap_adicionador|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~17_sumout\ = SUM(( \port_map_registradores|registrador~47_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~70_combout\) # (\port_map_registradores|registrador~63_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~14\ ))
-- \port_map_ual|portMap_adicionador|Add0~18\ = CARRY(( \port_map_registradores|registrador~47_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~70_combout\) # (\port_map_registradores|registrador~63_combout\))) ) + 
-- ( \port_map_ual|portMap_adicionador|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~63_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~47_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~70_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~14\,
	sumout => \port_map_ual|portMap_adicionador|Add0~17_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~18\);

\port_map_ual|portMap_adicionador|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~21_sumout\ = SUM(( \port_map_registradores|registrador~48_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~69_combout\) # (\port_map_registradores|registrador~64_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~18\ ))
-- \port_map_ual|portMap_adicionador|Add0~22\ = CARRY(( \port_map_registradores|registrador~48_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~69_combout\) # (\port_map_registradores|registrador~64_combout\))) ) + 
-- ( \port_map_ual|portMap_adicionador|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~64_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~48_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~69_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~18\,
	sumout => \port_map_ual|portMap_adicionador|Add0~21_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~22\);

\port_map_ual|portMap_adicionador|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~25_sumout\ = SUM(( \port_map_registradores|registrador~49_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~68_combout\) # (\port_map_registradores|registrador~65_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~22\ ))
-- \port_map_ual|portMap_adicionador|Add0~26\ = CARRY(( \port_map_registradores|registrador~49_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~68_combout\) # (\port_map_registradores|registrador~65_combout\))) ) + 
-- ( \port_map_ual|portMap_adicionador|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~65_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~49_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~68_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~22\,
	sumout => \port_map_ual|portMap_adicionador|Add0~25_sumout\,
	cout => \port_map_ual|portMap_adicionador|Add0~26\);

\port_map_controle|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_controle|Mux6~0_combout\ = (\port_map_memoriaInst|Mux3~0_combout\ & (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & !\port_map_memoriaInst|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000010000000000000001000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_controle|Mux6~0_combout\);

\port_map_controle|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_controle|Mux3~0_combout\ = (!\port_map_memoriaInst|Mux3~0_combout\ & (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & !\port_map_memoriaInst|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_controle|Mux3~0_combout\);

\port_map_ual|portMap_subtrair|Add0~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~34_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \port_map_ual|portMap_subtrair|Add0~34_cout\);

\port_map_ual|portMap_subtrair|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~1_sumout\ = SUM(( \port_map_registradores|registrador~43_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (!\port_map_registradores|registrador~51_combout\)) # (\port_map_controle|Mux7~0_combout\ & 
-- (((!\port_map_memoriaInst|Mux6~3_combout\) # (\port_map_pc|portOUT\(7))))) ) + ( \port_map_ual|portMap_subtrair|Add0~34_cout\ ))
-- \port_map_ual|portMap_subtrair|Add0~2\ = CARRY(( \port_map_registradores|registrador~43_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (!\port_map_registradores|registrador~51_combout\)) # (\port_map_controle|Mux7~0_combout\ & 
-- (((!\port_map_memoriaInst|Mux6~3_combout\) # (\port_map_pc|portOUT\(7))))) ) + ( \port_map_ual|portMap_subtrair|Add0~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000100111001000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~51_combout\,
	datac => \port_map_pc|ALT_INV_portOUT\(7),
	datad => \port_map_registradores|ALT_INV_registrador~43_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux6~3_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~34_cout\,
	sumout => \port_map_ual|portMap_subtrair|Add0~1_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~2\);

\port_map_ual|portMap_subtrair|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~5_sumout\ = SUM(( \port_map_registradores|registrador~44_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((!\port_map_registradores|registrador~52_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (((\port_map_memoriaInst|Mux5~2_combout\)) # (\port_map_pc|portOUT\(7)))) ) + ( \port_map_ual|portMap_subtrair|Add0~2\ ))
-- \port_map_ual|portMap_subtrair|Add0~6\ = CARRY(( \port_map_registradores|registrador~44_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & (((!\port_map_registradores|registrador~52_combout\)))) # (\port_map_controle|Mux7~0_combout\ & 
-- (((\port_map_memoriaInst|Mux5~2_combout\)) # (\port_map_pc|portOUT\(7)))) ) + ( \port_map_ual|portMap_subtrair|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010011100000101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datab => \port_map_pc|ALT_INV_portOUT\(7),
	datac => \port_map_registradores|ALT_INV_registrador~52_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~44_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux5~2_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~2\,
	sumout => \port_map_ual|portMap_subtrair|Add0~5_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~6\);

\port_map_ual|portMap_subtrair|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~9_sumout\ = SUM(( \port_map_registradores|registrador~45_combout\ ) + ( ((!\port_map_registradores|registrador~61_combout\ & !\port_map_registradores|registrador~72_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~6\ ))
-- \port_map_ual|portMap_subtrair|Add0~10\ = CARRY(( \port_map_registradores|registrador~45_combout\ ) + ( ((!\port_map_registradores|registrador~61_combout\ & !\port_map_registradores|registrador~72_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + ( 
-- \port_map_ual|portMap_subtrair|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~61_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~45_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~72_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~6\,
	sumout => \port_map_ual|portMap_subtrair|Add0~9_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~10\);

\port_map_ual|portMap_subtrair|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~13_sumout\ = SUM(( \port_map_registradores|registrador~46_combout\ ) + ( ((!\port_map_registradores|registrador~62_combout\ & !\port_map_registradores|registrador~71_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~10\ ))
-- \port_map_ual|portMap_subtrair|Add0~14\ = CARRY(( \port_map_registradores|registrador~46_combout\ ) + ( ((!\port_map_registradores|registrador~62_combout\ & !\port_map_registradores|registrador~71_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + ( 
-- \port_map_ual|portMap_subtrair|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~62_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~46_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~71_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~10\,
	sumout => \port_map_ual|portMap_subtrair|Add0~13_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~14\);

\port_map_ual|portMap_subtrair|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~17_sumout\ = SUM(( \port_map_registradores|registrador~47_combout\ ) + ( ((!\port_map_registradores|registrador~63_combout\ & !\port_map_registradores|registrador~70_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~14\ ))
-- \port_map_ual|portMap_subtrair|Add0~18\ = CARRY(( \port_map_registradores|registrador~47_combout\ ) + ( ((!\port_map_registradores|registrador~63_combout\ & !\port_map_registradores|registrador~70_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + ( 
-- \port_map_ual|portMap_subtrair|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~63_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~47_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~70_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~14\,
	sumout => \port_map_ual|portMap_subtrair|Add0~17_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~18\);

\port_map_ual|portMap_subtrair|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~21_sumout\ = SUM(( \port_map_registradores|registrador~48_combout\ ) + ( ((!\port_map_registradores|registrador~64_combout\ & !\port_map_registradores|registrador~69_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~18\ ))
-- \port_map_ual|portMap_subtrair|Add0~22\ = CARRY(( \port_map_registradores|registrador~48_combout\ ) + ( ((!\port_map_registradores|registrador~64_combout\ & !\port_map_registradores|registrador~69_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + ( 
-- \port_map_ual|portMap_subtrair|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~64_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~48_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~69_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~18\,
	sumout => \port_map_ual|portMap_subtrair|Add0~21_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~22\);

\port_map_ual|portMap_subtrair|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~25_sumout\ = SUM(( \port_map_registradores|registrador~49_combout\ ) + ( ((!\port_map_registradores|registrador~65_combout\ & !\port_map_registradores|registrador~68_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~22\ ))
-- \port_map_ual|portMap_subtrair|Add0~26\ = CARRY(( \port_map_registradores|registrador~49_combout\ ) + ( ((!\port_map_registradores|registrador~65_combout\ & !\port_map_registradores|registrador~68_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + ( 
-- \port_map_ual|portMap_subtrair|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~65_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~49_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~68_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~22\,
	sumout => \port_map_ual|portMap_subtrair|Add0~25_sumout\,
	cout => \port_map_ual|portMap_subtrair|Add0~26\);

\port_map_ual|Mux5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~3_combout\ = (!\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & (!\port_map_memoriaInst|Mux1~0_combout\ $ (\port_map_controle|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000100000100000000010000010000000001000001000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~3_combout\);

\port_map_registradores|registrador~66\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~66_combout\ = ( \port_map_registradores|registrador~26_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~26_q\,
	combout => \port_map_registradores|registrador~66_combout\);

\port_map_registradores|registrador~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\,
	ena => \port_map_registradores|registrador~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~18_q\);

\port_map_registradores|registrador~67\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~67_combout\ = (\port_map_registradores|registrador~18_q\ & (((!\port_map_memoriaInst|Mux6~1_combout\) # (\port_map_pc|portOUT\(7))) # (\port_map_pc|portOUT\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000100110011001100010011001100110001001100110011000100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(3),
	datab => \port_map_registradores|ALT_INV_registrador~18_q\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	combout => \port_map_registradores|registrador~67_combout\);

\port_map_ual|portMap_adicionador|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_adicionador|Add0~29_sumout\ = SUM(( \port_map_registradores|registrador~50_combout\ ) + ( (!\port_map_controle|Mux7~0_combout\ & ((\port_map_registradores|registrador~67_combout\) # (\port_map_registradores|registrador~66_combout\))) 
-- ) + ( \port_map_ual|portMap_adicionador|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101010101010100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~66_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~50_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~67_combout\,
	cin => \port_map_ual|portMap_adicionador|Add0~26\,
	sumout => \port_map_ual|portMap_adicionador|Add0~29_sumout\);

\port_map_ual|portMap_subtrair|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|portMap_subtrair|Add0~29_sumout\ = SUM(( \port_map_registradores|registrador~50_combout\ ) + ( ((!\port_map_registradores|registrador~66_combout\ & !\port_map_registradores|registrador~67_combout\)) # (\port_map_controle|Mux7~0_combout\) ) + 
-- ( \port_map_ual|portMap_subtrair|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux7~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~66_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~50_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~67_combout\,
	cin => \port_map_ual|portMap_subtrair|Add0~26\,
	sumout => \port_map_ual|portMap_subtrair|Add0~29_sumout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~51_combout\ ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~51_combout\ ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_memoriaInst|Mux0~1_combout\ & ( (!\port_map_memoriaInst|Mux2~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~2_combout\)) # (\port_map_memoriaInst|Mux2~0_combout\ & ((\port_map_registradores|registrador~51_combout\))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (!\port_map_memoriaInst|Mux3~0_combout\ & (((\port_map_registradores|registrador~51_combout\)))) # (\port_map_memoriaInst|Mux3~0_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((\port_map_registradores|registrador~51_combout\))) # 
-- (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux6~2_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110101010101010011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux6~2_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~51_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~52_combout\ ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~52_combout\ ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_memoriaInst|Mux0~1_combout\ & ( (!\port_map_memoriaInst|Mux2~0_combout\ & 
-- (\port_map_memoriaInst|Mux5~1_combout\)) # (\port_map_memoriaInst|Mux2~0_combout\ & ((\port_map_registradores|registrador~52_combout\))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (!\port_map_memoriaInst|Mux3~0_combout\ & (((\port_map_registradores|registrador~52_combout\)))) # (\port_map_memoriaInst|Mux3~0_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((\port_map_registradores|registrador~52_combout\))) # 
-- (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux5~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110101010101010011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux5~1_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~52_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\);

\port_map_registradores|registrador~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~53_combout\ = ( \port_map_registradores|registrador~21_q\ & ( \port_map_registradores|registrador~13_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~21_q\ & ( \port_map_registradores|registrador~13_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~21_q\ & ( !\port_map_registradores|registrador~13_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~21_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~13_q\,
	combout => \port_map_registradores|registrador~53_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~53_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~53_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~53_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\);

\port_map_registradores|registrador~54\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~54_combout\ = ( \port_map_registradores|registrador~22_q\ & ( \port_map_registradores|registrador~14_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~22_q\ & ( \port_map_registradores|registrador~14_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~22_q\ & ( !\port_map_registradores|registrador~14_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~22_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~14_q\,
	combout => \port_map_registradores|registrador~54_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~54_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~54_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~54_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\);

\port_map_registradores|registrador~55\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~55_combout\ = ( \port_map_registradores|registrador~23_q\ & ( \port_map_registradores|registrador~15_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~23_q\ & ( \port_map_registradores|registrador~15_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~23_q\ & ( !\port_map_registradores|registrador~15_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~23_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~15_q\,
	combout => \port_map_registradores|registrador~55_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~55_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~55_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~55_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\);

\port_map_registradores|registrador~56\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~56_combout\ = ( \port_map_registradores|registrador~24_q\ & ( \port_map_registradores|registrador~16_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~24_q\ & ( \port_map_registradores|registrador~16_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~24_q\ & ( !\port_map_registradores|registrador~16_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~24_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~16_q\,
	combout => \port_map_registradores|registrador~56_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~56_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~56_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~56_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\);

\port_map_registradores|registrador~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~57_combout\ = ( \port_map_registradores|registrador~25_q\ & ( \port_map_registradores|registrador~17_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~25_q\ & ( \port_map_registradores|registrador~17_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~25_q\ & ( !\port_map_registradores|registrador~17_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~25_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~17_q\,
	combout => \port_map_registradores|registrador~57_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[6]~6_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~57_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~57_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~57_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[6]~6_combout\);

\port_map_registradores|registrador~58\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~58_combout\ = ( \port_map_registradores|registrador~26_q\ & ( \port_map_registradores|registrador~18_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # (!\port_map_memoriaInst|Mux5~0_combout\)) # 
-- (\port_map_pc|portOUT\(7)) ) ) ) # ( !\port_map_registradores|registrador~26_q\ & ( \port_map_registradores|registrador~18_q\ & ( ((!\port_map_memoriaInst|Mux6~1_combout\) # ((!\port_map_memoriaInst|Mux6~0_combout\ & 
-- !\port_map_memoriaInst|Mux5~0_combout\))) # (\port_map_pc|portOUT\(7)) ) ) ) # ( \port_map_registradores|registrador~26_q\ & ( !\port_map_registradores|registrador~18_q\ & ( (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~1_combout\ & !\port_map_memoriaInst|Mux5~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000011111101111101011111111111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux5~0_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~26_q\,
	dataf => \port_map_registradores|ALT_INV_registrador~18_q\,
	combout => \port_map_registradores|registrador~58_combout\);

\port_map_multiplexador_2X1_8bits_br_ula|portOUT[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_br_ula|portOUT[7]~7_combout\ = ( \port_map_memoriaInst|Mux0~1_combout\ & ( \port_map_registradores|registrador~58_combout\ ) ) # ( !\port_map_memoriaInst|Mux0~1_combout\ & ( 
-- (\port_map_registradores|registrador~58_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\))) # (\port_map_memoriaInst|Mux2~0_combout\ & ((!\port_map_memoriaInst|Mux3~0_combout\) # 
-- (\port_map_memoriaInst|Mux1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010000000101010101010101010101010100000001010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~58_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_multiplexador_2X1_8bits_br_ula|portOUT[7]~7_combout\);

\port_map_ual|portMap_multiplicar|Mult0~mac\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 8,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 8,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m9x9",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	ax => \port_map_ual|portMap_multiplicar|Mult0~mac_AX_bus\,
	ay => \port_map_ual|portMap_multiplicar|Mult0~mac_AY_bus\,
	resulta => \port_map_ual|portMap_multiplicar|Mult0~mac_RESULTA_bus\);

\port_map_ual|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux4~0_combout\ = ( \port_map_controle|Mux5~0_combout\ & ( \port_map_ual|portMap_multiplicar|portOUT\(7) & ( (\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\) # 
-- (\port_map_registradores|registrador~50_combout\)))) ) ) ) # ( !\port_map_controle|Mux5~0_combout\ & ( \port_map_ual|portMap_multiplicar|portOUT\(7) & ( (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & 
-- (\port_map_registradores|registrador~50_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) ) # ( \port_map_controle|Mux5~0_combout\ & ( !\port_map_ual|portMap_multiplicar|portOUT\(7) & ( (\port_map_memoriaInst|Mux2~0_combout\ & 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~50_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) ) # ( !\port_map_controle|Mux5~0_combout\ & ( !\port_map_ual|portMap_multiplicar|portOUT\(7) & ( 
-- (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~50_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000010000000000000001000000000100010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~50_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datae => \port_map_controle|ALT_INV_Mux5~0_combout\,
	dataf => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(7),
	combout => \port_map_ual|Mux4~0_combout\);

\port_map_ual|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux4~1_combout\ = ( \port_map_ual|portMap_adicionador|Add0~29_sumout\ & ( \port_map_ual|Mux4~0_combout\ ) ) # ( !\port_map_ual|portMap_adicionador|Add0~29_sumout\ & ( \port_map_ual|Mux4~0_combout\ ) ) # ( 
-- \port_map_ual|portMap_adicionador|Add0~29_sumout\ & ( !\port_map_ual|Mux4~0_combout\ & ( ((\port_map_ual|Mux5~3_combout\ & \port_map_ual|portMap_subtrair|Add0~29_sumout\)) # (\port_map_ual|Mux5~4_combout\) ) ) ) # ( 
-- !\port_map_ual|portMap_adicionador|Add0~29_sumout\ & ( !\port_map_ual|Mux4~0_combout\ & ( (\port_map_ual|Mux5~3_combout\ & \port_map_ual|portMap_subtrair|Add0~29_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101001101110011011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~3_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~4_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~29_sumout\,
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~29_sumout\,
	dataf => \port_map_ual|ALT_INV_Mux4~0_combout\,
	combout => \port_map_ual|Mux4~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\port_map_ual|Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux4~2_combout\ = ( \port_map_ual|Mux5~7_combout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(7))))) # (\port_map_memoriaInst|Mux1~0_combout\ & 
-- (\port_map_registradores|registrador~50_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100010001101100000000000000000001000100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~50_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(7),
	datae => \port_map_ual|ALT_INV_Mux5~7_combout\,
	combout => \port_map_ual|Mux4~2_combout\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\ = ( !\port_map_controle|Mux3~0_combout\ & ( ((!\port_map_ual|portMap_adicionador|Add0~29_sumout\ & (((\port_map_ual|portMap_subtrair|Add0~29_sumout\ & \port_map_ual|Mux5~3_combout\)))) 
-- # (\port_map_ual|portMap_adicionador|Add0~29_sumout\ & (((\port_map_ual|portMap_subtrair|Add0~29_sumout\ & \port_map_ual|Mux5~3_combout\)) # (\port_map_ual|Mux5~4_combout\)))) # (\port_map_ual|Mux4~2_combout\) ) ) # ( \port_map_controle|Mux3~0_combout\ & 
-- ( (((\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a7~portbdataout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001000111111111000011110000111100011111111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|portMap_adicionador|ALT_INV_Add0~29_sumout\,
	datab => \port_map_ual|ALT_INV_Mux5~4_combout\,
	datac => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a7~portbdataout\,
	datad => \port_map_ual|ALT_INV_Mux4~2_combout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	dataf => \port_map_ual|ALT_INV_Mux5~3_combout\,
	datag => \port_map_ual|portMap_subtrair|ALT_INV_Add0~29_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\);

\port_map_registradores|registrador~59\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~59_combout\ = (\port_map_memoriaInst|Mux4~1_combout\ & \port_map_controle|Mux8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~1_combout\,
	datab => \port_map_controle|ALT_INV_Mux8~0_combout\,
	combout => \port_map_registradores|registrador~59_combout\);

\port_map_registradores|registrador~26\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[7]~6_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~26_q\);

\port_map_registradores|registrador~50\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~50_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~18_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~18_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~26_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~26_q\,
	datad => \port_map_registradores|ALT_INV_registrador~18_q\,
	combout => \port_map_registradores|registrador~50_combout\);

\port_map_ual|Mux5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~5_combout\ = ( \port_map_controle|Mux5~0_combout\ & ( \port_map_ual|portMap_multiplicar|portOUT\(6) & ( (\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux1~0_combout\) # 
-- (\port_map_registradores|registrador~49_combout\)))) ) ) ) # ( !\port_map_controle|Mux5~0_combout\ & ( \port_map_ual|portMap_multiplicar|portOUT\(6) & ( (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & 
-- (\port_map_registradores|registrador~49_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) ) # ( \port_map_controle|Mux5~0_combout\ & ( !\port_map_ual|portMap_multiplicar|portOUT\(6) & ( (\port_map_memoriaInst|Mux2~0_combout\ & 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~49_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) ) # ( !\port_map_controle|Mux5~0_combout\ & ( !\port_map_ual|portMap_multiplicar|portOUT\(6) & ( 
-- (\port_map_memoriaInst|Mux2~0_combout\ & (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~49_combout\ & !\port_map_memoriaInst|Mux0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000010000000000000001000000000100010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~49_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datae => \port_map_controle|ALT_INV_Mux5~0_combout\,
	dataf => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(6),
	combout => \port_map_ual|Mux5~5_combout\);

\port_map_ual|Mux5~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~6_combout\ = ( \port_map_ual|Mux5~4_combout\ & ( \port_map_ual|Mux5~5_combout\ ) ) # ( !\port_map_ual|Mux5~4_combout\ & ( \port_map_ual|Mux5~5_combout\ ) ) # ( \port_map_ual|Mux5~4_combout\ & ( !\port_map_ual|Mux5~5_combout\ & ( 
-- ((\port_map_ual|portMap_subtrair|Add0~25_sumout\ & \port_map_ual|Mux5~3_combout\)) # (\port_map_ual|portMap_adicionador|Add0~25_sumout\) ) ) ) # ( !\port_map_ual|Mux5~4_combout\ & ( !\port_map_ual|Mux5~5_combout\ & ( 
-- (\port_map_ual|portMap_subtrair|Add0~25_sumout\ & \port_map_ual|Mux5~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100011111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|portMap_subtrair|ALT_INV_Add0~25_sumout\,
	datab => \port_map_ual|ALT_INV_Mux5~3_combout\,
	datad => \port_map_ual|portMap_adicionador|ALT_INV_Add0~25_sumout\,
	datae => \port_map_ual|ALT_INV_Mux5~4_combout\,
	dataf => \port_map_ual|ALT_INV_Mux5~5_combout\,
	combout => \port_map_ual|Mux5~6_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\port_map_ual|Mux5~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~8_combout\ = ( \port_map_ual|Mux5~7_combout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(6))))) # (\port_map_memoriaInst|Mux1~0_combout\ & 
-- (\port_map_registradores|registrador~49_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100010001101100000000000000000001000100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~49_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(6),
	datae => \port_map_ual|ALT_INV_Mux5~7_combout\,
	combout => \port_map_ual|Mux5~8_combout\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\ = ( !\port_map_controle|Mux3~0_combout\ & ( ((!\port_map_ual|Mux5~4_combout\ & (((\port_map_ual|Mux5~3_combout\ & \port_map_ual|portMap_subtrair|Add0~25_sumout\)))) # 
-- (\port_map_ual|Mux5~4_combout\ & (((\port_map_ual|Mux5~3_combout\ & \port_map_ual|portMap_subtrair|Add0~25_sumout\)) # (\port_map_ual|portMap_adicionador|Add0~25_sumout\)))) # (\port_map_ual|Mux5~8_combout\) ) ) # ( \port_map_controle|Mux3~0_combout\ & ( 
-- (((\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a6~portbdataout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001000111111111000011110000111100011111111111110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~4_combout\,
	datab => \port_map_ual|portMap_adicionador|ALT_INV_Add0~25_sumout\,
	datac => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a6~portbdataout\,
	datad => \port_map_ual|ALT_INV_Mux5~8_combout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	dataf => \port_map_ual|portMap_subtrair|ALT_INV_Add0~25_sumout\,
	datag => \port_map_ual|ALT_INV_Mux5~3_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\);

\port_map_registradores|registrador~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[6]~10_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~25_q\);

\port_map_registradores|registrador~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~49_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~17_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~17_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~25_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~25_q\,
	datad => \port_map_registradores|ALT_INV_registrador~17_q\,
	combout => \port_map_registradores|registrador~49_combout\);

\port_map_ual|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux6~0_combout\ = ( \port_map_ual|portMap_adicionador|Add0~21_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(5))))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~48_combout\)) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~21_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & 
-- \port_map_ual|portMap_multiplicar|portOUT\(5))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~48_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011011101100011011101100010001000110111011000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~48_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(5),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~21_sumout\,
	combout => \port_map_ual|Mux6~0_combout\);

\port_map_ual|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~0_combout\ = (!\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_controle|Mux5~0_combout\) # (\port_map_memoriaInst|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000100000101000000010000010100000001000001010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~0_combout\);

\port_map_ual|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux5~1_combout\ = (!\port_map_memoriaInst|Mux0~1_combout\ & (((!\port_map_memoriaInst|Mux1~0_combout\) # (\port_map_controle|Mux5~0_combout\)) # (\port_map_memoriaInst|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011110000110100001111000011010000111100001101000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux5~1_combout\);

\port_map_ual|Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux6~2_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~21_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~21_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[5]~5_combout\,
	combout => \port_map_ual|Mux6~2_combout\);

\port_map_ual|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux6~1_combout\ = ( \port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|Mux6~0_combout\))) # (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\) # ((\port_map_ual|portMap_subtrair|Add0~21_sumout\)))) ) ) # ( !\port_map_multiplexador_2X1_8bits_br_ula|portOUT[5]~5_combout\ & ( (\port_map_ual|Mux5~1_combout\ & ((!\port_map_ual|Mux5~0_combout\ & 
-- (\port_map_ual|Mux6~0_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((\port_map_ual|portMap_subtrair|Add0~21_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000010011010001100101011100000010000100110100011001010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|ALT_INV_Mux6~0_combout\,
	datad => \port_map_ual|portMap_subtrair|ALT_INV_Add0~21_sumout\,
	datae => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[5]~5_combout\,
	combout => \port_map_ual|Mux6~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a5~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux6~0_combout\)) # (\port_map_ual|Mux6~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux6~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux6~2_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a5~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\);

\port_map_registradores|registrador~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[5]~5_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~24_q\);

\port_map_registradores|registrador~48\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~48_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~16_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~16_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~24_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~24_q\,
	datad => \port_map_registradores|ALT_INV_registrador~16_q\,
	combout => \port_map_registradores|registrador~48_combout\);

\port_map_ual|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux7~0_combout\ = ( \port_map_ual|portMap_adicionador|Add0~17_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(4))))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~47_combout\)) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~17_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & 
-- \port_map_ual|portMap_multiplicar|portOUT\(4))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~47_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011011101100011011101100010001000110111011000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~47_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(4),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~17_sumout\,
	combout => \port_map_ual|Mux7~0_combout\);

\port_map_ual|Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux7~2_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~17_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~17_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[4]~4_combout\,
	combout => \port_map_ual|Mux7~2_combout\);

\port_map_ual|Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux7~3_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_registradores|registrador~47_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~17_sumout\)))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_registradores|registrador~47_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~17_sumout\)))) ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~47_combout\ 
-- & ( (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~17_sumout\)))) ) ) ) # ( 
-- !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~47_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[4]~4_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~17_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101100111000000010100010100100011011001110010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~17_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[4]~4_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~47_combout\,
	combout => \port_map_ual|Mux7~3_combout\);

\port_map_ual|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux7~1_combout\ = ( \port_map_ual|portMap_adicionador|Add0~17_sumout\ & ( \port_map_ual|Mux7~3_combout\ & ( (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(4))) # (\port_map_memoriaInst|Mux1~0_combout\)) # 
-- (\port_map_ual|Mux5~0_combout\) ) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~17_sumout\ & ( \port_map_ual|Mux7~3_combout\ & ( (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(4))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\)) # (\port_map_ual|Mux5~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011111111111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(4),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~17_sumout\,
	dataf => \port_map_ual|ALT_INV_Mux7~3_combout\,
	combout => \port_map_ual|Mux7~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a4~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux7~0_combout\)) # (\port_map_ual|Mux7~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux7~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux7~2_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a4~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\);

\port_map_registradores|registrador~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[4]~4_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~23_q\);

\port_map_registradores|registrador~47\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~47_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~15_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~15_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~23_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~23_q\,
	datad => \port_map_registradores|ALT_INV_registrador~15_q\,
	combout => \port_map_registradores|registrador~47_combout\);

\port_map_ual|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux8~0_combout\ = ( \port_map_ual|portMap_adicionador|Add0~13_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(3))))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~46_combout\)) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~13_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & 
-- \port_map_ual|portMap_multiplicar|portOUT\(3))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~46_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011011101100011011101100010001000110111011000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~46_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(3),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~13_sumout\,
	combout => \port_map_ual|Mux8~0_combout\);

\port_map_ual|Mux8~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux8~2_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~13_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~13_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[3]~3_combout\,
	combout => \port_map_ual|Mux8~2_combout\);

\port_map_ual|Mux8~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux8~3_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_registradores|registrador~46_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~13_sumout\)))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_registradores|registrador~46_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~13_sumout\)))) ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~46_combout\ 
-- & ( (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~13_sumout\)))) ) ) ) # ( 
-- !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~46_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[3]~3_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~13_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101100111000000010100010100100011011001110010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~13_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[3]~3_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~46_combout\,
	combout => \port_map_ual|Mux8~3_combout\);

\port_map_ual|Mux8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux8~1_combout\ = ( \port_map_ual|portMap_adicionador|Add0~13_sumout\ & ( \port_map_ual|Mux8~3_combout\ & ( (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(3))) # (\port_map_memoriaInst|Mux1~0_combout\)) # 
-- (\port_map_ual|Mux5~0_combout\) ) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~13_sumout\ & ( \port_map_ual|Mux8~3_combout\ & ( (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(3))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\)) # (\port_map_ual|Mux5~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011111111111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(3),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~13_sumout\,
	dataf => \port_map_ual|ALT_INV_Mux8~3_combout\,
	combout => \port_map_ual|Mux8~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a3~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux8~0_combout\)) # (\port_map_ual|Mux8~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux8~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux8~2_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a3~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\);

\port_map_registradores|registrador~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[3]~3_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~22_q\);

\port_map_registradores|registrador~46\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~46_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~14_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~14_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~22_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~22_q\,
	datad => \port_map_registradores|ALT_INV_registrador~14_q\,
	combout => \port_map_registradores|registrador~46_combout\);

\port_map_ual|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux9~0_combout\ = ( \port_map_ual|portMap_adicionador|Add0~9_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(2))))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~45_combout\)) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~9_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & 
-- \port_map_ual|portMap_multiplicar|portOUT\(2))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~45_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011011101100011011101100010001000110111011000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~45_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(2),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~9_sumout\,
	combout => \port_map_ual|Mux9~0_combout\);

\port_map_ual|Mux9~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux9~2_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~9_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~9_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[2]~2_combout\,
	combout => \port_map_ual|Mux9~2_combout\);

\port_map_ual|Mux9~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux9~3_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_registradores|registrador~45_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~9_sumout\)))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_registradores|registrador~45_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~9_sumout\)))) ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~45_combout\ 
-- & ( (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~9_sumout\)))) ) ) ) # ( 
-- !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~45_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[2]~2_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~9_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101100111000000010100010100100011011001110010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~9_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[2]~2_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~45_combout\,
	combout => \port_map_ual|Mux9~3_combout\);

\port_map_ual|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux9~1_combout\ = ( \port_map_ual|portMap_adicionador|Add0~9_sumout\ & ( \port_map_ual|Mux9~3_combout\ & ( (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(2))) # (\port_map_memoriaInst|Mux1~0_combout\)) # 
-- (\port_map_ual|Mux5~0_combout\) ) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~9_sumout\ & ( \port_map_ual|Mux9~3_combout\ & ( (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(2))) # (\port_map_memoriaInst|Mux1~0_combout\)) 
-- # (\port_map_ual|Mux5~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011111111111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(2),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~9_sumout\,
	dataf => \port_map_ual|ALT_INV_Mux9~3_combout\,
	combout => \port_map_ual|Mux9~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a2~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux9~0_combout\)) # (\port_map_ual|Mux9~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux9~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux9~2_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a2~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\);

\port_map_registradores|registrador~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[2]~2_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~21_q\);

\port_map_registradores|registrador~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~45_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~13_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~13_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~21_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~21_q\,
	datad => \port_map_registradores|ALT_INV_registrador~13_q\,
	combout => \port_map_registradores|registrador~45_combout\);

\port_map_ual|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux11~0_combout\ = ( \port_map_ual|portMap_multiplicar|portOUT\(0) & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_adicionador|Add0~1_sumout\)))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~43_combout\)) ) ) # ( !\port_map_ual|portMap_multiplicar|portOUT\(0) & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|portMap_adicionador|Add0~1_sumout\ & 
-- !\port_map_ual|Mux5~2_combout\)))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~43_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100010001000110111011101100011011000100010001101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~43_combout\,
	datac => \port_map_ual|portMap_adicionador|ALT_INV_Add0~1_sumout\,
	datad => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datae => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(0),
	combout => \port_map_ual|Mux11~0_combout\);

\port_map_ual|Mux11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux11~1_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~1_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~1_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[0]~0_combout\,
	combout => \port_map_ual|Mux11~1_combout\);

\port_map_ual|Mux11~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux11~2_combout\ = ( \port_map_ual|portMap_adicionador|Add0~1_sumout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~1_sumout\)))) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~1_sumout\ & ( (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[0]~0_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101001000110110011100000001010001010010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~1_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[0]~0_combout\,
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~1_sumout\,
	combout => \port_map_ual|Mux11~2_combout\);

\port_map_ual|Mux11~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux11~3_combout\ = ( !\port_map_memoriaInst|Mux1~0_combout\ & ( (!\port_map_memoriaInst|Mux3~0_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & (((\port_map_ual|Mux11~2_combout\)))) # (\port_map_memoriaInst|Mux2~0_combout\ & 
-- (!\port_map_memoriaInst|Mux0~1_combout\ & ((\port_map_ual|portMap_multiplicar|portOUT\(0))))))) # (\port_map_memoriaInst|Mux3~0_combout\ & (!\port_map_memoriaInst|Mux0~1_combout\ & (((\port_map_ual|Mux11~2_combout\))))) ) ) # ( 
-- \port_map_memoriaInst|Mux1~0_combout\ & ( (!\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\ & (((\port_map_ual|Mux11~2_combout\)))) # (\port_map_memoriaInst|Mux2~0_combout\ & 
-- (\port_map_registradores|registrador~43_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000011001010000000101000101000100000111010100000001010001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~43_combout\,
	datad => \port_map_ual|ALT_INV_Mux11~2_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(0),
	datag => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	combout => \port_map_ual|Mux11~3_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux11~0_combout\)) # (\port_map_ual|Mux11~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux11~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux11~1_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\);

\port_map_registradores|registrador~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[0]~0_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~19_q\);

\port_map_registradores|registrador~43\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~43_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~11_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~11_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~19_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~19_q\,
	datad => \port_map_registradores|ALT_INV_registrador~11_q\,
	combout => \port_map_registradores|registrador~43_combout\);

\port_map_ual|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux10~0_combout\ = ( \port_map_ual|portMap_adicionador|Add0~5_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(1))))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~44_combout\)) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~5_sumout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (((\port_map_ual|Mux5~2_combout\ & 
-- \port_map_ual|portMap_multiplicar|portOUT\(1))))) # (\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_registradores|registrador~44_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011011101100011011101100010001000110111011000110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~44_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(1),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~5_sumout\,
	combout => \port_map_ual|Mux10~0_combout\);

\port_map_ual|Mux10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux10~2_combout\ = (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~5_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100000001010001010000000101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~5_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[1]~1_combout\,
	combout => \port_map_ual|Mux10~2_combout\);

\port_map_ual|Mux10~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux10~3_combout\ = ( \port_map_memoriaInst|Mux1~0_combout\ & ( \port_map_registradores|registrador~44_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & 
-- ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~5_sumout\)))) ) ) ) # ( !\port_map_memoriaInst|Mux1~0_combout\ & ( 
-- \port_map_registradores|registrador~44_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~5_sumout\)))) ) ) ) # ( \port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~44_combout\ 
-- & ( (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~5_sumout\)))) ) ) ) # ( 
-- !\port_map_memoriaInst|Mux1~0_combout\ & ( !\port_map_registradores|registrador~44_combout\ & ( (!\port_map_ual|Mux5~0_combout\ & (\port_map_ual|Mux5~1_combout\)) # (\port_map_ual|Mux5~0_combout\ & ((!\port_map_ual|Mux5~1_combout\ & 
-- ((\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\))) # (\port_map_ual|Mux5~1_combout\ & (\port_map_ual|portMap_subtrair|Add0~5_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101100111000000010100010100100011011001110010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_Mux5~1_combout\,
	datac => \port_map_ual|portMap_subtrair|ALT_INV_Add0~5_sumout\,
	datad => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[1]~1_combout\,
	datae => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	dataf => \port_map_registradores|ALT_INV_registrador~44_combout\,
	combout => \port_map_ual|Mux10~3_combout\);

\port_map_ual|Mux10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux10~1_combout\ = ( \port_map_ual|portMap_adicionador|Add0~5_sumout\ & ( \port_map_ual|Mux10~3_combout\ & ( (((!\port_map_ual|Mux5~2_combout\) # (\port_map_ual|portMap_multiplicar|portOUT\(1))) # (\port_map_memoriaInst|Mux1~0_combout\)) # 
-- (\port_map_ual|Mux5~0_combout\) ) ) ) # ( !\port_map_ual|portMap_adicionador|Add0~5_sumout\ & ( \port_map_ual|Mux10~3_combout\ & ( (((\port_map_ual|Mux5~2_combout\ & \port_map_ual|portMap_multiplicar|portOUT\(1))) # 
-- (\port_map_memoriaInst|Mux1~0_combout\)) # (\port_map_ual|Mux5~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001110111011111111111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux5~2_combout\,
	datad => \port_map_ual|portMap_multiplicar|ALT_INV_portOUT\(1),
	datae => \port_map_ual|portMap_adicionador|ALT_INV_Add0~5_sumout\,
	dataf => \port_map_ual|ALT_INV_Mux10~3_combout\,
	combout => \port_map_ual|Mux10~1_combout\);

\port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/processador_mason.ram0_memoriaAdress_e716e8fa.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memoriaAdress:port_map_memoriaAdress|altsyncram:ram_rtl_0|altsyncram_c502:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 2,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 3,
	port_a_logical_ram_depth => 8,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 2,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 3,
	port_b_logical_ram_depth => 8,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \port_map_controle|Mux6~0_combout\,
	portbre => \port_map_controle|Mux3~0_combout\,
	clk0 => \clock~input_o\,
	portadatain => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\ = ( \port_map_controle|Mux3~0_combout\ & ( \port_map_memoriaAdress|ram_rtl_0|auto_generated|ram_block1a1~portbdataout\ ) ) # ( !\port_map_controle|Mux3~0_combout\ & ( 
-- ((\port_map_ual|Mux5~7_combout\ & \port_map_ual|Mux10~0_combout\)) # (\port_map_ual|Mux10~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000000001111111100011111000111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_ual|ALT_INV_Mux5~7_combout\,
	datab => \port_map_ual|ALT_INV_Mux10~0_combout\,
	datac => \port_map_ual|ALT_INV_Mux10~2_combout\,
	datad => \port_map_memoriaAdress|ram_rtl_0|auto_generated|ALT_INV_ram_block1a1~portbdataout\,
	datae => \port_map_controle|ALT_INV_Mux3~0_combout\,
	combout => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\);

\port_map_registradores|registrador~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_memAdress_ula|portOUT[1]~1_combout\,
	ena => \port_map_registradores|registrador~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_registradores|registrador~20_q\);

\port_map_registradores|registrador~44\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_registradores|registrador~44_combout\ = (!\port_map_memoriaInst|Mux4~0_combout\ & (((\port_map_registradores|registrador~12_q\)))) # (\port_map_memoriaInst|Mux4~0_combout\ & ((!\port_map_memoriaInst|Mux0~0_combout\ & 
-- ((\port_map_registradores|registrador~12_q\))) # (\port_map_memoriaInst|Mux0~0_combout\ & (\port_map_registradores|registrador~20_q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111101111000000011110111100000001111011110000000111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux4~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux0~0_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~20_q\,
	datad => \port_map_registradores|ALT_INV_registrador~12_q\,
	combout => \port_map_registradores|registrador~44_combout\);

\port_map_ual|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Equal0~0_combout\ = !\port_map_registradores|registrador~46_combout\ $ (((!\port_map_registradores|registrador~54_combout\) # (\port_map_controle|Mux7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010101100101011001010110010101100101011001010110010101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~46_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~54_combout\,
	datac => \port_map_controle|ALT_INV_Mux7~0_combout\,
	combout => \port_map_ual|Equal0~0_combout\);

\port_map_ual|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Equal0~1_combout\ = ( \port_map_registradores|registrador~53_combout\ & ( \port_map_controle|Mux7~0_combout\ & ( (!\port_map_registradores|registrador~45_combout\ & (!\port_map_memoriaInst|Mux6~2_combout\ $ 
-- (\port_map_registradores|registrador~43_combout\))) ) ) ) # ( !\port_map_registradores|registrador~53_combout\ & ( \port_map_controle|Mux7~0_combout\ & ( (!\port_map_registradores|registrador~45_combout\ & (!\port_map_memoriaInst|Mux6~2_combout\ $ 
-- (\port_map_registradores|registrador~43_combout\))) ) ) ) # ( \port_map_registradores|registrador~53_combout\ & ( !\port_map_controle|Mux7~0_combout\ & ( (\port_map_registradores|registrador~45_combout\ & (!\port_map_registradores|registrador~43_combout\ 
-- $ (\port_map_registradores|registrador~51_combout\))) ) ) ) # ( !\port_map_registradores|registrador~53_combout\ & ( !\port_map_controle|Mux7~0_combout\ & ( (!\port_map_registradores|registrador~45_combout\ & 
-- (!\port_map_registradores|registrador~43_combout\ $ (\port_map_registradores|registrador~51_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000110000000011000000001110010000100100001001000010010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux6~2_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~43_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~45_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~51_combout\,
	datae => \port_map_registradores|ALT_INV_registrador~53_combout\,
	dataf => \port_map_controle|ALT_INV_Mux7~0_combout\,
	combout => \port_map_ual|Equal0~1_combout\);

\port_map_ual|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Equal0~2_combout\ = ( \port_map_controle|Mux7~0_combout\ & ( (!\port_map_registradores|registrador~47_combout\ & !\port_map_registradores|registrador~48_combout\) ) ) # ( !\port_map_controle|Mux7~0_combout\ & ( 
-- (!\port_map_registradores|registrador~47_combout\ & (!\port_map_registradores|registrador~55_combout\ & (!\port_map_registradores|registrador~48_combout\ $ (\port_map_registradores|registrador~56_combout\)))) # 
-- (\port_map_registradores|registrador~47_combout\ & (\port_map_registradores|registrador~55_combout\ & (!\port_map_registradores|registrador~48_combout\ $ (\port_map_registradores|registrador~56_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000100001100010001000100010000100001000011000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~47_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~48_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~55_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~56_combout\,
	datae => \port_map_controle|ALT_INV_Mux7~0_combout\,
	combout => \port_map_ual|Equal0~2_combout\);

\port_map_ual|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Equal0~3_combout\ = ( \port_map_controle|Mux7~0_combout\ & ( (!\port_map_registradores|registrador~49_combout\ & !\port_map_registradores|registrador~50_combout\) ) ) # ( !\port_map_controle|Mux7~0_combout\ & ( 
-- (!\port_map_registradores|registrador~49_combout\ & (!\port_map_registradores|registrador~57_combout\ & (!\port_map_registradores|registrador~50_combout\ $ (\port_map_registradores|registrador~58_combout\)))) # 
-- (\port_map_registradores|registrador~49_combout\ & (\port_map_registradores|registrador~57_combout\ & (!\port_map_registradores|registrador~50_combout\ $ (\port_map_registradores|registrador~58_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000100001100010001000100010000100001000011000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~49_combout\,
	datab => \port_map_registradores|ALT_INV_registrador~50_combout\,
	datac => \port_map_registradores|ALT_INV_registrador~57_combout\,
	datad => \port_map_registradores|ALT_INV_registrador~58_combout\,
	datae => \port_map_controle|ALT_INV_Mux7~0_combout\,
	combout => \port_map_ual|Equal0~3_combout\);

\port_map_ual|Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Equal0~4_combout\ = ( \port_map_ual|Equal0~2_combout\ & ( \port_map_ual|Equal0~3_combout\ & ( (!\port_map_ual|Equal0~0_combout\ & (\port_map_ual|Equal0~1_combout\ & (!\port_map_registradores|registrador~44_combout\ $ 
-- (\port_map_multiplexador_2X1_8bits_br_ula|portOUT[1]~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000010010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_registradores|ALT_INV_registrador~44_combout\,
	datab => \port_map_multiplexador_2X1_8bits_br_ula|ALT_INV_portOUT[1]~1_combout\,
	datac => \port_map_ual|ALT_INV_Equal0~0_combout\,
	datad => \port_map_ual|ALT_INV_Equal0~1_combout\,
	datae => \port_map_ual|ALT_INV_Equal0~2_combout\,
	dataf => \port_map_ual|ALT_INV_Equal0~3_combout\,
	combout => \port_map_ual|Equal0~4_combout\);

\port_map_ual|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux2~0_combout\ = (\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_memoriaInst|Mux0~1_combout\ & \port_map_controle|Mux5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000001000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datad => \port_map_controle|ALT_INV_Mux5~0_combout\,
	combout => \port_map_ual|Mux2~0_combout\);

\port_map_ual|in_tempZero\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|in_tempZero~combout\ = ( \port_map_ual|in_tempZero~combout\ & ( \port_map_ual|Mux2~0_combout\ & ( \port_map_ual|Equal0~4_combout\ ) ) ) # ( !\port_map_ual|in_tempZero~combout\ & ( \port_map_ual|Mux2~0_combout\ & ( 
-- \port_map_ual|Equal0~4_combout\ ) ) ) # ( \port_map_ual|in_tempZero~combout\ & ( !\port_map_ual|Mux2~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_ual|ALT_INV_Equal0~4_combout\,
	datae => \port_map_ual|ALT_INV_in_tempZero~combout\,
	dataf => \port_map_ual|ALT_INV_Mux2~0_combout\,
	combout => \port_map_ual|in_tempZero~combout\);

\port_map_ual|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux1~0_combout\ = !\port_map_controle|Mux5~0_combout\ $ (\port_map_ual|in_tempZero~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001100110011001100110011001100110011001100110011001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_controle|ALT_INV_Mux5~0_combout\,
	datab => \port_map_ual|ALT_INV_in_tempZero~combout\,
	combout => \port_map_ual|Mux1~0_combout\);

\port_map_ual|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|Mux0~0_combout\ = (!\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux1~0_combout\ & \port_map_memoriaInst|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	combout => \port_map_ual|Mux0~0_combout\);

\port_map_ual|zero\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_ual|zero~combout\ = ( \port_map_ual|zero~combout\ & ( \port_map_ual|Mux0~0_combout\ & ( \port_map_ual|Mux1~0_combout\ ) ) ) # ( !\port_map_ual|zero~combout\ & ( \port_map_ual|Mux0~0_combout\ & ( \port_map_ual|Mux1~0_combout\ ) ) ) # ( 
-- \port_map_ual|zero~combout\ & ( !\port_map_ual|Mux0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_ual|ALT_INV_Mux1~0_combout\,
	datae => \port_map_ual|ALT_INV_zero~combout\,
	dataf => \port_map_ual|ALT_INV_Mux0~0_combout\,
	combout => \port_map_ual|zero~combout\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ = ( \port_map_ual|zero~combout\ & ( (!\port_map_memoriaInst|Mux1~0_combout\ & (\port_map_memoriaInst|Mux0~1_combout\ & ((!\port_map_memoriaInst|Mux2~0_combout\) # 
-- (\port_map_memoriaInst|Mux3~0_combout\)))) ) ) # ( !\port_map_ual|zero~combout\ & ( (\port_map_memoriaInst|Mux3~0_combout\ & (\port_map_memoriaInst|Mux2~0_combout\ & (!\port_map_memoriaInst|Mux1~0_combout\ & \port_map_memoriaInst|Mux0~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000001101000000000000000100000000000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux3~0_combout\,
	datab => \port_map_memoriaInst|ALT_INV_Mux2~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux1~0_combout\,
	datad => \port_map_memoriaInst|ALT_INV_Mux0~1_combout\,
	datae => \port_map_ual|ALT_INV_zero~combout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\);

\port_map_addPC|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_addPC|Add0~29_sumout\ = SUM(( \port_map_pc|portOUT\(7) ) + ( GND ) + ( \port_map_addPC|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \port_map_pc|ALT_INV_portOUT\(7),
	cin => \port_map_addPC|Add0~26\,
	sumout => \port_map_addPC|Add0~29_sumout\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[7]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[7]~8_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & \port_map_addPC|Add0~29_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datab => \port_map_addPC|ALT_INV_Add0~29_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[7]~8_combout\);

\port_map_pc|portOUT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(7));

\port_map_memoriaInst|Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_memoriaInst|Mux6~2_combout\ = (!\port_map_pc|portOUT\(7) & (\port_map_memoriaInst|Mux6~0_combout\ & \port_map_memoriaInst|Mux6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000010000000100000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_pc|ALT_INV_portOUT\(7),
	datab => \port_map_memoriaInst|ALT_INV_Mux6~0_combout\,
	datac => \port_map_memoriaInst|ALT_INV_Mux6~1_combout\,
	combout => \port_map_memoriaInst|Mux6~2_combout\);

\port_map_multiplexador_2X1_8bits_jump|portOUT[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \port_map_multiplexador_2X1_8bits_jump|portOUT[0]~1_combout\ = (!\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & ((\port_map_addPC|Add0~1_sumout\))) # (\port_map_multiplexador_2X1_8bits_jump|portOUT[2]~0_combout\ & 
-- (\port_map_memoriaInst|Mux6~2_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \port_map_memoriaInst|ALT_INV_Mux6~2_combout\,
	datab => \port_map_multiplexador_2X1_8bits_jump|ALT_INV_portOUT[2]~0_combout\,
	datac => \port_map_addPC|ALT_INV_Add0~1_sumout\,
	combout => \port_map_multiplexador_2X1_8bits_jump|portOUT[0]~1_combout\);

\port_map_pc|portOUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \port_map_multiplexador_2X1_8bits_jump|portOUT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \port_map_pc|portOUT\(0));

ww_out_out_pc(0) <= \out_out_pc[0]~output_o\;

ww_out_out_pc(1) <= \out_out_pc[1]~output_o\;

ww_out_out_pc(2) <= \out_out_pc[2]~output_o\;

ww_out_out_pc(3) <= \out_out_pc[3]~output_o\;

ww_out_out_pc(4) <= \out_out_pc[4]~output_o\;

ww_out_out_pc(5) <= \out_out_pc[5]~output_o\;

ww_out_out_pc(6) <= \out_out_pc[6]~output_o\;

ww_out_out_pc(7) <= \out_out_pc[7]~output_o\;

ww_out_out_rom(0) <= \out_out_rom[0]~output_o\;

ww_out_out_rom(1) <= \out_out_rom[1]~output_o\;

ww_out_out_rom(2) <= \out_out_rom[2]~output_o\;

ww_out_out_rom(3) <= \out_out_rom[3]~output_o\;

ww_out_out_rom(4) <= \out_out_rom[4]~output_o\;

ww_out_out_rom(5) <= \out_out_rom[5]~output_o\;

ww_out_out_rom(6) <= \out_out_rom[6]~output_o\;

ww_out_out_rom(7) <= \out_out_rom[7]~output_o\;

ww_out_opcode(0) <= \out_opcode[0]~output_o\;

ww_out_opcode(1) <= \out_opcode[1]~output_o\;

ww_out_opcode(2) <= \out_opcode[2]~output_o\;

ww_out_opcode(3) <= \out_opcode[3]~output_o\;

ww_out_rs(0) <= \out_rs[0]~output_o\;

ww_out_rs(1) <= \out_rs[1]~output_o\;

ww_out_rt(0) <= \out_rt[0]~output_o\;

ww_out_rt(1) <= \out_rt[1]~output_o\;

ww_out_endereco(0) <= \out_endereco[0]~output_o\;

ww_out_endereco(1) <= \out_endereco[1]~output_o\;

ww_out_endereco(2) <= \out_endereco[2]~output_o\;

ww_out_endereco(3) <= \out_endereco[3]~output_o\;

ww_out_out_br_reg_A(0) <= \out_out_br_reg_A[0]~output_o\;

ww_out_out_br_reg_A(1) <= \out_out_br_reg_A[1]~output_o\;

ww_out_out_br_reg_A(2) <= \out_out_br_reg_A[2]~output_o\;

ww_out_out_br_reg_A(3) <= \out_out_br_reg_A[3]~output_o\;

ww_out_out_br_reg_A(4) <= \out_out_br_reg_A[4]~output_o\;

ww_out_out_br_reg_A(5) <= \out_out_br_reg_A[5]~output_o\;

ww_out_out_br_reg_A(6) <= \out_out_br_reg_A[6]~output_o\;

ww_out_out_br_reg_A(7) <= \out_out_br_reg_A[7]~output_o\;

ww_out_out_br_reg_B(0) <= \out_out_br_reg_B[0]~output_o\;

ww_out_out_br_reg_B(1) <= \out_out_br_reg_B[1]~output_o\;

ww_out_out_br_reg_B(2) <= \out_out_br_reg_B[2]~output_o\;

ww_out_out_br_reg_B(3) <= \out_out_br_reg_B[3]~output_o\;

ww_out_out_br_reg_B(4) <= \out_out_br_reg_B[4]~output_o\;

ww_out_out_br_reg_B(5) <= \out_out_br_reg_B[5]~output_o\;

ww_out_out_br_reg_B(6) <= \out_out_br_reg_B[6]~output_o\;

ww_out_out_br_reg_B(7) <= \out_out_br_reg_B[7]~output_o\;

ww_out_out_ula_result(0) <= \out_out_ula_result[0]~output_o\;

ww_out_out_ula_result(1) <= \out_out_ula_result[1]~output_o\;

ww_out_out_ula_result(2) <= \out_out_ula_result[2]~output_o\;

ww_out_out_ula_result(3) <= \out_out_ula_result[3]~output_o\;

ww_out_out_ula_result(4) <= \out_out_ula_result[4]~output_o\;

ww_out_out_ula_result(5) <= \out_out_ula_result[5]~output_o\;

ww_out_out_ula_result(6) <= \out_out_ula_result[6]~output_o\;

ww_out_out_ula_result(7) <= \out_out_ula_result[7]~output_o\;

ww_out_out_overflow <= \out_out_overflow~output_o\;

ww_out_out_memAdress(0) <= \out_out_memAdress[0]~output_o\;

ww_out_out_memAdress(1) <= \out_out_memAdress[1]~output_o\;

ww_out_out_memAdress(2) <= \out_out_memAdress[2]~output_o\;

ww_out_out_memAdress(3) <= \out_out_memAdress[3]~output_o\;

ww_out_out_memAdress(4) <= \out_out_memAdress[4]~output_o\;

ww_out_out_memAdress(5) <= \out_out_memAdress[5]~output_o\;

ww_out_out_memAdress(6) <= \out_out_memAdress[6]~output_o\;

ww_out_out_memAdress(7) <= \out_out_memAdress[7]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(0) <= \out_out_mul_2X1_memAdress_ula[0]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(1) <= \out_out_mul_2X1_memAdress_ula[1]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(2) <= \out_out_mul_2X1_memAdress_ula[2]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(3) <= \out_out_mul_2X1_memAdress_ula[3]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(4) <= \out_out_mul_2X1_memAdress_ula[4]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(5) <= \out_out_mul_2X1_memAdress_ula[5]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(6) <= \out_out_mul_2X1_memAdress_ula[6]~output_o\;

ww_out_out_mul_2X1_memAdress_ula(7) <= \out_out_mul_2X1_memAdress_ula[7]~output_o\;
END structure;


