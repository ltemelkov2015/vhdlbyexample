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
--                 --------------------------------------------------------------------------
--                 this design uses ADV# to latch data during asynch read, and WE# signal 
--                 to latch data into SRAM when write. 
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

 
entity mem_ctl_mt45w8mw16 is
   port(
	      -- to/from register map
			clk, reset: in  std_logic;
	      addr:       in  std_logic_vector(22 downto 0);
         data_f2s:   in  std_logic_vector(15 downto 0);
			mem:        in  std_logic;
			rw:         in  std_logic;
			lb_en:      in  std_logic;
			ub_en:      in  std_logic;
			ready:      out std_logic;
			data_s2f_ur:out std_logic_vector(15 downto 0);
			data_s2f_r: out std_logic_vector(15 downto 0);
			-- to/from SRAM chip mem_ctl_mt45w8mw16
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
end mem_ctl_mt45w8mw16;
 



architecture arch of mem_ctl_mt45w8mw16 is

type state_type is(idle, rd1, rd2, rd3, rd4, wr1, wr2, wr3, wr4);
signal state_reg, state_next: state_type;
signal data_f2s_reg, data_f2s_next: std_logic_vector(15 downto 0);
signal data_s2f_reg, data_s2f_next: std_logic_vector(15 downto 0);
signal addr_reg, addr_next: std_logic_vector(22 downto 0);
signal we_buf, oe_buf, tri_buf, adv_buf, lb_buf, ub_buf: std_logic;
signal we_reg, oe_reg, tri_reg, adv_reg, lb_reg, ub_reg: std_logic; 


 
begin
--state and data registers
process(clk, reset)
begin
if(reset='1') then
 state_reg <=idle;
 data_f2s_reg <=(others=> '0');
 data_s2f_reg <=(others=> '0');
 addr_reg <= (others =>'0');
 we_reg <='1';
 oe_reg <='1';
 tri_reg <='1';
 adv_reg <='1';
 lb_reg <='1';
 ub_reg<='1';
elsif(clk'event and clk='1') then
 state_reg <= state_next;
 data_f2s_reg <= data_f2s_next;
 data_s2f_reg <= data_s2f_next;
 addr_reg <= addr_next;
 we_reg <=we_buf;
 oe_reg <=oe_buf;
 tri_reg <= tri_buf;
 adv_reg <= adv_buf;
 lb_reg <=lb_buf;
 ub_reg <= ub_buf;
end if;
end process;

--------------------------------------------------------------------------------------
--next state logic
--------------------------------------------------------------------------------------
process(state_reg, data_f2s_reg, data_s2f_reg, addr_reg, mem, addr, dio, rw, data_f2s)
begin
addr_next<=addr_reg;  -- default
data_f2s_next <= data_f2s_reg;
data_s2f_next <= data_s2f_reg;
--ready <='1';

case state_reg is
  when idle=>
    if(mem='0') then 
      state_next <=idle;
    else
      addr_next<=addr;
		
        if rw='0' then -- write
          state_next <=wr1;
          data_f2s_next <=data_f2s;
        else --read
          state_next <=rd1;
        end if;
     end if;
--ready <='1';

  when rd1=>
    state_next <=rd2;
  when rd2=>
    state_next <=rd3;
  when rd3=>
    state_next <=rd4;
  when rd4=>
    data_s2f_next <= dio;
	 state_next <= idle;
  when wr1=>
    state_next <=wr2;
  when wr2=>
    state_next <=wr3;
  when wr3=>
    state_next <=wr4;
  when wr4=>
    state_next <=idle;
end case;
end process;
     
--------------------------------------------------------------
-- look-ahead output logic
--------------------------------------------------------------
process(state_next)
begin

tri_buf <='1'; --defaults
we_buf  <='1';
oe_buf  <='1';
adv_buf <='1';
lb_buf <= lb_reg;
ub_buf <= ub_reg;
ready<='0'; --unregistered signal


case state_next is
  when idle=>
   ready <='1';
  when rd1=> 
      lb_buf<=lb_en;
      ub_buf<=ub_en;		
      adv_buf <='0'; 
      oe_buf  <='0';
  when rd2=> 
      oe_buf  <='0';
  when rd3=>
      oe_buf  <='0';
  when rd4=>
      oe_buf  <='0';
  when wr1=>
        lb_buf<=lb_en;
        ub_buf<=ub_en;	
        tri_buf <='0';
		  adv_buf <='0';
		  we_buf  <='0';
  when wr2=>
      tri_buf <='0';
		adv_buf <='0';
		we_buf  <='0';
	when wr3=>
	   tri_buf <='0';
		adv_buf <='0';
		we_buf  <='0';
	when wr4=>
	   tri_buf <='0';
		adv_buf <='0';
end case;
end process;

-- to main system
data_s2f_r  <= data_s2f_reg;
data_s2f_ur <= dio;


--to SRAM
we_n <=we_reg;
oe_n<=oe_reg;
s_addr <=addr_reg;
adv_n<=adv_reg;
lb_n <=lb_reg;
ub_n <=ub_reg;

--i/o for sram chip
ce_n <='0';
sclk <='0';
cre <='0';
dio <= data_f2s_reg when tri_reg='0' else (others=>'Z');



end arch;
