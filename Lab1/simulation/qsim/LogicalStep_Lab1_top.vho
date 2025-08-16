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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "05/28/2024 19:32:58"

-- 
-- Device: Altera 10M08SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab1_top IS
    PORT (
	leds : OUT std_logic_vector(7 DOWNTO 0);
	sw : IN std_logic_vector(1 DOWNTO 1);
	PB : IN std_logic_vector(1 DOWNTO 0)
	);
END LogicalStep_Lab1_top;

ARCHITECTURE structure OF LogicalStep_Lab1_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(1 DOWNTO 1);
SIGNAL ww_PB : std_logic_vector(1 DOWNTO 0);
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \PB[1]~input_o\ : std_logic;
SIGNAL \PB[0]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \inst5|OUT_4~0_combout\ : std_logic;
SIGNAL \inst8|inst3~0_combout\ : std_logic;
SIGNAL \inst8|inst2~combout\ : std_logic;
SIGNAL \inst8|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst8|ALT_INV_inst2~combout\ : std_logic;
SIGNAL \inst5|ALT_INV_OUT_4~0_combout\ : std_logic;

BEGIN

leds <= ww_leds;
ww_sw <= sw;
ww_PB <= PB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst8|ALT_INV_inst3~0_combout\ <= NOT \inst8|inst3~0_combout\;
\inst8|ALT_INV_inst2~combout\ <= NOT \inst8|inst2~combout\;
\inst5|ALT_INV_OUT_4~0_combout\ <= NOT \inst5|OUT_4~0_combout\;

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst8|ALT_INV_inst2~combout\,
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|OUT_4~0_combout\,
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\PB[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB(1),
	o => \PB[1]~input_o\);

\PB[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PB(0),
	o => \PB[0]~input_o\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\inst5|OUT_4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst5|OUT_4~0_combout\ = \sw[1]~input_o\ $ (((\PB[1]~input_o\) # (\PB[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PB[1]~input_o\,
	datac => \PB[0]~input_o\,
	datad => \sw[1]~input_o\,
	combout => \inst5|OUT_4~0_combout\);

\inst8|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst8|inst3~0_combout\ = \sw[1]~input_o\ $ (\PB[1]~input_o\ $ (\PB[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[1]~input_o\,
	datab => \PB[1]~input_o\,
	datac => \PB[0]~input_o\,
	combout => \inst8|inst3~0_combout\);

\inst8|inst2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst8|inst2~combout\ = \sw[1]~input_o\ $ (((!\PB[0]~input_o\) # (!\PB[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PB[1]~input_o\,
	datab => \PB[0]~input_o\,
	datac => \sw[1]~input_o\,
	combout => \inst8|inst2~combout\);

ww_leds(7) <= \leds[7]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(0) <= \leds[0]~output_o\;
END structure;


