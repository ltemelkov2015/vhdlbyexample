--test bench to test procedures

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------
entity t_packageTB is
   GENERIC (limit : INTEGER := 255);
end t_packageTB;
-------------------------------------------------------

architecture test of t_packageTB is
 component min_max
    port( ena: IN BIT;
          inp1, inp2: IN INTEGER RANGE 0 TO limit;
          min_out, max_out: OUT INTEGER RANGE 0 TO limit);
 end component;
 
 signal E: BIT;
 signal I1, I2:  integer range 0 to limit;
 signal Min,Max: integer range 0 to limit;
 
 begin
   UUT: min_max --generic map(limit) 
        port map( ena=>E, inp1=>I1, inp2=>I2, min_out=>Min, max_out=>Max);
   I1<=120;
   I2<=100;
   E<='1' after 25 ns, '0' after 30 ns, '1' after 60 ns;
 end test; 
 
 
 