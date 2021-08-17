library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity Timer is
	port(clock		:	in std_logic;
		  enable 	:	in std_logic; 
		  enable2 	:	in std_logic; --este enable serve para colcar o tempo de novo a 10 minutos quando acaba o período  
		  reset		:	in std_logic; 
		  overtime  :  in std_logic; --se o jogo estiver empatado no final do 4 periodo, este overtime faz com que sejam adicionados mais 5 minutos de overtime
		  UniCent	:	out std_logic_vector(3 downto 0);
		  DezCent	:	out std_logic_vector(3 downto 0);
		  UniSeg		:	out std_logic_vector(3 downto 0);
		  DezSeg		:	out std_logic_vector(3 downto 0);
		  UniMin		:	out std_logic_vector(3 downto 0);
		  DezMin		:	out std_logic_vector(3 downto 0));

end Timer;

architecture Behavioral of Timer is
--definição dos valores iniciais
signal s_UnidadesCent : unsigned(3 downto 0) := "0000";
signal s_DezenasCent  : unsigned(3 downto 0) := "0000";
signal s_UnidadesSeg  : unsigned(3 downto 0) := "0000";
signal s_DezenasSeg   : unsigned(3 downto 0) := "0000";
signal s_UnidadesMin  : unsigned(3 downto 0) := "0000";
signal s_DezenasMin   : unsigned(3 downto 0) := "0001"; 

begin
	process(clock)
	begin 
		if ((rising_edge(clock)) and (enable = '1')) then
			if (reset = '1') then --valores após o reset
				s_UnidadesCent <= "0000";
				s_DezenasCent  <= "0000";
				s_UnidadesSeg  <= "0000";
				s_DezenasSeg   <= "0000";
				s_UnidadesMin  <= "0000";
				s_DezenasMin   <= "0001";
			
			
			elsif (s_UnidadesMin = "0000" and s_DezenasMin = "0000" and s_DezenasSeg = "0000" and s_UnidadesSeg = "0000" and s_UnidadesCent = "0000" and s_DezenasCent = "0000") then
			
				if(enable2='0' and overtime='0') then
					
					s_UnidadesCent <= s_UnidadesCent;
					s_DezenasCent <= s_DezenasCent;
					s_UnidadesSeg <= s_UnidadesSeg;
					s_DezenasSeg <= s_DezenasSeg;
					s_UnidadesMin <= s_UnidadesMin;
					s_DezenasMin <= s_DezenasMin;
					
				elsif(enable2='1') then
				--caso o tempo esteja a 00:00 o enable2 volta a colocar o tempo a 10 minutos
					s_UnidadesCent <= "0000";
					s_DezenasCent <= "0000";
					s_UnidadesSeg <= "0000";
					s_DezenasSeg <= "0000";
					s_UnidadesMin <= "0000";
					s_DezenasMin <= "0001";
					
				elsif(overtime='1') then
				--caso o jogo esteja empatado no final, o overtime coloca o jogo adiciona 5 minutos para se jogarem
					s_UnidadesCent <= "0000";
					s_DezenasCent <= "0000";
					s_UnidadesSeg <= "0000";
					s_DezenasSeg <= "0000";
					s_UnidadesMin <= "0101";
					s_DezenasMin <= "0000";
					
				end if;

			else
			
				if(enable2='0' and overtime='0') then
			
					s_UnidadesCent <= s_UnidadesCent - 1; --a cada sinal de clock, o tempo desce um centésimo
								
					if (s_UnidadesCent = "0000" and s_DezenasCent /= "0000") then 
						s_UnidadesCent  <= "1001";
						s_DezenasCent <= s_DezenasCent - 1; 
								
					elsif (s_UnidadesCent = "0000" and s_DezenasCent = "0000") then
						s_UnidadesSeg <= s_UnidadesSeg - 1;
						s_UnidadesCent  <= "1001";
						s_DezenasCent <= "1001";
								
						if (s_UnidadesCent = "0000" and s_DezenasCent = "0000" and s_UnidadesSeg = "0000" and s_DezenasSeg /= "0000") then
								s_UnidadesSeg <= "1001";
								s_DezenasSeg <= s_DezenasSeg - 1;
								
						elsif (s_UnidadesSeg = "0000" and s_DezenasSeg = "0000" and s_UnidadesCent = "0000" and s_DezenasCent = "0000") then
								s_UnidadesSeg <= "1001";
								s_DezenasSeg <= "0101";
								s_UnidadesMin <= s_UnidadesMin - 1;
											
							if (s_UnidadesMin = "0000" and s_DezenasMin /= "0000") then
								s_DezenasMin <= s_DezenasMin - 1;
								s_UnidadesMin <= "1001";
													
							end if;
						end if;					
					end if;	
				end if;
			end if;
				
		else 
			s_UnidadesCent <= s_UnidadesCent;
			s_DezenasCent <= s_DezenasCent;
			s_UnidadesSeg <= s_UnidadesSeg;
			s_DezenasSeg <= s_DezenasSeg;
			s_UnidadesMin <= s_UnidadesMin;
			s_DezenasMin <= s_DezenasMin;
			
		end if;	
				
	end process;

	UniCent <= std_logic_vector(s_UnidadesCent);
	DezCent <= std_logic_vector(s_DezenasCent);
	UniSeg  <= std_logic_vector(s_UnidadesSeg);
	DezSeg  <= std_logic_vector(s_DezenasSeg);
	UniMin  <= std_logic_vector(s_UnidadesMin);
	DezMin  <= std_logic_vector(s_DezenasMin);
	
end Behavioral;