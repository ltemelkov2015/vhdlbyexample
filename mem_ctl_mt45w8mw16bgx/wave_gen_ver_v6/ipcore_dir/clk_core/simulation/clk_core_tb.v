// file: clk_core_tb.v
//
// DISCLAIMER OF LIABILITY
//
// This file contains proprietary and confidential information of
// Xilinx, Inc. ("Xilinx"), that is distributed under a license
// from Xilinx, and may be used, copied and/or disclosed only
// pursuant to the terms of a valid license agreement with Xilinx.
//
// XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
// ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
// EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
// LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
// MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
// does not warrant that functions included in the Materials will
// meet the requirements of Licensee, or that the operation of the
// Materials will be uninterrupted or error-free, or that defects
// in the Materials will be corrected. Furthermore, Xilinx does
// not warrant or make any representations regarding use, or the
// results of the use, of the Materials in terms of correctness,
// accuracy, reliability or otherwise.
//
// Xilinx products are not designed or intended to be fail-safe,
// or for use in any application requiring fail-safe performance,
// such as life-support or safety devices or systems, Class III
// medical devices, nuclear facilities, applications related to
// the deployment of airbags, or any other applications that could
// lead to death, personal injury or severe property or
// environmental damage (individually and collectively, "critical
// applications"). Customer assumes the sole risk and liability
// of any use of Xilinx products in critical applications,
// subject only to applicable laws and regulations governing
// limitations on product liability.
//
// Copyright 2008, 2009 Xilinx, Inc.
// All rights reserved.
//
// This disclaimer and copyright notice must be retained as part
// of this file at all times.
//

//----------------------------------------------------------------------------
// Clocking wizard demonstration testbench
//----------------------------------------------------------------------------
// This demonstration testbench instantiates the example design for the 
//   clocking wizard. Input clocks are toggled, which cause the clocking
//   network to lock and the counters to increment.
//----------------------------------------------------------------------------

`timescale 1ps/1ps

`define wait_lock @(posedge LOCKED)

module clk_core_tb ();

  // Clock to Q delay of 100ps
  localparam  TCQ         = 100;
  // timescale is 1ps/1ps
  localparam  ONE_NS      = 1000;
  localparam  PHASE_ERR_MARGIN   = 100; // 100ps
  // how many cycles to run
  localparam  COUNT_PHASE = 1024;
  // we'll be using the period in many locations
  localparam time PER1    = 10.0*ONE_NS;
  localparam time PER1_1  = PER1/2;
  localparam time PER1_2  = PER1 - PER1/2;

  // Declare the input clock signals
  reg         CLK_IN1     = 1;

  // The high bits of the sampling counters
  wire [2:1]  COUNT;
  // Status and control signals
  reg         RESET      = 0;
  wire        LOCKED;
  reg         COUNTER_RESET = 0;

  // Input clock generation
  //------------------------------------
  always begin
    CLK_IN1 = #PER1_1 ~CLK_IN1;
    CLK_IN1 = #PER1_2 ~CLK_IN1;
  end

  // Test sequence
  reg [15*8-1:0] test_phase = "";
  initial begin
    // Set up any display statements using time to be readable
    $timeformat(-12, 2, "ps", 10);
    COUNTER_RESET = 0;
    test_phase = "reset";
    RESET = 1;
    #(PER1*6);
    RESET = 0;
    test_phase = "wait lock";
    `wait_lock;
    COUNTER_RESET = 1;
    #(PER1*20)
    COUNTER_RESET = 0;

    test_phase = "counting";
    #(PER1*COUNT_PHASE);
    $display("SIMULATION PASSED");
    $finish;
  end

  // Instantiation of the example design containing the clock
  //    network and sampling counters
  //---------------------------------------------------------
  clk_core_exdes #(.TCQ (TCQ)) dut
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Reset for logic in example design
    .COUNTER_RESET      (COUNTER_RESET),
    // High bits of the counters
    .COUNT              (COUNT),
    // Status and control signals
    .RESET              (RESET),
    .LOCKED             (LOCKED));

endmodule
