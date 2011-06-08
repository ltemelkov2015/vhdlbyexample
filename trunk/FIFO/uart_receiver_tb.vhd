-- receiver test bench

library ieee;
use ieee.std_logic_1164.all;

entity uart_receiver_tb is
end uart_receiver_tb;

architecture tb of uart_receiver_tb is

 component uart_receiver
   port( RxReset:         in  std_logic;
         RxD:             in  std_logic;
         BaudRateClk16X:  in  std_logic;
         RHRData:         out std_logic_vector(7 downto 0); --Rx shift register data on internal bus to RHR
         t_LSR:    out std_logic_vector(4 downto 0); --RxFlags are updated  p.11 datasheet
         LCRBitsIn:       in  std_logic_vector(5 downto 0) --lcr bits concerning the receiver state machine
         );
end component;


-- Interface
signal rst: std_logic;
signal serial_in:std_logic;
signal XBaud: std_logic:='1';
signal RHR: std_logic_vector(7 downto 0);
signal LSR: std_logic_vector(4 downto 0);
signal LCR: std_logic_vector(5 downto 0):="011011";

begin

UUT: uart_receiver port map( RxReset => rst,
                             RxD => serial_in, 
                             BaudRateClk16X =>XBaud,
                             RHRData=>RHR,
                             t_LSR=>LSR,
                             LCRBitsIn=>LCR
                            );
                            
                            
XBaud <= not XBaud after 5 ns;  --16x 9600baud rate
  
reset:
process
  begin
  rst <='1';
  wait for 120 ns;
  rst <='0';
  wait;
end process reset;


data:
process
  begin
serial_in <='1';
wait for 150 ns;
serial_in <='0';  --start
wait for 160 ns;
serial_in <= '1'; --bit 0 LSB
wait for 160 ns;
serial_in <='0'; -- bit1
wait for 160 ns;
serial_in <='0'; -- bit2
wait for 160 ns;
serial_in <='1'; -- bit3
wait for 160 ns;
serial_in <='0'; -- bit4
wait for 160 ns;
serial_in <='1'; -- bit5
wait for 160 ns;
serial_in <='1'; -- bit6
wait for 160 ns;
serial_in <='1'; -- bit 7
wait for 160 ns;
serial_in <= '0'; --even parity  0 will generate error for even parity
wait for 160 ns;
serial_in <= '1';  --stop it no parity
wait for 160 ns;
serial_in <='1'; -- second stop bit
wait for 520 ns;
serial_in <='0' ; --start bit again
wait;
end process data;

end tb;
 
