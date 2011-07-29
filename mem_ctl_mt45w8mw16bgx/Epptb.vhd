--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:00:34 07/23/2011
-- Design Name:   
-- Module Name:   C:/Nexus2memControl/Epptb.vhd
-- Project Name:  mem_ctl_mt45w8mw16bgx
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EppMemCtrTop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Epptb IS
END Epptb;
 
ARCHITECTURE behavior OF Epptb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EppMemCtrTop
    PORT(
         mclk : IN  std_logic;
         reset : IN  std_logic;
         pdb : INOUT  std_logic_vector(7 downto 0);
         astb : IN  std_logic;
         dstb : IN  std_logic;
         pwr : IN  std_logic;
         pwait : OUT  std_logic;
         s_addr : OUT  std_logic_vector(22 downto 0);
         adv_n : OUT  std_logic;
         ce_n : OUT  std_logic;
         lb_n : OUT  std_logic;
         ub_n : OUT  std_logic;
         oe_n : OUT  std_logic;
         we_n : OUT  std_logic;
         sclk : OUT  std_logic;
         cre : OUT  std_logic;
         dio : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
 
   --Inputs
   signal mclk : std_logic := '0';
   signal reset : std_logic := '0';
   signal astb : std_logic := '0';
   signal dstb : std_logic := '0';
   signal pwr : std_logic := '0';

	--BiDirs
   signal pdb : std_logic_vector(7 downto 0);
   signal dio : std_logic_vector(15 downto 0);

 	--Outputs
   signal pwait : std_logic;
   signal s_addr : std_logic_vector(22 downto 0);
   signal adv_n : std_logic;
   signal ce_n : std_logic;
   signal lb_n : std_logic;
   signal ub_n : std_logic;
   signal oe_n : std_logic;
   signal we_n : std_logic;
   signal sclk : std_logic; 
   signal cre : std_logic;


   -- Clock period definitions
   constant mclk_period : time := 20 ns;
	constant hclk_period : time := 30 ns;
	constant ramclk_period : time :=10 ns;
	

	
																		 
	                   
	-- Some default values for Addresses and Data. 
	-- in some of the next testbenches use random generator
	signal EppAdr0:    std_logic_vector(7 downto 0):=x"00";
	signal EppAdr1:    std_logic_vector(7 downto 0):=x"01";
	signal EppAdr2:    std_logic_vector(7 downto 0):=x"02";
	signal EppAdr3:    std_logic_vector(7 downto 0):=x"03";
	signal EppAdr4:    std_logic_vector(7 downto 0):=x"04";
	signal EppAdr5:    std_logic_vector(7 downto 0):=x"05";
	

	
	signal MemCtrlAdr0: std_logic_vector(7 downto 0):=x"FE";      --Address 0
	signal MemCtrlAdr1: std_logic_vector(7 downto 0):=x"FE";      --A1
	signal MemCtrlAdr2: std_logic_vector(7 downto 0):=x"00";      --A2
	signal MemCtrlData0: std_logic_vector(7 downto 0):=x"0A";     --A3
	signal MemCtrlData1: std_logic_vector(7 downto 0):=x"0B";     --A4
	signal MemCtrlControl: std_logic_vector(7 downto 0):=x"06";   --A5
	signal MemCtrlData00:  std_logic_vector(7 downto 0):=x"07";   --A3
	signal MemCtrlData01:  std_logic_vector(7 downto 0):=x"08";   --A4
	
	--Internal signals for state machine >USB- Epp
	type stateType is(stHostReady, stHostEppAdr0WriteA, stHostEppAdr0WriteB,
	                               stHostEppAdr1WriteA, stHostEppAdr1WriteB,
											 stHostEppAdr2WriteA, stHostEppAdr2WriteB,
											 stHostEppAdr3WriteA, stHostEppAdr3WriteB,
											 stHostEppAdr4WriteA, stHostEppAdr4WriteB,
											 stHostEppAdr5WriteA, stHostEppAdr5WriteB,
											 stHostEppAdr6WriteA, stHostEppAdr6WriteB,
											 
											 stHostEppAdr3WriteAA, stHostEppAdr3WriteBB,
											 
											 
											 stHostEppAdr0RdA, stHostEppAdr0RdB,
	                               stHostEppAdr1RdA, stHostEppAdr1RdB,
											 stHostEppAdr2RdA, stHostEppAdr2RdB,
											 
											 
											 
											 stHostEppAdr33WriteA, stHostEppAdr33WriteB,
											 stHostEppAdr44WriteA, stHostEppAdr44WriteB,
											 
											 
	
	                               stHostMemAdr0WriteA, stHostMemAdr0WriteB,
											 stHostMemAdr1WriteA, stHostMemAdr1WriteB,
											 stHostMemAdr2WriteA, stHostMemAdr2WriteB,
											 
											 
											 
											 
											 
	                               stHostMemAdr0RdA, stHostMemAdr0RdB,
											 stHostMemAdr1RdA, stHostMemAdr1RdB,
											 stHostMemAdr2RdA, stHostMemAdr2RdB,
											 
											 
											 stHostMemDataRd03A, stHostMemDataRd03B,
											 
											 
											 stHostMemCtrlWriteA, stHostMemCtrlWriteB,


                                  stHostMemData0WriteA, stHostMemData0WriteB,
											 stHostMemData1WriteA, stHostMemData1WriteB,
											 
											 
											 stHostMemData00WriteA, stHostMemData00WriteB,
											 stHostMemData01WriteA, stHostMemData01WriteB
	
	
	                               );
											 
											 
											 
-- state machine Memcontrol -Sram
type MemRamState is(idle, srd0, srd1, srd2, srd3);
signal ms_stateReg : MemRamState:=idle;
signal ms_stateNext:	MemRamState;										 

   	

   signal state_reg, state_next: stateType;
   signal hclk: std_logic:='0';
   signal ramclk: std_logic:='0';	
	signal hreset:std_logic:='0';	
   constant sramData: std_logic_vector(15 downto 0):=x"070A";	
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EppMemCtrTop PORT MAP (
          mclk => mclk,
          reset => reset,
          pdb => pdb,
          astb => astb,
          dstb => dstb,
          pwr => pwr,
          pwait => pwait,
          s_addr => s_addr,
          adv_n => adv_n,
          ce_n => ce_n,
          lb_n => lb_n,
          ub_n => ub_n,
          oe_n => oe_n,
          we_n => we_n,
          sclk => sclk,
          cre => cre,
          dio => dio
        );



   -- Memory Clock process definitions
   mclk_process :process
   begin
		mclk <= '0';
		wait for mclk_period/2;
		mclk <= '1';
		wait for mclk_period/2;
   end process mclk_process;
 
 -- 
 host_clk:process
 begin
     hclk <='0';
	  wait for hclk_period/2;
	  hclk<= '1';
	  wait for hclk_period/2;
 end process host_clk;



--
ram_clock: process
begin
ramclk <= '0';
wait for ramclk_period/2;
ramclk <='1';
wait for ramclk_period/2;
end process ram_clock; 

--
host_reset:process
 begin
    hreset<='1';
	 wait for hclk_period *3;
	 hreset<='0';
	 wait;
 end process;
 
 Epp_reset: process
 begin
  reset<='1';
  wait for mclk_period*2;
  reset<='0';
  wait;
 end process;
 
 
 process(hclk, hreset)
 begin
 if(hreset='1') then
    state_reg <= stHostReady;
 elsif(hclk'event and hclk='1') then
    state_reg <=state_next;
 end if;
 end process;
 
 
 -- next state logic
 process(state_reg, pwait)
 
 begin
 case state_reg is
 

   when stHostReady=>
	   state_next <=  stHostEppAdr0WriteA;

		
	when stHostEppAdr0WriteA =>
	  if(pwait='0') then 
	    state_next <= stHostEppAdr0WriteA;
	  else
	    state_next <= stHostEppAdr0WriteB;
	  end if;
	
	when stHostEppAdr0WriteB =>
	    state_next <= stHostMemAdr0WriteA;
		 
	when stHostMemAdr0WriteA =>
	  if pwait='0' then
	    state_next<= stHostMemAdr0WriteA;
	  else
	    state_next<= stHostMemAdr0WriteB;
	  end if;
	  
	  
	when stHostMemAdr0WriteB=>
	   state_next <= stHostEppAdr1WriteA;
		
	
   when stHostEppAdr1WriteA=>
        if pwait='0' then
          state_next <= stHostEppAdr1WriteA;
        else 
          state_next <= stHostEppAdr1WriteB;
         end if;

    when stHostEppAdr1WriteB=>
	      state_next <= stHostMemAdr1WriteA;
	
	when stHostMemAdr1WriteA=>
	    if pwait='0' then
		   state_next <= stHostMemAdr1WriteA;
		 else
		   state_next <= stHostMemAdr1WriteB;
		 end if;
		
    when stHostMemAdr1WriteB =>
	     state_next <= stHostEppAdr2WriteA;

     when stHostEppAdr2WriteA=>
	       if pwait='0' then
			   state_next <= stHostEppAdr2WriteA;
			 else
			   state_next <= stHostEppAdr2WriteB;
			 end if;
		----	 
	  when stHostEppAdr2WriteB=>
	      state_next <= stHostMemAdr2WriteA;
			
			
		when stHostMemAdr2WriteA=>
		   if pwait='0' then 
			  state_next <= stHostMemAdr2WriteA;
			else
			  state_next <= stHostMemAdr2WriteB;
			end if;
		

     --load addres 5	for the control register	
		when stHostMemAdr2WriteB=>
		    state_next <= stHostEppAdr5WriteA; --write control register address
			 
	 
	  when stHostEppAdr5WriteA =>
	       if pwait='0' then
				  state_next <= stHostEppAdr5WriteA;
			 else
				  state_next <= stHostEppAdr5WriteB;
		    end if;
			 
			 
	  when stHostEppAdr5WriteB=>
	      state_next <= stHostMemCtrlWriteA; 
		
		
		when stHostMemCtrlWriteA=>
		  if pwait='0' then
		     state_next <=  stHostMemCtrlWriteA;
		  else
		     state_next <=  stHostMemCtrlWriteB;
		  end if;
		
		 --load the data registers
		when stHostMemCtrlWriteB=>
		     state_next <= stHostEppAdr3WriteA;
			  
			  
	   when stHostEppAdr3WriteA=>
		     if pwait='0' then
			   state_next <= stHostEppAdr3WriteA;
				else
				state_next <=stHostEppAdr3WriteB;
			  end if;
			  
		when stHostEppAdr3WriteB=>
		     state_next <= stHostMemData0WriteA;
			  
		
		when stHostMemData0WriteA=>
		   if pwait ='0' then
			   state_next <= stHostMemData0WriteA;
			else
			   state_next <= stHostMemData0WriteB;
			end if;
			
			
			
		when stHostMemData0WriteB=>
		    state_next <= stHostEppAdr4WriteA;
			 
			-- 
		when stHostEppAdr4WriteA=>
		   if pwait='0' then
			   state_next <= stHostEppAdr4WriteA;
			else
			   state_next <= stHostEppAdr4WriteB;
			end if;
			
		
		 when stHostEppAdr4WriteB=>
		    state_next <= stHostMemData1WriteA;
				
		
	   when stHostMemData1WriteA=>
		    if pwait='0' then 
			   state_next <= stHostMemData1WriteA;
			 else 
			   state_next <= stHostMemData1WriteB;
			 end if;
			 
			 
		when stHostMemData1WriteB =>
		     ---- write two more data bytes
			  state_next<= stHostEppAdr33WriteA;
			  
			  
		when stHostEppAdr33WriteA=>
		    if pwait='0' then 
			   state_next <= stHostEppAdr33WriteA;
			 else
			   state_next <= stHostEppAdr33WriteB;
			 end if;
			 
			 
			 
		when 	stHostEppAdr33WriteB=>
             state_next <= stHostMemData00WriteA;				 
			 
			 
			  
			  
		when stHostMemData00WriteA=>
		   if pwait='0' then
			  state_next <= stHostMemData00WriteA;
			else
			  state_next <= stHostMemData00WriteB;
			end if;
			
			
		when 	stHostMemData00WriteB=>
		   state_next <= stHostEppAdr44WriteA;
			
		when  stHostEppAdr44WriteA=>
		   if pwait ='0' then 
			  state_next <= stHostEppAdr44WriteA;
			else 
			  state_next <= stHostEppAdr44WriteB;
			end if;
			
			
		when stHostEppAdr44WriteB=>
		   state_next <= stHostMemData01WriteA;
			
			
		when stHostMemData01WriteA=>
		   if pwait='0' then 
			state_next <= stHostMemData01WriteA;
			else
			state_next <= stHostMemData01WriteB;
			end if;
			
			
			
			
		-- repeat the process several times	
		-- or start another state like reading
	   when stHostMemData01WriteB=>
		   --state_next <=  stHostEppAdr33WriteA;
		     state_next <= stHostEppAdr0RdA;
			  
			  
			  
		when stHostEppAdr0RdA=>
		    if pwait = '0' then 
			   state_next <= stHostEppAdr0RdA;
			 else
			   state_next <= stHostEppAdr0RdB;
			 end if;
			 
			 
		when stHostEppAdr0RdB=>
		    state_next <= stHostMemAdr0RdA;
			  
	--
	   when stHostMemAdr0RdA=>
		    if pwait='0' then
			    state_next <= stHostMemAdr0RdA;
			else
			    state_next <=stHostMemAdr0RdB;
			end if;
		
		
		when stHostMemAdr0RdB=>
		    state_next <= stHostEppAdr1RdA;
			 
		when stHostEppAdr1RdA=>
		   if pwait='0' then 
			  state_next <= stHostEppAdr1RdA;
			else
			  state_next <= stHostEppAdr1RdB;
			end if;
			
			
	  when stHostEppAdr1RdB=>
	     state_next <= stHostMemAdr1RdA;
			 
	-- 
		when stHostMemAdr1RdA =>
		   if pwait='0' then 
			   state_next <= stHostMemAdr1RdA;
			else
			   state_next <= stHostMemAdr1RdB;
			end if;
			
			
		when stHostMemAdr1RdB=>
		     state_next <= stHostEppAdr2RdA;
			  
		when stHostEppAdr2RdA=>
		   if pwait ='0' then
			   state_next<= stHostEppAdr2RdA;
			else
			  state_next <= stHostEppAdr2RdB;
			end if;
			
			
	  when stHostEppAdr2RdB =>
	      state_next <= stHostMemAdr2RdA;
			  
	--		  
		when stHostMemAdr2RdA =>
		    if pwait='0' then 
			    state_next <= stHostMemAdr2RdA;
			 else
			    state_next <= stHostMemAdr2RdB;
			end if;
			
			
	   when stHostMemAdr2RdB=>
		     state_next <= stHostEppAdr3WriteAA;
			  
  --
      when stHostEppAdr3WriteAA=>
		   if pwait='0' then 
			  state_next <= stHostEppAdr3WriteAA;
			else
			  state_next <= stHostEppAdr3WriteBB;
			end if;
			
		
		when stHostEppAdr3WriteBB =>
		  state_next <= stHostMemDataRd03A;
		  
		when stHostMemDataRd03A=>
		  if pwait='0' then
		    state_next <= stHostMemDataRd03A;
		  else
		    state_next <= stHostMemDataRd03B;
		 end if;
		 
		 --when stHostMemDataRd03B=>
		
			  
			  
		-- read memory data

      --default		
		when others=>
		   state_next <=stHostReady;
        		
	end case;
end process;	
	  
	  
	
		
	




	
	  
        
 
 
 -- combinational logic output.
 process(state_reg)
 begin
 astb<='1'; --defaults
 dstb<='1';
 pwr<='0';
 pdb<=(others =>'Z');
 
 
 case state_reg is
   
	
     when stHostReady=>
	   
		
	  when stHostEppAdr0WriteA =>
	       astb <='0';
			 pdb<= EppAdr0;
	
	  when stHostEppAdr0WriteB =>
	       
		 
	  when stHostMemAdr0WriteA =>
	       dstb<='0';
			 pdb<=MemCtrlAdr0;
			 
	  
	  when stHostMemAdr0WriteB=>
	       
	   
		
	  when stHostEppAdr1WriteA=>
          astb <='0';
			 pdb<= EppAdr1;
		  

     when stHostEppAdr1WriteB=>
	      
	
	  when stHostMemAdr1WriteA=>
	       dstb<='0';
			 pdb<=MemCtrlAdr1;
	    
		
     when stHostMemAdr1WriteB =>
	     

     when stHostEppAdr2WriteA=>
	       astb <='0';
			 pdb<= EppAdr2;
			 
 
	  when stHostEppAdr2WriteB=>
	       
			
	  when stHostMemAdr2WriteA=>
	       dstb<='0';
			 pdb<=MemCtrlAdr2;
		   
		
	
	  when stHostMemAdr2WriteB=>
		    
			 
	 
	  when stHostEppAdr5WriteA =>
	       astb <='0';
			 pdb<= EppAdr5;
			 
			 
	  when stHostEppAdr5WriteB=>
	      
		
		
		when stHostMemCtrlWriteA=>
		    dstb<='0';
			 pdb<= MemCtrlControl;
		
		 
		when stHostMemCtrlWriteB=>
		     
			  
			  
	   when stHostEppAdr3WriteA=>
		     astb <='0';
			  pdb<= EppAdr3;
		     
			  
		when stHostEppAdr3WriteB=>
		     
			  
		
		when stHostMemData0WriteA=>
		     dstb<='0';
			  pdb<= MemCtrlData0;
			
			
			
		when stHostMemData0WriteB=>
		    
			 
			
		when stHostEppAdr4WriteA=>
		     astb <='0';
			  pdb<= EppAdr4;
			
		
		 when stHostEppAdr4WriteB=>
		    
				
		
	    when stHostMemData1WriteA=>
		      dstb<='0';
			   pdb<= MemCtrlData1;
			 
			 
		 when stHostMemData1WriteB =>
		 
			  
			  
		 when stHostMemData00WriteA=>
		       dstb<='0';
				 pdb<=MemCtrlData00;
				 
			
			
		 when 	stHostMemData00WriteB=>
		   
			
			
		 when stHostMemData01WriteA=>
		      dstb<='0';
				 pdb<=MemCtrlData01;
		   
			
		when stHostEppAdr33WriteA=>
		     astb <='0';
			  pdb<= EppAdr3;
			  
		when stHostEppAdr33WriteB=>
		
		
		when stHostEppAdr44WriteA=>
		     astb <='0';
			  pdb<= EppAdr4;
			  
			  
			  
		when stHostEppAdr44WriteB=>
		
		
		--- reading
		when stHostMemAdr0RdA =>
		    dstb <='0';
			 pwr <='1';
			 
		when stHostMemAdr0RdB=>
		
		
		
		
		when stHostMemAdr1RdA =>
		    dstb <='0';
			 pwr <='1';
			 
		when stHostMemAdr1RdB=> 



     when stHostMemAdr2RdA =>
		    dstb <='0';
			 pwr <='1';
			 
		when stHostMemAdr2RdB=>	   
		
		
		when stHostEppAdr0RdA =>
           astb <='0';
			  pdb <= EppAdr0;		
 		     
		
		when stHostEppAdr0RdB=>
		
		when stHostEppAdr1RdA=>
		     astb <='0';
			  pdb <= EppAdr1;
		
		
		when stHostEppAdr1RdB=>
		
		when stHostEppAdr2RdA=>
		     astb <='0';
			  pdb <= EppAdr2;
		
		when stHostEppAdr2RdB=>

  		
		when stHostMemDataRd03A =>
		    dstb <='0';
			 pwr <= '1';
		
		when stHostMemDataRd03B =>
		
		when stHostEppAdr3WriteAA=>
		     astb <='0';
			  pdb <= EppAdr3;
			  
	  when stHostEppAdr3WriteBB =>
	      
		 
		 when others=>
	 
	end case;
end process; 


-- Sram States
process(ramclk)
begin
if(ramclk'event and ramclk='1') then
ms_stateReg<=ms_stateNext;
end if;
end process;


-- next state_logic for sram
process(ms_stateReg, s_addr, adv_n, we_n, ce_n, lb_n, ub_n, oe_n, we_n, sclk, cre)
begin


case ms_stateReg is

 when idle=>
   
    if (adv_n ='0' and  ce_n='0' and oe_n='0' and (lb_n='0' or ub_n='0') and we_n='1') then
	   ms_stateNext <= srd0;
	 else
	   ms_stateNext <= idle;
	end if;
	
	
 when srd0=>
    ms_stateNext <=srd1;
	 
		  

 when srd1=>
   ms_stateNext <=srd2;
	
	
 when srd2=>
   ms_stateNext <=srd3; 

	when srd3 =>
	   if oe_n='1'  or  ce_n='1' then
         ms_stateNext <= idle;
      else
         ms_stateNext <= srd3;
		end if;
			
 when others =>
    ms_stateNext <= idle;
	
end case;
end process;
 
 
-- sram output
process( ms_stateReg)
begin
   case ms_stateReg is
	  when srd3 =>
	      dio <= sramData; --070A h
     when others=>
	      dio <= (others=>'Z');
	end case;
end process;
      
	 
end behavior;
