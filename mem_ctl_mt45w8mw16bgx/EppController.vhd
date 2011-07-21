----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:13 07/18/2011 
-- Design Name: 
-- Module Name:    EppController - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  Epp controller that communucates to the EPP interface on one side and to
-- the Memory controller on the other side 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EppController is
  Port (
	  --to/from Epp side
		mclk 	   : in std_logic;
		reset    : in std_logic;
      pdb		: inout std_logic_vector(7 downto 0);
      astb 	   : in std_logic;
      dstb 	   : in std_logic;
      pwr 	   : in std_logic;
      pwait 	: out std_logic;
		--to/from mem control side
		AddressBusOut:     out std_logic_vector(7 downto 0);
		DataBusOut   :     out std_logic_vector(7 downto 0);
		EppDataBusIn:      in  std_logic_vector(7 downto 0);
		ctrlDataWriteTick: out std_logic;
		ctrlDataReadTick:  out std_logic;
		Ready:      in std_logic
		); 
end EppController;


architecture Behavioral of EppController is
type state_type is(stEppReady, 
                   stEppAdrWriteA,
                   stEppAdrWriteB,
                   stEppAdrWriteC,						 
						 stEppAdrReadA,
                   stEppAdrReadB,
                   stEppAdrReadC,             
                   stEppDataWriteA,
 						 stEppDataWriteB,
						 stEppDataWriteC,
						 stEppDataReadA,
						 stEppDataReadB,
						 stEppDataReadC
                  );


signal state_reg, state_next: state_type;	  
signal Adr_reg, Adr_next: std_logic_vector(3 downto 0);
signal ctrlDir_reg, ctrlDir_next: std_logic;
signal ctrlAdr_reg, ctrlAdr_next: std_logic;
signal ctrlAdrStb: std_logic;
signal ctrlWriteStb: std_logic;
signal ctrlDataStb: std_logic;
signal BusEppIn, BusEppOut,BusEppData: std_logic_vector(7 downto 0);
signal pwait_reg, pwait_next: std_logic;
signal ctrlDataWr_reg, ctrlDataWr_next: std_logic;
signal ctrlDataRd_reg, ctrlDataRd_next: std_logic;
signal ctrlReady: std_logic;




begin
ctrlAdrStb <=astb;
ctrlWriteStb <=pwr;
ctrlDataWriteTick<=ctrlDataWr_reg;
ctrlDataReadTick<=ctrlDataRd_reg;

pwait<= pwait_reg;
ctrlReady<=Ready;
AddressBusOut<="0000" & Adr_reg;
DataBusOut<=busEppIn;



-- inout bus control
busEppIn <= pdb;
pdb <= busEppOut when ctrlWriteStb = '1' and ctrlDir_reg = '1' else "ZZZZZZZZ";
busEppOut <= "0000" & Adr_reg when ctrlAdrStb = '0' else busEppData;
busEppData<=EppDataBusIn;

-- next state register logic
Adr_next <= pdb(3 downto 0) when ctrlAdr_reg='1' else Adr_reg;



