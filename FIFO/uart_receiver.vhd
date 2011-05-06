-- uart_receiver.vhd
-- this is a uart receiver state machine which gets data from the register map and updates data to
-- the register map declared in uart top module
-- refer to datasheet 16c1450 UART
-- Author: Lachezar Temelkov 05/05/2011


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_receiver is
   port( RxReset:         in  std_logic;
         RxD:             in  std_logic;
         BaudRateClk16X:  in  std_logic;
         RHRData:         out std_logic_vector(7 downto 0); --Rx shift register data on internal bus to RHR
         RHRDataEnable:   out std_logic; -- enable so that RHR register loads data from shift reg.
         RxLSRBitsOut:    out std_logic_vector(4 downto 0); --RxFlags are updated  p.11 datasheet
         RxLSRBitsEnable: out std_logic; -- enable to internal write to LSR Rx bit section
         LCRBitsIn:       in  std_logic_vector(4 downto 0) --lcr bits concerning the receiver state machine
         );
end uart_receiver;
         
                                                           
         
         
architecture rtl of uart_receiver is
-------- State Machine ----------------------------------------------------------------------------------
type RxState is (RxIdle, RxStart, RxData, RxParity, RxStop);


------- Aliases -----------------------------------------------------------------------------------------
alias n_bits: std_logic_vector(1 downto 0) is LCRBitsIn(1 downto 0);      --this portion shows bit count
alias parity_bits: std_logic_vector( 1 downto 0) is LCRBitsIn(5 downto 4); 
   
  
   
-------- Signal declarations Internal -------------------------------------------------------------------
signal   RxPr_State, RxNxtState: RxState;
signal   Rx_Data_Strob,ClrRxStrobeCounter: std_logic;
signal   strobCounter: integer range 0 to 16; 
constant halfCount: integer:=8;  -- counts till 8  and then strob
constant fullCount: integer:=16; -- counts till 16 and then strob
signal   t_RHR: std_logic_vector(9 downto 0);
signal   ClrShiftData: std_logic;
signal   num_bits: integer 0 to 8;

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

------
------
------
begin

---------------------------------------------------------------------------------------------------
---------------- Component Instances --------------------------------------------------------------
---------------------------------------------------------------------------------------------------
Rx_Strob: rxStrobe port map(BaudclkIn =>BaudRateClk16X, -- Rx_Data_Strob strobs data in the middle of the RX time bit
                            RxStrobeOut => Rx_Data_Strob, 
                            DeltaDelay => strobCounter,
                            reset => RxReset,
                            clear => ClrRxStrobeCounter); 



RxShift_Reg: shift Generic Map(WIDTH =>9) port map(C=>Rx_Data_Strob,
                                                   SI=>RxD,
                                                   Clear=>ClrShiftData,
                                                   PO=>t_RHR);
                                                   
 
                                                   
RxTxBitLength: WordLength port map(WordIn =>n_bits, WordLength =>num_bits);  
                                                  

-------------- Set initial state on reset ------------------------------------------------------
Rx_State_Machine: 
    process(RxReset, RxD, Rx_Data_Strob)
      variable bitCount:integer;
      begin
        if RxReset='1' then
           RxPr_State <= RxIdle;
           ClrRxStrobeCounter <='1';      -- dont start counting yet, wait for a start bit
           ClrShiftData <='1';            -- clear RxShiftReg
        elsif(RxD'event and RxD='0') and RxPr_State=RxIdle then
           ClrRxStrobeCounter <='0';      -- start strob counter
           strobCounter <= halfCount;     -- count to 8
           ClrShiftData <='0';            -- Rx ShiftReg ready to count
           bitCount:=0;
        elsif(Rx_Data_Strob'event and Rx_Data_Strob='1')then
           case RxPr_State is
             when RxIdle =>
                strobCounter <= fullCount; -- program counter to 16
                RxPr_State <= RxStart;
             when RxStart =>
                bitCount:=bitCount+1;
                if(bitCount=num_bits) then -- choose next state after abl bits are in
                    if(LCRBitsIn(3)='0) then Rx_PrState <=RxStop;  -- no parity, goto RxStop state
                    else RxPr_State <=RxParity;
                    end if;
                else RxPrState <= RxStart; -- loop in the same state till all bits are shifted in
                end if;
             when RxParity => 
                RxPrState <= RxStop;
             when RxStop =>
              
                   
                
                
                
      end if;
    



                     
               

                 
  
  
  
end rtl;