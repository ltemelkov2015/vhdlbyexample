----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Lachezar Temelkov       
-- 
-- Create Date:    17:49:32 07/08/2011 
-- Design Name: 
-- Module Name:    mem_ctl_mt45w8mw16 - Behavioral 
-- Project Name:   SRAM memory controller for MT458MW16BGX memory
-- Target Devices: Nexus2, SPARTAN 3E, MT458MW16BGX
-- Tool versions:  XILINX ISE 12.3
-- Description:    This component describes an asynchronous memory controller
--                 to CellularRAM MT458MW16BGX found in Nexus2 DK from Digilent
--                 This design uses a single clock, hence it is safe but not optimized.
--                 Optimized design can be achieved using the DCM feature of SPARTAN 3E FPGA
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mem_mt45w8mw16_TB is
end mem_mt45w8mw16_TB;

architecture tb of mem_mt45w8mw16_TB is

constant  ADDR_W: integer:=23; 
constant  DATA_W: integer:=16; 
signal    data_f2s, data_s2f_r,data_s2f_ur, dio: std_logic_vector(DATA_W -1  downto  0) ; 
signal    mem, rw: std_logic;  
signal    addr, s_addr :  std_logic_vector(ADDR_W -1 downto  0);
signal    ready: std_logic;
signal    clk: std_logic:='0';
signal    reset: std_logic:='1';
signal    adv_n, ce_n, lb_n, ub_n, oe_n, we_n, sclk: std_logic; 


 
begin
  UUT: entity work.mem_ctl_mt45w8mw16(arch)
       port map(clk => clk,
            reset=>reset,
            addr=>addr,
            data_f2s=>data_f2s,
            mem=>mem,
            rw=>rw,
            ready=>ready,
            data_s2f_ur => data_s2f_ur,
            data_s2f_r =>data_s2f_r,
            s_addr=>s_addr,
            adv_n=>adv_n,
            ce_n=>ce_n,
            lb_n=>lb_n,
            ub_n=>ub_n,
            oe_n=>oe_n,
            we_n=>we_n,
            sclk=>sclk,
            dio=>dio
            );
            
clk <=not clk after 10 ns;

rst: 
process
  begin
  wait for 74 ns;
  reset <='1';
  for i in 1 to 10 loop
  wait until falling_edge(clk);
  end loop;
  reset <='0';
  wait;
end process rst;

 addr<="00000000000000000000001";
 data_f2s<="0000000000001011";
 
memsig:
process
   begin
     mem<='0';
     wait for 389 ns;
     mem<='1';
     wait until rising_edge(ready);
     mem<='0';
     wait;
end process memsig;

rw<='1';

--cntl_ready:
--process
--  begin
--  wait until rising_edge(ready);
--  mem<='0';
--  wait;
--end process cntl_ready;
 
end tb;
 
 
            
            
            
            
            
