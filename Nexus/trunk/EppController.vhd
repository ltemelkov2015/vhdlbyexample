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
-- Moved ctrlDataWriteTick to state A(one state ahead)
-- Rev.n49
--Additeional Comments: 
-- rev.n48 is still flaky. getting and setting registers fail when loop mode.
-- most likely glitch in the next state logic
-- Rev 49. removes posible glitches in next state logic 
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

-- glitch free next state logic
-- first four bytes are next state indetificators, the other five are next state controls
--****************************************************************************************
-- bit0 -> ctrlDataWr_next
-- bit1 -> ctrlDataRd_next
-- bit2 -> pwait_next
-- bit3 -> ctrlAdr_next
-- bit4 -> ctrlDir_next

-- States
constant stEppReady:      std_logic_vector(8 downto 0):= "0000" & "00000"; 
constant stEppAdrWriteA:  std_logic_vector(8 downto 0):= "0001" & "00000";
constant stEppAdrWriteB:  std_logic_vector(8 downto 0):= "0010" & "01000";
constant stEppAdrWriteC:  std_logic_vector(8 downto 0):= "0011" & "00100"; 
constant stEppAdrReadA:   std_logic_vector(8 downto 0):= "0100" & "10000";
constant stEppAdrReadB:   std_logic_vector(8 downto 0):= "0101" & "10000";
constant stEppAdrReadC:   std_logic_vector(8 downto 0):= "0110" & "10100";
constant stEppDataWriteA: std_logic_vector(8 downto 0):= "0111" & "00001";
constant stEppDataWriteB: std_logic_vector(8 downto 0):= "1000" & "00000";
constant stEppDataWriteC: std_logic_vector(8 downto 0):= "1001" & "00100";
constant stEppDataReadA:  std_logic_vector(8 downto 0):= "1010" & "10010";
constant stEppDataReadB:  std_logic_vector(8 downto 0):= "1011" & "10000";
constant stEppDataReadC:  std_logic_vector(8 downto 0):= "1100" & "10100";
--



signal state_reg:  std_logic_vector(8 downto 0):= stEppReady;
signal state_next: std_logic_vector(8 downto 0);  

signal Adr_reg, Adr_next: std_logic_vector(3 downto 0);
signal ctrlDir_reg: std_logic;
signal ctrlAdr_reg: std_logic;
signal ctrlAdrStb: std_logic;
signal ctrlWriteStb: std_logic;
signal ctrlDataStb: std_logic;
signal BusEppIn, BusEppOut,BusEppData: std_logic_vector(7 downto 0);
signal pwait_reg: std_logic;
signal ctrlDataWr_reg: std_logic;
signal ctrlDataRd_reg: std_logic;
signal ctrlReady: std_logic;




begin
ctrlAdrStb <=astb;
ctrlDataStb <=dstb;
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


	-- Map control signals from the current state
	ctrlDataWr_reg  <= state_reg(0);
	ctrlDataRd_reg  <= state_reg(1);
	pwait_reg       <= state_reg(2);
	ctrlAdr_reg     <= state_reg(3);
	ctrlDir_reg     <= state_reg(4);


process(mclk, reset)
begin
 if(reset='1') then
    state_reg <=stEppReady;
    Adr_reg<=(others=>'0');
  elsif(mclk'event and mclk='1') then
    state_reg <=state_next;
    Adr_reg<= Adr_next;
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
	      if(ctrlReady='1') then
			   state_next <= stEppDataWriteC;
			 else
			   state_next <= stEppDataWriteB;
		    end if;
		
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
			if(ctrlReady='1') then
			   state_next <= stEppDataReadC;
			 else
			   state_next <= stEppDataReadB;
			 end if;
			
			
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

end Behavioral;

