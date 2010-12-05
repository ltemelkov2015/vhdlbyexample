--Problem 5.1 page 85
--Generic multiplexer using concurrent statements
-- use generic n value, m=8; use an array type for the input stimulus
--
--               m
--        x(0)  -/-|-           MUX
--        x(1)  -/-| - 
--          .   -/-|  -    m
--          .   -/-|   ----/---->y
--          .   -/-|  -
--          .   -/-| -
--      x(2^n-1)-/-|-
--
--

library ieee;
use ieee.std_logic_1164.all;
use work.input_array.all;


ENTITY mux is 
   GENERIC(n:INTEGER:=7);
   
     PORT(x:   IN    vector_array(0 to n);
          --sel: IN    STD_LOGIC_VECTOR(n downto 0);
          sel: IN INTEGER RANGE 0 TO (2**n - 1); 
          y:   OUT   STD_LOGIC_VECTOR(7 DOWNTO 0));
 END mux;
          
          
          
 -------------------------------------------------
 
 ARCHITECTURE dataflow of mux is
 BEGIN
       y <= x(sel); 
 END dataflow;
 
