--FreqDivider.vhd
--A Generic Frequency Divider


-----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------


ENTITY FreqDiv IS
  GENERIC(n: INTEGER:= 7);
  PORT (fclk:   IN  STD_LOGIC;
        fclk_n: OUT STD_LOGIC);
END FreqDiv;


------------------------------------------------

ARCHITECTURE behav OF FreqDiv IS
BEGIN
  PROCESS(fclk)
    variable counter: INTEGER RANGE 0 TO 10;
    BEGIN
      IF fclk'EVENT AND fclk='1' THEN
        IF(counter < n/2) THEN 
           counter:=counter+1; fclk_n <='1';
        ELSIF(counter >= n/2 and counter <n) THEN
           counter:=counter+1; fclk_n <='0';
        ELSIF (counter=n) THEN
           fclk_n<='1';
           counter:=1;
        END IF;
    END IF;
      
 END PROCESS;
END behav;
        
------------------------------------------------
    
      