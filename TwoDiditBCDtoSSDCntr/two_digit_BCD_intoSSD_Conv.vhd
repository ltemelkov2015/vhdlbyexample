--two_digit_BCD_intoSSD_Conv.vhd
-- this converts two 4 bit digital BCD lines into two seven segment indicator signals
--@Author: Lachezar Temelkov:
--        --------                         -
--  4bits|        |   7bits               | |
-- D1--->|        |--------------------->  -
--       |        |                       | |       -
-- D2--->|        |                        -       | |
--       |        |------------------------------>  -
--       |        |                                | | 
--        --------                                  -
--


-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------------------------------

ENTITY BCD_SSI IS
   PORT (D1,D2: IN INTEGER RANGE 0 TO 10;
         SSI_OUT1, SSI_OUT2:OUT STD_LOGIC_VECTOR(6 downto 0));
END BCD_SSI;

--------------------------------------------------------------------------------

ARCHITECTURE behavior of BCD_SSI IS

BEGIN
--------------------------------------------------------------------------------
  
   SSI_OUT1 <= "1111110" WHEN D1=0  ELSE   --7E
               "0110000" WHEN D1=1  ELSE   --30
               "1101101" WHEN D1=2  ELSE   --6D
               "1111001" WHEN D1=3  ELSE   --79
               "0110011" WHEN D1=4  ELSE   --33
               "1011011" WHEN D1=5  ELSE   --5B
               "1011111" WHEN D1=6  ELSE   --5F
               "1110000" WHEN D1=6  ELSE   --70
               "1111111" WHEN D1=8  ELSE   --7F
               "1111011" WHEN D1=9  ELSE   --7B
               "0000000";
 
 ------------------------------------------------------------------------------
  
   SSI_OUT2 <= "1111110" WHEN D2=0  ELSE   --7E
               "0110000" WHEN D2=1  ELSE   --30
               "1101101" WHEN D2=2  ELSE   --6D
               "1111001" WHEN D2=3  ELSE   --79
               "0110011" WHEN D2=4  ELSE   --33
               "1011011" WHEN D2=5  ELSE   --5B
               "1011111" WHEN D2=6  ELSE   --5F
               "1110000" WHEN D2=7  ELSE   --70
               "1111111" WHEN D2=8  ELSE   --7F
               "1111011" WHEN D2=9  ELSE   --7B
               "0000000";

 END behavior;


