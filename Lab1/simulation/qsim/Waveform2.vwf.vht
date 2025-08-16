-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/28/2024 19:32:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          LogicalStep_Lab1_top
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY LogicalStep_Lab1_top_vhd_vec_tst IS
END LogicalStep_Lab1_top_vhd_vec_tst;
ARCHITECTURE LogicalStep_Lab1_top_arch OF LogicalStep_Lab1_top_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL leds : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL PB : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL sw : STD_LOGIC_VECTOR(1 DOWNTO 1);
COMPONENT LogicalStep_Lab1_top
	PORT (
	leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	PB : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	sw : IN STD_LOGIC_VECTOR(1 DOWNTO 1)
	);
END COMPONENT;
BEGIN
	i1 : LogicalStep_Lab1_top
	PORT MAP (
-- list connections between master ports and signals
	leds => leds,
	PB => PB,
	sw => sw
	);

-- sw[1]
t_prcs_sw_1: PROCESS
BEGIN
LOOP
	sw(1) <= '0';
	WAIT FOR 1000000 ps;
	sw(1) <= '1';
	WAIT FOR 1000000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_sw_1;

-- PB[1]
t_prcs_PB_1: PROCESS
BEGIN
LOOP
	PB(1) <= '0';
	WAIT FOR 500000 ps;
	PB(1) <= '1';
	WAIT FOR 500000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_PB_1;

-- PB[0]
t_prcs_PB_0: PROCESS
BEGIN
LOOP
	PB(0) <= '0';
	WAIT FOR 250000 ps;
	PB(0) <= '1';
	WAIT FOR 250000 ps;
	IF (NOW >= 2000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_PB_0;
END LogicalStep_Lab1_top_arch;
