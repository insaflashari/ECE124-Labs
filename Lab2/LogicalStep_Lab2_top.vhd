--author: Lab Section 206, Group 12, Lab2_REPORT, Insaf Lashari, Aryan Gupta

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb_n				: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
	); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
  component SevenSegment port (
  
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
	
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	component segment7_mux port (
			clk			: in  std_logic := '0';
			DIN2			: in  std_logic_vector(6 downto 0);
			DIN1			: in  std_logic_vector(6 downto 0);
			DOUT			: out std_logic_vector(6 downto 0);
			DIG2			: out std_logic;
			DIG1			: out std_logic
	);
	end component;
	
	component PB_Inverters port (		
			pb_n			: in std_logic_vector(3 downto 0);
			pb				: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component Logic_Processor port (
			logic_in0	: in std_logic_vector(3 downto 0);
			logic_in1	: in std_logic_vector(3 downto 0);
			mux_select	: in std_logic_vector(1 downto 0);
			logic_out	: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component full_adder_4bit port (
				
				
			CARRY_IN1                 	: in std_logic;
			BUS1_b0                 	: in std_logic;
			BUS0_b0                 	: in std_logic;
			
			BUS1_b1                 	: in std_logic;
			BUS0_b1                 	: in std_logic;
			
			BUS1_b2                 	: in std_logic;
			BUS0_b2                 	: in std_logic;
			
			BUS1_b3                 	: in std_logic;
			BUS0_b3                 	: in std_logic;
			
			CARRY_OUT3                	: out std_logic;
			SUM                			: out std_logic_vector(3 downto 0)
	);
	end component;	
	
		component mux2to1 port (
				
				hex_num0				 : in std_logic_vector(3 downto 0);
				hex_num1				 : in std_logic_vector(3 downto 0);
				mux_select         : in std_logic;
				hex_out 				 : out std_logic_vector(3 downto 0)
	);
	end component;	
	
	
-------------------------------------------------------------------
	
	
-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--

	signal seg7_A		: std_logic_vector(6 downto 0);
	
	signal seg7_B		: std_logic_vector(6 downto 0);
	
	signal hex_A		: std_logic_vector(3 downto 0);
	
	signal hex_B		: std_logic_vector(3 downto 0);
	
	
	signal pb			: std_logic_vector(3 downto 0);
	
	signal signal_c   : std_logic_vector(3 downto 0);
	
	signal hex_sum    : std_logic_vector(3 downto 0);
	signal carry_out  : std_logic;
	
	signal display_A  : std_logic_vector(3 downto 0);
	signal display_B  : std_logic_vector(3 downto 0);
	
	
-- Here the circuit begins

begin

 hex_A <= SW(3 downto 0);
 hex_B <= SW(7 downto 4);
 
 signal_c <= "000" & carry_out;


--COMPONENT HOOKUP

	INST1: SevenSegment port map(display_A, seg7_A);
	INST2: SevenSegment port map(display_B, seg7_B);
	INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data(6 downto 0), seg7_char2, seg7_char1);
	INST4: PB_Inverters port map(pb_n(3 downto 0), pb);
	INST5: Logic_Processor port map(hex_B, hex_A, pb(1 downto 0), leds(3 downto 0));
	INST6: full_adder_4bit port map('0', hex_B(0), hex_A(0), hex_B(1), hex_A(1), hex_B(2), hex_A(2), hex_B(3), hex_A(3), carry_out, hex_sum);
	INST7: mux2to1 port map(hex_sum, hex_A, pb(2), display_A);
	INST8: mux2to1 port map(signal_c, hex_B, pb(2), display_B);
 
end SimpleCircuit;

