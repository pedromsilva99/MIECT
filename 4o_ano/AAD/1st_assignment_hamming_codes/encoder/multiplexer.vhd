library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux2_1 is
    port(sel      : in std_logic;
          dataln0, dataln1   : in std_logic;
          out1    : out std_logic);

end Mux2_1;

architecture BehavProc of Mux2_1 is
begin
    out1 <= (dataln0 and not sel) or (dataln1 and sel) ;
end BehavProc;


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
    port(sel, selPar      : in std_logic;
          dataln0, dataln1, dataln2, dataln3: in std_logic;
          out1    : out std_logic);

end Mux4_1;

architecture BehavProc of Mux4_1 is
begin
    out1 <= (sel and selPar and dataln3) or (sel and not selPar and dataln2) 
	 or (not sel and selPar and dataln1) or (not sel and not selPar and dataln0);
end BehavProc;