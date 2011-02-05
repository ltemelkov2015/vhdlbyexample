-- vhdl example showing the delta cycle in a process
--


------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------

ENTITY seqtest IS
  PORT(inp,rst:IN STD_LOGIC;
       otp:OUT STD_LOGIC
       );
END seqtest;

-----------------------------------------------------------

ARCHITECTURE seqtest OF seqtest IS
SIGNAL a: STD_LOGIC;
BEGIN
  PROCESS(inp,rst)
    BEGIN
    if(rst='1') then
       otp <='1';
       a <='0';
    elsif(inp'event and inp='1') then
       a <='1' after 10 ns;
       otp<=a after 12 ns;
    end if;
  
END PROCESS;
END seqtest;

  
       
       
      




