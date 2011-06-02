-- one_to 2bitstopbits
-- it converts one bit into two bits data integer stop bits
library ieee;
use ieee.std_logic_1164.all;

entity stop_bit_conv is
   port(stop_bit_in:   IN std_logic;
        stop_bits_out: OUT positive range 1 to 2
        );
end stop_bit_conv;

architecture rtl of stop_bit_conv is
begin
  stop_bits_out <= 1 when stop_bit_in ='0' else
                   2 when stop_bit_in ='1';
end rtl; 