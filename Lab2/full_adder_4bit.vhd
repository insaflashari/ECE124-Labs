--author: Lab Section 206, Group 12, Lab2_REPORT, Insaf Lashari, Aryan Gupta

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_4bit is port (
				
				
			CARRY_IN1                 	: in std_logic;
			BUS1_b0                 	: in std_logic;
			BUS0_b0                 	: in std_logic;
			
			BUS1_b1                 	: in std_logic;
			BUS0_b1                 	: in std_logic;
			
			BUS1_b2                 	: in std_logic;
			BUS0_b2                 	: in std_logic;
			
			BUS1_b3                 	: in std_logic;
			BUS0_b3                 	: in std_logic;
		
			
			CARRY_OUT0                	: inout std_logic;
			CARRY_OUT1                	: inout std_logic;
			CARRY_OUT2                	: inout std_logic;
			CARRY_OUT3                	: out std_logic;
			
			SUM                			: out std_logic_vector(3 downto 0)


);
end full_adder_4bit;	
	
architecture adder_logic of full_adder_4bit is

component full_adder_1bit port (
		   INPUT_A                 	: in std_logic;
			INPUT_B                 	: in std_logic;
			CARRY_IN                	: in std_logic;
			FULL_ADDER_CARRY_OUTPUT 	: out std_logic;
			FULL_ADDER_SUM_OUTPUT  		: out std_logic;
			HALF_ADDER_CARRY_OUTPUT		: inout std_logic;
			HALF_ADDER_SUM_OUTPUT      : inout std_logic;
			FA_INPUT_AND					: inout std_logic
	);
	end component;
	
	


begin




INST1: full_adder_1bit port map(BUS0_b0, BUS1_b0, CARRY_IN1, CARRY_OUT0, SUM(0));
INST2: full_adder_1bit port map(BUS0_b1, BUS1_b1, CARRY_OUT0, CARRY_OUT1, SUM(1));
INST3: full_adder_1bit port map(BUS0_b2, BUS1_b2, CARRY_OUT1, CARRY_OUT2, SUM(2));
INST4: full_adder_1bit port map(BUS0_b3, BUS1_b3, CARRY_OUT2, CARRY_OUT3, SUM(3));


end architecture adder_logic;