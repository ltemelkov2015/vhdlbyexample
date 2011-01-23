library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity shiftreg_tb is
	-- Generic declarations of the tested unit
		generic(
		n : INTEGER := 4 );
end shiftreg_tb;

architecture TB_ARCHITECTURE of shiftreg_tb is
	-- Component declaration of the tested unit
	component shiftreg
		generic(
		n : INTEGER := 4 );
	port(
		d : in STD_LOGIC;
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		q : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal d : STD_LOGIC;
	signal clk : STD_LOGIC :='0';
	signal rst : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal q : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : shiftreg
		generic map (
			n => n
		)

		port map (
			d => d,
			clk => clk,
			rst => rst,
			q => q
		);

	-- Add your stimulus here ...  
	clock: Process(clk)
	Begin
	clk <= not clk after 20ns;	
	end Process; 
	
	stimul:Process
	Begin  
		rst<='1';
		wait for 50 ns;
		rst<='0';
		wait;
	end Process;
	
	d_input:Process
	Begin  
		d<='1';
		wait for 76 ns;
		d<='0';
	end Process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_shiftreg of shiftreg_tb is
	for TB_ARCHITECTURE
		for UUT : shiftreg
			use entity work.shiftreg(behavior);
		end for;
	end for;
end TESTBENCH_FOR_shiftreg;

