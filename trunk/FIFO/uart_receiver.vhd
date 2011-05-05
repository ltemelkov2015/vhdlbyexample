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
type RxState is (RxIdle, RxStart, RxData, Parity);


------- Aliases -----------------------------------------------------------------------------------------
alias WordLength: std_logic_vector(1 downto 0) is LCRBitsIn(1 downto 0);  --this portion shows bit count   
  
   
-------- Signal declarations Internal -------------------------------------------------------------------
signal   RxPr_State, RxNxtState: RxState;
signal   Rx_Data_Strob,ClrRxStrobeCounter: std_logic;
signal   strobCounter: integer range 0 to 16; 
constant halfCount: integer:=8;  -- counts till 8  and then strob
constant fullCount: integer:=16; -- counts till 16 and then strob
signal   t_RHR: std_logic_vector(9 downto 0);
signal   ClrShiftData: std_logic;


-------- component declaration RX Clock ----------------------------------------------------------
component rxStrobe is
  port( BaudClkIn:      IN STD_LOGIC;
        RxStrobeOut:    OUT STD_LOGIC;
        DeltaDelay:     IN INTEGER RANGE 0 to 16;
        reset, clear:   IN STD_LOGIC
      );
end component;

-------- component declaration Rx Shift register --------------------------------------------------
component shift is
  GENERIC(WIDTH: positive);
   port(C, SI, Clear : in std_logic;
        PO : out std_logic_vector(WIDTH -1 downto 0));
end component;



---------------------------------------------------------------------------------------------------
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
           ClrShiftData <='0';            -- Rx ShiftReg ready
           bitCount:=0;
        elsif(Rx_Data_Strob'event and Rx_Data_Strob='1')then
           case RxPr_State is
             when RxIdle =>
                strobCounter <= fullCount;
                RxPr_State <= RxStart;
             when RxStart =>
                bitCount:=bitCount+1;
                if(bitCount=WordLength) then
                   RxPr_State <=Parity;
                end if;
             when Parity =>
                   
                
                
                
      end if;
    



                     
               

                 
  
  
  
end rtl;