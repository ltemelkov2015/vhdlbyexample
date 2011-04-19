--FrequencyDiveder_TB.vhd
--Test bench for frequencydivider


------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
------------------------------------------

ENTITY FreqDivider_TB IS
  GENERIC(n:INTEGER:=1024); --10bit divisor
END FreqDivider_TB;

---------------------------------------------

ARCHITECTURE FreqDivider_TB OF FreqDivider_TB IS
---------------------------------------------
component freq_divider

PORT ( clk : IN STD_LOGIC;
        Div: IN INTEGER RANGE 0 to n;
        out1, out2 : BUFFER STD_LOGIC:='1');
 END component;
---------------------------------------------

SIGNAL clock_out1, clock_out2: STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
SIGNAL ClkDiv: INTEGER RANGE 0 to 1024:=6;
---------------------------------------------

BEGIN

UUT : freq_divider PORT MAP(clock,ClkDiv,clock_out1, clock_out2);

clock_gen:PROCESS(clock)
         BEGIN
           clock <= not clock after 25 ns;
         END PROCESS;
END FreqDivider_TB;
 