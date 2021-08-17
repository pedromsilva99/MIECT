library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CounterUpDownPontos is
	port(	clk			:	in std_logic;
			enable		:	in std_logic;
			reset			:	in std_logic;
			upPontos		:  in std_logic;
			downPontos	:  in std_logic;
			Uni			:	out std_logic_vector(3 downto 0);
			Dez			:	out std_logic_vector(3 downto 0));
end CounterUpDownPontos;

architecture Behavioral of CounterUpDownPontos is
	signal s_cntUni	:	unsigned(3 downto 0) :="0000";
	signal s_cntDez	:	unsigned(3 downto 0) :="0000";
	
begin

	Uni <= std_logic_vector(s_cntUni);
	Dez <= std_logic_vector(s_cntDez);
	
	process(clk)
	begin
		if((enable = '1') and (rising_edge(clk))) then
		
			if(reset='1') then--reset coloca os pontos no valor inicial 
				s_cntUni <= "0000";
				s_cntDez <= "0000";
				
			elsif (upPontos = '1') then --se as unidades forem 9 e incrementarem mais um ponto, as unidades passam para 0 e as dezenas para (dezenas + 1)
				if (s_cntUni = "1001") then
					s_cntUni <= "0000";
					s_cntDez <= s_cntDez + 1;
					
					if (s_cntUni = "1001" and s_cntDez = "1001") then --se os pontos forem 99, não deixa incrementar mais
						s_cntUni <= "1001";
						s_cntDez <= "1001";
					end if;
					
				else
					s_cntUni <= s_cntUni + 1;
				end if;
				
			elsif (downPontos = '1') then
				if (s_cntUni = "0000") then --se as unidades forem 0 e retirarem mais um ponto, as unidades passam para 9 e as dezenas para (dezenas - 1)
					s_cntUni <= "1001";
					s_cntDez <= s_cntDez - 1;
					
					if (s_cntUni = "0000" and s_cntDez = "0000") then --se as faltas forem 0, não deixa decrementar mais
						s_cntUni <= "0000";
						s_cntDez <= "0000";
					end if;
					
				else
					s_cntUni <= s_cntUni - 1;
				end if;
				
			else
				s_cntUni <= s_cntUni;
				s_cntDez <= s_cntDez;
				
			end if;
		end if;
	end process;
end Behavioral;