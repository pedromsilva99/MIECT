-- Copyright (C) 2017  Intel Corporation. All rights reserved.
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
-- Generated on "04/11/2018 16:14:57"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          BasicWatch
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY BasicWatch_vhd_vec_tst IS
END BasicWatch_vhd_vec_tst;
ARCHITECTURE BasicWatch_arch OF BasicWatch_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL LEDG : STD_LOGIC_VECTOR(8 DOWNTO 8);
SIGNAL SW : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT BasicWatch
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	LEDG : OUT STD_LOGIC_VECTOR(8 DOWNTO 8);
	SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : BasicWatch
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDG => LEDG,
	SW => SW
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 10000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;

-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 25000 ps;
	SW(0) <= '1';
	WAIT FOR 35000 ps;
	SW(0) <= '0';
	WAIT FOR 15000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 40000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 25000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 15000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 25000 ps;
	SW(0) <= '0';
	WAIT FOR 35000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 20000 ps;
	SW(0) <= '1';
	WAIT FOR 20000 ps;
	SW(0) <= '0';
	WAIT FOR 15000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 15000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 15000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 15000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 20000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 15000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 15000 ps;
	SW(0) <= '1';
	WAIT FOR 15000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
	WAIT FOR 20000 ps;
	SW(0) <= '1';
	WAIT FOR 20000 ps;
	SW(0) <= '0';
	WAIT FOR 5000 ps;
	SW(0) <= '1';
	WAIT FOR 5000 ps;
	SW(0) <= '0';
	WAIT FOR 10000 ps;
	SW(0) <= '1';
	WAIT FOR 10000 ps;
	SW(0) <= '0';
WAIT;
END PROCESS t_prcs_SW_0;

-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 15000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 25000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 20000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 20000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 45000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 20000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 20000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 25000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 30000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 20000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 20000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 15000 ps;
	SW(1) <= '1';
	WAIT FOR 35000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 15000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 30000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 20000 ps;
	SW(1) <= '1';
	WAIT FOR 25000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
	WAIT FOR 5000 ps;
	SW(1) <= '0';
	WAIT FOR 10000 ps;
	SW(1) <= '1';
	WAIT FOR 10000 ps;
	SW(1) <= '0';
	WAIT FOR 5000 ps;
	SW(1) <= '1';
WAIT;
END PROCESS t_prcs_SW_1;
END BasicWatch_arch;
