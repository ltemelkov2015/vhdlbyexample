---------------------------------------------------
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;
 ---------------------------------------------------
 ENTITY ram IS
 GENERIC ( bits: INTEGER := 8; -- # of bits per word
           words: INTEGER := 16); -- # of words in the memory
     PORT ( wr_ena, clk: IN STD_LOGIC;
            addr: IN INTEGER RANGE 0 TO words-1;
            data_in: IN STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
            data_out: OUT STD_LOGIC_VECTOR (bits-1 DOWNTO 0));
END ram;
 ---------------------------------------------------
 ARCHITECTURE ram OF ram IS
 TYPE vector_array IS ARRAY (0 TO words-1) OF STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
 SIGNAL memory: vector_array;
 BEGIN
 PROCESS (clk, wr_ena)
 BEGIN
 IF (wr_ena='1') THEN
    IF (clk'EVENT AND clk='1') THEN
        memory(addr) <= data_in after 3 ns;
    END IF;
 END IF;
 END PROCESS;
 data_out <= memory(addr);
 END ram;
 ---------------------------------------------------