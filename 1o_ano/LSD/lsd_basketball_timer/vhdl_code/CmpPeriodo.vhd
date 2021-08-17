library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CmpPeriodo is
	port( reset		:	in  std_logic;
		   enable	:	in  std_logic;
			periodo  :	in  std_logic;
		   LED0		:	out std_logic;
		   LED1		:	out std_logic;
		   LED2		:	out std_logic;
		   LED3		:	out std_logic);

end CmpPeriodo;

architecture Behavioral of CmpPeriodo is

	signal s_periodo	: integer :=1;
	signal s_led0		: std_logic:='1';
	signal s_led1		: std_logic:='0';
	signal s_led2		: std_logic:='0';
	signal s_led3		: std_logic:='0';
	
begin
	
	LED0 <= s_led0;
	LED1 <= s_led1;
	LED2 <= s_led2;
	LED3 <= s_led3;
	
	process(periodo)
	
		begin
		if(enable='1') then
			if (reset = '1') then
				s_led0 <= '1';
				s_led1 <= '0';
				s_led2 <= '0';
				s_led3 <= '0';
				
				s_periodo <= 1;

			
			elsif(reset='0') then
			
				if (rising_edge(periodo)) then
				
					s_periodo <= s_periodo + 1;
					
					
					if (s_periodo=1) then
						s_led0 <= '1';
						s_led1 <= '0';
						s_led2 <= '0';
						s_led3 <= '0';
						
					elsif (s_periodo=2) then
						s_led0 <= '1';
						s_led1 <= '1';
						s_led2 <= '0';
						s_led3 <= '0';
						
					elsif (s_periodo=3) then
						s_led0 <= '1';
						s_led1 <= '1';
						s_led2 <= '1';
						s_led3 <= '0';
						
					elsif (s_periodo=4) then
						s_led0 <= '1';
						s_led1 <= '1';
						s_led2 <= '1';
						s_led3 <= '1';
						
						
					end if;		
				end if;
			end if;
		end if;
	end process;
end Behavioral;