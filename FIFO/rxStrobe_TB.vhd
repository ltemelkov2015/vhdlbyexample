-- rxStrobe testbench
-- test if the strobe signal is properly generated
--

library ieee;
use ieee.std_logic_1164.all;




entity rxStrobe_TB is
end rxStrobe_TB;




architecture tb of rxStrobe_TB is

---------------------------------------
component rxStrobe is
 port( BaudClkIn:    IN STD_LOGIC;
        RxStrobeOut: OUT STD_LOGIC;
        reset:       IN STD_LOGIC
      );
end component; 
---------------------------------------

signal rst, strobe: std_logic;
signal clock: std_logic:='1';

begin
  UUT: rxStrobe port map(BaudClkIn =>clock, RxStrobeOut=>strobe, reset =>rst);
  clock <= not clock after 25 ns;
  
reset: process
        begin 
         rst <= '1';
         wait for 73 ns;
         rst <= '0';
         wait;
       end process reset;
end tb;
      
  