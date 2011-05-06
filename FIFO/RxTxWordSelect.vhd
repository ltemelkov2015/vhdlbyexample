-- RxTxWordSelect.vhd
-- Selects the number of bits to be transmitted according to
-- the table below. see ST16C1450 p.13 data sheet
--    Bit1     Bit0    WordLength
--    0        0       5(default)
--    0        1       6
--    1        0       7
--    1        1       8



library ieee;
use ieee.std_logic_1164.all;



entity WordLength is
  port(WordIn:     in  std_logic_vector(1 downto 0);
       WordLength: out integer range 0 to 8
       );
end WordLength;

architecture behav of WordLength is
begin
  WordLength <= 5 when WordIn="00" else
                6 when WordIn="01" else
                7 when WordIn="10" else
                8 when WordIn="11";
end behav;