library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BasicWatch is
	port(SW			: in  std_logic_vector(1 downto 0);
		  CLOCK_50	: in  std_logic;
		  KEY			: in  std_logic_vector(2 downto 0);
		  HEX2		: out std_logic_vector(6 downto 0);
		  HEX3		: out std_logic_vector(6 downto 0);
		  HEX4		: out std_logic_vector(6 downto 0);
		  HEX5		: out std_logic_vector(6 downto 0);
		  LEDG		: out std_logic_vector(8 downto 8);
		  LEDR		: out std_logic_vector(0 downto 0));
		  
end BasicWatch;

architecture Structural of BasicWatch is

	-- Sinal global de reset
	signal s_globalRst : std_logic;
	
	-- Reset individual para os contadores de segundos ('1' quando ajustamos os minutos)
	signal s_sReset : std_logic;
	
	-- Controlo de sinais
	signal s_mode : std_logic; -- s_mode='0'-normal operation; s_mode='1'-set min/hours
	signal s_mSet : std_logic; -- s_mSet='1'-set (fast increment) minutes
	
	-- Base 4 Hz clock signal
	signal s_clk4Hz : std_logic;
	
	-- Global enable (always '1' while setting min/hours;
	-- otherwise always repeating '1', '0', '0', '0')
	signal s_globalEnb : std_logic;

	-- Binary values of each counter
	signal s_sUnitsBin : std_logic_vector(3 downto 0);
	signal s_sTensBin	: std_logic_vector(3 downto 0);
	signal s_mUnitsBin : std_logic_vector(3 downto 0);
	signal s_mTensBin	: std_logic_vector(3 downto 0);
	

	-- Terminal count flags of each counter
	signal s_sUnitsTerm, s_sTensTerm	: std_logic;
	signal s_mUnitsTerm, s_mTensTerm	: std_logic;
	

	-- Enable signals of each counter
	signal s_sUnitsEnb, s_sTensEnb	: std_logic;
	signal s_mUnitsEnb, s_mTensEnb	: std_logic;
	
	
	signal s_max_num_hours, s_h_tens_display_en : std_logic;

begin
	s_globalRst	<= SW(0);  --RESET
	s_sReset		<= s_globalRst or s_mode;
	
	s_mode <= not KEY(1); 
	s_mSet <= not KEY(2);
										
	clk_div_4hz : entity work.ClkDividerN(RTL)
							generic map(k			=> 12500000)  --frequência para que seja 1 segundo real
							port map(clkIn			=> CLOCK_50,
										clkOut		=> s_clk4Hz);

	clk_enb_gen : entity work.ClkEnableGenerator(RTL)   --isto faz com que ce acenda a LED Green 8 a cada segundo que passa
							port map(clkIn4Hz		=> s_clk4Hz,
										mode			=> s_mode,
										clkEnable	=> s_globalEnb,
										tick1Hz		=> LEDG(8));
										
	

	s_sUnitsEnb	<= '1'; 

	s_units_cnt : entity work.Counter4Bits(RTL)   
							generic map(MAX	=> 9)
							port map(reset		=> s_sReset,
										clk		=> s_clk4Hz,
										enable1	=> s_globalEnb,
										enable2	=> s_sUnitsEnb,
										enable3  => SW(1),
										valOut	=> s_sUnitsBin,
										termCnt	=> s_sUnitsTerm,
										enable4  => (s_sUnitsBin),
										enable5  => unsigned (s_sTensBin),
										enable6  => unsigned (s_mUnitsBin),
										enable7  => unsigned (s_mTensBin));

	s_sTensEnb <= s_sUnitsTerm;

	s_tens_cnt : entity work.Counter4Bits(RTL)
							generic map(MAX	=> 5)
							port map(reset		=> s_sReset,
										clk		=> s_clk4Hz,
										enable1	=> s_globalEnb,
										enable2	=> s_sTensEnb,
										enable3  => SW(1),
										valOut	=> s_sTensBin,
										termCnt	=> s_sTensTerm,
										enable4  => unsigned (s_sUnitsBin),
										enable5  => unsigned (s_sTensBin),
										enable6  => unsigned (s_mUnitsBin),
										enable7  => unsigned (s_mTensBin));

	s_mUnitsEnb <= ((s_sTensTerm and s_sUnitsTerm) and not s_mode) or
						(s_mode and s_mSet);

	m_units_cnt : entity work.Counter4Bits(RTL)
							generic map(MAX	=> 9)
							port map(reset		=> s_globalRst,
										clk		=> s_clk4Hz,
										enable1	=> s_globalEnb,
										enable2	=> s_mUnitsEnb,
										enable3  => SW(1),
										valOut	=> s_mUnitsBin,
										termCnt	=> s_mUnitsTerm,
										enable4  => unsigned (s_sUnitsBin),
										enable5  => unsigned (s_sTensBin),
										enable6  => unsigned (s_mUnitsBin),
										enable7  => unsigned (s_mTensBin));

	s_mTensEnb <= (s_mUnitsTerm and s_mUnitsEnb);

	m_tens_cnt : entity work.Counter4Bits(RTL)
							generic map(MAX	=> 5)
							port map(reset		=> s_globalRst,
										clk		=> s_clk4Hz,
										enable1	=> s_globalEnb,
										enable2	=> s_mTensEnb,
										enable3  => SW(1),
										valOut	=> s_mTensBin,
										termCnt	=> s_mTensTerm,
										enable4  => unsigned (s_sUnitsBin),
										enable5  => unsigned (s_sTensBin),
										enable6  => unsigned (s_mUnitsBin),
										enable7  => unsigned (s_mTensBin));

	

	s_units_decod : entity work.Bin7SegDecoder(RTL)
							port map(enable	=> '1',
										binInput	=> s_sUnitsBin,
										decOut_n	=> HEX2);

	s_tens_decod : entity work.Bin7SegDecoder(RTL)
							port map(enable	=> '1',
										binInput	=> s_sTensBin,
										decOut_n	=> HEX3);

	m_units_decod : entity work.Bin7SegDecoder(RTL)
							port map(enable	=> '1',
										binInput	=> s_mUnitsBin,
										decOut_n	=> HEX4);

	m_tens_decod : entity work.Bin7SegDecoder(RTL)
							port map(enable	=> '1',
										binInput	=> s_mTensBin,
										decOut_n	=> HEX5);

	
end Structural;