-- Shift register implementation
-- This is a generic shift register with serial In, paralel out,
-- and Asynchronoucs clear, for use in 
-- Transmit and receive state machines



library ieee;
use ieee.std_logic_1164.all;

entity shift is
  GENERIC(WIDTH: positive:= 10);
   port(C, SI, Clear : in std_logic;
        PO : out std_logic_vector(WIDTH -1 downto 0));
end shift;


architecture archi of shift is
signal tmp: std_logic_vector(PO'HIGH downto 0);
begin
Shifting: 
process (C, Clear)
begin
if(Clear='1') then --implement generic zeroing the tmp signal
   for i in PO'range loop tmp(i) <= '0';end loop;
elsif (C'event and C='1') then
tmp <= tmp(PO'HIGH -2 downto 0)& SI;
end if;
end process Shifting;
PO <= tmp;
end archi;
-----------------------------------------------------------------------