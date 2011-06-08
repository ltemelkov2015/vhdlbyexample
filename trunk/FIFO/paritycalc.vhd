-- one bit parity calculator
-- it basically performs XOR logic function upon external clock

library ieee;
use ieee.std_logic_1164.all;


entity xor_calc is
  port( bit_in:IN std_logic;
        clk:   IN std_logic;
        reset: IN std_logic;
        xor_bit_out: OUT std_logic);
end xor_calc;


architecture behav of xor_calc is 
signal temp: std_logic;
begin
  process(clk)
    begin
    if(reset='1') then
       temp <='0';
       xor_bit_out <='0';
    elsif(clk'event and clk='1') then
      temp <= temp xor bit_in;
    end if;
end process;
xor_bit_out <= temp;
end behav;  
