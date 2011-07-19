# file: wave.sv
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

#
# Get the windows set up
#
if {[catch {window new WatchList -name "Design Browser 1" -geometry 1054x819+536+322}] != ""} {
    window geometry "Design Browser 1" 1054x819+536+322
}
window target "Design Browser 1" on
browser using {Design Browser 1}
browser set \
    -scope nc::clk_core_tb
browser yview see nc::clk_core_tb
browser timecontrol set -lock 0

if {[catch {window new WaveWindow -name "Waveform 1" -geometry 1010x600+0+541}] != ""} {
    window geometry "Waveform 1" 1010x600+0+541
}
window target "Waveform 1" on
waveform using {Waveform 1}
waveform sidebar visibility partial
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units ns \
    -valuewidth 75
cursor set -using TimeA -time 0
waveform baseline set -time 0
waveform xview limits 0 20000n

#
# Define signal groups
#
catch {group new -name {Output clocks} -overlay 0}
catch {group new -name {Status/control} -overlay 0}
catch {group new -name {Counters} -overlay 0}

set id [waveform add -signals [list {nc::clk_core_tb.CLK_IN1}]]

group using {Output clocks}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
    {clk_core_tb.dut.clk[1]} \
    {clk_core_tb.dut.clk[2]} 
group using {Counters}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
    {clk_core_tb.dut.counter[1]} \
    {clk_core_tb.dut.counter[2]} 
group using {Status/control}
group set -overlay 0
group set -comment {}
group clear 0 end

group insert \
   {nc::clk_core_tb.RESET}    {nc::clk_core_tb.LOCKED}


set id [waveform add -signals [list {nc::clk_core_tb.COUNT} ]]

set id [waveform add -signals [list {nc::clk_core_tb.test_phase} ]]
waveform format $id -radix %a

set groupId [waveform add -groups {{Input clocks}}]
set groupId [waveform add -groups {{Output clocks}}]
set groupId [waveform add -groups {{Status/control}}]
set groupId [waveform add -groups {{Counters}}]
