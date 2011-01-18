-- two_digit_ssd_cntr.vhdl
-- LEVEL TOP, consists of two other modules "TwoDigitBcdCntr"  and  "BCD_SSI"
-- @Lachezar Temelkov 13/1/2011
----------------------------------------------------------------
--        -------------------------------------------------
--       |     ------ module 1  ------  module2            | top module
--       |    |      |-------->|      |----->              |
--   clk |    |      |         |      |                    |
--   ---->--->|      |         |      |                    |
--       |    |      |-------->|      |                    |
--       |    |      |         |      |----->              |
--       |     ------           ------                     |
--       |         |rst                                    |
--        -------------------------------------------------
----------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------
ENTITY Top IS
      PORT(clk, rst: IN STD_LOGIC;
           digit1, digit2:OUT STD_LOGIC_VECTOR (6 downto 0));
END Top;


ARCHITECTURE struct of Top IS
----------------------------------------------------------------
---- Declare the inner modules that will make the top level ----
----------------------------------------------------------------
component TwoDigitBcdCntr IS
      Port(clk,rst: IN STD_LOGIC;
           digit1,digit2: OUT INTEGER RANGE 0 TO 10);
End component;
----------------------------------------------------------------
component  BCD_SSI IS
   PORT (D1,D2: IN INTEGER RANGE 0 to 10;
         SSI_OUT1, SSI_OUT2:OUT STD_LOGIC_VECTOR(6 downto 0));
END component;
----------------------------------------------------------------
SIGNAL D1,D2: INTEGER RANGE 0 to 10;

BEGIN
BCD_COUNTER: TwoDigitBcdCntr
              port map(clk, rst, D1,D2);
             
              
BCD_SSD_CONV: BCD_SSI
              port map(D1, D2, digit1, digit2);
              
END struct;
-------------------------------------------------------------------



