----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:14 07/09/2011 
-- Design Name: 
-- Module Name:    ram_ctrl_test - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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


entity ram_ctrl_test is
       port(
		       clk: in    std_logic;
				 sw:         in    std_logic_vector(7 downto 0);
				 btn:        in    std_logic_vector(3 downto 0);
				 led:        out   std_logic_vector(7 downto 0);
				 -- interface to SRAM
				 MemAdr:         out   std_logic_vector(22 downto 0);
				 MemWR, MemOE:  out   std_logic;
				 MemDB:        inout std_logic_vector(15 downto 0);
				 RamCS, RamLB, RamUB: out std_logic;
				 RamAdv, RamClk, RamCRE:out std_logic
				 --RamWait:        in std_logic
				 );
end ram_ctrl_test;



architecture Behavioral of ram_ctrl_test is
constant ADDR_W: integer:=23;
constant DATA_W:integer:=16;
signal   addr:std_logic_vector(ADDR_W-1 downto 0);
signal   data_f2s, data_s2f: std_logic_vector(DATA_W-1 downto 0);
signal   mem, rw: std_logic;
signal   data_reg: std_logic_vector(15 downto 0);
signal   db_btn: std_logic_vector(3 downto 0);


begin
ctrl_unit:entity work.mem_ctl_mt45w8mw16(arch)
          port map(
			          clk  => clk,
						 reset=> db_btn(3),
						 addr=>addr,
						 data_f2s=>data_f2s,
						 mem=>mem,
						 rw=>rw,
						 lb_en =>'0',
						 ub_en =>'0',
						 ready=>open,
						 data_s2f_ur =>open,
						 data_s2f_r=>data_s2f,
						 s_addr=>MemAdr,
						 adv_n=>RamAdv,
						 ce_n=>RamCS,
						 lb_n=>RamLB,
						 ub_n=>RamUB,
						 oe_n=>MemOE,
						 we_n=>MemWR,
						 sclk=>RamClk,
						 cre=>RamCRE,
						 --wait_z=>RamWait,
						 dio=>MemDB
						 );

debounce_unit0: 
           entity work.debounce(fsmd_arch)
			  port map( 
			            clk=>clk, 
							reset=>'0',
							sw=>btn(0),
							db_level=>open,
							db_tick=>db_btn(0)
						);
debounce_unit1:
           entity work.debounce(fsmd_arch)
			  port map(
			           clk=>clk,
						  reset=>'0',
						  sw=>btn(1),
						  db_level=>open,
						  db_tick=>db_btn(1)
						  );
debounce_unit2:
           entity work.debounce(fsmd_arch)
			  port map(
			            clk=>clk,
							reset=>'0',
							sw=>btn(2),
							db_level=>open,
							db_tick=>db_btn(2)
							);
							
							
debounce_unit3: --reset
           entity work.debounce(fsmd_arch)
			  port map(
			            clk=>clk,
							reset=>'0',
							sw=>btn(3),
							db_level=>open,
							db_tick=>db_btn(3)
							);
							
-- data registers
process(clk,db_btn(3))
begin
if(db_btn(3)='1') then
  data_reg<=(others =>'0');
elsif(clk'event and clk='1') then
  if(db_btn(0)='1') then
    data_reg <="00000000" & sw;
 end if;
end if;
end process;

-- address
addr<="000000000000000" & sw; 
data_f2s <= data_reg;

--command
process(db_btn)
 begin
 if db_btn(1)='1' then --write
    mem <='1';
	 rw<='0';
 elsif db_btn(2)='1' then --read
    mem<='1';
	 rw <='1';
  else
    mem <='0';
	 rw <='1';
  end if;
 end process;
 
 -- output
 led <=data_s2f(7 downto 0);
end Behavioral;

