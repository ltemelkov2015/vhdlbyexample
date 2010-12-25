--test bench for encoder2


library ieee;
use ieee.std_logic_1164.all;

Entity encTB is
End encTB;


Architecture tb of encTB is

component enc2

Port(   EncIn:    in   std_logic_vector(7 downto 0);
        EncOut:   out  std_logic_vector(2 downto 0);
        EncCheck: out std_logic);
End component;


-- top level stimulu and response signal
SIGNAL EncIn:  std_logic_vector(7 downto 0):="10001101";
SIGNAL EncOut: std_logic_vector(2 downto 0);
SIGNAL EncCheck: std_logic;


BEGIN

ENCODERUUT: enc2 port map(EncIn, EncOut, EncCheck);

test: PROCESS
BEGIN

  wait for 100 ns; EncIn <="01111101";
  wait for 100 ns; EncIn <="00001010";
  wait for 100 ns; EncIn <="00000000";
wait;


end process test;
end tb;


