-- sequencwer _TB.vhd

library ieee;
use ieee.std_logic_1164.all;


-------------------------------------
ENTITY sequencer_TB IS
END sequencer_TB;
-------------------------------------

architecture sequencer_TB of sequencer_TB is

component sequencer
    port(clk,enbl: IN STD_LOGIC;
          Data_In:  IN STD_LOGIC_VECTOR( 0 to 7); 
          Data_Out: OUT STD_LOGIC);
End component;

SIGNAL reset, output: STD_LOGIC;
SIGNAL clock:STD_LOGIC:='0';
SIGNAL Input: STD_LOGIC_VECTOR(7 downto 0):="10111011";

BEGIN
 DUT: sequencer port map(clock,reset,Input,output);
 process(clock)
   begin
     clock <=not clock after 20 ns;
  end process;
  
  process
    begin
      reset <= '0';
      wait for 40 ns;
      reset <='1';
      wait for 65 ns;
      reset <='0';
      wait for 1500 ns;
  end process;
end sequencer_TB;