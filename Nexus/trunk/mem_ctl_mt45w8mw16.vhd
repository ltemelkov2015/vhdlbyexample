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
-- 21/8/2011 replaced the look ahead logic with glitch free states 08/22/2011
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
--GLITCH FREE STATES
--bit0 -> tri <='1'; --defaults
--bit1 -> we  <='1';
--bit2 -> oe  <='1';
--bit3 -> adv <='1';
--bit4 -> ready <='1' i.e idle

constant idle: std_logic_vector(8 downto 0):= "0000" & "11111"; 
constant rd1:  std_logic_vector(8 downto 0):= "0001" & "00011";
constant rd2:  std_logic_vector(8 downto 0):= "0010" & "01011";
constant rd3:  std_logic_vector(8 downto 0):= "0011" & "01011";
constant rd4:  std_logic_vector(8 downto 0):= "0100" & "01011";

constant wr1:  std_logic_vector(8 downto 0):= "0110" & "00100";
constant wr2:  std_logic_vector(8 downto 0):= "0111" & "00100";
constant wr3:  std_logic_vector(8 downto 0):= "1000" & "00100";
constant wr4:  std_logic_vector(8 downto 0):= "1001" & "00110";

signal state_reg:  std_logic_vector(8 downto 0):=idle;
signal state_next: std_logic_vector(8 downto 0);


signal data_f2s_reg, data_f2s_next: std_logic_vector(15 downto 0);
signal data_s2f_reg, data_s2f_next: std_logic_vector(15 downto 0);
signal addr_reg, addr_next: std_logic_vector(22 downto 0);
signal we_reg, oe_reg, tri_reg, adv_reg: std_logic; 


 
begin
-- signal map
tri_reg <= state_reg(0);
we_reg  <= state_reg(1);
oe_reg  <= state_reg(2);
adv_reg <= state_reg(3);
ready   <= state_reg(4);

--passthru
lb_n <=lb_en;
ub_n <=ub_en;

process(clk, reset)
begin
if(reset='1') then
 state_reg <=idle;
 data_f2s_reg <=(others=> '0');
 data_s2f_reg <=(others=> '0');
 addr_reg <= (others =>'0');
elsif(clk'event and clk='1') then
 state_reg <= state_next;
 data_f2s_reg <= data_f2s_next;
 data_s2f_reg <= data_s2f_next;
 addr_reg <= addr_next;
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


  when rd1=>
    state_next <=rd2;
  when rd2=>
    state_next <=rd3;
  when rd3=>
    state_next <=rd4;
  when rd4=>
    data_s2f_next <= dio;
	 state_next <=idle;

	 
	 
  when wr1=>
    state_next <=wr2;
  when wr2=>
    state_next <=wr3;
  when wr3=>
    state_next <=wr4;
  when wr4=>
    state_next <=idle;
	 
  when others=>
    state_next <=idle;
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


--i/o for sram chip
ce_n <='0';
sclk <='0';
cre <='0';
dio <= data_f2s_reg when tri_reg='0' else (others=>'Z');

end arch;

