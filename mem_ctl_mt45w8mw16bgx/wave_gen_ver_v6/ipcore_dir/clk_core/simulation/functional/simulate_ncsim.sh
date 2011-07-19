#/bin/sh
# file: simulate_ncsim.sh
#
# DISCLAIMER OF LIABILITY
#
# This file contains proprietary and confidential information of
# Xilinx, Inc. ("Xilinx"), that is distributed under a license
# from Xilinx, and may be used, copied and/or disclosed only
# pursuant to the terms of a valid license agreement with Xilinx.
#
# XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
# ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
# EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
# LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
# MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
# does not warrant that functions included in the Materials will
# meet the requirements of Licensee, or that the operation of the
# Materials will be uninterrupted or error-free, or that defects
# in the Materials will be corrected. Furthermore, Xilinx does
# not warrant or make any representations regarding use, or the
# results of the use, of the Materials in terms of correctness,
# accuracy, reliability or otherwise.
#
# Xilinx products are not designed or intended to be fail-safe,
# or for use in any application requiring fail-safe performance,
# such as life-support or safety devices or systems, Class III
# medical devices, nuclear facilities, applications related to
# the deployment of airbags, or any other applications that could
# lead to death, personal injury or severe property or
# environmental damage (individually and collectively, "critical
# applications"). Customer assumes the sole risk and liability
# of any use of Xilinx products in critical applications,
# subject only to applicable laws and regulations governing
# limitations on product liability.
#
# Copyright 2008, 2009 Xilinx, Inc.
# All rights reserved.
#
# This disclaimer and copyright notice must be retained as part
# of this file at all times.
#

# set up the working directory
mkdir work

# compile all of the files
ncvlog -work work ${XILINX}/verilog/src/glbl.v
ncvlog -work work ../../../clk_core.v
ncvlog -work work ../../example_design/clk_core_exdes.v
ncvlog -work work ../clk_core_tb.v

# elaborate and run the simulation
ncelab -work work -access +wc work.clk_core_tb work.glbl
ncsim -input  "@database -open -shm nc; probe -create -database nc -all -depth all; probe dut.counter; run 50000ns; exit" work.clk_core_tb
