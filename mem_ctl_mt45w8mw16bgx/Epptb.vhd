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
	
	-- test against the following operations
	
																		 
															
   
	                   
	-- Some default values for Addresses and Data. 
	-- in some of the next testbenches use random generator
	signal EppAdr0:    std_logic_vector(7 downto 0):=x"00";
	signal EppAdr1:    std_logic_vector(7 downto 0):=x"01";
	signal EppAdr2:    std_logic_vector(7 downto 0):=x"02";
	signal EppAdr3:    std_logic_vector(7 downto 0):=x"03";
	signal EppAdr4:    std_logic_vector(7 downto 0):=x"04";
	signal EppAdr5:    std_logic_vector(7 downto 0):=x"05";
	

	
	signal MemCtrlAdr0: std_logic_vector(7 downto 0):=x"02";      --Address 0
	signal MemCtrlAdr1: std_logic_vector(7 downto 0):=x"02";      --A1
	signal MemCtrlAdr2: std_logic_vector(7 downto 0):=x"00";      --A2
	signal MemCtrlData0: std_logic_vector(7 downto 0):=x"0A";     --A3
	signal MemCtrlData1: std_logic_vector(7 downto 0):=x"0B";     --A4
	signal MemCtrlControl: std_logic_vector(7 downto 0):=x"01";   --A5
	
	
	--Internal signals for state machine
	type stateType is(stHostReady, stHostEppAdr0WriteA, stHostEppAdr0WriteB,
	                               stHostEppAdr1WriteA, stHostEppAdr1WriteB,
											 stHostEppAdr2WriteA, stHostEppAdr2WriteB,
											 stHostEppAdr3WriteA, stHostEppAdr3WriteB,
											 stHostEppAdr4WriteA, stHostEppAdr4WriteB,
											 stHostEppAdr5WriteA, stHostEppAdr5WriteB,
											 stHostEppAdr6WriteA, stHostEppAdr6WriteB,
											 
											 
	
	                               stHostMemAdr0WriteA, stHostMemAdr0WriteB,
											 stHostMemAdr1WriteA, stHostMemAdr1WriteB,
											 stHostMemAdr2WriteA, stHostMemAdr2WriteB,
											 
											 stHostMemCtrlWriteA, stHostMemCtrlWriteB,


                                  stHostMemData0WriteA, stHostMemData0WriteB,
											 stHostMemData1WriteA, stHostMemData1WriteB
	
	
	                               );

   	

   signal state_reg, state_next: stateType;
   signal hclk: std_logic:='0';	
	signal hreset:std_logic:='0';											 
   
 
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
		     ---- go back to Epp Ready
			  state_next<= stHostReady;
			  
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
		 
		 when others=>
	 
	end case;
end process; 
end behavior;
