--Timer1.vhd
--Implements a timer with a reset, start and stop button and a seven segment display
--SSD's are 3 of them, one for the minutesm and two for the seconds shown
-- the timer counts  up to 9min and 59 sec and then starts over
-- this version is without state machine
--Author: Lachezar Temelkov


-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------------------------


ENTITY TIMER1 IS
  PORT(clock, reset, startbtn, stopbtn: IN STD_LOGIC;
       mins,dec_sec, single_sec:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
  END TIMER1;

-----------------------------------------------------------------------------

ARCHITECTURE arch1 OF TIMER1 IS
 BEGIN
   
   PROCESS(clock,reset,startbtn,stopbtn)
     variable start: boolean;
     variable minutes, decimalseconds, singlesecond: INTEGER RANGE 0 TO 10;
     
     BEGIN
      
     IF(reset='1') THEN 
           minutes :=0; decimalseconds :=0; singlesecond :=0;
           start:=false;
     ELSIF(startbtn ='1' and stopbtn='1') THEN
           minutes:=0; decimalseconds:=0;singlesecond:=0; start:=false;
     ELSIF(startbtn'EVENT and startbtn='1') THEN 
           minutes:=0; decimalseconds:=0;singlesecond:=0; start:=true; --start counting on the rising edge of startbtn
     ELSIF(stopbtn'EVENT and stopbtn='1') THEN start:=false;           --stop  counting on the rising edge of stopbtn
     END IF;
     
     --nested if's-------------------------------------------
     IF(start=true) THEN
       IF(clock'EVENT and clock='1') THEN 
          singlesecond:=singlesecond+1;
          IF(singlesecond=10) THEN 
             singlesecond:=0; decimalseconds:=decimalseconds+1;
             IF(decimalseconds =6) THEN singlesecond:=0; decimalseconds:=0; minutes:=minutes+1; 
                IF(minutes = 10) THEN  minutes:=0; start:=false;
                END IF;
             END IF;
          END IF;
       END IF;
     END IF;
     
     ---------------------------------------------------------------------------------------------------------------------------
     ------------   BCD to SSD Conversion  concurrent! -----------------------
     --------------------------------------------------------------
     CASE singlesecond IS
       WHEN 0 => single_sec <= "1111110"; --7E
       WHEN 1 => single_sec <= "0110000"; --30
       WHEN 2 => single_sec <= "1101101"; --6D
       WHEN 3 => single_sec <= "1111001"; --79
       WHEN 4 => single_sec <= "0110011"; --33
       WHEN 5 => single_sec <= "1011011"; --5B
       WHEN 6 => single_sec <= "1011111"; --5F
       WHEN 7 => single_sec <= "1110000"; --70
       WHEN 8 => single_sec <= "1111111"; --7F
       WHEN 9 => single_sec <= "1111011"; --7B
       WHEN OTHERS => NULL; -- do nothing
      END CASE;
    --------------------------------------------------------------------------     
      CASE decimalseconds IS
       WHEN 0 => dec_sec <= "1111110"; --7E
       WHEN 1 => dec_sec <= "0110000"; --30
       WHEN 2 => dec_sec <= "1101101"; --6D
       WHEN 3 => dec_sec <= "1111001"; --79
       WHEN 4 => dec_sec <= "0110011"; --33
       WHEN 5 => dec_sec <= "1011011"; --5B
       WHEN OTHERS => NULL; -- do nothing
      END CASE;
        
        
     -----------------------------------------------------------------------
     CASE minutes IS
       WHEN 0 => mins <= "1111110"; --7E
       WHEN 1 => mins  <= "0110000"; --30
       WHEN 2 => mins  <= "1101101"; --6D
       WHEN 3 => mins  <= "1111001"; --79
       WHEN 4 => mins  <= "0110011"; --33
       WHEN 5 => mins  <= "1011011"; --5B
       WHEN 6 => mins  <= "1011111"; --5F
       WHEN 7 => mins  <= "1110000"; --70
       WHEN 8 => mins  <= "1111111"; --7F
       WHEN 9 => mins  <= "1111011"; --7B
       WHEN OTHERS => NULL; -- do nothing
      END CASE;
    ---------------------------------------------------------------------------    
    END PROCESS;
END arch1;
          
         
         
     
       
     
       
     