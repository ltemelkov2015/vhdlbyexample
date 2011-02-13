-- SynthesizableEventCounter_TB.vhdl
-- TestBench for the SynthesizableEventCounter


-----------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------



-----------------------------------------------------
ENTITY SynthEventCounter_TB IS
  END SynthEventCounter_TB;
-----------------------------------------------------


-----------------------------------------------------
ARCHITECTURE SynthEventCounter_TB OF SynthEventCounter_TB IS

COMPONENT SynthEventCounter
   PORT(clk: IN bit;
       reset: IN STD_LOGIC;
       Cntr: OUT INTEGER RANGE 0 to 99);
END COMPONENT;

---------------------------------------------
SIGNAL CLOCK: BIT:= '0';
SIGNAL RST: STD_LOGIC;
SIGNAL COUNTER: INTEGER RANGE 0 TO 99;
---------------------------------------------

BEGIN
  UUT: SynthEventCounter port map(CLOCK, RST, COUNTER);
  clock_gen: PROCESS(CLOCK)
      BEGIN
        CLOCK <= NOT CLOCK after 25 ns;
    END PROCESS;
  reset_circuit: PROCESS
      BEGIN
        RST <='0';
        wait for 95 ns;
        RST <='1';
        wait for 20 ns;
        RST <='0';
        wait;
    END PROCESS;
END SynthEventCounter_TB;
---------------------------------------------
  

  
  