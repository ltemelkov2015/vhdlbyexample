library ieee;
use ieee.std_logic_1164.all;


entity stop_watch_test is
end stop_watch_test;

architecture arch of stop_watch_test is
signal clock: std_logic:='1';
signal enbl: std_logic:='1';
signal clear: std_logic:='1';
signal digit2, digit1, digit0: std_logic_vector(3 downto 0);

begin
watch_unit: entity work.stop_watch(cascade_arch)
   port map(
            clk=>clock,
            go=>enbl,
            clr=>clear,
            d2=>digit2,
            d1=>digit1,
            d0=>digit0
            );

  
control_clear: 
process
  begin
    wait for 900 ns;
    enbl<='0';
    wait;
end process control_clear;

clock <= not clock after 5 ns;
        
end arch;


