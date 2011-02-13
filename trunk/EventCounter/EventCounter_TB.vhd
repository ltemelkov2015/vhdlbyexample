-- EventCounter_TB.vhdl
-- TestBench for the EventCounter


-----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------



-----------------------------------------------------
ENTITY EventCounter_TB IS
  END EventCounter_TB;
-----------------------------------------------------


-----------------------------------------------------
ARCHITECTURE EventCounter_TB OF EventCounter_TB IS

COMPONENT EventCounter
   PORT(clk: IN bit;
        Cntr: OUT INTEGER RANGE 0 to 99);
END COMPONENT;

---------------------------------------------
SIGNAL CLOCK: BIT:= '0';
SIGNAL COUNTER: INTEGER RANGE 0 TO 99;
---------------------------------------------

BEGIN
  UUT: EventCounter port map(CLOCK, COUNTER);
  clock_gen: PROCESS(CLOCK)
      BEGIN
        CLOCK <= NOT CLOCK after 25 ns;
    END PROCESS;
END EventCounter_TB;
---------------------------------------------
  

  
  