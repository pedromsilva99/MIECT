LIBRARY ieee;
LIBRARY elementaryGates;
USE ieee.std_logic_1164.all;
USE elementaryGates.all;

ENTITY decoder4to11 is
	PORT (p1, p2, p3, p4: IN STD_LOGIC;
			o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: OUT STD_LOGIC);
END decoder4to11;

ARCHITECTURE combinatorialDecoding OF decoder4to11 IS
	COMPONENT gateAnd4
		PORT(x0,x1,x2,x3: IN STD_LOGIC;
			  y: OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN

	x1_out:  gateAnd4 PORT MAP (     p1,     p2, not p3, not p4, o1);
	x2_out:  gateAnd4 PORT MAP (     p1, not p2,     p3, not p4, o2);
	x3_out:  gateAnd4 PORT MAP (     p1, not p2, not p3,     p4, o3);
	x4_out:  gateAnd4 PORT MAP ( not p1,     p2,     p3, not p4, o4);
	x5_out:  gateAnd4 PORT MAP ( not p1,     p2, not p3,     p4, o5);
	x6_out:  gateAnd4 PORT MAP ( not p1, not p2,     p3,     p4, o6);
	x7_out:  gateAnd4 PORT MAP (     p1,     p2,     p3, not p4, o7);
	x8_out:  gateAnd4 PORT MAP (     p1,     p2, not p3,     p4, o8);
	x9_out:  gateAnd4 PORT MAP (     p1, not p2,     p3,     p4, o9);
	x10_out: gateAnd4 PORT MAP ( not p1,    p2,     p3,     p4, o10);	
	x11_out: gateAnd4 PORT MAP (     p1,     p2,    p3,     p4, o11);	

END combinatorialDecoding;