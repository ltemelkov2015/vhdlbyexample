-- uart_top is a top level FIFO structure
-- the signals ports are taken exactly the same as a regular FIFO structure ST16C1450 for instance
-- this module is designed specially for NEXUS2 SPARTAN 3E board from digilent
-- author: Lachezar Temelkov
-- rev 1.0 04/15/20011 Initial rev.    -> Features - No FIFO Buffer


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------  UART  TOP SIGNALS ----------------------------------------------------
entity uart_top is 
  port(Addr:         IN    std_logic_vector(2 downto 0);
       Data:         INOUT std_logic_vector(7 downto 0);
       IOR:          IN    std_logic; 
       IOW:          IN    std_logic;
       CS:           IN    std_logic;
       Reset:        IN    std_logic;
       INT:          OUT   std_logic;
       TxD:          OUT   std_logic;
       RxD:          IN    std_logic;
       Master_Clk:   IN    std_logic); --Nexus2 board uses 50Mhz internal clock
  end uart_top;
  ------------------------------------------------------------------------------
  
  architecture rtl of uart_top is
  -------- Component/Logic Block/ Declarations ---------------------------------
  
  
  
  -------   Baud Rate Generator Component ------------------------------------------------------
  --@Input: clk: Gets a master clock from Spartan Nexus 2( 50Mhx in this case)
  --@Output: out1 and out1 are the same. those are divided frequency outputs,
  --@Input: divisor the coefficient of division:        out1,2 = clk/divisor; divisor=baudratex16
  component freq_divider is
    generic(n:INTEGER);
    port ( clk : IN STD_LOGIC;
           Div: IN INTEGER RANGE 0 to n;
           out1, out2 : BUFFER STD_LOGIC:='1');
    end component;
    
  -----  UART RECEIVER component ---------------------------------------------------------------
  --@input:   reset: internal reset to the module
  --@Output:  RHRData: receive holding byte. 
  --@Input:   BaudRateClk16X: 16X BaudRate  clock
  --@Output:  RxLSR: Line Status Register
  component uart_receiver is
   port( RxReset:         in  std_logic;
         RxD:             in  std_logic;
         BaudRateClk16X:  in  std_logic;
         RHRData:         out std_logic_vector(7 downto 0); --Rx shift register data on internal bus to RHR
         RxLSR:           out std_logic_vector(4 downto 0); --RxFlags are updated  p.11 datasheet
         LCRBitsIn:       in  std_logic_vector(5 downto 0) --lcr bits concerning the receiver state machine
         );
end component;
  
  
  
  
  
  
  
  
  --------  uart configuration (adressable registers ------
  
  signal RHR             : std_logic_vector(7 downto 0);   
  signal THR             : std_logic_vector(7 downto 0); 
  signal DLL             : std_logic_vector(7 downto 0);
  signal DLM             : std_logic_vector(7 downto 0);
  signal IER             : std_logic_vector(7 downto 0);
  signal ISR             : std_logic_vector(7 downto 0);
  signal LCR             : std_logic_vector(7 downto 0);
  signal MCR             : std_logic_vector(7 downto 0);
  signal LSR             : std_logic_vector(7 downto 0);
  signal MSR             : std_logic_vector(7 downto 0);
  signal SPR             : std_logic_vector(7 downto 0);
  signal Reserved1       : std_logic_vector(7 downto 0);
  signal Reserved2       : std_logic_vector(7 downto 0);
  signal Reserved3       : std_logic_vector(7 downto 0);

 ----------  uart internal non-addressable registers -------------
 

  signal TxShiftTransmitter   : std_logic_vector(7 downto 0);
  signal AddressBus           : std_logic_vector(2 downto 0);
  signal ClkBaud              : std_logic; 
  signal t_div                : integer range 0 to 1024; --temporary divisor
     
  ---- Aliases for easy accessing registers ---------------------
  
  alias RxFlags: std_logic_vector(5 downto 0) is LSR(5 downto 0);  --this portion is updated by RxStateMachine
  alias TxFlags: std_logic_vector(1 downto 0) is LSR(7 downto 6);  --this portion is updated by TxStateMachine
  
  ---------------------------------------------------------------
  
begin
t_div <= to_integer(unsigned(DLM(2 downto 0) & DLL)); --std_logic_vector to integer conversion
AddressBus <= Addr;

---- Address Decoder Logic Register Map page 10 from data sheet--
  Decoder: process(IOR, IOW, CS, Reset)
    begin
    if(CS='0') then -- put address and Data bus in hiZ
           AddressBus <="ZZZ";
           Data <= (others => 'Z'); 
    elsif(Reset='1') then  -- init registers and state machines 
           DLL <="XXXXXXXX";
           DLM <="XXXXXXXX";
           RHR <="XXXXXXXX";
           THR <="XXXXXXXX";
           IER <=X"00";
           ISR <=X"01";
           LCR <=X"00";
           MCR <=X"00";
           LSR <=X"60";
           MSR <=X"00";
           SPR <=X"FF";
           TxShiftTransmitter(7)<='1';
           INT <= 'Z';
           
           
      elsif(IOR='1') then
           if(AddressBus = "011") then Data <= LCR;
           elsif LCR(7)='0' then
             case AddressBus is
               when "000" =>  Data <= RHR;
               when "001" =>  Data <= IER;
               when "010" =>  Data <= ISR;
               when "100" =>  Data <= MCR;
               when "101" =>  Data <= LSR;
               when "110" =>  Data <= MSR;
               when "111" =>  Data <= SPR;
               when others => Data <= X"FF"; -- this should not happen
              end case;
           elsif LCR(7)='1' then
              case AddressBus is
               when "000" =>  Data <= DLL;
               when "001" =>  Data <= DLM;
               when others => Data <=X"FF"; --this should not happen
              end case;
          end if;
      elsif(IOW='0') then
          Data <= (others => 'Z');   --hiZ Impedance for DataBus transmit
          if AddressBus = "011" then LCR <=Data; 
          elsif LCR(7)='0' then 
             case AddressBus is
               when "000" => THR <=Data;     -- receive data on data bus    
               when "001" => IER <=Data;
               when "010" => Reserved1 <= Data;
               when "100" => MCR <= Data;
               when "101" => Reserved2 <=Data;
               when "110" => Reserved3 <=Data;
               when "111" => SPR <=Data;
               when others => null;
             end case;
          elsif LCR(7)='1' then
             case AddressBus is
               when "000" =>  DLL <= Data;
               when "001" =>  DLM <= Data;
               when others => null;
             end case;
          end if;
    end if;
end process Decoder;

------------------------------------------------------------------------               
----   Baud Rate Clock Logic /instance/ --------------------------------
------------------------------------------------------------------------                
Baud_Gen: freq_divider generic map(n =>1024) port map( clk=>Master_Clk, -- 50Mhz
                                                       Div=>t_div, 
                                                       out1=>ClkBaud,
                                                       out2=>open);
 -- out1 output has the 16xBaudrate clock now --
 -----------------------------------------------------------------------
 end rtl; 
       