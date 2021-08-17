library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Este mux seleciona entra faltas e pontos o que irá aparecer nos displays de 7 segmentos.
--Só deixa incrementar e decrementar no que estiver seleccionado.

entity Mux4_2 is
	port(	uniFaltas	:	in std_logic_vector(3 downto 0);
			dezFaltas	:	in std_logic_vector(3 downto 0);
			uniPontos	:	in std_logic_vector(3 downto 0);
			dezPontos	:	in std_logic_vector(3 downto 0);
			sel			:	in std_logic;
			dataOut0		:	out std_logic_vector(3 downto 0);
			dataOut1		:	out std_logic_vector(3 downto 0));
end Mux4_2;

architecture Behavioral of Mux4_2 is

begin
	process(sel)
	begin
		if(sel='0') then
			dataOut0 <= uniPontos;
			dataOut1 <= dezPontos;
		else
			dataOut0 <= uniFaltas;
			dataOut1 <= dezFaltas;
		end if;
	end process;
end Behavioral;