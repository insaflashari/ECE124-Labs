--author: Lab Section 206, Group 12, Lab4_Report, Aryan Gupta, Insaf Lashari

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- declaration of state machine
Entity State_Machine_Example IS Port
(
	clk_input, reset, enable, blink_sig	: IN std_logic;
	requestNS, requestEW: IN std_logic;

 green, yellow, red					: OUT std_logic; -- northsouth
  greenEW, yellowEW, redEW					: OUT std_logic; --eastwest
 crossNS, crossEW, regclearNS, regclearEW				: OUT std_logic;
 stateout : out std_logic_vector ( 3 downto 0) -- output as 4 bit

 );
END ENTITY;
 

 Architecture SM of State_Machine_Example is
 
 
 TYPE STATE_NAMES IS (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9,S10, S11, S12, S13, S14, S15);   -- list all the STATE_NAMES values

 


 SIGNAL current_state, next_state	:  STATE_NAMES;     	-- signals of type STATE_NAMES



 BEGIN

 -------------------------------------------------------------------------------
 --State Machine:
 -------------------------------------------------------------------------------

 -- REGISTER_LOGIC PROCESS EXAMPLE
 
Register_Section: PROCESS (clk_input)  -- this process updates with a clock
BEGIN
	IF(rising_edge(clk_input)) THEN -- reset handler
		IF (reset = '1') THEN
			current_state <= S0;
		ELSIF (reset = '0' AND enable = '1') THEN -- AND enable = 1
			current_state <= next_state;
		END IF;
	END IF;
END PROCESS;	



-- TRANSITION LOGIC PROCESS EXAMPLE

Transition_Section: PROCESS ( requestEW, requestNS, current_state) 

BEGIN -- state by state for transitioning between states
  CASE current_state IS 
        WHEN S0 => 
					IF (requestEW ='1' AND requestNS ='0' ) then
					next_state <= S6;
					else
					next_state <= S1;
					end if;
					
         WHEN S1 =>	
					IF (requestEW ='1' AND requestNS ='0') then
					next_state <= S6;
					else	
					next_state <= S2;
					end if;

         WHEN S2 =>		
					next_state <= S3;
		
				
         WHEN S3 =>		
					next_state <= S4;
			

         WHEN S4 =>		
					next_state <= S5;

         WHEN S5 =>		
					next_state <= S6;
				
         WHEN S6 =>		
					next_state <= S7;
				
				
         WHEN S7 =>		
					next_state <= S8;
					
			WHEN S8 =>
				IF (requestNS ='1' AND requestEW ='0'  ) then
					next_state <= S14;
					else	
					next_state <= S9;
					end if;
				
				
			WHEN S9 => 
				IF (requestNS ='1' AND requestEW ='0'  ) then
					next_state <= S14;
					else
				next_state <= S10;
				end if;
			
			
			WHEN S10 => 
				next_state <= S11;
				
			WHEN S11 => 
				next_state <= S12;
				
			WHEN S12 => 
				next_state <= S13;
				
			WHEN S13 => 
				next_state <= S14; 
				
			WHEN S14 => 
				next_state <= S15;
				
			WHEN S15 => 
				next_state <= S0;
				
				
				-- all 16 states are done
				WHEN OTHERS =>
               next_state <= S0;
	  END CASE;
 END PROCESS;
 

-- DECODER SECTION PROCESS EXAMPLE (MOORE FORM SHOWN)

Decoder_Section: PROCESS (blink_sig, current_state) 

BEGIN

			regclearNS <= '0'; -- case by case for logic between different states
			regclearEW	<= '0';
			
			
     CASE current_state IS
	  
         WHEN S0 =>
			green  <= blink_sig;
			yellow <= '0';
			red <= '0'; 
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '0';
			crossEW <= '0'; 
			stateout <= "0000";
				
         WHEN S1 =>		
			green  <= blink_sig;
			yellow <= '0';
			red <= '0';
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '0';
			crossEW <= '0';
			stateout <= "0001";
			
         WHEN S2 =>		
			green  <= '1';
			yellow <= '0';
			red <= '0';	
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '1';
			crossEW <= '0';
			stateout <= "0010";
			
         WHEN S3 =>		
			green  <= '1';
			yellow <= '0';
			red <= '0';		
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '1';
			crossEW <= '0';
		
			
			stateout <= "0011";
			
         WHEN S4 =>		
			green  <= '1';
			yellow <= '0';
			red <= '0';		
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '1';
			crossEW <= '0';
			
			
			stateout <= "0100";

         WHEN S5 =>		
			green  <= '1';
			yellow <= '0';
			red <= '0';	 
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '1';
			crossEW <= '0';
					
			
			stateout <= "0101";
			
         WHEN S6 =>		
			green  <= '0';
			yellow <= '1';
			red <= '0';	
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '0';
			crossEW <= '0';
			regclearNS<='1';
			regclearEW<= '0';
			stateout <= "0110";
				
         WHEN S7 =>		
			green  <= '0';
			yellow <= '1';
			red <= '0';
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '1'; 
			crossNS <= '0';
			crossEW <= '0';
			stateout <= "0111";
			
			WHEN S8 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= blink_sig;
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '0';
			
			stateout <= "1000";
			
			WHEN S9 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= blink_sig;
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '0';
			stateout <= "1001";
			
			WHEN S10 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '1';
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '1';
			stateout <= "1010";
			
			WHEN S11 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '1';
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '1';
			stateout <= "1011";
			
			WHEN S12 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '1';
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '1';
			stateout <= "1100";
			
			
			
			WHEN S13=>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '1';
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '1';
			stateout <= "1101";
			
			WHEN S14 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '0';
			yellowEW <= '1';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '0';
			regclearNS<= '0';
			regclearEW<= '1';
			stateout <= "1110";
			
			WHEN S15 =>		
			green  <= '0';
			yellow <= '0';
			red <= '1';
			greenEW  <= '0';
			yellowEW <= '1';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '0';
			stateout <= "1111";
			
				
         WHEN others =>		
			green  <= '0';
			yellow <= '0';
			red <= '0';
			greenEW  <= '0';
			yellowEW <= '0';
			redEW <= '0'; 
			crossNS <= '0';
			crossEW <= '0';
	
			
	  END CASE;
 END PROCESS;

 END ARCHITECTURE SM;