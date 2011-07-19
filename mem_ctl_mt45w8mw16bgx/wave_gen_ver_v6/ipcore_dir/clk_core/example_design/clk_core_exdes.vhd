-- file: clk_core_exdes.vhd
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
-- Clocking wizard example design
------------------------------------------------------------------------------
-- This example design instantiates the created clocking network, where each
--   output clock drives a counter. The high bit of each counter is ported.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity clk_core_exdes is
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
end clk_core_exdes;

architecture xilinx of clk_core_exdes is

  -- Parameters for the counters
  ---------------------------------
  -- Counter width
  constant C_W        : integer := 16;

  -- Number of counters
  constant NUM_C      : integer := 2;
  -- Array typedef
  type ctrarr is array (1 to NUM_C) of std_logic_vector(C_W-1 downto 0);

  -- When the clock goes out of lock, reset the counters
  signal   locked_int : std_logic;
  signal   reset_int  : std_logic                     := '0';
  -- Declare the clocks and counters
  signal   clk        : std_logic_vector(NUM_C downto 1);
  signal   clk_int    : std_logic_vector(NUM_C downto 1);
  signal   counter    : ctrarr := (( others => (others => '0')));

component clk_core is
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

begin
  -- Alias output to internally used signal
  LOCKED    <= locked_int;

  -- When the clock goes out of lock, reset the counters
  reset_int <= (not locked_int) or RESET or COUNTER_RESET;

  -- Instantiation of the clocking network
  ----------------------------------------
  clknetwork : clk_core
  port map
   (-- Clock in ports
    CLK_IN1            => CLK_IN1,
    -- Clock out ports
    CLK_OUT1           => clk_int(1),
    CLK_OUT2           => clk_int(2),
    -- Status and control signals
    RESET              => RESET,
    LOCKED             => locked_int);


  -- Connect the output clocks to the design
  -------------------------------------------
  clk(1) <= clk_int(1);
  clk(2) <= clk_int(2);

  -- Output clock sampling
  -------------------------------------
  counters: for count_gen in 1 to NUM_C generate begin
    process (clk(count_gen)) begin
      if (rising_edge(clk(count_gen))) then
        if (reset_int = '1') then
          counter(count_gen) <= (others => '0') after TCQ;
        else
          counter(count_gen) <= counter(count_gen) + 1 after TCQ;
        end if;
      end if;
    end process;

    -- alias the high bit of each counter to the corresponding
    --   bit in the output bus
    COUNT(count_gen) <= counter(count_gen)(C_W-1);

  end generate counters;


end xilinx;
