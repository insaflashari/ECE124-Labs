--author: Lab Section 206, Group 12, Lab4_Report, Aryan Gupta, Insaf Lashari

-- libraries
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


--declaration of top file
ENTITY LogicalStep_Lab4_top IS
   PORT
	(
   clkin_50		: in	std_logic;							-- The 50 MHz FPGA Clockinput
	rst_n			: in	std_logic;							-- The RESET input (ACTIVE LOW)
	pb_n			: in	std_logic_vector(3 downto 0); -- The push-button inputs (ACTIVE LOW)
 	sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds			: out std_logic_vector(7 downto 0);	-- for displaying the the lab4 project details
	--sim_sm_clken 	 : out	std_logic;
	--sim_blink_sig  : out	std_logic;
	--EW_a, EW_g, EW_d, NS_a, NS_g, NS_d : out std_logic;
	-------------------------------------------------------------
	-- you can add temporary output ports here if you need to debug your design 
	-- or to add internal signals for your simulations
	-------------------------------------------------------------
	
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;							-- seg7 digi selectors
	seg7_char2  : out	std_logic							-- seg7 digi selectors
	);
END LogicalStep_Lab4_top;


--architecture declarations
ARCHITECTURE SimpleCircuit OF LogicalStep_Lab4_top IS

   component segment7_mux port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	--bits 6 to 0 represent segments G,F,E,D,C,B,A
			 DIN1 		: in  std_logic_vector(6 downto 0); --bits 6 to 0 represent segments G,F,E,D,C,B,A
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
   );
   end component;

   component clock_generator port (
			sim_mode			: in boolean;
			reset				: in std_logic;
         clkin      		: in  std_logic; --clock
			sm_clken			: out	std_logic;
			blink		  		: out std_logic
  );
   end component;

   component pb_inverters port (
				rst_n: in std_logic;
				rst: out std_logic;
			 pb_n					: in std_logic_vector(3 downto 0);
			 pb			  		: out std_logic_vector(3 downto 0)
  );
   end component;

	
	component synchronizer port(
			clk					: in std_logic;
			reset					: in std_logic;
			din					: in std_logic;
			dout					: out std_logic
  );
   end component;
	
	
-- 
	component holding_register port (
		clk					: in std_logic;
		reset					: in std_logic;
		register_clr			: in std_logic;
		din					: in std_logic;
		dout					: out std_logic
  );
  end component;
  
  
component PB_filters port (
	clkin				: in std_logic;
	rst_n				: in std_logic;
	rst_n_filtered	: out std_logic;
 	pb_n				: in  std_logic_vector (3 downto 0);
	pb_n_filtered	: out	std_logic_vector(3 downto 0)							 
	); 
end component;

component State_Machine_Example  Port
(
 clk_input, reset, enable, requestNS, requestEW, blink_sig	: IN std_logic;
 green, yellow, red					: OUT std_logic;
  greenEW, yellowEW, redEW					: OUT std_logic;
 crossNS, regclearNS, regclearEW, crossEW				: OUT std_logic;
 stateout : out std_logic_vector(3 downto 0)

 );
END component;
  
  
--				
	
----------------------------------------------------------------------------------------------------
	CONSTANT	sim_mode						: boolean := TRUE; -- set to FALSE for LogicalStep board downloads
	                                                     -- set to TRUE for SIMULATIONS
--	
SIGNAL sm_clken, blink_sig, NS_CROSSING, EW_CROSSING		: std_logic; 
	
	--Push button
	SIGNAL pb								: std_logic_vector(3 downto 0);
	SIGNAL sync_out :std_logic_vector ( 1 downto 0);
	SIGNAL rst_in: std_logic;
	SIGNAL rst_n_fil: std_logic;
	SIGNAL synch_rst: std_logic;
	SIGNAL pb_filt: std_logic_vector (3 downto 0);

	-- North South
	signal greensolid: std_logic;
	signal yellowsolid: std_logic;
	signal redsolid: std_logic;

	
	--East West
	signal greensolidEW: std_logic;
	signal yellowsolidEW: std_logic;
	signal redsolidEW: std_logic;
	
	
-- lights
	signal light:  std_logic_vector (6 downto 0);
		
	signal lightEW: std_logic_vector (6 downto 0);
	signal rst: std_logic;
	signal requestNS : std_logic;
	signal requestEW : std_logic;
	signal registernsc : std_logic;
	signal registerewc : std_logic;

	
BEGIN



	-- sends output values to the led array
 leds(0)<= NS_CROSSING; -- sm_clken
 leds(2)<= EW_CROSSING; -- blink_sig
 leds(1)<= requestNS;
 leds(3) <= requestEW;
 
light <=  yellowsolid & "00" & greensolid & "00" & redsolid; -- North South
lightEW <=  yellowsolidEW & "00" & greensolidEW & "00" & redsolidEW; -- East West





----------------------------------------------------------------------------------------------------
INST1: pb_inverters		port map (rst_n_fil, rst, pb_filt, pb);
INST2: clock_generator 	port map (sim_mode, pb(3), clkin_50, sm_clken, blink_sig); -- blink_sig;
INST3: PB_filters port map (clkin_50, rst_n, rst_n_fil, pb_n, pb_filt);
INST4: synchronizer port map( clkin_50, synch_rst, rst, synch_rst); -- the synchronizer is also reset by synch_rst.
INST5: synchronizer port map(clkin_50, synch_rst, pb(1), sync_out(1)); -- the synchronizer is also reset by synch_rst.
INST6: holding_register port map (clkin_50, synch_rst, registerewc, sync_out(1), requestEW);--led(1);
INST7: synchronizer port map (clkin_50, synch_rst, pb(0), sync_out(0));
INST8: holding_register port map( clkin_50, synch_rst, registernsc, sync_out(0), requestNS); --led(3);

INST9: State_Machine_Example PORT MAP(clkin_50, synch_rst, sm_clken, requestNS , requestEW, blink_sig, 
greensolid, yellowsolid, redsolid,  greensolidEW, yellowsolidEW, redsolidEW,NS_CROSSING, registernsc, 
registerewc, EW_CROSSING, leds(7 downto 4));

INST10: segment7_mux port map(clkin_50, lightEW, light , seg7_data (6 downto 0), seg7_char1, seg7_char2); 

-- Used for waveform 2


 --sim_sm_clken <= sm_clken;
 --sim_blink_sig <= blink_sig;
 --EW_g <= greensolidEW;
 --EW_a <= yellowsolidEW;
 --EW_d <= redsolidEW;
 --NS_g <= greensolid;
 --NS_a <= yellowsolid;
 --NS_d <= redsolid;


END SimpleCircuit;