--test bench for seqtest


---------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------

ENTITY seqtest_TB IS
END seqtest_TB;

---------------------------------
ARCHITECTURE seqtest_TB OF seqtest_TB IS

component seqtest
  PORT(inp,rst:IN STD_LOGIC;
       otp:OUT STD_LOGIC
       );
END component;

signal output: STD_LOGIC;
signal input: STD_LOGIC:='0';
signal reset: STD_LOGIC;


BEGIN
  DUT: seqtest port map(input, reset, output);
  
rst:PROCESS
  BEGIN
    reset <='1';
    wait for 50 ns;
    reset <='0';
    wait;
END PROCESS;

clock: PROCESS(input)
    BEGIN
      input <= not input after 23 ns;
  END PROCESS;
END seqtest_TB;
  