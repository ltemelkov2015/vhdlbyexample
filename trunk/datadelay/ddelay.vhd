-- data delay 
-- delay the output from the input


----------------------------------
library ieee;
use ieee.std_logic_1164.all;
----------------------------------

entity 	ddelay is
	port(d: in std_logic_vector(3 downto 0);
	clk: in std_logic;	
	sel:in integer range 0 to 7; 
	q:out std_logic_vector(3 downto	0));
end ddelay;

---------------------------------

architecture behav of ddelay is	 
type wire is array(0 to 7) of std_logic_vector(3 downto 0);
signal internal:wire;
begin
	process(clk)
	begin
		if(clk'EVENT and clk='1') then	   
			for i in 0 to 6 loop
				internal(i+1) <= internal(i);
			end loop;
			internal(0) <= d;
		end if;
	end process;   
	
	
q <= internal(sel); -- will generate a bigger hardware circuit,
	-- since "sel" signal is coded by 4 bits, i.e if sel=5,6,7
	-- this combinations are not included and vhdl will generate bigger hardwares logic
	
--q <= internal(0) when sel=0 else	
--internal(1) when sel=1 else
--internal(2) when sel=2 else
--internal(3) when sel=3 else
--internal(4) when sel=4 else
--internal(0); -- if sel is different than 4 default to '0' or no delay
		
end behav;
			
		
	