----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:13 07/18/2011 
-- Design Name: 
-- Module Name:    Memory controller Top 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  top memory controller that connects the Epp controller to mem_ctl_45... module
-- 
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

entity memctl_top is
  port(
        --to/from EppController
		mclk:         in std_logic;
		reset:        in std_logic;
		AddressBusIn: in unsigned(7 downto 0);
		DataBusIn:    in unsigned(7 downto 0);
		DataBusOut:   out std_logic_vector(7 downto 0);
		IOW: in std_logic;
		IOR: in std_logic;
		ready:        out std_logic;
		--to/from Sram memory
		s_addr:     out std_logic_vector(22 downto 0);
		adv_n:      out std_logic;
		ce_n:       out std_logic;
		lb_n:       out std_logic;
		ub_n:       out std_logic;
		oe_n:       out std_logic;
		we_n:       out std_logic;
		sclk:       out std_logic;
		cre:        out std_logic;
		--wait_z:     in std_logic;
		dio:        inout std_logic_vector(15 downto 0)
		);
		
end memctl_top;



architecture arch_top of memctl_top is
----------------------------------------------------------------------------
--Table:1
-- internal addressable registersp
-- MemControlReg:
   -- bit 0  lb_en   '0'en, '1' dis
   -- bit 1  ub_en   '0'en, '1' dis
   -- bit 2  addres auto increment write  '1'- enable, '0' dis
   -- bit 3  address auto increment read  '1'- enable, '0' dis
	-- bit 4-7 "xxxx"
----------------------------------------------------------------------------
signal AddrReg0,AddrReg0next:  unsigned(7 downto 0);    --read/write
signal AddrReg1, AddrReg1next: unsigned(7 downto 0);    --read/write
signal AddrReg2, AddrReg2next: unsigned(7 downto 0);    --read/write
signal DataReg0, DataReg0next: unsigned(7 downto 0);    --read/write
signal DataReg1, DataReg1next: unsigned(7 downto 0);    --read/write
signal MemControlReg, MemControlnext: unsigned(7 downto 0);  --read/write
----------------------------------------------------------------------------

-- future use, status register that is updated from inside the controller
-- and read only from Epp IO,
signal MemStatusReg, MemStatusnext:   unsigned(7 downto 0);  
----------------------------------------------------------------------------

signal AddressBusEpp:        std_logic_vector(22 downto 0); 
signal DataBusEpp:           std_logic_vector(15 downto 0);
signal tDataEpp:             std_logic_vector(15 downto 0);
signal tDataEpp_r:           std_logic_vector(15 downto 0);
signal tDataEpp_ur:          std_logic_vector(7 downto 0);
signal ctrl_mem, trw:        std_logic;
signal CntrTick0, CntrTick1: std_logic;

-- state for generating mem and rw  tick
constant stMemReady: std_logic_vector(3 downto 0):="00" & "00"; --mem, rw last 2 bits
constant stMemWrite: std_logic_vector(3 downto 0):="01" & "10";
constant stMemRead:  std_logic_vector(3 downto 0):="10" & "11";
signal MemState_reg: std_logic_vector(3 downto 0):= stMemReady;
signal MemState_next: std_logic_vector(3 downto 0);
signal tDataBusOut:   std_logic_vector(7 downto 0);


begin
-- component instantination

mem_ctrl: entity work.mem_ctl_mt45w8mw16(arch) 
          port map(
			          reset =>reset,
						 clk=>mclk,
						 addr=> AddressBusEpp, 
						 data_f2s=>DataBusEpp,
						 mem=>MemState_reg(1),
						 rw=>MemState_reg(0),
						 lb_en=>MemControlReg(0),
						 ub_en=>MemControlReg(1),
						 ready=>ready,
						 data_s2fmuxed=> tDataEpp_ur,
						 data_s2f_r => tDataEpp_r,
						 s_addr=>s_addr, 
						 adv_n =>adv_n,
			          ce_n => ce_n,      
			          lb_n => lb_n,
			          ub_n =>ub_n,
			          oe_n =>oe_n,
			          we_n =>oe_n,
			          sclk=>sclk,
			          cre=>cre,
			          dio=>dio
                   );						 
						 
          
