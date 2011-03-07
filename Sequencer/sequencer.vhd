-- Sequencer.vhd
-- Takes a data input, and if sata bit is "1" , a combination of "110" is sent with posedge of clock
--If data bit is "0" , a combination of 100 is sent. There is also rst signal, active level is high
--MSB first
--------------------------------------------------------------------------------------------------
-- Sequencer v2.0 added two different state machines, as well as a shift register

----------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------

ENTITY sequencer is
     port(clk,enbl: IN STD_LOGIC;
          Data_In:  IN STD_LOGIC_VECTOR( 7 downto 0); 
          Data_Out: OUT STD_LOGIC);
End sequencer;

-----------------------------------------------------------------------------------------------

architecture behav of sequencer is
-----------------------------------------------------------------------------------------------
type state IS(S0,S1,S2);
signal pr1_state: state; -- present state for state machine 1 for logic '0'
signal pr2_state: state; -- present state for state machine 2 for logic '1'
constant SI:std_logic:='0';
signal data_reg: std_logic_vector(7 downto 0);  --msb must be sent first 
-----------------------------------------------------------------------------------------------

begin
  process(clk,enbl)
    
    begin
      if(enbl='1') then 
         pr1_state <=S0; pr2_state <=S0;
         data_reg <=Data_in;
         
      elsif(clk'EVENT and clk='1') then
         if(data_reg(7) ='0') then
            case pr1_state is
                 when S0=>Data_Out <='1';pr1_state <=S1;
                 when S1=>Data_Out <='0';pr1_state <=S2;
                 when S2=>Data_Out <='0';pr1_state <=S0; pr2_state <=S0;
                      data_reg <=data_reg(6 downto 0) & SI; 
            end case;
            elsif(data_reg(7)='1') then
            case pr2_state is
                 when S0=>Data_Out <='1';pr2_state <=S1;
                 when S1=>Data_Out <='1';pr2_state <=S2;
                 when S2=>Data_Out <='0';pr1_state <=S0; pr2_state <=S0;
                      data_reg <=data_reg(6 downto 0) & SI; 
            end case;
            end if;
       end if;
  end process;
end behav;      
      


       
         
               
