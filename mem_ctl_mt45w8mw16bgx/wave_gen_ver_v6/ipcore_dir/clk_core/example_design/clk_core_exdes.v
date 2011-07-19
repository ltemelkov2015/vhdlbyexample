// file: clk_core_exdes.v
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
// Clocking wizard example design
//----------------------------------------------------------------------------
// This example design instantiates the created clocking network, where each
//   output clock drives a counter. The high bit of each counter is ported.
//----------------------------------------------------------------------------

`timescale 1ps/1ps

module clk_core_exdes #(parameter TCQ = 100)
 (// Clock in ports
  input         CLK_IN1,
  // Reset that only drives logic in example design
  input         COUNTER_RESET,
  // High bits of counters driven by clocks
  output [2:1]  COUNT,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );

  // Parameters for the counters
  //-------------------------------
  // Counter width
  localparam    C_W       = 16;
  // Number of counters
  localparam    NUM_C     = 2;
  genvar        count_gen;
  // When the clock goes out of lock, reset the counters
  wire          reset_int = !LOCKED || RESET || COUNTER_RESET;

  // Declare the clocks and counters
  wire [NUM_C:1] clk_int;
  wire [NUM_C:1] clk;
  reg [C_W-1:0]  counter [NUM_C:1];

  // Instantiation of the clocking network
  //--------------------------------------
  clk_core clknetwork
   (// Clock in ports
    .CLK_IN1            (CLK_IN1),
    // Clock out ports
    .CLK_OUT1           (clk_int[1]),
    .CLK_OUT2           (clk_int[2]),
    // Status and control signals
    .RESET              (RESET),
    .LOCKED             (LOCKED));

  // Connect the output clocks to the design
  //-----------------------------------------
  assign clk[1] = clk_int[1];
  assign clk[2] = clk_int[2];

  // Output clock sampling
  //-----------------------------------
  generate for (count_gen = 1; count_gen <= NUM_C; count_gen = count_gen + 1) begin: counters

    always @(posedge clk[count_gen]) begin
      if (reset_int) begin
        counter[count_gen] <= #TCQ { C_W { 1'b 0 } };
      end else begin
        counter[count_gen] <= #TCQ counter[count_gen] + 1'b 1;
      end
    end
    // alias the high bit of each counter to the corresponding
    //   bit in the output bus
    assign COUNT[count_gen] = counter[count_gen][C_W-1];
  end
  endgenerate



endmodule
