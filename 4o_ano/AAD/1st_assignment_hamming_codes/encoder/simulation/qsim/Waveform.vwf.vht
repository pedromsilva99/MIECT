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
-- Generated on "12/08/2021 22:17:19"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          hammingCodeBitSerialEncoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY hammingCodeBitSerialEncoder_vhd_vec_tst IS
END hammingCodeBitSerialEncoder_vhd_vec_tst;
ARCHITECTURE hammingCodeBitSerialEncoder_arch OF hammingCodeBitSerialEncoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL d_out : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL y : STD_LOGIC;
COMPONENT hammingCodeBitSerialEncoder
	PORT (
	clk : IN STD_LOGIC;
	d_out : OUT STD_LOGIC;
	rst : IN STD_LOGIC;
	y : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : hammingCodeBitSerialEncoder
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	d_out => d_out,
	rst => rst,
	y => y
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 49
	LOOP
		clk <= '0';
		WAIT FOR 10000 ps;
		clk <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 980000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

-- y
t_prcs_y: PROCESS
BEGIN
	y <= '0';
	WAIT FOR 10000 ps;
	y <= '1';
	WAIT FOR 120000 ps;
	y <= '0';
WAIT;
END PROCESS t_prcs_y;
END hammingCodeBitSerialEncoder_arch;
