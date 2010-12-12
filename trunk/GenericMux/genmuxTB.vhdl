--test bench mux--


library ieee;
use ieee.std_logic_1164.all;
use work.input_array.all;


entity test_bench is
 end;

architecture TB of test_bench is
COMPONENT mux
GENERIC(n:POSITIVE);  --again some default
     port(x:   IN    vector_array(0 to 2**n-1);
          sel: IN INTEGER RANGE 0 TO (2**n - 1); 
          y:   OUT   STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT ;




--test bench top level parameters--
SIGNAL x1 :  vector_array(0 to 2**2-1):=("01111110",
                                         "00111111",
                                         "00011111",
                                         "00001111");
SIGNAL sel1 : INTEGER:=2;
SIGNAL y1:  std_logic_vector(7 downto 0);




begin

--pass the generic parameter to an instance of a component(dut1) --
dut1 :  mux GENERIC MAP(n=>2) PORT MAP ( x1, sel1, y1);
  

test : PROCESS
   begin
   
   wait for 100 ns; sel1 <=1; 
   wait for 50 ns;  sel1  <= 0;
   wait;
end PROCESS test;



end TB;
