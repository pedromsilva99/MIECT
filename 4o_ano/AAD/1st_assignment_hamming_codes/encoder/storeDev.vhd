LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDPET IS
  PORT (clk, D:     IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q, nQ:      OUT STD_LOGIC);
END flipFlopDPET;

ARCHITECTURE behavior OF flipFlopDPET IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN Q <= '0';
		      nQ <= '1';
		 ELSIF (nSet = '0')
		       THEN Q <= '1';
		            nQ <= '0';
	          ELSIF (clk = '1') AND (clk'EVENT)
	                THEN Q <= D;
		                  nQ <= NOT D;

	 END IF;
  END PROCESS;
END behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY elementaryGates;
USE elementaryGates.all;

ENTITY binCounter_4bit IS
  PORT (nRst: IN STD_LOGIC;
        clk:  IN STD_LOGIC;
        c:    OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END binCounter_4bit;

ARCHITECTURE structure OF binCounter_4bit IS
  SIGNAL pD1, pD2: STD_LOGIC;
  SIGNAL iD1, iD2, iD3: STD_LOGIC;
  SIGNAL iQ0, iQ1, iQ2, iQ3: STD_LOGIC;
  SIGNAL inQ0: STD_LOGIC;
  COMPONENT gateAnd
    PORT (x0, x1: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT gateXOR
    PORT (x0, x1: IN STD_LOGIC;
          y:      OUT STD_LOGIC);
  END COMPONENT;
  COMPONENT flipFlopDPET
    PORT (clk, D:     IN STD_LOGIC;
          nSet, nRst: IN STD_LOGIC;
          Q, nQ:      OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  ad1: gateAnd PORT MAP (iQ0, iQ1, pD1);
  ad2: gateAnd PORT MAP (pD1, iQ2, pD2);
  
  xr1: gateXOR PORT MAP (iQ0, iQ1, iD1);
  xr2: gateXOR PORT MAP (pD1, iQ2, iD2);
  xr3: gateXOR PORT MAP (pD2, iQ3, iD3);
  
  ff0: flipFlopDPET PORT MAP (clk, inQ0, '1', nRst, iQ0, inQ0);
  ff1: flipFlopDPET PORT MAP (clk, iD1,  '1', nRst, iQ1);
  ff2: flipFlopDPET PORT MAP (clk, iD2,  '1', nRst, iQ2);
  ff3: flipFlopDPET PORT MAP (clk, iD3,  '1', nRst, iQ3);
  c(0) <= iQ0;
  c(1) <= iQ1;
  c(2) <= iQ2;
  c(3) <= iQ3;
END structure;