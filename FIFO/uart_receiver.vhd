-- uart_receiver.vhd
-- this is a uart receiver state machine which gets data from the register map and updates data to
-- the register map declared in uart top module
-- refer to datasheet 16c1450 UART
-- This receiver design has a disadvantage because, it creates another clock domain RX_DATA_STROB
-- This would create synch problems. We have to try to have only one clock, and everything else
-- should be enable signal in combinatorial circuit
-- Author: Lachezar Temelkov 05/05/2011


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std.all;

entity uart_receiver is
   port( RxReset:         in  std_logic;
         RxD:             in  std_logic;
         BaudRateClk16X:  in  std_logic;
         RHRData:         out std_logic_vector(7 downto 0); --Rx shift register data on internal bus to RHR
         RxLSRBitsOut:    out std_logic_vector(4 downto 0); --RxFlags are updated  p.11 datasheet
         LCRBitsIn:       in  std_logic_vector(5 downto 0) --lcr bits concerning the receiver state machine
         );
end uart_receiver;
         
                                                           
         
         
architecture rtl of uart_receiver is
-------- State Machine ----------------------------------------------------------------------------------
type RxState is (RxIdle, RxStart, RxData, RxParity, RxStop);


------- Aliases -----------------------------------------------------------------------------------------
alias n_bits: std_logic_vector(1 downto 0) is LCRBitsIn(1 downto 0);      --this portion shows bit count
alias parity_bits: std_logic_vector( 2 downto 0) is LCRBitsIn(5 downto 3); 
   
  
   
-------- Signal declarations Internal -------------------------------------------------------------------
signal   RxPr_State, RxNxtState: RxState;
signal   Rx_Data_Strob,ClrRxStrobeCounter: std_logic;
signal   strobCounter: integer range 0 to 16; 
constant halfCount: integer:=8;  -- counts till 8  and then strob
constant fullCount: integer:=16; -- counts till 16 and then strob
signal   t_RHR: std_logic_vector(11 downto 0);
signal   ClrShiftData: std_logic;
signal   num_bits: integer range 0 to 8;
signal   stopbits: positive range 1 to 2;
signal   xorbit: std_logic;
signal   xor_reset:std_logic;
signal   parityDelta: std_logic;


--------------------------------------------------------------------------------------------------
-------- component declarations -----------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- Rx Clock
component rxStrobe is
  port( BaudClkIn:      IN STD_LOGIC;
        RxStrobeOut:    OUT STD_LOGIC;
        DeltaDelay:     IN INTEGER RANGE 0 to 16;
        reset, clear:   IN STD_LOGIC
      );
end component;

-- Rx Shift register 
component shift is
  GENERIC(WIDTH: positive);
   port(C, SI, Clear : in std_logic;
        PO : out std_logic_vector(WIDTH -1 downto 0));
end component;


--RxTxWordLength
component WordLength is
     port(WordIn:     in  std_logic_vector(1 downto 0);
          WordLength: out integer range 0 to 8
         );
end component;



-- stop bit converter
component stop_bit_conv is
  port(stop_bit_in:   IN std_logic;
       stop_bits_out: OUT positive range 1 to 2
        );
end component;


--parity xor calculator
component xor_calc is
  port( bit_in:IN std_logic;
        clk:   IN std_logic;
        reset: IN std_logic;
        xor_bit_out: OUT std_logic);
end component;


begin

---------------------------------------------------------------------------------------------------------------------
---------------- Component Instances --------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
Rx_Strob: rxStrobe port map(BaudclkIn =>BaudRateClk16X, -- Rx_Data_Strob strobs data in the middle of the RX time bit
                            RxStrobeOut => Rx_Data_Strob, 
                            DeltaDelay => strobCounter,
                            reset => RxReset,
                            clear => ClrRxStrobeCounter); 



RxShift_Reg: shift Generic Map(WIDTH =>11) port map(C=>Rx_Data_Strob,
                                                   SI=>RxD,
                                                   Clear=>ClrShiftData,
                                                   PO=>t_RHR);
                                                   
 
                                                   
RxTxBitLength: WordLength port map(WordIn =>n_bits, WordLength =>num_bits);  




RxStopBits: stop_bit_conv port map(stop_bit_in => LCRBitsIn(2),
                                   stop_bits_out => stopbits);
                                   
                                   
                                   
RxXorCalc: xor_calc port map(bit_in => RxD, 
                            clk => Rx_Data_Strob,
                            reset => xor_reset,
                            xor_bit_out => xorbit); 
                            
                                       
                                                  

