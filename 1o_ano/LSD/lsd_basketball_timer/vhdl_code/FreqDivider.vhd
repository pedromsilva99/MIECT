library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity FreqDivider is
	port(	clk_50mhz  :  in std_logic; -- entrada- clock de 50 mhz
			clk_100hz  :  out std_logic); -- saída- clock de 100 hz
end FreqDivider;

architecture behavioral of FreqDivider is
	--signal halfway: std_logic_vector(17 downto 0) :="111101000010010000"; --250 000 em binário (Para frequência de 1hz temos que defenir como 25 000 000, para 100hz é 25 000 000 / 100)
	signal halfway: std_logic_vector(17 downto 0) :="000110000110101000"; -- Frequência menor para uso na apresentação oral
 	signal counter: std_logic_vector(17 downto 0) :=(others=>'0');	
	signal newClk : std_logic :='0';
begin 
	
	process(clk_50mhz)
	begin
	
		if rising_edge(clk_50mhz) then
			if counter=halfway-'1' then
				counter <= (others=>'0');
				newClk <= not newClk;
			else
				counter<= counter + "1";
			end if;
		end if;
	
	end process;
	clk_100hz <= newClk;
end behavioral;