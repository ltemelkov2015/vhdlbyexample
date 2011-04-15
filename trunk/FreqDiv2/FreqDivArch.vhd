-- this freq divider is from Pedroni book



-----------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 -----------------------------------------
 ENTITY freq_divider IS
 PORT ( clk : IN STD_LOGIC;
        out1, out2 : BUFFER STD_LOGIC:='1');
 END freq_divider;
 -----------------------------------------
 ARCHITECTURE example OF freq_divider IS
    SIGNAL count1 : INTEGER RANGE 0 TO 7;
    BEGIN
      PROCESS (clk)
        VARIABLE count2 : INTEGER RANGE 0 TO 7;
    BEGIN
    IF (clk'EVENT AND clk='1') THEN
       count1 <= count1 + 1;
       count2 := count2 + 1;
    IF (count1 = 2 ) THEN
       out1 <= NOT out1;
       count1 <= 0;
    END IF;
    IF (count2 = 3 ) THEN
       out2 <= NOT out2;
       count2 := 0;
 END IF;
 END IF;
 END PROCESS;
 END example;
 -----------------------------------------
