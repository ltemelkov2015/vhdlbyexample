-- uart_rx_top_tb.vhd
-- this tests the receiver only



library ieee;
use ieee.std_library_1164.all;

entity receiverTB is 
end receiverTB;


architecture testbench of receiverTB is
component uart_top is 
  port(Addr:         IN    std_logic_vector(2 downto 0);
       Data:         INOUT std_logic_vector(7 downto 0);
       IOR:          IN    std_logic; 
       IOW:          IN    std_logic;
       CS:           IN    std_logic;
       Reset:        IN    std_logic;
       INT:          OUT   std_logic;
       TxD:          OUT   std_logic;
       RxD:          IN    std_logic;
       Master_Clk:   IN    std_logic); --Nexus2 board uses 50Mhz internal clock
end component;