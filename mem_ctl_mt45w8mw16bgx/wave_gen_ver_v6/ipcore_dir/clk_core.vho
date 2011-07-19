-------------------------------------------------------------------------------
-- Copyright (c) 2010 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 1.0
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : clk_core.vho
-- /___/   /\     Timestamp  : Mon Feb 08 10:37:09 Mountain Standard Time 2010
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component clk_core
  PORT (
    CLK_IN1 : IN STD_LOGIC;
    CLK_IN1_P : IN STD_LOGIC;
    CLK_IN1_N : IN STD_LOGIC;
    CLK_IN2 : IN STD_LOGIC;
    CLK_IN2_P : IN STD_LOGIC;
    CLK_IN2_N : IN STD_LOGIC;
    CLK_FB_IN : IN STD_LOGIC;
    CLK_FB_IN_P : IN STD_LOGIC;
    CLK_FB_IN_N : IN STD_LOGIC;
    DADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    DCLK : IN STD_LOGIC;
    DEN : IN STD_LOGIC;
    DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    DOUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    DRDY : IN STD_LOGIC;
    DWE : IN STD_LOGIC;
    PROGCLK : IN STD_LOGIC;
    PROGDATA : IN STD_LOGIC;
    PROGEN : IN STD_LOGIC;
    PROGDONE : OUT STD_LOGIC;
    PSCLK : IN STD_LOGIC;
    PSEN : IN STD_LOGIC;
    PSINCDEC : IN STD_LOGIC;
    PSDONE : OUT STD_LOGIC;
    CLK_OUT1 : OUT STD_LOGIC;
    CLK_OUT2 : OUT STD_LOGIC;
    CLK_OUT3 : OUT STD_LOGIC;
    CLK_OUT4 : OUT STD_LOGIC;
    CLK_OUT5 : OUT STD_LOGIC;
    CLK_OUT6 : OUT STD_LOGIC;
    CLK_OUT7 : OUT STD_LOGIC;
    CLKFB_OUT : OUT STD_LOGIC;
    RESET : IN STD_LOGIC;
    POWER_DOWN : IN STD_LOGIC;
    FREEZE : IN STD_LOGIC;
    INPUT_CLK_STOPPED : OUT STD_LOGIC;
    LOCKED : OUT STD_LOGIC;
    STATUS : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));

end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of clk_core: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : clk_core
  port map (
    CLK_IN1 => CLK_IN1,
    CLK_IN1_P => CLK_IN1_P,
    CLK_IN1_N => CLK_IN1_N,
    CLK_IN2 => CLK_IN2,
    CLK_IN2_P => CLK_IN2_P,
    CLK_IN2_N => CLK_IN2_N,
    CLK_FB_IN => CLK_FB_IN,
    CLK_FB_IN_P => CLK_FB_IN_P,
    CLK_FB_IN_N => CLK_FB_IN_N,
    DADDR => DADDR,
    DCLK => DCLK,
    DEN => DEN,
    DIN => DIN,
    DOUT => DOUT,
    DRDY => DRDY,
    DWE => DWE,
    PROGCLK => PROGCLK,
    PROGDATA => PROGDATA,
    PROGEN => PROGEN,
    PROGDONE => PROGDONE,
    PSCLK => PSCLK,
    PSEN => PSEN,
    PSINCDEC => PSINCDEC,
    PSDONE => PSDONE,
    CLK_OUT1 => CLK_OUT1,
    CLK_OUT2 => CLK_OUT2,
    CLK_OUT3 => CLK_OUT3,
    CLK_OUT4 => CLK_OUT4,
    CLK_OUT5 => CLK_OUT5,
    CLK_OUT6 => CLK_OUT6,
    CLK_OUT7 => CLK_OUT7,
    CLKFB_OUT => CLKFB_OUT,
    RESET => RESET,
    POWER_DOWN => POWER_DOWN,
    FREEZE => FREEZE,
    INPUT_CLK_STOPPED => INPUT_CLK_STOPPED,
    LOCKED => LOCKED,
    STATUS => STATUS);

-- INST_TAG_END ------ End INSTANTIATION Template ------------
