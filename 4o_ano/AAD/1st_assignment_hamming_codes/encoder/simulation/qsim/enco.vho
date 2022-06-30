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
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "12/08/2021 22:17:20"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hammingCodeBitSerialEncoder IS
    PORT (
	y : IN std_logic;
	clk : IN std_logic;
	rst : IN std_logic;
	d_out : OUT std_logic
	);
END hammingCodeBitSerialEncoder;

ARCHITECTURE structure OF hammingCodeBitSerialEncoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_d_out : std_logic;
SIGNAL \d_out~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \stateCounter|ff0|Q~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \stateCounter|ff0|Q~q\ : std_logic;
SIGNAL \stateCounter|ff1|Q~0_combout\ : std_logic;
SIGNAL \stateCounter|ff1|Q~q\ : std_logic;
SIGNAL \stateCounter|ff2|Q~0_combout\ : std_logic;
SIGNAL \stateCounter|ff2|Q~q\ : std_logic;
SIGNAL \stateCounter|ff3|Q~0_combout\ : std_logic;
SIGNAL \stateCounter|ff3|Q~q\ : std_logic;
SIGNAL \y~input_o\ : std_logic;
SIGNAL \and_c|y~0_combout\ : std_logic;
SIGNAL \and_c|y~1_combout\ : std_logic;
SIGNAL \and_d|y~0_combout\ : std_logic;
SIGNAL \and_c|y~2_combout\ : std_logic;
SIGNAL \ff_x14|Q~0_combout\ : std_logic;
SIGNAL \control|comp_rst~0_combout\ : std_logic;
SIGNAL \ff_x14|Q~q\ : std_logic;
SIGNAL \and_a|y~0_combout\ : std_logic;
SIGNAL \and_a|y~1_combout\ : std_logic;
SIGNAL \ff_x12|Q~0_combout\ : std_logic;
SIGNAL \ff_x12|Q~q\ : std_logic;
SIGNAL \and_d|y~1_combout\ : std_logic;
SIGNAL \and_d|y~2_combout\ : std_logic;
SIGNAL \ff_x15|Q~0_combout\ : std_logic;
SIGNAL \ff_x15|Q~q\ : std_logic;
SIGNAL \and_b|y~0_combout\ : std_logic;
SIGNAL \and_b|y~1_combout\ : std_logic;
SIGNAL \ff_x13|Q~0_combout\ : std_logic;
SIGNAL \ff_x13|Q~q\ : std_logic;
SIGNAL \multiplexer2_1|out1~0_combout\ : std_logic;
SIGNAL \multiplexer2_1|out1~1_combout\ : std_logic;
SIGNAL \multiplexer2_1|out1~2_combout\ : std_logic;
SIGNAL \ff_out|Q~q\ : std_logic;
SIGNAL \control|ALT_INV_comp_rst~0_combout\ : std_logic;
SIGNAL \ff_out|ALT_INV_Q~q\ : std_logic;

BEGIN

ww_y <= y;
ww_clk <= clk;
ww_rst <= rst;
d_out <= ww_d_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\control|ALT_INV_comp_rst~0_combout\ <= NOT \control|comp_rst~0_combout\;
\ff_out|ALT_INV_Q~q\ <= NOT \ff_out|Q~q\;

\d_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ff_out|ALT_INV_Q~q\,
	devoe => ww_devoe,
	o => \d_out~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\stateCounter|ff0|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stateCounter|ff0|Q~0_combout\ = !\stateCounter|ff0|Q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff0|Q~q\,
	combout => \stateCounter|ff0|Q~0_combout\);

\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

\stateCounter|ff0|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stateCounter|ff0|Q~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stateCounter|ff0|Q~q\);

\stateCounter|ff1|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stateCounter|ff1|Q~0_combout\ = \stateCounter|ff0|Q~q\ $ (\stateCounter|ff1|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \stateCounter|ff1|Q~0_combout\);

\stateCounter|ff1|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stateCounter|ff1|Q~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stateCounter|ff1|Q~q\);

