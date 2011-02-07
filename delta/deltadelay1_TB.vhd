--delta delay test bench 

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY delay_TB IS
  END delay_TB;


ARCHITECTURE delay_TB OF delay_TB IS
------------------------------------
component reg
   PORT( a, clock : in bit;
         d : out bit);
end component;
-----------------------------------
 signal input, clk, d: bit;
-----------------------------------
BEGIN
DUT: reg port map(input, clk, d);

clock_stimulus: PROCESS
                    BEGIN
                      clk <='1';
                      wait for 40 ns;
                      input <='1';
                      wait for 100 ns;
                      input <='0';
                      wait; -- wait forever and examnine the wave form
              END PROCESS;
          END delay_TB;

--------------------------------------------   