process(mclk, reset)
begin
 if(reset='1') then
    state_reg <=stEppReady;
    Adr_reg<=(others=>'0');
	 ctrlAdr_reg<='0';
	 ctrlDir_reg<='0';
	 pwait_reg<='0';
	 ctrlDataWr_reg<='0';
	 ctrlDataRd_reg<='0';
  elsif(mclk'event and mclk='1') then
    state_reg <=state_next;
    Adr_reg<= Adr_next;
	 ctrlAdr_reg<=ctrlAdr_next;
	 ctrlDir_reg<=ctrlDir_reg;
	 pwait_reg<=pwait_next;
	 ctrlDataWr_reg<=ctrlDataWr_next;
	 ctrlDataRd_reg<=ctrlDataRd_next;
  end if;
end process; 
	
------------------------------------------------------------------
-- FSM next state logic
------------------------------------------------------------------
process(state_reg, ctrlAdrStb, ctrlWriteStb, ctrlDataStb, ctrlReady)
begin

case state_reg is
  when stEppReady =>
					if ctrlAdrStb = '0' and ctrlWriteStb = '0' then
						state_next <= stEppAdrWriteA;
               elsif ctrlAdrStb = '0' and ctrlWriteStb = '1' then
						state_next <= stEppAdrReadA;
               elsif ctrlDataStb = '0' and ctrlWriteStb = '0' then
						state_next <= stEppDataWriteA;
               elsif ctrlDataStb = '0' and ctrlWriteStb = '1' then
						state_next <= stEppDataReadA;
               else
					   state_next <= stEppReady;
					end if;

	 
  	--Write Address Register States			
	when stEppAdrWriteA  =>
			      state_next <= stEppAdrWriteB;

	when stEppAdrWriteB =>
					state_next <= stEppAdrWriteC;
					
   when stEppAdrWriteC =>
					if ctrlAdrStb = '0' then
						state_next <= stEppAdrWriteC;
					else
						state_next <= stEppReady;
					end if;		

	--Read Address Register States			
	when stEppAdrReadA =>
		  state_next <= stEppAdrReadB;

	when stEppAdrReadB =>
			state_next <= stEppAdrReadC;

	when stEppAdrReadC =>
		 if ctrlAdrStb = '0'  then
			 state_next <= stEppAdrReadC;
		 else
		    state_next <= stEppReady;
		 end if;



	-- Write data register states
	 when stEppDataWriteA =>
			state_next <= stEppDataWriteB;
    when stEppDataWriteB=>
			state_next <= stEppDataWriteC;
    when stEppDataWriteC =>
		if ctrlDataStb = '0' then
			state_next <= stEppDataWriteC;
		else
 			state_next <= stEppReady;
		end if;


	-- Read data register
	 when stEppDataReadA =>
			state_next <= stEppDataReadB;
	 when stEppDataReadB =>
			state_next <= stEppDataReadC;
	 when stEppDataReadC =>
		if ctrlDataStb = '0' then
			state_next <= stEppDataReadC;
		else
			state_next <= stEppReady;
		end if;

	-- Some unknown state				
	  when others =>
			state_next <= stEppReady;
     end case;
end process;   



-------------------------------------------------------------
-- look ahead buffers. Those sre control signals to datapath
-------------------------------------------------------------
process(state_next, ctrlReady)
begin
ctrlDataWr_next <='0'; --default outputs
ctrlDataRd_next <='0';
pwait_next<='0';
ctrlAdr_next<='0';
ctrlDir_next<='0';

case state_next is

-- Idle
when stEppReady=>

-- Address Register Write
when stEppAdrWriteA=>
when stEppAdrWriteB=>
     ctrlAdr_next<='1';
when stEppAdrWriteC=> 
 if(ctrlReady='0') then 
    pwait_next<='1'; 
 else 
    pwait_next<='0'; --default
 end if;

 
--DataRegister write  
when stEppDataWriteA=>
when stEppDataWriteB=>
     ctrlDataWr_next<='1';
when stEppDataWriteC=>
if(ctrlReady='0') then 
    pwait_next<='1'; 
 else 
    pwait_next<='0'; 
 end if;
    	  
--Data register read
when stEppDataReadA=>
     ctrlDir_next<='1';
when stEppDataReadB=>
     ctrlDataRd_next <='1';
     ctrlDir_next<='1';
when stEppDataReadC=>
     ctrlDir_next<='1';
	  if(ctrlReady='0') then 
        pwait_next<='1'; 
     else 
        pwait_next<='0'; 
     end if;
     
--Address register read
when stEppAdrReadA=>
     ctrlDir_next<='1';
when stEppAdrReadB=>
     ctrlDir_next<='1';
when stEppAdrReadC=>
     ctrlDir_next<='1';
	     if(ctrlReady='0') then 
           pwait_next<='1'; 
        else 
           pwait_next<='0'; --default
        end if;
    
end case;
end process;
end Behavioral;

