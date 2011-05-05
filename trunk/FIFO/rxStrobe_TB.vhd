-- rxStrobe testbench
-- test if the strobe signal is properly generated
-- rev 1.0

library ieee;
use ieee.std_logic_1164.all;




entity rxStrobe_TB is
end rxStrobe_TB;




architecture tb of rxStrobe_TB is

---------------------------------------
component rxStrobe is
 port( BaudClkIn:    IN STD_LOGIC;
        RxStrobeOut: OUT STD_LOGIC;
        DeltaDelay:  IN INTEGER RANGE 0 to 16;
        reset, clear: IN STD_LOGIC
      );
end component; 
---------------------------------------

signal rst, clr, strobe: std_logic;
signal clock: std_logic:='1';
constant delay: integer:=8;
--------------------------------------


begin
  UUT: rxStrobe port map(BaudClkIn =>clock, 
                         RxStrobeOut=>strobe,
                         DeltaDelay =>delay, 
                         reset =>rst, clear => clr);
                         
  clock <= not clock after 25 ns;
  
reset: process
        begin 
         clr<='0'; 
         rst <= '1';
         wait for 73 ns;
         rst <= '0';
         wait;
       end process reset;
end tb;
      
  