-- Sequencer.vhd
-- Takes a data input, and if sata bit is "1" , a combination of "110" is sent with posedge of clock
--If data bit is "0" , a combination of 100 is sent. There is also rst signal, active level is high
--MSB first

----------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------

ENTITY sequencer is
     port(clk,rst: IN STD_LOGIC;
          Data_In:  IN STD_LOGIC_VECTOR( 7 downto 0); 
          Data_Out: OUT STD_LOGIC);
End sequencer;

-----------------------------------------------------------------------------------------------

architecture behav of sequencer is
-----------------------------------------------------------------------------------------------
type state IS(S0,S1,S2);
signal current_state: state;


begin
  process(clk,rst)
    variable ix: integer range -1 to 7:=7;
    variable stop: boolean;
    begin
      
      if(rst='1') then
        current_state <=S0;
        ix:=7; 
        stop:=false;
          
      elsif(clk'EVENT and clk='1' and stop=false) then
        if(Data_In(ix)='0') then
            case current_state is
            when S0=>
             Data_Out <='1';current_state <=S1;
            when S1=>
             Data_Out <='0';current_state <=S2;
            when S2=>
             Data_Out <='0';current_state <=S0;ix:=ix-1;
            end case;
          
        elsif(Data_In(ix)='1') then  
            case current_state is
            when S0=>
             Data_Out <='1';current_state <=S1;
            when S1=>
             Data_Out <='1';current_state <=S2;
            when S2=>
             Data_Out <='0';current_state <=S0;ix:=ix-1;
            end case;
        end if;
      end if;
      
      if(ix=-1) then stop:=true; Data_Out <='0'; end if;
        
 end process;
end behav;      
      


       
         
               
