--author: Lab Section 206, Group 12, Lab2_REPORT, Insaf Lashari, Aryan Gupta

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2to1 is 
port (
				
				
			hex_num0, hex_num1      : in std_logic_vector(3 downto 0);
			mux_select              : in std_logic;
			hex_out                	: out std_logic_vector(3 downto 0)


);
end mux2to1;	
	
architecture mux2to1_logic of mux2to1 is

begin

with mux_select select
hex_out <= hex_num0 when '1',
			  hex_num1 when '0';

end mux2to1_logic;