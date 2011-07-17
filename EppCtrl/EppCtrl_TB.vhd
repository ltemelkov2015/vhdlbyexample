library ieee;
use ieee.std_logic_1164.all;

entity EppCtrl_TB is
end EppCtrl_TB;


architecture tb of EppCtrl_TB is

--signal reset:std_logic;
signal clock : std_logic:='1';
signal dbus:  std_logic_vector(7 downto 0);
signal Led: std_logic_vector( 7 downto 0);
signal addrstb: std_logic;
signal datastb:std_logic;
signal write: std_logic;
signal bwait: std_logic;



begin
  UUT: --entity work.EppCtrl(arch)
       entity work.dpimref(Behavioral)
       --entity work.EppCtrl(archi) 
       port map(
                mclk=>clock,
                --reset=>reset,
                pdb=>dbus,
                astb=>addrstb,
                dstb=>datastb,
                pwr=>write,
                pwait=>bwait,
                rgLed=>open,
                rgSwt=>"11111111",
                rgBtn=>"0000"
                );
                

                
clock <= not clock after 20 ns;


--process
--  begin
--    reset <= '1';
--    wait for 54 ns;
--    reset <='0';
--    wait;
--end process;

process
  begin
    -- write an address register
    dbus<="00000011";
    datastb <='1';
    write <='1';
    addrstb <='1';
    wait for 10 ns;
    write <= '0';
    wait for 40 ns;
    addrstb <='0';
    wait for 130 ns;
    addrstb <='1';
    wait for 15 ns;
    write <='1';
    --------  write a data register
    wait for 35 ns;
    dbus<="00000101";
    write <='0';
    wait for 24 ns;
    datastb <='0';
    wait for 130 ns;
    datastb<='1';
    wait for 10 ns;
    write<='1';
    
    ------- read a data register
    wait for 32 ns;
    dbus<=(others=>'Z');
    wait for 98 ns;
    datastb <='0';
    wait for 135 ns;
    datastb <='1';
    
    
    --- read the address register
    wait for 158 ns;
    addrstb <='0';
    wait for 134 ns;
    addrstb <='1';
    wait;
    
    
    
end process;
end tb;

