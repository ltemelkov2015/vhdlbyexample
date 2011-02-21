--Timer2.vhd
--Implements a timer with a reset, a start/button and a seven segment display
--SSD's are 3 of them, one for the minutesm and two for the seconds shown
-- the timer counts  up to 9min and 59 sec and then starts over
-- this version is without state machine
--Author: Lachezar Temelkov


-----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------------------------


ENTITY TIMER1 IS
  PORT(clock,cntl: IN STD_LOGIC;
       mins,dec_sec, single_sec:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
  END TIMER1;

-----------------------------------------------------------------------------

ARCHITECTURE arch1 OF TIMER1 IS
 BEGIN
   
   PROCESS(clock,cntl)
     variable t_start, t_stop, t_reset: boolean;
     variable t_counter: INTEGER RANGE 0 TO 120;
     variable minutes, decimalseconds, singlesecond: INTEGER RANGE 0 TO 10;
     
     BEGIN
     
     IF(clock'EVENT and clock='1') THEN 
        IF(cntl='1') THEN
           t_counter:=t_counter+1;
           IF(t_counter=120) THEN --Reset 
           t_counter=0; 
           t_reset:=true; t_stop:=false; t_stop:=false;
           ELSE t_ON_OFF:=not t_ON_OFF;
           END IF
         END IF;
    