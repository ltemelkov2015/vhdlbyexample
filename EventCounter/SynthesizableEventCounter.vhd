-- SynthesizableEventCounter.vhd
-- Description: Countes the rising and falling edges of a clock 0-99
-- avoids initializing signals and variables also shows he correct way of
-- doing doble clocking, according to Pedroni book
-- Author: Lachezar Temelkov Feb. 2
-- A synthesizable code, uses two counters and multiplexer at the end.
-- we use a state machine , because we want to start the count on the posedge of clock
-- the first posedge of clock has a count of 0



---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------
ENTITY SynthEventCounter IS
  PORT(clk: IN bit;
       reset: IN STD_LOGIC;
       Cntr: OUT INTEGER RANGE 0 to 99);
  END SynthEventCounter;
-----------------------------------------

ARCHITECTURE SynthEventCounter OF SynthEventCounter IS

TYPE state IS(S0,S1,S2); --S0 is the reset state
SIGNAL current_state, next_state:state;
SIGNAL COUNTER1, COUNTER2: INTEGER RANGE 0 TO 101;

BEGIN
 Cntr <= COUNTER1 WHEN clk='1' ELSE COUNTER2;
--------------------------------------------------
   
  PROCESS(clk)
   BEGIN
       if(clk'EVENT and clk='1') THEN 
          if(reset='1') then 
            current_state <=S0;
          else current_state <= next_state;
          end if;
       elsif(clk'EVENT and clk='0') THEN
          if(reset='1') then current_state <=S0;
          elsif(current_state =S0) THEN 
             current_state <=S0;
          else current_state <= next_state;
          end if;
       end if;
      
  END PROCESS;
  

--------------------------------------------------
  
  PROCESS(current_state)
    variable tmp_rising_edge: INTEGER RANGE -2 TO 100;
    variable tmp_falling_edge:INTEGER RANGE -2 TO 101;
    
    BEGIN
    CASE(current_state) IS
      WHEN S0 => --RESET
       COUNTER1 <=0; COUNTER2 <=0;next_state <=S1;
       tmp_rising_edge:=-2; tmp_falling_edge:=-1;
      WHEN S1 => --COUNT RISING EDGES
       IF(tmp_rising_edge = 98) THEN tmp_rising_edge:=0;
       ELSE tmp_rising_edge:=tmp_rising_edge + 2; END IF;
         COUNTER1<=tmp_rising_edge;
         next_state <=S2;
      WHEN S2=> --COUNT FALLING EDGES
         IF(tmp_falling_edge = 99) THEN tmp_falling_edge:=1;
         ELSE tmp_falling_edge:=tmp_falling_edge + 2; END IF;
         COUNTER2<=tmp_falling_edge;
         next_state <=S1;
   END CASE;
   
END PROCESS;
---------------------------------------------------------------------------
        

END SynthEventCounter;
      