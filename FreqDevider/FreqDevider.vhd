--FreqDivider.vhd
--A Generic Frequency Divider
--04/2011 
--Added an input register that defines the division coefficient 


-----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------


ENTITY FreqDiv IS
  GENERIC(n: INTEGER:= 1024);
  PORT (fclk:   IN  STD_LOGIC;                 --master clock in
        ClkDiv: IN  INTEGER RANGE 0 TO n;      --Clock divisor
        fclk_n: OUT STD_LOGIC);                --derived clock out=master clock/ClkDiv
END FreqDiv;


------------------------------------------------

ARCHITECTURE behav OF FreqDiv IS
 signal counter: INTEGER RANGE 0 TO n;
BEGIN
  PROCESS(fclk)
   
    BEGIN
      IF fclk'EVENT AND fclk='1' THEN
        IF(counter < ClkDiv/2) THEN 
           counter<=counter+1; 
           fclk_n <='1';
        ELSIF (counter=ClkDiv) THEN
           fclk_n<='1';
           counter<=1;
        ELSIF(counter >= ClkDiv/2) THEN
           counter<=counter+1; 
           fclk_n <='0';
        
        END IF;
    END IF;
      
 END PROCESS;
END behav;
        
------------------------------------------------
    
      