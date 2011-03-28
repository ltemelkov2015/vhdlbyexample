-- this example is from the book "Rapid Prototyping of Digital System
-- scomp.vhd creates a simple microprocessor with a state machine

-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


--- custom megafunction ALTERA library----------
library lpm;
use lpm.lpm_components.all;
------------------------------------------------  


-------------- TOP ENTITY ----------------------
entity scomp is
 port(clock, reset                :IN STD_LOGIC;
      program_counter_out         :OUT STD_LOGIC(7 downto 0);
      register_AC_out             :OUT STD_LOGIC(15 downto 0);
      memory_data_register_out    :OUT STD_LOGIC(15 downto 0)); 
end port;
      
-------------------------------------------------



architecture a of scomp is
type state_type(reset_pc, fetch,decode, execute_add, execute_load, execute_store,
           execute_store3, execute_store2, execute_jump);


---- register file -----------------             
signal state:state_type;
signal instruction_register, memory_data_register      :STD_LOGIC(15 downto 0);
signal register_AC                                     :STD_LOGIC(15 downto 0);
signal program_counter                                 :STD_LOGIC(7 downto 0);
signal memory_address_register                         :STD_LOGIC(7 downto 0);
signal memory_write                                    :STD_LOGIC;


-----------------------------------
begin
  memory:lpm_ram_dq
     GENERIC MAP(
            lpm_widthad     =>8; --0-255 locations in memory
            lpm_outdata     =>"UNREGISTERED";      -- no clocking on the output bus
            lpm_indata      =>"REGISTERED" ;       -- indata is via a clocked register
            lpm_address_control =>"UNREGISTERED";  -- address bus no register/clocl/
            --file with the mnemonics instruction code
            lpm_file        =>"program.mif";
            lpm_width       =>16) -- 16 bit words per location
            
     PORT MAP(data=>Register_AC, address=>memory_address_register,
              we=>memory_write, inclock=>clock, q=>memory_data_register);
               
------- some concurent events ----------------------------------------
program_count_out         <=program_counter;
register_AC_out           <=register_AC;
memory_data_register_out  <=memory_data_register;
------- end concurrent events ----------------------------------------

process(clock, reset)
  begin
  if reset='1' then state <=reset_pc;
  elsif(clock'EVENT and clock='1')
      case state is
        when reset_pc =>
             program_counter            <="00000000";
             memory_address_register    <="00000000";
             register_AC                <="0000000000000000"
             memory_write               <='0';
             state                      <=fetch;  -- next state after reset is fetch instruction
             
        when fetch=>
             instruction_register       <=memory_data_register;
             program_counter            <=program_conter+1;
             memory_write               <='0';
             state                      <=decode; -- next state decode the instruction
             
             
        when decode=>
             --place the address part of the instruction onto the MAR to get operands
             memory_address_register<=instruction_register(7 downto 0);
             --decode the opcode
             case instruction_register(15 downto 8) is
                  when "00000000"=>
                      state <=execute_add;
                  when "00000001"=>
                      state <=execute_store;
                  when "00000010"
                      state <=execute_load;
                  when "00000011" =>
                      state  <=execute_jump;
             end case;
             
             
             when execute_add=>  -- Execute ADD instruction
                  register_AC             <=register_AC + memory_data_register; --ACC 
                  memory_address_register <=program_counter;
                  state                   <=fetch; -- done with current instruction, go fetch next
                  
             when execute_store => --execute store into  memory instruction.Needs 3 clk cycles for mem write
                  memory_write      <='1';               --enable MemWR
                  state             <=execute_store2     --and prepare for the second clock mem write cycle
                  
                  
             when execute_store2=> --this state ensures mem address is valid until after memory_write 
                                   -- goes inactive
                  memory_write      <='0';
                  state             <=execute_store3;
                  
             when execute_store3=>
                  memory_address_register   <=program_counter;
                  state                     <=fetch;    
                
      