----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:13 07/18/2011 
-- Design Name: 
-- Module Name:    EppMemCtrTop - top 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  This is the highest level of vhdl hierarchy that instantiate all the other moduls
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


entity EppMemCtrTop is
   port(
		--to/from Epp side
		mclk 	   : in std_logic;
		reset    : in std_logic;
      pdb		: inout std_logic_vector(7 downto 0);
      astb 	   : in std_logic;
      dstb 	   : in std_logic;
      pwr 	   : in std_logic;
      pwait 	: out std_logic;
		
		-- to from Sram side
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
end EppMemCtrTop;


architecture top of EppMemCtrTop is
signal      tAddressBusOut:       std_logic_vector(7 downto 0);
signal		tDataBusOut:          std_logic_vector(7 downto 0);
signal		tEppDataBusIn:        std_logic_vector(7 downto 0);
signal		tctrlDataWriteTick:   std_logic;
signal		tctrlDataReadTick:    std_logic;
signal		tReady:               std_logic;




begin
EppCntrl: entity work.EppController(Behavioral)
               port map (
					           mclk  => mclk,
		                    reset => reset,    
                          pdb	  => pdb,
                          astb  => astb,	   
                          dstb  => dstb,								  
                          pwr   => pwr,	   
                          pwait 	=> pwait,
								  --------------------------------
                          AddressBusOut => tAddressBusOut,
		                    DataBusOut   => tDataBusOut,
		                    EppDataBusIn => tEppDataBusIn,
		                    ctrlDataWriteTick => tctrlDataWriteTick,
		                    ctrlDataReadTick => tctrlDataReadTick,
		                    Ready => tReady
								 );
		
MemController: entity work. memctl_top(arch_top)
               port map(
                         mclk=>mclk,
		                   reset=>reset,
		                   AddressBusIn => unsigned(tAddressBusOut),
		                   DataBusIn => unsigned(tDataBusOut),
		                   DataBusOut => tEppDataBusIn,
		                   IOW => tctrlDataWriteTick,
								 IOR =>  tctrlDataReadTick,
		                   ready => tReady,
                         -----------------------------------
                         s_addr => s_addr,
		                   adv_n => adv_n,
		                   ce_n => ce_n,
		                   lb_n => lb_n,
		                   ub_n => ub_n,
		                   oe_n => oe_n,
		                   we_n => we_n,
                     	 sclk => sclk,
		                   cre=>cre,
		                   --wait_z:     in std_logic;
		                   dio =>dio
);

end top;								 