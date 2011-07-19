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
		AddressBusIn: in std_logic_vector(7 downto 0);
		DataBusIn:    in std_logic_vector(7 downto 0);
		ctrlDataWriteTickIn: in std_logic;
		ready:        out std_logic_vector;
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
-- internal addressable registers
----------------------------------------------------------------------------
signal AddrReg0,AddrReg0next:  std_logic_vector(7 downto 0);    --read/write
signal AddrReg1, AddrReg1next: std_logic_vector(7 downto 0);    --read/write
signal AddrReg2, AddrReg2next: std_logic_vector(7 downto 0);    --read/write
signal DataReg0, DataReg0next: std_logic_vector(7 downto 0);    --read/write
signal DataReg1, DataReg1next: std_logic_vector(7 downto 0);    --read/write
signal MemControlReg, MemControlnext: std_logic_vector(7 downto 0);  --read/write
signal MemStatusReg, MemStatusnext:   std_logic_vector(7 downto 0);  --read from Eppinterfawe only/ internal Write
signal NumBytesReg, NumBytesnext:     std_logic_vector(7 downto 0);
----------------------------------------------------------------------------
signal AddressBusRam:  std_logic_vector(22 downto 0); 
signal DataBusRam:     std_logic_vector(15 downto 0);
signal tDataEpp:       std_logic_vector(15 downto 0);
signal tDataEpp_r:     std_logic_vector(15 downto 0);
signal tDataEpp_ur:    std_logic_vector(15 downto 0);
signal tmem, trw:      std_logic;

-- state for generating mem tick
type state_type is(idle, S1, S2);
signal state_reg, state_next: state_type;


begin
-- component instantination

mem_ctrl: entity work.mem_ctl_mt45w8mw16(arch) 
          port map(
			          reset =>reset,
						 clk=>mclk,
						 addr=> tAddressBusIn, --???
						 data_f2s=>tDataEpp,
						 mem=>tmem,
						 rw=>trw,
						 lb_en=>MemControlReg(0),
						 ub_en=>MemControlReg(1),
						 ready=>ready,
						 data_s2f_ur=> tDataEpp_ur,
						 data_s2f_r => tDataEpp_r,
						 s_addr=>AddressBusRam, --???
						 adv_n =>adv_n,
			          ce_n => ce_n,      
			          lb_n => lb_n,
			          ub_n =>ub_n,
			          oe_n =>oe_n,
			          we_n =>oe_n,
			          sclk=>sclk,
			          cre=>cre,
			          dio=>DataBusRam
                   );						 
						 
          
AddressBusRam <=AddrReg2(5 downto 0) & AddrReg1(7 downto 0) & AddrReg0(7 downto 0);
DataBusRam    <=DataReg1(7 downto 0) & DataReg0(7 downto 0);


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
elsif(mclk'event and mck='1') then
 AddrReg0 <= AddrReg0next;
 AddrReg1 <= AddrReg1next;
 AddrReg2 <= AddrReg2next;
 DataReg0 <= DataReg0next;
 DataReg1 <= DataReg1next;
 MemControlReg <= MemControlnext;
 MemStatusReg <= MemStatusnext;
end if;
end process

-- next state logic for register update
AddrReg0 <= DataBusIn when AddressBusIn(3 downto 0)="0000" and ctrlDataWriteTickIn='1' else AddrReg0next;
AddrReg1 <= DataBusIn when AddressBusIn(3 downto 0)="00000001" and ctrlDataWriteTickIn='1' else AddrReg1next;
AddrReg2 <= DataBusIn when AddressBusIn(3 downto 0)="00000010" and ctrlDataWriteTickIn='1' else AddrReg2next;
DataReg0 <= DataBusIn when AddressBusIn(3 downto 0)="00000011" and ctrlDataWriteTickIn='1' else DataReg0next;
DataReg1 <= DataBusIn when AddressBusIn(3 downto 0)="00000100" and ctrlDataWriteTickIn='1' else DataReg1next;
MemControlReg <= DataBusIn when AddressBusIn(3 downto 0)="00000100" and ctrlDataWriteTickIn='1' else MemControlnext;


-- memory strob
tmem <='1' when AddressBusIn="00000100" and ctrlDataWriteTickIn='1' else '0';

   

		
		