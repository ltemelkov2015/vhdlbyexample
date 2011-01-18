--TB_BCD.vhd test bench
--This is a test bench file that tests the module
--two_digit_BCD_cntr.vhd 




----------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

----------------------------------


ENTITY TB_BCD IS
End TB_BCD;

----------------------------------

ARCHITECTURE TB of TB_BCD IS

---------------------------------------------------------------
component  TwoDigitBcdCntr is 
  Port(clk,rst: IN STD_LOGIC;
       -- digit1,digit2: OUT STD_LOGIC_VECTOR (3 downto 0));
        digit1, digit2: OUT INTEGER RANGE 0 TO 10);
End component;
----------------------------------------------------------------
    
-- Declare Input/Output Signals for Test Bench Top
---------------------------------------------------
SIGNAL rst: STD_LOGIC;
SIGNAL Clock: STD_LOGIC:='0';
SIGNAL D1,D2: INTEGER RANGE 0 TO 10;
----------------------------------------------------

BEGIN

UUT: TwoDigitBcdCntr 
     port map(Clock,rst,D1,D2); -- DUT instance within test bench
     
clock_gen: Process(Clock)
           Begin
            Clock <= not Clock after 20 ns;
           End Process clock_gen;

reset_gen: Process
           Begin
           rst <='0';
           wait for 32 ns;
           rst <= '1';
           wait for 30 ns;
           rst <='0';
           wait;
           End Process reset_gen;
END TB;
   
     
 
