--FrequencyDiveder_TB.vhd
--Test bench for frequencydivider


------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
------------------------------------------

ENTITY FreqDivider_TB IS
  GENERIC(n: INTEGER:=1024);
END FreqDivider_TB;

---------------------------------------------

ARCHITECTURE FreqDivider_TB OF FreqDivider_TB IS
---------------------------------------------
component FreqDiv 
  
  PORT (fclk:   IN  STD_LOGIC;
        ClkDiv: IN  INTEGER RANGE 0 TO n; 
        fclk_n: OUT STD_LOGIC);
END component;

---------------------------------------------

SIGNAL clock_out: STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
SIGNAL Div:INTEGER RANGE 0 to n:=5;
---------------------------------------------

BEGIN
  
  UUT : FreqDiv PORT MAP(clock,Div,clock_out);
  
  clock_gen:PROCESS(clock)
            BEGIN
              clock <= not clock after 25 ns;
            END PROCESS;
END FreqDivider_TB;
    
  

        
