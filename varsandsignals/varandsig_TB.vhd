--test bench for varandsig.vhd


------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------

ENTITY sigvar_TB IS
END sigvar_TB;

------------------------------------



Architecture TB OF sigvar_TB IS

component Sig
      PORT(input: IN std_logic;
      output: OUT INTEGER RANGE 0 TO 15
      );
END component;

signal inp: STD_LOGIC:='0';
signal otp: INTEGER RANGE 0 to 15;

begin

DUT:Sig
    port map(inp,otp);
    
trigger: process
begin
         wait for 50 ns;
         inp <='1';
         wait;
End process;

End TB;  

