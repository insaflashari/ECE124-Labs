--author: Lab Section 206, Group 12, Lab4_Report, Aryan Gupta, Insaf Lashari

library IEEE;
use IEEE.std_logic_1164.all;

-- declaration of synchronizer
entity synchronizer is port (

			clk					: in std_logic;
			reset					: in std_logic;
			din					: in std_logic;
			dout					: out std_logic
  );
 end synchronizer;
 
 
architecture circuit of synchronizer is
	-- register as a 2 bit number
	Signal sreg				: std_logic_vector(1 downto 0);

BEGIN

	process(clk)
	
	begin 
	 if (rising_edge(clk)) then
	 
	 -- keeps register in sync with global clock
	 
	sreg(0) <= (not reset AND din);
	sreg(1) <= (not reset AND sreg(0));
		

		
	end if;
	 
	 
		
	end process;
	dout <=  sreg(1); 
	 

end;