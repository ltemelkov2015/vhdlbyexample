-- uart_receiver.vhd
-- this is a uart receiver state machine which gets data from the register map and updates data to
-- the register map declared in uart top module
-- refer to datasheet 16c1450 UART
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
         t_LSR:           out std_logic_vector(4 downto 0); --RxFlags are updated  p.11 datasheet
         LCRBitsIn:       in  std_logic_vector(5 downto 0) --lcr bits concerning the receiver state machine
         );
end uart_receiver;
         
                                                           
         
         
architecture rtl of uart_receiver is
-------- State Machine ----------------------------------------------------------------------------------
type RxState is (idle,shift, parity, stop);


------- Aliases -----------------------------------------------------------------------------------------
alias n_bits: std_logic_vector(1 downto 0) is LCRBitsIn(1 downto 0);      --this portion shows bit count
alias data_ready:std_logic is t_LSR(0);  
-------- Signal declarations Internal -------------------------------------------------------------------
signal   RxPr_State: RxState;
signal   Rx_Data_Strob,ClrRxStrobeCounter: std_logic;
signal   strobCounter: integer range 0 to 16; 
constant halfCount: integer:=8;  -- counts till 8  and then strob
constant fullCount: integer:=16; -- counts till 16 and then strob
signal   s_reg: std_logic_vector(7 downto 0);
signal   ClrShiftData: std_logic;
signal   num_bits: integer range 0 to 8;
signal   XorCalc: std_logic;
signal   rbr:std_logic_vector(7 downto 0);


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



--RxTxWordLength
component WordLength is
     port(WordIn:     in  std_logic_vector(1 downto 0);
          WordLength: out integer range 0 to 8
         );
end component;


begin
------------------ Cobinational Logic --------------------------------
RHRData <= rbr;
---------------------------------------------------------------------------------------------------------------------
---------------- Component Instances --------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
Rx_Strob: rxStrobe port map(BaudclkIn =>BaudRateClk16X, -- Rx_Data_Strob strobs data in the middle of the RX time bit
                            RxStrobeOut => Rx_Data_Strob, 
                            DeltaDelay => strobCounter,
                            reset => RxReset,
                            clear => ClrRxStrobeCounter); 
                                                  
RxTxBitLength: WordLength port map(WordIn =>n_bits, WordLength =>num_bits);

-------------- Set initial state on reset ------------------------------------------------------
Rx_State_Machine: 
    process(RxReset, RxD, Rx_Data_Strob)
      variable bitCount:integer range 0 to 8;
      
      begin
        if RxReset='1' then
           RxPr_State <= idle;
           ClrRxStrobeCounter <='1';      -- dont start counting yet, wait for a start bit
           t_LSR <=(others =>'0');
           rbr <= (others => '0');
           s_reg <=(others =>'0');
        elsif(RxD'event and RxD='0') and RxPr_State=idle then
           ClrRxStrobeCounter <='0';      -- start strob counter
           strobCounter <= halfCount;     -- count to 8
           bitCount:=0;                   -- init the bit counter
           XorCalc<='0';                  -- init XorCalc that holds the intertmidiate xor results of data bits
           data_ready <='0';              -- data ready strob  
           s_reg <=(others =>'0');
        elsif(Rx_Data_Strob'event and Rx_Data_Strob='1') then
          
           case RxPr_State is
             when idle =>
               if(RxD = '0') then --valid start bit
                 strobcounter <=fullCount;
                 RxPr_State <=shift;
               else
                RxPr_State <=idle;
               end if;
             
             when shift =>
                bitCount:=bitCount+1;
                XorCalc <= XorCalc xor RxD;
                s_reg <= RxD & s_reg(7 downto 1);
                  if(bitCount=num_bits) then -- choose next state after all bits are in
                     if(LCRBitsIn(3)='0') then RxPr_State <=stop;  -- no parity, goto RxStop state p.14 data sheet
                     else RxPr_State <=parity;
                     end if;
                  else RxPr_State <= shift; -- loop in the same state till all bits are shifted in
                  end if;
               
                
             when parity => 
               if(LCRBitsIn(4) = '0') then --oddparity
                    if(XorCalc = '0') and (RxD ='1') then 
                      t_LSR(2) <='0'; --no parity err
                    elsif(XorCalc ='1' and RxD='0') then 
                      t_LSR(2) <='0'; -- no parity err
                    else
                      t_LSR(2) <='1'; --  parity err
                    end if;
                elsif(LCRBitsIn(4) = '1') then       -- even parity
                    if(XorCalc = '1') and (RxD='1')then 
                      t_LSR(2) <='0'; -- no even parity err
                    elsif (XorCalc = '0' and RxD='0') then
                      t_LSR(2) <='0'; -- no even parity err
                    else
                      t_LSR(2) <='1'; -- even parity err
                    end if;
                    RxPr_State <= stop;
               end if;
                      
                      
                            
          when stop =>
             if(RxD ='1') then  
               t_LSR(3)<='0'; -- no frame err
             else
               t_LSR(3)<='1'; --frame err
             end if;
             RxPr_State <=idle;           -- start the state machine over
             ClrRxStrobeCounter <='1';    -- stop the strobe counter
             data_ready<='1';             -- set that the byte is ready in the temp LSR reg
             case num_bits is
               when 8 => rbr <= s_reg;                --transfer data to receive buffer
               when 6 => rbr <= "00" & s_reg(7 downto 2);
               when 5 => rbr <= "000" & s_reg(7 downto 3);
               when others => null; 
             end case;
              
          end case;   
          end if;
end process; 
end rtl;

