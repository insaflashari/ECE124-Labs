LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity HVAC is

	port
	(
		HVAC_SIM : IN boolean; 
		clk : in std_logic;
		run : in std_logic;
		increase, decrease : in std_logic;
		temp : out std_logic_vector(3 downto 0) 
		
	);
	
end entity;
	
architecture rtl of HVAC is  
	signal clk_2hz : std_logic;
	signal HVAC_clock : std_logic;
	signal digital_counter : std_logic_vector(23 downto 0);
	
	
	
begin



	clk_divider: process (clk)
		variable counter: unsigned(23 downto 0);
		
		begin
		

			if (rising_edge (clk)) then
						counter := counter + 1;
			end if;
			
			
			digital_counter <= std_logic_vector(counter);
			
			
	end process;
		

	clk_2hz <= digital_counter(23);

	clk_mux: process (HVAC_SIM)

	begin 
		if (HVAC_SIM) then
		
				HVAC_clock <= clk;
				
		else
				HVAC_clock <= clk_2hz;
				
		end if;
		
	end process;
	
	
	
counter: process (HVAC_clock)

	variable cnt : unsigned(3 downto 0) := "0111";
	begin
	
	
		IF ((rising_edge(HVAC_clock))	AND (run = '1')) then 
			IF ((increase = '1') AND (cnt <	"1111"))	then 
			cnt := cnt + 1 ;
			
			ELSIF ((decrease = '1')AND (cnt > "0000")) then
			cnt := cnt - 1 ;
			
			END IF; 
		END IF;
		
	
	
		temp <= std_logic_vector(cnt);
	
	end process;
	
end rtl;