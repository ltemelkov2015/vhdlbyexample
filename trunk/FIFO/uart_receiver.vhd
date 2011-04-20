-- uart_receiver.vhd
-- this is a uart receiver state machine
-- refer to datasheet 16c1450 UART



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_receiver is
   port( RxReset:        in  std_logic;
         RxD:            in  std_logic;
         BaudRateClk16X: in  std_logic;
         RHRData:        out std_logic_vector(7 downto 0); --Rx shift register data on internal bus to RHR
         RHRDataEnable:   out std_logic; -- enable so that RHR register loads data from shift reg.
         RxLSRBitsOut:    out std_logic_vector(4 downto 0); --RxBreak, RxFramingErr,RxParityErr,RxOverrun,RxDataReady  p.11 datasheet
         RxLSRBitsEnable: out std_logic; -- enable to internal write to LSR Rx bit section
         LCRBitsIn:       in  std_logic_vector(5 downto 0) --lcr bits concerning the receiver state machine
         );
end uart_receiver;
         
                                                           
         
         
architecture rtl of uart_receiver is
begin
end rtl;