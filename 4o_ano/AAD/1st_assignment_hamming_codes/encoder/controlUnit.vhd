LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controlUnit IS
  PORT (sc: IN std_logic_vector(3 downto 0);
        comp_rst, a, b, c, d, sel2_1, sel4_1, selPar:      OUT STD_LOGIC);
END controlUnit;

ARCHITECTURE behavior OF controlUnit IS
	
BEGIN
	a <= (not sc(2) and sc(0)) or (not sc(3) and not sc(2) and sc(1)) or (not sc(3) and sc(1) and sc(0)) or (sc(3) and not sc(2) and not sc(1));
	b <= (not sc(3) and not sc(1) and sc(0)) or (not sc(3) and sc(2) and not sc(1)) or (not sc(3) and sc(2) and sc(0)) or (sc(3) and not sc(2) and not sc(0)) or (sc(3) and not sc(2) and sc(1));
	c <= (not sc(2) and sc(1) and not sc(0)) or (not sc(3) and sc(2) and not sc(0)) or (not sc(3) and sc(2) and sc(1)) or (sc(3) and not sc(2) and sc(0));
	d <= (sc(3) and not sc(2)) or (not sc(2) and sc(1) and sc(0)) or (not sc(3) and sc(2) and not sc(1) and sc(0)) or (not sc(3) and sc(2) and sc(1) and not sc(0));
	sel2_1 <= sc(3) and sc(2);
	sel4_1 <= sc(3) and sc(2) and sc(1);
	selPar <= sc(3) and sc(2) and sc(0);
	comp_rst <= not sc(3) and not sc(2) and not sc(1) and not sc(0);

END behavior;