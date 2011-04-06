-- test bench for ram.vhd

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
entity ram_TB is
  GENERIC ( bits: INTEGER := 8; -- # of bits per word
           words: INTEGER := 4); -- # of words in the memory
end ram_TB;

------------------------------------------------------------

architecture test of ram_TB is

--- componrnt declaration ----------------------------------
 component ram
   PORT (   wr_ena, clk: IN STD_LOGIC;
            addr: IN INTEGER RANGE 0 TO words-1;
            data_in: IN STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
            data_out: OUT STD_LOGIC_VECTOR (bits-1 DOWNTO 0));
   end component;
   
--------------------------------------------------------------

signal t_we:          std_logic:='1';
signal t_clock:       std_logic:='0';
signal t_address:     integer range 0 to words-1;
signal t_data_in:     std_logic_vector(bits-1 downto 0);
signal t_data_out:    std_logic_vector(bits-1 downto 0);

--------------------------------------------------------------
   
   
begin
  UUT: ram port map(t_we, t_clock, t_address, t_data_in, t_data_out);
  t_clock <= not t_clock after 25 ns;
  
we:process
   begin
       t_we <='1';
       wait for 275 ns;
       t_we <='0';
       wait; --forever
  end process we; 
  
addr_and_data:process
              begin
              t_address <= 0;
              t_data_in <="00000000";
              wait for 47 ns;
              t_address  <= 1;
              t_data_in <="00000001";
              wait for 47 ns;
              t_address  <= 2;
              t_data_in <="00000010";
              wait for 47 ns;
              t_address  <= 3;
              t_data_in <="00000011";
              --wait for 50 ns;
              --t_address  <= 4;
              --t_data_in <="00000100";
              wait for 200 ns;
              t_address <= 2;
              wait;
            end process;
          
         
          
          end test;
               
   