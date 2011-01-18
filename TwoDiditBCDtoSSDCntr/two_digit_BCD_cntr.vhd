-- two_digit_BCD_cntr.vhd--
-- @Description:
-- BCD counter with two digits (0-9)
--        ------
--       |      |
--       |      |--digit2 (0-9)
-- clk-->|      |
--       |      |--digit1 (0-9)
--       |      |
--        ------
--           |
--          rst
--
--@Author: Lachezar Temelkov
--@Date:Jan/2011
-----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------------

Entity TwoDigitBcdCntr IS
      Port(clk,rst: IN STD_LOGIC;
           --digit1,digit2: OUT STD_LOGIC_VECTOR (3 downto 0));
           digit1, digit2: OUT INTEGER RANGE 0 TO 10);
           
End TwoDigitBcdCntr;

-----------------------------------------------------------------

ARCHITECTURE behavior OF TwoDigitBcdCntr IS
   BEGIN
      PROCESS(clk, rst)
        VARIABLE temp1:INTEGER RANGE 0 TO 10;
        VARIABLE temp2:INTEGER RANGE 0 TO 10;
      BEGIN
      if(rst='1') THEN
         temp1:=0;
         temp2:=0;
      elsif(clk'EVENT and clk='1') THEN
         temp1:= temp1+1;
         if(temp1=10) THEN
            temp1:=0;
            temp2:=temp2+1;
            if(temp2=10) THEN
              temp2:=0;
            end if;
         end if;
      end if;
      digit1 <=temp1;
      digit2 <=temp2;
     End Process;
   End behavior;   
 -----------------------------------------------------------------

