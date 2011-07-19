-- file: clk_core_tb.vhd
--
-- DISCLAIMER OF LIABILITY
--
-- This file contains proprietary and confidential information of
-- Xilinx, Inc. ("Xilinx"), that is distributed under a license
-- from Xilinx, and may be used, copied and/or disclosed only
-- pursuant to the terms of a valid license agreement with Xilinx.
--
-- XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
-- ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-- EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
-- LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
-- MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
-- does not warrant that functions included in the Materials will
-- meet the requirements of Licensee, or that the operation of the
-- Materials will be uninterrupted or error-free, or that defects
-- in the Materials will be corrected. Furthermore, Xilinx does
-- not warrant or make any representations regarding use, or the
-- results of the use, of the Materials in terms of correctness,
-- accuracy, reliability or otherwise.
--
-- Xilinx products are not designed or intended to be fail-safe,
-- or for use in any application requiring fail-safe performance,
-- such as life-support or safety devices or systems, Class III
-- medical devices, nuclear facilities, applications related to
-- the deployment of airbags, or any other applications that could
-- lead to death, personal injury or severe property or
-- environmental damage (individually and collectively, "critical
-- applications"). Customer assumes the sole risk and liability
-- of any use of Xilinx products in critical applications,
-- subject only to applicable laws and regulations governing
-- limitations on product liability.
--
-- Copyright 2008, 2009 Xilinx, Inc.
-- All rights reserved.
--
-- This disclaimer and copyright notice must be retained as part
-- of this file at all times.
--

------------------------------------------------------------------------------
-- Clocking wizard demonstration testbench
------------------------------------------------------------------------------
-- This demonstration testbench instantiates the example design for the 
--   clocking wizard. Input clocks are toggled, which cause the clocking
--   network to lock and the counters to increment.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.all;

entity clk_core_tb is
end clk_core_tb;

architecture test of clk_core_tb is

  -- Clock to Q delay of 100 ps
  constant TCQ         : time := 100 ps;
  -- timescale is 1ps
  constant ONE_NS      : time := 1 ns;
  -- how many cycles to run
  constant COUNT_PHASE : integer := 1024 + 1;


  -- we'll be using the period in many locations
  constant PER1        : time := 10.0 ns;


  -- Declare the input clock signals
  signal CLK_IN1       : std_logic := '1';
  -- The high bits of the sampling counters
  signal COUNT         : std_logic_vector(2 downto 1);
  -- Status and control signals
  signal RESET         : std_logic := '0';
  signal LOCKED        : std_logic;
  signal COUNTER_RESET : std_logic := '0';

component clk_core_exdes
generic (TCQ        : in  time := 100 ps);
port
 (-- Clock in ports
  CLK_IN1           : in  std_logic;
  -- Reset that only drives logic in example design
  COUNTER_RESET     : in  std_logic;
  -- High bits of counters driven by clocks
  COUNT             : out std_logic_vector(2 downto 1);
  -- Status and control signals
  RESET             : in  std_logic;
  LOCKED            : out std_logic
 );
end component;

begin

  -- Input clock generation
  --------------------------------------
  process begin
    CLK_IN1 <= not CLK_IN1; wait for (PER1/2);
  end process;

  -- Test sequence
  process begin
    RESET      <= '1';
    wait for (PER1*6);
    RESET      <= '0';
    wait until LOCKED = '1';
    wait for (PER1*COUNT_PHASE);

    report "Simulation Stopped." severity failure;
    wait;
  end process;

  -- Instantiation of the example design containing the clock
  --    network and sampling counters
  -----------------------------------------------------------
  dut : clk_core_exdes
  generic map
   (TCQ                => TCQ)
  port map
   (-- Clock in ports
    CLK_IN1            => CLK_IN1,
    -- Reset for logic in example design
    COUNTER_RESET      => COUNTER_RESET,
    -- High bits of the counters
    COUNT              => COUNT,
    -- Status and control signals
    RESET              => RESET,
    LOCKED             => LOCKED);

end test;
