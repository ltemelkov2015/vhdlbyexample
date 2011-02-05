-- testing variables vs signals
-- this just shows the main difference between those
-- What is the expected output? 



----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------

ENTITY Sig IS
 PORT(input: IN std_logic;
      output: OUT INTEGER RANGE 0 TO 15
      );
      
END Sig;



----------------------------------------
Architecture behav of Sig IS
begin
process
variable variable1: integer :=1;
variable variable2: integer :=2;
variable variable3: integer :=3;
begin
wait on input;
variable1 := variable2;
variable2 := variable1 + variable3;
variable3 := variable2;
output <= variable1 + variable2 + variable3 after 10 ns;
end process;
end behav;

      




