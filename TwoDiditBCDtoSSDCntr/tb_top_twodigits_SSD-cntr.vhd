--tb_top_twodigits_SSD-cntr.vhd--
-- This is the test bench
----------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

----------------------------------


ENTITY TB_OF_BCD_SSI_CNTR IS
End TB_OF_BCD_SSI_CNTR;

----------------------------------

ARCHITECTURE TB of TB_OF_BCD_SSI_CNTR IS

---------------------------------------------------------------
component Top is 
Port(clk,rst: IN STD_LOGIC;
           digit1,digit2: OUT STD_LOGIC_VECTOR (6 downto 0));
           
End component;
----------------------------------------------------------------
    
-- Declare Input/Output Signals for Test Bench Top
---------------------------------------------------
SIGNAL rst: STD_LOGIC;
SIGNAL Clock: STD_LOGIC:='0';
SIGNAL D1,D2: STD_LOGIC_VECTOR(6 downto 0);
----------------------------------------------------

BEGIN

UUT: Top 
     port map(Clock,rst,D1,D2);
     
test: PROCESS
      BEGIN
      rst <='1';
      wait for  100 ns;
      rst <='0';
      wait;
      End process test;

clock_generator: process(Clock)
                 BEGIN
                 Clock <= not Clock after 20 ns;
                 End process clock_generator;

End TB;
      


