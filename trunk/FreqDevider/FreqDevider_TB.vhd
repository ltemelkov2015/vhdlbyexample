--FrequencyDiveder_TB.vhd
--Test bench for frequencydivider


------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
------------------------------------------

ENTITY FreqDivider_TB IS
END FreqDivider_TB;

---------------------------------------------

ARCHITECTURE FreqDivider_TB OF FreqDivider_TB IS
---------------------------------------------
component FreqDiv 
  GENERIC(n: INTEGER:=10);
  PORT (fclk:   IN  STD_LOGIC;
        fclk_n: OUT STD_LOGIC);
END component;

---------------------------------------------

SIGNAL clock_out: STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
---------------------------------------------

BEGIN
  
  UUT : FreqDiv GENERIC MAP(n=>10) PORT MAP(clock,clock_out);
  
  clock_gen:PROCESS(clock)
            BEGIN
              clock <= not clock after 25 ns;
            END PROCESS;
END FreqDivider_TB;
    
  

        
