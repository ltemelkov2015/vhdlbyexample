-- PriorityEnc1.vhdl
-- The circuit encode the highest set input bit
-- This solutions, requires using operators only
-- Used in priority Interrupts
--               -----------
--            0-|7          |-EncSel
--            1-|6          |
--            0-|5          |
--            0-|4         2|-1
--            1-|3         1|-1
--            1-|2         0|-0
--            0-|1          |
--               -----------
-- 
-- Author: Lachezar Temelkov
-- Date: 12/2010
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;


---------------------------------------------------
ENTITY PriorEnc IS
  PORT(EncIn: IN STD_LOGIC_VECTOR (3 downto 0);
       EncOut:OUT STD_LOGIC_VECTOR (1 downto 0);
       EncSel:OUT STD_LOGIC);
END PriorEnc;
--------------------------------------------------- 

ARCHITECTURE Behavioral of PriorEnc IS


BEGIN 
--Use only operators. Have to use a map from the truth table in order to simulate this
 EncOut(0)<= EncIn(3) OR (EncIn(1) AND NOT EncIn(2));
 EncOut(1)<= EncIn(2) OR EncIn(3);
 EncSel <= EncIn(0) OR EncIn(1) OR EncIn(2) OR EncIn(3);  
               
END Behavioral;           
