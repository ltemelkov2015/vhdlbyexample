--priority encoder2.vhdl
--use WHEN/ELSE clause
--Author: Lachezar Temelkov

Library ieee;
use ieee.std_logic_1164.all;

Entity enc2 is
   Port(EncIn:    in   std_logic_vector(7 downto 0);
        EncOut:   out  std_logic_vector(2 downto 0);
        EncCheck: out std_logic);
End enc2;
   
   
Architecture dataflow of enc2 is



Begin


-- Encoder output --

EncOut<=  "111" when EncIn(7)='1' else
          "110" when EncIn(6)='1' else
          "101" when EncIn(5)='1' else
          "100" when EncIn(4)='1' else
          "011" when EncIn(3)='1' else
          "010" when EncIn(2)='1' else
          "001" when EncIn(1)='1' else
          "000";

-- Encoder Check signal -- 

EncCheck <= EncIn(7) or EncIn(6) or EncIn(5) or EncIn(4)
                     or EncIn(3) or EncIn(2) or EncIn(1);


          
END dataflow;
