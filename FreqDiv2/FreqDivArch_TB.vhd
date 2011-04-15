--FrequencyDiveder_TB.vhd
--Test bench for frequencydivider


------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
------------------------------------------

ENTITY FreqDivider_TB IS
END FreqDivider_TB;

---------------------------------------------

ARCHITECTURE FreqDivider_TB OF FreqDivider_TB IS
---------------------------------------------
component freq_divider
PORT ( clk : IN STD_LOGIC;
        out1, out2 : BUFFER STD_LOGIC);
 END component;
---------------------------------------------

SIGNAL clock_out1, clock_out2: STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
---------------------------------------------

BEGIN

UUT : freq_divider PORT MAP(clock,clock_out1, clock_out2);

clock_gen:PROCESS(clock)
         BEGIN
           clock <= not clock after 25 ns;
         END PROCESS;
END FreqDivider_TB;
 