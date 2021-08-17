library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux6_4 is
	port(	UniCent	:	in std_logic_vector(3 downto 0);
		   DezCent	:	in std_logic_vector(3 downto 0);
		   UniSeg	:	in std_logic_vector(3 downto 0);
		   DezSeg	:	in std_logic_vector(3 downto 0);
		   UniMin	:	in std_logic_vector(3 downto 0);
		   DezMin	:	in std_logic_vector(3 downto 0);
			sel		:	in std_logic;
			dataOut0	:	out std_logic_vector(3 downto 0);
			dataOut1	:	out std_logic_vector(3 downto 0);
			dataOut2	:	out std_logic_vector(3 downto 0);
			dataOut3	:	out std_logic_vector(3 downto 0));
			
end Mux6_4;

architecture Behavioral of Mux6_4 is

begin
	process(sel)
	begin
		if(sel='0') then
			dataOut0 <= UniSeg;
			dataOut1 <= DezSeg;
			dataOut2 <= UniMin;
			dataOut3 <= DezMin;
			
		else
			dataOut0 <= UniCent;
			dataOut1 <= DezCent;
			dataOut2 <= UniSeg;
			dataOut3 <= DezSeg;
		end if;
	end process;
end Behavioral;