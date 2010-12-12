--new data package

-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


-------------------------------------------------
PACKAGE input_array is
    TYPE vector_array IS ARRAY (NATURAL RANGE <>) OF
         STD_LOGIC_VECTOR(7 DOWNTO 0);
END input_array;

------------------------------------------------

