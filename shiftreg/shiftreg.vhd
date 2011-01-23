--Verilog for a shift register
--using signals
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--------------------------------------

ENTITY shiftreg IS
	GENERIC(n:INTEGER :=4);
	PORT (d, clk, rst: IN STD_LOGIC;
	q: OUT STD_LOGIC);
END shiftreg;

--------------------------------------

ARCHITECTURE behavior of shiftreg IS
--SIGNAL internal: STD_LOGIC_VECTOR (n-1 downto 0);
BEGIN
	PROCESS(clk,rst)	
	VARIABLE  internal: STD_LOGIC_VECTOR (n-1 downto 0);
	BEGIN
	IF(rst='1') THEN
		--internal <=(OTHERS => '0');  --if you use signal
		internal:=(OTHERS => '0');
	ELSIF (clk'EVENT AND clk='1') THEN
		internal := d & internal(internal'LEFT DOWNTO 1);
	END IF;	
	q <=internal(0);
END PROCESS;
--q <=internal(0);										  --if you use signal
END behavior;