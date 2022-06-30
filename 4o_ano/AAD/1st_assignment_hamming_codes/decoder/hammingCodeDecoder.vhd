LIBRARY ieee;
LIBRARY elementaryGates;
USE ieee.std_logic_1164.all;
USE elementaryGates.all;

ENTITY hammingCodeDecoder IS
	PORT (y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15:	IN STD_LOGIC;
			m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11:	OUT STD_LOGIC);
END hammingCodeDecoder;

ARCHITECTURE pararellDecoder of hammingCodeDecoder IS
	
	signal  s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15: STD_LOGIC; -- xor correction o
	signal sp1,sp2,sp3,sp4: STD_LOGIC;  --p1,p2,p3,p4 signal
	signal y1_y7, y8_y11, y_a, y2_y3, y23_9, y4_y5, y45_10, y6_y9, y10_y11, y_b, y2_y4, y24_7, y3_y5, y35_8: STD_LOGIC; -- xor signals;

	
	-- COMPONENTES INSTANCIADOS
	COMPONENT decoder4to11
		PORT (p1, p2, p3, p4: IN STD_LOGIC;
				o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11: OUT STD_LOGIC);
	END COMPONENT;
	COMPONENT gateXOR
		PORT (x0, x1: IN STD_LOGIC;
				y: OUT STD_LOGIC);
	END COMPONENT;

BEGIN
	
	-- p1
	xor1_7: gateXOR PORT MAP (y1, y7, y1_y7);
	xor8_11: gateXOR PORT MAP (y8, y11, y8_y11);
	xor_A: gateXOR PORT MAP(y1_y7,y8_y11,y_a);
	
	xor2_3: gateXOR PORT MAP(y2, y3, y2_y3);
	xor23_9: gateXOR PORT MAP(y2_y3, y9, y23_9);
	
	xor12: gateXOR PORT MAP(y23_9,y_a,s12);
	xorp1: gateXOR PORT MAP(s12,y12,sp1);
	
	-- p2
	xor4_5: gateXOR PORT MAP(y4, y5, y4_y5);
	xor45_10: gateXOR PORT MAP(y4_y5, y10, y45_10);
	xor13: gateXOR PORT MAP(y_a,y45_10,s13);
	xorp2: gateXOR PORT MAP(s13,y13,sp2);
	
	-- p3 
	xor6_9: gateXOR PORT MAP (y6, y9, y6_y9);
	xor10_11: gateXOR PORT MAP (y10, y11, y10_y11);
	xor_B: gateXOR PORT MAP(y6_y9,y10_y11,y_b);
	
	xor2_4: gateXOR PORT MAP(y2, y4, y2_y4);
	xor24_7: gateXOR PORT MAP(y2_y4, y7, y24_7);
	
	xor14: gateXOR PORT MAP(y24_7,y_b,s14);
	xorp3: gateXOR PORT MAP(s14,y14,sp3);
	
	-- p4
	xor3_5: gateXOR PORT MAP(y3, y5, y3_y5);
	xor35_8: gateXOR PORT MAP(y3_y5, y8, y35_8);
	xor15: gateXOR PORT MAP(y_b,y35_8,s15);
	xorp4: gateXOR PORT MAP(s15,y15,sp4);

	
	-- FIND THE BIT WHERE THERE'S AN ERROR, IF ANY 
	error_finder: decoder4to11 PORT MAP(sp1, sp2, sp3, sp4, s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11);
	
	-- CORRECTING OUTPUT BITS IF THERE IS ANY ERROR
	out_m1: gateXOR PORT MAP(s1, y1, m1);
	out_m2: gateXOR PORT MAP(s2, y2, m2);
	out_m3: gateXOR PORT MAP(s3, y3, m3);
	out_m4: gateXOR PORT MAP(s4, y4, m4);
	out_m5: gateXOR PORT MAP(s5, y5, m5);
	out_m6: gateXOR PORT MAP(s6, y6, m6);
	out_m7: gateXOR PORT MAP(s7, y7, m7);
	out_m8: gateXOR PORT MAP(s8, y8, m8);
	out_m9: gateXOR PORT MAP(s9, y9, m9);
	out_m10: gateXOR PORT MAP(s10, y10, m10);
	out_m11: gateXOR PORT MAP(s11, y11, m11);
	
END pararellDecoder;

	