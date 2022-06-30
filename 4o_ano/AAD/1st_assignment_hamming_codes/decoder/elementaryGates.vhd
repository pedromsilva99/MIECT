LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateAnd;

ARCHITECTURE logicFunction OF gateAnd IS
BEGIN
  y <= x0 AND x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateOr IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateOr;

ARCHITECTURE logicFunction OF gateOr IS
BEGIN
  y <= x0 OR x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXOR IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateXOR;

ARCHITECTURE logicFunction OF gateXOR IS
BEGIN
  y <= x0 XOR x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd4 IS
	PORT(x0,x1,x2,x3: IN STD_LOGIC;
		  y: OUT STD_LOGIC);
end gateAnd4;

ARCHITECTURE structure OF gateAnd4 IS
	COMPONENT gateAnd
		PORT (x0, x1: IN STD_LOGIC;
				y: OUT STD_LOGIC);
	END COMPONENT;
	signal s0,s1: STD_LOGIC;

BEGIN
	and1: gateAnd PORT MAP (x0,x1,s0);
	and2: gateAnd PORT MAP (x2,x3,s1);
	and3: gateAnd PORT MAP (s0,s1,y);

END structure;