----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:05 07/13/2011 
-- Design Name: 
-- Module Name:    dff_en - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff_en is
  port(
       clk, reset: in std_logic;
		 en:         in std_logic;
		 d:          in std_logic;
		 q:         out std_logic
      );		 
end dff_en;

architecture Behavioral of dff_en is
signal r_reg, r_next:std_logic;
begin
process(clk, reset)
begin
if(reset='1') then
r_reg <='0';
elsif(clk'event and clk='1') then
r_reg<=r_next;
end if;
end process;

-- next state logic
r_next<=d when en='1' else
r_reg;

-- output logic

 q<=r_reg;

end Behavioral;