-------------- Set initial state on reset ------------------------------------------------------
Rx_State_Machine: 
    process(RxReset, RxD, Rx_Data_Strob)
      variable bitCount:integer range 0 to 8;
      variable stopCount: integer range 0 to 2;
      
      begin
        if RxReset='1' then
           RxPr_State <= RxIdle;
           ClrRxStrobeCounter <='1';      -- dont start counting yet, wait for a start bit
           ClrShiftData <='1';            -- clear RxShiftReg
           xor_reset <='1';
        elsif(RxD'event and RxD='0') and RxPr_State=RxIdle then
           ClrRxStrobeCounter <='0';      -- start strob counter
           strobCounter <= halfCount;     -- count to 8
           ClrShiftData <='0';            -- Rx ShiftReg ready to count
           bitCount:=0;                   -- init the bit counter
           stopCount:=0;
           parityDelta <= '0';
           RxPr_State <= RxStart;
        elsif(Rx_Data_Strob'event and Rx_Data_Strob='1') then
          
           case RxPr_State is
             
             when RxStart =>
                RxPr_State <= RxData; 
                strobCounter <= fullCount;
                
               
             when RxData =>
                bitCount:=bitCount+1;
                  if(bitCount=num_bits) then -- choose next state after all bits are in
                     if(LCRBitsIn(3)='0') then RxPr_State <=RxStop;  -- no parity, goto RxStop state p.14 data sheet
                     else RxPr_State <=RxParity;
                     end if;
                  else RxPr_State <= RxData; -- loop in the same state till all bits are shifted in
                  end if;
               
               
             ----------------------------------  
             when RxParity => 
                
                  
                  parityDelta <='1';
                  RxPr_State <=RxStop;   -- next, go to the stop state
                  
                  
          -------------------------------------              
          when RxStop =>
              stopCount:=stopCount+1;
              if(stopCount=stopbits) then 
                  case bitCount is
                    when 1 =>  -- if stops bit is only one, check for validity
                       if (t_RHR(11) = '1') then 
                           RxLSRBitsOut(3)<='0'; --ok, we got the stop bit, set LSR to no frame error
                       else
                           RxLSRBitsOut(3)<='1';  -- else set LSR that we have a frame error/haven't receive stop bit
                       end if;
                    
                    when 2 => -- if stop bits are two, check to make sure we got 2 consequtive "highs" shifted in
                        if (t_RHR(11) = '1') and (t_RHR(10) = '1')then 
                          RxLSRBitsOut(3)<='0'; --ok, we got 2 stop bit, no frame error
                        else
                          RxLSRBitsOut(3)<='1';  -- else set that we got frame error
                        end if;
                    when others =>
                        NULL;
                  end case;
    
               RxPr_State <=RxIdle;       -- start the state machine over
               ClrRxStrobeCounter <='1';  -- stop the strobe counter
               RxLSRBitsOut(0)<='1';      -- set that the byte is ready in the LSR reg
               xor_reset <='1';           -- reset the xor logic
               
               -- decide how many bits will go into RHR register from the shift reg t_RHR(11 downto 0)
               case num_bits is
                 when 8 =>
                      if (stopbits=1)and (LCRBitsIn(3)='0') then     -- 8 bits, one stop, no parity
                       RHRData <= t_RHR(10 downto 3);
                      elsif(stopbits=1) and (LCRBitsIn(3)='1') then --8 bits, one stop, even or odd parity
                       RHRData <= t_RHR(9 downto 2);
                      elsif(stopbits=2) and (LCRBitsIn(3)='0') then  -- 8 bits, 2 stops, no parity 
                       RHRData <= t_RHR(9 downto 2);
                      elsif(stopbits=2) and (LCRBitsIn(3)='1') then -- 8 bits, 2 stops, and parity
                       RHRData <= t_RHR(8 downto 1);
                      else
                        RHRData <= "00000000"; --  <-this should never happen
                    end if;
                when 6 =>
                     if(stopbits=1)and (LCRBitsIn(3)<='0') then       -- 6 bits, one stop, no parity
                       RHRData <="00" & t_RHR(10 downto 5);
                     elsif(stopbits=1) and (LCRBitsIn(3)='1') then  --6 bits, one stop, even or odd parity
                       RHRData <="00" & t_RHR(9 downto 4);
                     elsif(stopbits=2) and (LCRBitsIn(3)<='0') then   -- 6 bits, 2 stops, no parity 
                       RHRData <="00" & t_RHR(9 downto 4);
                    elsif(stopbits=2) and (LCRBitsIn(3)='1') then   -- 6 bits, 2 stops, and parity
                       RHRData <="00" & t_RHR(8 downto 3);
                    else 
                       RHRData <= "00000000";  --  <-this should never happen
                  end if;
                when others =>
                  NULL;
               end case;  --num_bits
            else RxPr_State <=RxStop; -- stay in loop till all parity bits are shifted in
            end if;
            
          when others =>
          NULL; 
            end case;   
            end if;
end process; 



process(parityDelta)
 begin
  if(parityDelta ='1') then
    if(parity_bits(1)= '0') then                        --even parity
        if(xorbit='0')    then RxLSRBitsOut(2)<='0';    -- set bit to indicate no even parity error
        else RxLSRBitsOut(2)<='1';                      -- set bit to indicate  even parity error
        end if;
    elsif(parity_bits(1)<='1') then                     --odd parity
        if(xorbit='0')    then RxLSRBitsOut(2)<='1';    -- set bit to indicate odd parity error
        else RxLSRBitsOut(2)<='0';                      -- set bit to indicate no odd parity error
        end if;
    end if; 
   else
       xor_reset<='0'; 
 end if;  
 end process;  
end rtl;