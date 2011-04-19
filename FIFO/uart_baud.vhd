-- this freq divider used for baud rate generator

--------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 -------------------------------------------------
 ENTITY freq_divider IS
 GENERIC(n:INTEGER:=1024); --10bit divisor
 PORT ( clk : IN STD_LOGIC;
        Div: IN INTEGER RANGE 0 to n;
        out1, out2 : BUFFER STD_LOGIC:='1');
 END freq_divider;
 -------------------------------------------------
 ARCHITECTURE behav OF freq_divider IS
    SIGNAL count1 : INTEGER RANGE 0 TO n/2;
    BEGIN
      PROCESS (clk)
        VARIABLE count2 : INTEGER RANGE 0 TO n/2;
    BEGIN
    IF (clk'EVENT AND clk='1') THEN
       count1 <= count1 + 1;
       count2 := count2 + 1;
    IF (count1 = (Div/2)-1) THEN
       out1 <= NOT out1;
       count1 <= 0;
    END IF;
    IF (count2 = Div/2) THEN
       out2 <= NOT out2;
       count2 := 0;
 END IF;
 END IF;
 END PROCESS;
 END behav;
 -------------------------------------------------