AddressBusEpp <= std_logic_vector(AddrReg2(6 downto 0) & AddrReg1(7 downto 0) & AddrReg0(7 downto 0));
DataBusEpp <=std_logic_vector(DataReg1(7 downto 0) & DataReg0(7 downto 0));

DataBusOut<=tDataBusOut; 
tDataBusOut <= tDataEpp_ur       when AddressBusIn="0000" & "0100" else
std_logic_vector(AddrReg0)       when AddressBusIn="0000" & "0000" else
std_logic_vector(AddrReg1)       when AddressBusIn="0000" & "0001" else
std_logic_vector(AddrReg2)       when AddressBusIn="0000" & "0010" else
std_logic_vector(MemControlReg)  when AddressBusIn="0000" & "0101" else
"11111111";
					




process(mclk, reset)
begin
if reset='1' then
 AddrReg0 <=(others=>'0');
 AddrReg1 <=(others=>'0');
 AddrReg2 <=(others=>'0');
 DataReg0 <=(others=>'0');
 DataReg1 <=(others=>'0');
 MemControlReg <=(others=>'0');
 MemStatusReg <=(others=>'0');
elsif(mclk'event and mclk='1') then
 AddrReg0 <= AddrReg0next;
 AddrReg1 <= AddrReg1next;
 AddrReg2 <= AddrReg2next;
 DataReg0 <= DataReg0next;
 DataReg1 <= DataReg1next;
 MemControlReg <= MemControlnext;
 MemStatusReg <= MemStatusnext;
end if;
end process;


-- next state logic for register update
AddrReg0next<= DataBusIn when AddressBusIn(3 downto 0)="0000" and IOW='1' else 
               AddrReg0 + 1 when (AddressBusIn(3 downto 0)="0100" and  
					               (IOW='1' and MemControlReg(2)='1')) or
                              (IOR='1' and MemControlReg(3)='1') else
               AddrReg0;
					
					
--Tick update0 
CntrTick0 <= '1' when AddrReg0=x"FF" and AddressBusIn(3 downto 0)="0100" else '0';

AddrReg1next<= DataBusIn when AddressBusIn(3 downto 0)="0001" and IOW='1' else 
               AddrReg1 + 1 when CntrTick0='1' and 
					                  ((IOW='1' and MemControlReg(2)='1')  or
				                     (IOR='1' and MemControlReg(3)='1'))  else
				   AddrReg1;
					

--Tick update1
CntrTick1 <= '1' when AddrReg1=x"FF"  and CntrTick0='1' else '0';

AddrReg2next<= DataBusIn when AddressBusIn(3 downto 0)="010" and IOW='1' else 
               AddrReg2 + 1 when CntrTick1='1' and 
					                  ((IOW='1' and MemControlReg(2)='1')  or
				                     (IOR='1' and MemControlReg(3)='1'))  else
					AddrReg2;



DataReg0next<= DataBusIn   when AddressBusIn(3 downto 0)="0011" and IOW='1' else DataReg0;
DataReg1next<= DataBusIn   when AddressBusIn(3 downto 0)="0100" and IOW='1' else DataReg1;
MemControlnext<= DataBusIn when AddressBusIn(3 downto 0)="0101" and IOW='1' else MemControlReg;


----------------------------------------------------------
-- memory control signals state machine, look ahead logic
----------------------------------------------------------
process(mclk, reset)
begin
if(reset='1') then
 MemState_reg <= stMemReady;
elsif mclk'event and mclk='1' then
 MemState_reg <=MemState_next;
end if;
end process;

--next state logic
process(MemState_reg, AddressBusIn(3 downto 0), IOW, IOR)
begin
case MemState_reg is
  when stMemReady=>
       if(AddressBusIn(3 downto 0) = "0100" and IOW='1') then
		    MemState_next <= stMemWrite;
		 elsif(AddressBusIn(3 downto 0) = "0100" and IOR='1') then
		    MemState_next <= stMemRead;
		 else
		    MemState_next<= stMemReady;
       end if;
		 
	when stMemWrite =>
	     MemState_next<= stMemReady;
	when stMemRead =>
	     MemState_next<= stMemReady;
	when others =>
	     MemState_next<= stMemReady;
end case;
end process;

end arch_top;
   

		
		