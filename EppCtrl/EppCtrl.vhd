---------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Lachezar Temelkov
-- 
-- Create Date:    14:40:43 07/12/2011 
-- Design Name: 
-- Module Name:    EppCtrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    This is the main syncronous module that communicate to the EPP 
--                 interface on one side and to memory controller from the other side
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
use ieee.numeric_std.all;

entity EppCtrl is
  port(
        -- to/from EPP interface
		  reset: in std_logic;
        mclk:  in std_logic;
        pdb:   inout std_logic_vector(7 downto 0);
        astb:  in std_logic;
        dstb:  in std_logic;
        pwr:   in std_logic;
 		  pwait: out std_logic
		  -- TODO: to/from memory controller mem_ctl_mt45w8mw16
		 );	
end EppCtrl;
  
  
architecture arch of EppCtrl is

-- registers. next state signals----
signal EppAddr_reg, EppAddr_next: std_logic_vector(7 downto 0);
signal Data0_reg, Data0_next:     std_logic_vector(7 downto 0);
signal Data1_reg, Data1_next:     std_logic_vector(7 downto 0);
signal Data2_reg, Data2_next:     std_logic_vector(7 downto 0);
signal Data3_reg, Data3_next:     std_logic_vector(7 downto 0);
signal Data4_reg, Data4_next:     std_logic_vector(7 downto 0);
signal Data5_reg, Data5_next:     std_logic_vector(7 downto 0);
signal Data6_reg, Data6_next:     std_logic_vector(7 downto 0);
signal Data7_reg, Data7_next:     std_logic_vector(7 downto 0);

-- internal signals
signal pdb_buf: std_logic_vector(7 downto 0);

-- state indicator
type state_type is(stEppReady, 
                   stEppAwrA, 
						       stEppAwrB,
                   stEppArdA,
                   stEppArdB,
                   stEppDwrA,
                   stEppDwrB,
                   stEppDrdA,
                   stEppDrdB
                  );


signal state_reg, state_next: state_type;				
signal pwait_buf, pwait_reg:  std_logic;
signal tri_buf: std_logic;
signal tri_reg: std_logic:='1';




begin

process(mclk, reset)
begin
  if(reset='1') then
     state_reg <= stEppReady;
	  EppAddr_reg <=(others=>'0');
	  Data0_reg <=(others=>'0');
	  Data1_reg <=(others=>'0');
	  Data2_reg <=(others=>'0');
	  Data3_reg <=(others=>'0');
	  Data4_reg <=(others=>'0');
	  Data5_reg <=(others=>'0');
	  Data6_reg <=(others=>'0');
	  Data7_reg <=(others=>'0');
	  pwait_reg <= '0';
	  tri_reg <='1';
	elsif(mclk'event and mclk='1') then
	  state_reg <=state_next;
	  EppAddr_reg <= EppAddr_next;
	  Data0_reg <=Data0_next;
	  Data1_reg <=Data1_next;
	  Data2_reg <=Data2_next;
	  Data3_reg <=Data3_next;
	  Data4_reg <=Data4_next;
	  Data5_reg <=Data5_next;
	  Data6_reg <=Data6_next;
	  Data7_reg <=Data7_next;
	  pwait_reg <=pwait_buf;
	  tri_reg <= tri_buf;
   end if;
end process;

-- next state logic
process(state_reg, Data0_reg, Data1_reg, Data2_reg, Data3_reg, Data4_reg, 
        Data5_reg, Data6_reg, Data7_reg, EppAddr_reg, pwr, astb, dstb, pdb)
begin
Data0_next <= Data0_reg; --defaults
Data1_next <= Data1_reg;
Data2_next <= Data2_reg;
Data3_next <= Data3_reg;
Data4_next <= Data4_reg;
Data5_next <= Data5_reg;
Data6_next <= Data6_reg;
Data7_next <= Data7_reg;
EppAddr_next <= EppAddr_reg;
pdb_buf <=(others =>'0');


case state_reg is
  when stEppReady =>
   if astb='0' then
	  if pwr='0' then --address write EPP->P
		 state_next <= stEppAwrA;
	  else -- address read 
		 state_next <= stEppArdA;
	  end if;
	elsif dstb = '0' then
	  if pwr='0' then --data write
		 state_next <= stEppDwrA;
	  else
		 state_next <= stEppDrdA;
	  end if;
	else 
	    state_next <= stEppReady;
	end if;
	 
	 
   when stEppAwrA=>
	  if astb ='0' then
		 state_next <= stEppAwrA;
	  else --wait till astr goes to '1'
		 state_next <= stEppReady;
		 EppAddr_next  <= pdb;
	  end if;
			 
	 		
   when stEppArdA=>
	    pdb_buf <= EppAddr_reg;
	    if astb='0' then
         state_next<=stEppArdA;		 
	    else
		   state_next <= stEppReady;
		 end if; 
		 
		   
	  
   when stEppDwrA=>
	   if dstb ='0' then
			state_next <= stEppDwrA;
		else --wait till astr goes to '1'
			state_next <= stEppReady;
			--decide which data reg to be written
			case EppAddr_reg is
			when "00000000" =>
			     Data0_next<=pdb;
			when "00000001" => 
              Data1_next<=pdb;
         when "00000010" =>
              Data2_next<=pdb;
         when "00000011" =>
              Data3_next<=pdb;
         when "00000100" =>
              Data4_next<=pdb;
         when  "00000101" =>
              Data5_next<=pdb;
         when "00000110" =>
              Data6_next<=pdb;
         when "00000111" =>
              Data7_next <=pdb;
         when others =>
              null;
    		end case;
		end if;
      	
			
	   when stEppDrdA =>
		   -- decide which data register to be read
			case EppAddr_reg is
			when "00000000" =>
			     pdb_buf<=Data0_reg;
			when "00000001" => 
              pdb_buf<=Data1_reg;
         when "00000010" =>
              pdb_buf<=Data2_reg;
         when "00000011" =>
              pdb_buf<=Data3_reg;
         when "00000100" =>
              pdb_buf<=Data4_reg;
         when  "00000101" =>
              pdb_buf<=Data5_reg;
         when "00000110" =>
              pdb_buf<=Data6_reg;
         when "00000111" =>
              pdb_buf<=Data7_reg;
         when others =>
              null;
    		end case;
			if  dstb='0' then
             state_next<=stEppDrdA;		 
	      else
		       state_next <= stEppReady;
		   end if; 
			
		when others =>
		   state_next <=stEppReady;
	end case;
end process;			
         		
			 
-------------------------------------------------------
--look ahead logic
-------------------------------------------------------			 
process(state_next)
begin
pwait_buf <='0'; --defaults
tri_buf <='1';
	 	
case state_next is
  when stEppReady=>
  when stEppAwrA=>
       pwait_buf <= '1'; 
  when stEppArdA=>
       pwait_buf <='1';  -- return wait=1 to Epp and
		 tri_buf<='0';     -- enable the output
  when stEppDwrA=>
       pwait_buf <='1';
  when stEppDrdA=>
       pwait_buf <='1';  -- return wait=1 to Epp and
		 tri_buf<='0';
  when others=>	--default values	 
end case;
end process;

--output
pwait<=pwait_reg;
pdb <= pdb_buf when tri_reg='0' else (others =>'Z');		 
end arch;
