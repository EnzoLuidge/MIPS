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
-- Generated on "05/18/2024 09:43:50"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Aula14
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Aula14_vhd_vec_tst IS
END Aula14_vhd_vec_tst;
ARCHITECTURE Aula14_arch OF Aula14_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL beq_dec : STD_LOGIC;
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL entrada_pcZao : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RAM_IN : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RAM_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reg_rs : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SAIDA_2_ULA : STD_LOGIC;
SIGNAL saida_pc2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SAIDA_ULA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL wr_reg : STD_LOGIC;
COMPONENT Aula14
	PORT (
	beq_dec : OUT STD_LOGIC;
	CLOCK_50 : IN STD_LOGIC;
	entrada_pcZao : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	RAM_IN : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	RAM_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	reg_rs : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SAIDA_2_ULA : OUT STD_LOGIC;
	saida_pc2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SAIDA_ULA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	wr_reg : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Aula14
	PORT MAP (
-- list connections between master ports and signals
	beq_dec => beq_dec,
	CLOCK_50 => CLOCK_50,
	entrada_pcZao => entrada_pcZao,
	RAM_IN => RAM_IN,
	RAM_OUT => RAM_OUT,
	reg_rs => reg_rs,
	SAIDA_2_ULA => SAIDA_2_ULA,
	saida_pc2 => saida_pc2,
	SAIDA_ULA => SAIDA_ULA,
	wr_reg => wr_reg
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 28
	LOOP
		CLOCK_50 <= '0';
		WAIT FOR 10000 ps;
		CLOCK_50 <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	CLOCK_50 <= '0';
WAIT;
END PROCESS t_prcs_CLOCK_50;
END Aula14_arch;
