library ieee;
use ieee.std_logic_1164.all;

entity disp_mux_test is
end disp_mux_test;

architecture tb of disp_mux_test is

signal C: std_logic:='1';
signal RST: std_logic:='1';
signal inp0: std_logic_vector(7 downto 0):="01010101";
signal inp1: std_logic_vector(7 downto 0):="00011111";
signal inp2: std_logic_vector(7 downto 0):="00000001";
signal inp3: std_logic_vector(7 downto 0):="11100000";
signal enbl: std_logic_vector(3 downto 0);
signal seg:  std_logic_vector(7 downto 0);



begin
  led_mux: entity work.disp_mux(arch) 
    port map(
              clk=>C,
              reset=>RST,
              in0=>inp0,
              in1=>inp1,
              in2=>inp2,
              in3=>inp3,
              an=>enbl,
              sseg=>seg
              );
              
  C<=not C after 10 ns;
  reset_cntl:
  process
    begin
      wait for 45 ns;
      RST<='0';
      wait;
  end process reset_cntl;
end tb;
              