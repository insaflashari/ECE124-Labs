--author: Lab Section 206, Group 12, Lab2_REPORT, Insaf Lashari, Aryan Gupta

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_1bit is port (
				
				
			INPUT_A                 	: in std_logic;
			INPUT_B                 	: in std_logic;
			CARRY_IN                	: in std_logic;
			FULL_ADDER_CARRY_OUTPUT 	: out std_logic;
			FULL_ADDER_SUM_OUTPUT  		: out std_logic;
			HALF_ADDER_CARRY_OUTPUT		: inout std_logic;
			HALF_ADDER_SUM_OUTPUT      : inout std_logic;
			FA_INPUT_AND					: inout std_logic


);
end full_adder_1bit;	
	
architecture adder_logic of full_adder_1bit is

begin

HALF_ADDER_CARRY_OUTPUT <= (INPUT_A AND INPUT_B);
HALF_ADDER_SUM_OUTPUT <= (INPUT_A XOR INPUT_B);
FULL_ADDER_SUM_OUTPUT <= (CARRY_IN XOR HALF_ADDER_SUM_OUTPUT);
FA_INPUT_AND          <= (CARRY_IN AND HALF_ADDER_SUM_OUTPUT);
FULL_ADDER_CARRY_OUTPUT <= (FA_INPUT_AND OR HALF_ADDER_CARRY_OUTPUT);

end architecture adder_logic;