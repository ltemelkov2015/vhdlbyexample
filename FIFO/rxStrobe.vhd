-- rxStrobe is a logic that creates a strobe, right in the middle of the 
-- received data bit, needed for shifting in Rx data. 
-- the input to that module is 16xBaudrate clock received from Baudrate generator
-- the strobe must be programable for a time period TBaudClkIn/2 or TBaudClkIn i.e 8 and 16
-- Author:Lachezar Temelkov 04/20/2011
-- 05/04/2011 Added  "clear

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rxStrobe is
  port( BaudClkIn:     IN STD_LOGIC;
        RxStrobeOut:   OUT STD_LOGIC;
        DeltaDelay:    IN INTEGER range 0 to 16; --4 bits
        reset, clear:  IN STD_LOGIC
      );
end rxStrobe;

architecture rtl of rxStrobe is
signal cntr: integer range 0 to 8;
begin
---------  simple counter to 7 with asynch reset --------------------
RxStrobe:  process(BaudClkIn, Reset) 
             variable t_cnt: integer range 0 to 16;
             begin
                 if(Reset='1' or clear='1') then 
                    RxStrobeOut <='0';
                    t_cnt:=0;
                 elsif(BaudClkIn'event and BaudClkIn='1') then
                    t_cnt:=t_cnt+1;
                    if(t_cnt = DeltaDelay) then 
                       t_cnt:=0;
                       RxStrobeOut <='1';
                    else RxStrobeOut <='0';
                    end if;
                 end if;
                 cntr <= t_cnt;
            end process;
---------------------------------------------------------------------

end rtl;
     
        
      