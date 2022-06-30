LIBRARY ieee;
LIBRARY elementaryGates;
USE ieee.std_logic_1164.all;
USE elementaryGates.all;

ENTITY hammingCodeBitSerialEncoder IS
	PORT (y, clk, rst:	IN STD_LOGIC;
			d_out:	OUT STD_LOGIC);
END hammingCodeBitSerialEncoder;

ARCHITECTURE bitSerialEncoding of hammingCodeBitSerialEncoder IS
	COMPONENT gateAnd
		PORT (x0, x1: IN STD_LOGIC;
				y: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXOR
		PORT (x0, x1: IN STD_LOGIC;
				y: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT flipFlopDPET
		PORT (clk, D: IN STD_LOGIC;
				nSet, nRst: IN STD_LOGIC;
				Q, nQ: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT Mux2_1
    PORT(sel      : IN STD_LOGIC;
          dataln0, dataln1   : IN STD_LOGIC;
          out1    : OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT Mux4_1
    port(sel, selPar      : IN STD_LOGIC;
          dataln0, dataln1, dataln2, dataln3: IN STD_LOGIC;
          out1    : OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT controlUnit 
		PORT (sc: IN STD_LOGIC_VECTOR(3 downto 0);
				comp_rst, a, b, c, d,sel2_1, sel4_1, selPar: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT binCounter_4bit 
		PORT (nRst: IN STD_LOGIC;
				clk:  IN STD_LOGIC;
				c:    OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;
	
	signal s_a, s_b, s_c, s_d, a_y, b_y, c_y, d_y, s_reset, s_sel2_1, s_sel4_1, s_selPar: STD_LOGIC;
	signal Q_x12, Q_x13, Q_x14, Q_x15, sa_12, sb_13, sc_14, sd_15, out2_1, out4_1: STD_LOGIC;
	signal state_counter_signal : STD_LOGIC_VECTOR(3 downto 0);

BEGIN

	stateCounter: binCounter_4bit PORT MAP(rst, clk, state_counter_signal);
	control: controlUnit PORT MAP(state_counter_signal, s_reset, s_a, s_b, s_c, s_d, s_sel2_1, s_sel4_1, s_selPar);
	
	and_a: gateAnd PORT MAP(s_a,y,a_y);
	and_b: gateAnd PORT MAP(s_b,y,b_y);
	and_c: gateAnd PORT MAP(s_c,y,c_y);
	and_d: gateAnd PORT MAP(s_d,y,d_y);
	
	xor_a: gateXOR PORT MAP(a_y, Q_x12,sa_12);
	xor_b: gateXOR PORT MAP(b_y, Q_x13,sb_13);
	xor_c: gateXOR PORT MAP(c_y, Q_x14,sc_14);
	xor_d: gateXOR PORT MAP(d_y, Q_x15,sd_15);
	
	ff_x12: flipFlopDPET PORT MAP(clk,sa_12,'1',not s_reset,Q_x12);
	ff_x13: flipFlopDPET PORT MAP(clk,sb_13,'1',not s_reset,Q_x13);
	ff_x14: flipFlopDPET PORT MAP(clk,sc_14,'1',not s_reset,Q_x14);
	ff_x15: flipFlopDPET PORT MAP(clk,sd_15,'1',not s_reset,Q_x15);
	
	multiplexer2_1: Mux2_1 PORT MAP(s_sel2_1, y, out4_1, out2_1);
	multiplexer4_1: Mux4_1 PORT MAP(s_sel4_1, s_selPar, Q_x12, Q_x13, Q_x14, Q_x15, out4_1);
	
	ff_out: flipFlopDPET PORT MAP(clk,out2_1,'1','1',d_out);
	
END bitSerialEncoding;