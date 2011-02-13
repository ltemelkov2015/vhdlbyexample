-- EventCounter.vhd
-- Description: Countes the rising and falling edges of a clock 0-99
-- Author: Lachezar Temelkov Feb. 2011
-- This code is eazy but unfortunatelly not synthesizable :(

---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------



-----------------------------------------
ENTITY EventCounter IS
  PORT(clk: IN bit;
       Cntr: OUT INTEGER RANGE 0 to 99);
  END EventCounter;
-----------------------------------------

ARCHITECTURE EventCounter OF EventCounter IS
BEGIN
  PROCESS(clk)
    -- Variable Initialiation is only for simulation purposes
    -- Real case scenario, use something like Reset
    variable tmp: INTEGER RANGE -1 TO 99:=-1;
     BEGIN
      
      if (tmp=99) then
          tmp:=0;
      else
          tmp:=tmp + 1;
      end if;
      Cntr <=tmp;
  END PROCESS;
END EventCounter;
-------------------------------------------
      -- EventCounter.vhd
-- Description: Countes the rising and falling edges of a clock 0-99
-- Author: Lachezar Temelkov Feb. 2011


---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------



-----------------------------------------
ENTITY EventCounter IS
  PORT(clk: IN bit;
       Cntr: OUT INTEGER RANGE 0 to 99);
  END EventCounter;
-----------------------------------------

ARCHITECTURE EventCounter OF EventCounter IS
BEGIN
  PROCESS(clk)
    -- Variable Initialiation is only for simulation purposes
    -- Real case scenario, use something like Reset
    variable tmp: INTEGER RANGE -1 TO 99:=-1;
     BEGIN
      
      if (tmp=99) then
          tmp:=0;
      else
          tmp:=tmp + 1;
      end if;
      Cntr <=tmp;
  END PROCESS;
END EventCounter;
-------------------------------------------
      