-- file: clk_core.vhd
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
-- User entered comments
------------------------------------------------------------------------------
-- None
--
------------------------------------------------------------------------------
-- Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
-- Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
------------------------------------------------------------------------------
-- CLK_OUT1   100.000      0.000    50.000      271.831    271.071
-- CLK_OUT2    96.875      0.000    50.000      273.577    271.071
--
------------------------------------------------------------------------------
-- Input Clock   Input Freq (MHz)   Input Jitter (UI)
------------------------------------------------------------------------------
-- primary         100.000            0.010

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity clk_core is
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
end clk_core;

architecture xilinx of clk_core is
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of xilinx : architecture is "clk_core,clk_wiz_v1_5,{component_name=clk_core,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=MMCM_ADV,num_out_clk=2,clkin1_period=10.0,clkin2_period=10.0,use_power_down=false}";
  -- Input clock buffering / unused connectors
  signal clkin1      : std_logic;
  -- Output clock buffering / unused connectors
  signal clkfbout         : std_logic;
  signal clkfbout_buf     : std_logic;
  signal clkfboutb_unused : std_logic;
  signal clkout0          : std_logic;
  signal clkout0b_unused  : std_logic;
  signal clkout1          : std_logic;
  signal clkout1b_unused  : std_logic;
  signal clkout2_unused   : std_logic;
  signal clkout2b_unused  : std_logic;
  signal clkout3_unused   : std_logic;
  signal clkout3b_unused  : std_logic;
  signal clkout4_unused   : std_logic;
  signal clkout5_unused   : std_logic;
  signal clkout6_unused   : std_logic;
  -- Dynamic programming unused signals
  signal do_unused        : std_logic_vector(15 downto 0);
  signal drdy_unused      : std_logic;
  -- Dynamic phase shift unused signals
  signal psdone_unused    : std_logic;
  -- Unused status signals
  signal clkfbstopped_unused : std_logic;
  signal clkinstopped_unused : std_logic;
begin


  -- Input buffering
  --------------------------------------
  clkin1_buf : IBUFG
  port map
   (O => clkin1,
    I => CLK_IN1);


  -- Clocking primitive
  --------------------------------------
  -- Instantiation of the MMCM primitive
  --    * Unused inputs are tied off
  --    * Unused outputs are labeled unused

  mmcm_adv_inst : MMCM_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLKOUT4_CASCADE      => FALSE,
    CLOCK_HOLD           => FALSE,
    COMPENSATION         => "ZHOLD",
    STARTUP_WAIT         => FALSE,
    DIVCLK_DIVIDE        => 4,
    CLKFBOUT_MULT_F      => 31.000,
    CLKFBOUT_PHASE       => 0.000,
    CLKFBOUT_USE_FINE_PS => FALSE,
    CLKOUT0_DIVIDE_F     => 7.750,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKOUT0_USE_FINE_PS  => FALSE,
    CLKOUT1_DIVIDE       => 8,
    CLKOUT1_PHASE        => 0.000,
    CLKOUT1_DUTY_CYCLE   => 0.500,
    CLKOUT1_USE_FINE_PS  => FALSE,
    CLKIN1_PERIOD        => 10.0,
    REF_JITTER1          => 0.010)
  port map
    -- Output clocks
   (CLKFBOUT            => clkfbout,
    CLKFBOUTB           => clkfboutb_unused,
    CLKOUT0             => clkout0,
    CLKOUT0B            => clkout0b_unused,
    CLKOUT1             => clkout1,
    CLKOUT1B            => clkout1b_unused,
    CLKOUT2             => clkout2_unused,
    CLKOUT2B            => clkout2b_unused,
    CLKOUT3             => clkout3_unused,
    CLKOUT3B            => clkout3b_unused,
    CLKOUT4             => clkout4_unused,
    CLKOUT5             => clkout5_unused,
    CLKOUT6             => clkout6_unused,
    -- Input clock control
    CLKFBIN             => clkfbout_buf,
    CLKIN1              => clkin1,
    CLKIN2              => '0',
    -- Tied to always select the primary input clock
    CLKINSEL            => '1',
    -- Ports for dynamic reconfiguration
    DADDR               => (others => '0'),
    DCLK                => '0',
    DEN                 => '0',
    DI                  => (others => '0'),
    DO                  => do_unused,
    DRDY                => drdy_unused,
    DWE                 => '0',
    -- Ports for dynamic phase shift
    PSCLK               => '0',
    PSEN                => '0',
    PSINCDEC            => '0',
    PSDONE              => psdone_unused,
    -- Other control and status signals
    LOCKED              => LOCKED,
    CLKINSTOPPED        => clkinstopped_unused,
    CLKFBSTOPPED        => clkfbstopped_unused,
    PWRDWN              => '0',
    RST                 => RESET);

  -- Output buffering
  -------------------------------------
  clkf_buf : BUFG
  port map
   (O => clkfbout_buf,
    I => clkfbout);


  clkout1_buf : BUFG
  port map
   (O   => CLK_OUT1,
    I   => clkout0);

  clkout2_buf : BUFG
  port map
   (O   => CLK_OUT2,
    I   => clkout1);
end xilinx;