\stateCounter|ff2|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stateCounter|ff2|Q~0_combout\ = \stateCounter|ff2|Q~q\ $ (((\stateCounter|ff0|Q~q\ & \stateCounter|ff1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \stateCounter|ff2|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \stateCounter|ff2|Q~0_combout\);

\stateCounter|ff2|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stateCounter|ff2|Q~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stateCounter|ff2|Q~q\);

\stateCounter|ff3|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stateCounter|ff3|Q~0_combout\ = \stateCounter|ff3|Q~q\ $ (((\stateCounter|ff2|Q~q\ & (\stateCounter|ff0|Q~q\ & \stateCounter|ff1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff3|Q~q\,
	datab => \stateCounter|ff2|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \stateCounter|ff3|Q~0_combout\);

\stateCounter|ff3|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \stateCounter|ff3|Q~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stateCounter|ff3|Q~q\);

\y~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y,
	o => \y~input_o\);

\and_c|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_c|y~0_combout\ = (\y~input_o\ & !\stateCounter|ff2|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y~input_o\,
	datad => \stateCounter|ff2|Q~q\,
	combout => \and_c|y~0_combout\);

\and_c|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_c|y~1_combout\ = (\stateCounter|ff0|Q~q\ & (\stateCounter|ff3|Q~q\)) # (!\stateCounter|ff0|Q~q\ & ((\stateCounter|ff1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff3|Q~q\,
	datab => \stateCounter|ff1|Q~q\,
	datad => \stateCounter|ff0|Q~q\,
	combout => \and_c|y~1_combout\);

\and_d|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_d|y~0_combout\ = (\y~input_o\ & !\stateCounter|ff3|Q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y~input_o\,
	datad => \stateCounter|ff3|Q~q\,
	combout => \and_d|y~0_combout\);

\and_c|y~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_c|y~2_combout\ = (\stateCounter|ff2|Q~q\ & (\and_d|y~0_combout\ & ((\stateCounter|ff1|Q~q\) # (!\stateCounter|ff0|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff2|Q~q\,
	datab => \and_d|y~0_combout\,
	datac => \stateCounter|ff1|Q~q\,
	datad => \stateCounter|ff0|Q~q\,
	combout => \and_c|y~2_combout\);

\ff_x14|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ff_x14|Q~0_combout\ = \ff_x14|Q~q\ $ (((\and_c|y~2_combout\) # ((\and_c|y~0_combout\ & \and_c|y~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \and_c|y~0_combout\,
	datab => \and_c|y~1_combout\,
	datac => \and_c|y~2_combout\,
	datad => \ff_x14|Q~q\,
	combout => \ff_x14|Q~0_combout\);

\control|comp_rst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|comp_rst~0_combout\ = (!\stateCounter|ff2|Q~q\ & (!\stateCounter|ff3|Q~q\ & (!\stateCounter|ff0|Q~q\ & !\stateCounter|ff1|Q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff2|Q~q\,
	datab => \stateCounter|ff3|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \control|comp_rst~0_combout\);

\ff_x14|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ff_x14|Q~0_combout\,
	clrn => \control|ALT_INV_comp_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_x14|Q~q\);

\and_a|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_a|y~0_combout\ = (\y~input_o\ & (!\stateCounter|ff3|Q~q\ & ((\stateCounter|ff0|Q~q\) # (!\stateCounter|ff2|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y~input_o\,
	datab => \stateCounter|ff0|Q~q\,
	datac => \stateCounter|ff2|Q~q\,
	datad => \stateCounter|ff3|Q~q\,
	combout => \and_a|y~0_combout\);

\and_a|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_a|y~1_combout\ = (\and_c|y~0_combout\ & ((\stateCounter|ff0|Q~q\) # ((\stateCounter|ff3|Q~q\ & !\stateCounter|ff1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \and_c|y~0_combout\,
	datab => \stateCounter|ff0|Q~q\,
	datac => \stateCounter|ff3|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \and_a|y~1_combout\);

\ff_x12|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ff_x12|Q~0_combout\ = \ff_x12|Q~q\ $ (((\and_a|y~1_combout\) # ((\stateCounter|ff1|Q~q\ & \and_a|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff1|Q~q\,
	datab => \and_a|y~0_combout\,
	datac => \and_a|y~1_combout\,
	datad => \ff_x12|Q~q\,
	combout => \ff_x12|Q~0_combout\);

\ff_x12|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ff_x12|Q~0_combout\,
	clrn => \control|ALT_INV_comp_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_x12|Q~q\);

\and_d|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_d|y~1_combout\ = (\stateCounter|ff3|Q~q\) # ((\stateCounter|ff0|Q~q\ & \stateCounter|ff1|Q~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff3|Q~q\,
	datab => \stateCounter|ff0|Q~q\,
	datac => \stateCounter|ff1|Q~q\,
	combout => \and_d|y~1_combout\);

\and_d|y~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_d|y~2_combout\ = (\stateCounter|ff2|Q~q\ & (\and_d|y~0_combout\ & (\stateCounter|ff0|Q~q\ $ (\stateCounter|ff1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff2|Q~q\,
	datab => \and_d|y~0_combout\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \and_d|y~2_combout\);

\ff_x15|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ff_x15|Q~0_combout\ = \ff_x15|Q~q\ $ (((\and_d|y~2_combout\) # ((\and_d|y~1_combout\ & \and_c|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \and_d|y~1_combout\,
	datab => \and_c|y~0_combout\,
	datac => \and_d|y~2_combout\,
	datad => \ff_x15|Q~q\,
	combout => \ff_x15|Q~0_combout\);

\ff_x15|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ff_x15|Q~0_combout\,
	clrn => \control|ALT_INV_comp_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_x15|Q~q\);

\and_b|y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_b|y~0_combout\ = (\y~input_o\ & (!\stateCounter|ff2|Q~q\ & ((\stateCounter|ff1|Q~q\) # (!\stateCounter|ff0|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \y~input_o\,
	datab => \stateCounter|ff1|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff2|Q~q\,
	combout => \and_b|y~0_combout\);

\and_b|y~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \and_b|y~1_combout\ = (\and_d|y~0_combout\ & ((\stateCounter|ff2|Q~q\ & ((\stateCounter|ff0|Q~q\) # (!\stateCounter|ff1|Q~q\))) # (!\stateCounter|ff2|Q~q\ & (\stateCounter|ff0|Q~q\ & !\stateCounter|ff1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \and_d|y~0_combout\,
	datab => \stateCounter|ff2|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \and_b|y~1_combout\);

\ff_x13|Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ff_x13|Q~0_combout\ = \ff_x13|Q~q\ $ (((\and_b|y~1_combout\) # ((\stateCounter|ff3|Q~q\ & \and_b|y~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff3|Q~q\,
	datab => \and_b|y~0_combout\,
	datac => \and_b|y~1_combout\,
	datad => \ff_x13|Q~q\,
	combout => \ff_x13|Q~0_combout\);

\ff_x13|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ff_x13|Q~0_combout\,
	clrn => \control|ALT_INV_comp_rst~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_x13|Q~q\);

\multiplexer2_1|out1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \multiplexer2_1|out1~0_combout\ = (\stateCounter|ff0|Q~q\ & ((\stateCounter|ff1|Q~q\ & (\ff_x15|Q~q\)) # (!\stateCounter|ff1|Q~q\ & ((\ff_x13|Q~q\))))) # (!\stateCounter|ff0|Q~q\ & (((\stateCounter|ff1|Q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff0|Q~q\,
	datab => \ff_x15|Q~q\,
	datac => \ff_x13|Q~q\,
	datad => \stateCounter|ff1|Q~q\,
	combout => \multiplexer2_1|out1~0_combout\);

\multiplexer2_1|out1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \multiplexer2_1|out1~1_combout\ = (\stateCounter|ff0|Q~q\ & (((\multiplexer2_1|out1~0_combout\)))) # (!\stateCounter|ff0|Q~q\ & ((\multiplexer2_1|out1~0_combout\ & (\ff_x14|Q~q\)) # (!\multiplexer2_1|out1~0_combout\ & ((\ff_x12|Q~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ff_x14|Q~q\,
	datab => \ff_x12|Q~q\,
	datac => \stateCounter|ff0|Q~q\,
	datad => \multiplexer2_1|out1~0_combout\,
	combout => \multiplexer2_1|out1~1_combout\);

\multiplexer2_1|out1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \multiplexer2_1|out1~2_combout\ = (\stateCounter|ff2|Q~q\ & ((\stateCounter|ff3|Q~q\ & ((!\multiplexer2_1|out1~1_combout\))) # (!\stateCounter|ff3|Q~q\ & (!\y~input_o\)))) # (!\stateCounter|ff2|Q~q\ & (((!\y~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stateCounter|ff2|Q~q\,
	datab => \stateCounter|ff3|Q~q\,
	datac => \y~input_o\,
	datad => \multiplexer2_1|out1~1_combout\,
	combout => \multiplexer2_1|out1~2_combout\);

\ff_out|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \multiplexer2_1|out1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff_out|Q~q\);

ww_d_out <= \d_out~output_o\;
END structure;


