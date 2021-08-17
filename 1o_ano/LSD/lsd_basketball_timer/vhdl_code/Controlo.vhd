library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Controlo is
	port (clk	   : in  std_logic;
			enable   : in  std_logic;-- Representa o Start/Stop
			rst	   : in  std_logic;
			cntRst   : out std_logic;
			cntEnb   : out std_logic); 
end Controlo;  

architecture Behavioral of Controlo is
	
	type state is (RESET, STARTED, STOPPED, START);
	signal PS, NS : state;
	
begin

	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				PS <= RESET;
			else
				PS <= NS;
			end if;	
		end if;
	end process;
	
	
	com_proc : process(PS, enable)	
	begin
		case PS is	
		
			when RESET => 
				if (enable = '1' and rst = '0') then
					NS <= START;
					cntRst <= '0';
					cntEnb <= '1';
				elsif (enable = '0' and rst = '1') then
					NS <= RESET;
					cntRst <= '1';
					cntEnb <= '0';
				elsif (enable = '0' and rst = '0') then
					NS <= RESET;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '1' and rst = '1') then
					NS <= RESET;
					cntRst <= '1';
					cntEnb <= '1';
				end if;
					
			when START => 
				if (enable = '1' and rst = '0') then
					NS <= STARTED;
					cntRst <= '0';
					cntEnb <= '1';
				elsif (enable = '0' and rst = '1') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '0' and rst = '0') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '1' and rst = '1') then
					NS <= RESET;
					cntRst <= '1';
					cntEnb <= '1';
				end if;	

			when STARTED =>
				if (enable = '1' and rst = '0') then
					NS <= STARTED;
					cntRst <= '0';
					cntEnb <= '1';
				elsif (enable = '0' and rst = '1') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '0' and rst = '0') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '1' and rst = '1') then
					NS <= RESET;
					cntRst <= '1';
					cntEnb <= '1';
				end if;
			
			when STOPPED =>
				if (enable = '1' and rst = '0') then
					NS <= START;
					cntRst <= '0';
					cntEnb <= '1';
				elsif (enable = '0' and rst = '1') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '0' and rst = '0') then
					NS <= STOPPED;
					cntRst <= '0';
					cntEnb <= '0';
				elsif (enable = '1' and rst = '1') then
					NS <= RESET;
					cntRst <= '1';
					cntEnb <= '1';
				end if;
						
				
			end case;
	end process;
end Behavioral;