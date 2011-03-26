dp32_types
xst -intstyle ise -ifn "C:/DP32/DP32CPU/dp32.xst" -ofn "C:/DP32/DP32CPU/dp32.syr" 
xst -intstyle ise -ifn "C:/DP32/DP32CPU/dp32.xst" -ofn "C:/DP32/DP32CPU/dp32.syr" 
dp32_types
work
vhdl dp32_types "dp32_types.vhd"
vhdl work "DP32.vhd"
Release 12.3 - xst M.70d (nt)
Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--> Parameter TMPDIR set to xst/projnav.tmp


Total REAL time to Xst completion: 0.00 secs
Total CPU time to Xst completion: 0.31 secs
 
--> Parameter xsthdpdir set to xst


Total REAL time to Xst completion: 0.00 secs
Total CPU time to Xst completion: 0.31 secs
 
--> Reading design: dp32.prj

TABLE OF CONTENTS
  1) Synthesis Options Summary
  2) HDL Compilation
  3) Design Hierarchy Analysis
  4) HDL Analysis
  5) HDL Synthesis
     5.1) HDL Synthesis Report
  6) Advanced HDL Synthesis
     6.1) Advanced HDL Synthesis Report
  7) Low Level Synthesis
  8) Partition Report
  9) Final Report
	9.1) Device utilization summary
	9.2) Partition Resource Summary
	9.3) TIMING REPORT


=========================================================================
*                      Synthesis Options Summary                        *
=========================================================================
---- Source Parameters
Input File Name                    : "dp32.prj"
Input Format                       : mixed
Ignore Synthesis Constraint File   : NO

---- Target Parameters
Output File Name                   : "dp32"
Output Format                      : NGC
Target Device                      : xc3s100e-4-vq100

---- Source Options
Top Module Name                    : dp32
Automatic FSM Extraction           : YES
FSM Encoding Algorithm             : Auto
Safe Implementation                : No
FSM Style                          : LUT
RAM Extraction                     : Yes
RAM Style                          : Auto
ROM Extraction                     : Yes
Mux Style                          : Auto
Decoder Extraction                 : YES
Priority Encoder Extraction        : Yes
Shift Register Extraction          : YES
Logical Shifter Extraction         : YES
XOR Collapsing                     : YES
ROM Style                          : Auto
Mux Extraction                     : Yes
Resource Sharing                   : YES
Asynchronous To Synchronous        : NO
Multiplier Style                   : Auto
Automatic Register Balancing       : No

---- Target Options
Add IO Buffers                     : YES
Global Maximum Fanout              : 500
Add Generic Clock Buffer(BUFG)     : 24
Register Duplication               : YES
Slice Packing                      : YES
Optimize Instantiated Primitives   : NO
Use Clock Enable                   : Yes
Use Synchronous Set                : Yes
Use Synchronous Reset              : Yes
Pack IO Registers into IOBs        : Auto
Equivalent register Removal        : YES

---- General Options
Optimization Goal                  : Speed
Optimization Effort                : 1
Keep Hierarchy                     : No
Netlist Hierarchy                  : As_Optimized
RTL Output                         : Yes
Global Optimization                : AllClockNets
Read Cores                         : YES
Write Timing Constraints           : NO
Cross Clock Analysis               : NO
Hierarchy Separator                : /
Bus Delimiter                      : <>
Case Specifier                     : Maintain
Slice Utilization Ratio            : 100
BRAM Utilization Ratio             : 100
Verilog 2001                       : YES
Auto BRAM Packing                  : NO
Slice Utilization Ratio Delta      : 5

=========================================================================


=========================================================================
*                          HDL Compilation                              *
=========================================================================
Compiling vhdl file "C:/DP32/DP32CPU/dp32_types.vhd" in Library dp32_types.
Architecture dp32_types of Entity dp32_types is up to date.
Compiling vhdl file "C:/DP32/DP32CPU/DP32.vhd" in Library work.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 11. Undefined symbol 'unit_delay'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 11. unit_delay: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 12. Undefined symbol 'bus_bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 12. bus_bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 13. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 13. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3010 - "C:/DP32/DP32CPU/DP32.vhd" Line 23. Entity dp32 does not exist.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 26. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 26. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 32. Undefined symbol 'reg_array'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 32. reg_array: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 35. Undefined symbol 'bit_8'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 35. bit_8: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 38. Undefined symbol 'current_instr'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 38. current_instr: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 62. Undefined symbol 'a_bus'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 62. Undefined symbol 'addr'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 62. addr: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 62. Undefined symbol 'Tpd'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 62. Tpd: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 63. Undefined symbol 'fetch'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 63. Undefined symbol 'bool_to_bit'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 63. bool_to_bit: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 64. Undefined symbol 'phi1'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 64. phi1: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 65. Undefined symbol 'reset'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 65. reset: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 71. Undefined symbol 'read'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 80. Undefined symbol 'phi2'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 80. phi2: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 85. Undefined symbol 'ready'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 85. ready: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 86. Undefined symbol 'result'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 86. Undefined symbol 'd_bus'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 86. d_bus: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 90. Undefined symbol 'phi1'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 90. phi1: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 91. Undefined symbol 'reset'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 91. reset: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 97. Undefined symbol 'read'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 97. Undefined symbol 'Tpd'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 97. Tpd: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 104. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 104. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 108. Undefined symbol 'a_bus'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 108. Undefined symbol 'addr'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 108. addr: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 108. Undefined symbol 'Tpd'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 108. Tpd: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 109. Undefined symbol 'fetch'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 110. Undefined symbol 'phi1'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 110. phi1: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 111. Undefined symbol 'reset'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 111. reset: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 117. Undefined symbol 'write'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 118. Undefined symbol 'phi2'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 118. phi2: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 119. Undefined symbol 'd_bus'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 119. Undefined symbol 'data'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 119. data: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 133. Undefined symbol 'ready'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 133. ready: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 135. Undefined symbol 'phi1'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 135. phi1: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 136. Undefined symbol 'reset'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 136. reset: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 142. Undefined symbol 'write'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 142. Undefined symbol 'Tpd'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 142. Tpd: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 143. Undefined symbol 'd_bus'.
ERROR:HDLParsers:3448 - "C:/DP32/DP32CPU/DP32.vhd" Line 143. null waveform element is not supported.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 148. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 148. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 151. Undefined symbol 'int_to_bits'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 151. int_to_bits: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 151. Undefined symbol 'result'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 151. result: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 161. Undefined symbol 'bool_to_bit'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 161. bool_to_bit: Undefined symbol (last report in this block)
ERROR:HDLParsers:164 - "C:/DP32/DP32CPU/DP32.vhd" Line 161. parse error, unexpected MINUS
ERROR:HDLParsers:164 - "C:/DP32/DP32CPU/DP32.vhd" Line 173. parse error, unexpected ELSIF, expecting END
ERROR:HDLParsers:164 - "C:/DP32/DP32CPU/DP32.vhd" Line 176. parse error, unexpected ELSE, expecting END
ERROR:HDLParsers:164 - "C:/DP32/DP32CPU/DP32.vhd" Line 179. parse error, unexpected IF, expecting SEMICOLON
ERROR:HDLParsers:3011 - "C:/DP32/DP32CPU/DP32.vhd" Line 182. End Identifier subtract does not match declaration, add.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 187. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 187. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 193. Undefined symbol 'int_to_bits'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 193. int_to_bits: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 193. Undefined symbol 'result'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 193. result: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 204. Undefined symbol 'bool_to_bit'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 204. bool_to_bit: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 211. Undefined symbol 'bit_32'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 211. bit_32: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 217. Undefined symbol 'int_to_bits'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 217. int_to_bits: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 217. Undefined symbol 'result'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 217. result: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 227. Undefined symbol 'bool_to_bit'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 227. bool_to_bit: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 236. Undefined symbol 'reset'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 236. reset: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 237. Undefined symbol 'read'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 237. Undefined symbol 'Tpd'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 237. Tpd: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 238. Undefined symbol 'write'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 239. Undefined symbol 'fetch'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 240. Undefined symbol 'd_bus'.
ERROR:HDLParsers:3448 - "C:/DP32/DP32CPU/DP32.vhd" Line 240. null waveform element is not supported.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 241. Undefined symbol 'PC'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 247. PC: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 247. Undefined symbol 'current_instr'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 247. current_instr: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 249. Undefined symbol 'bits_to_int'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 249. bits_to_int: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 249. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 253. Undefined symbol 'op'.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 254. Undefined symbol 'bits_to_natural'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 254. bits_to_natural: Undefined symbol (last report in this block)
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 258. op: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 259. Undefined symbol 'op_add'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 259. op_add: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 260. Undefined symbol 'reg'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 260. reg: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 260. Formal parameter N of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 262. Undefined symbol 'op_addq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 262. op_addq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 263. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 264. Undefined symbol 'op_sub'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 264. op_sub: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 265. Undefined symbol 'subtract'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 265. subtract: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 267. Undefined symbol 'op_subq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 267. op_subq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 269. Undefined symbol 'op_mul'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 269. op_mul: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 270. Formal parameter N of procedure multiply must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 272. Undefined symbol 'op_mulq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 272. op_mulq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 273. Formal parameter Z of procedure multiply must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 274. Undefined symbol 'op_div'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 274. op_div: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 275. Formal parameter N of procedure divide must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 277. Undefined symbol 'op_divq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 277. op_divq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 278. Formal parameter Z of procedure divide must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 279. Undefined symbol 'op_land'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 279. op_land: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 281. Undefined symbol 'bool_to_bit'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 281. bool_to_bit: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 282. Undefined symbol 'op_lor'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 282. op_lor: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 285. Undefined symbol 'op_lxor'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 285. op_lxor: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 288. Undefined symbol 'op_lmask'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 288. op_lmask: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 291. Undefined symbol 'op_ld'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 291. op_ld: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 292. Undefined symbol 'displacement'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 292. displacement: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 294. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 295. Undefined symbol 'effective_addr'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 295. effective_addr: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 295. Formal parameter N of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 300. Undefined symbol 'op_ldq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 300. op_ldq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 301. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 305. Undefined symbol 'op_st'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 305. op_st: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 308. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 309. Formal parameter N of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 315. Undefined symbol 'op_stq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 315. op_stq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 316. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 320. Undefined symbol 'op_br'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 320. op_br: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 323. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 324. Formal parameter N of procedure add must be associated with an actual value.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 327. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 327. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 327. and can not have such operands in this context.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 328. Undefined symbol 'cm_i'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 328. cm_i: Undefined symbol (last report in this block)
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 332. Undefined symbol 'op_bi'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 332. op_bi: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 335. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 336. Formal parameter N of procedure add must be associated with an actual value.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 339. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 339. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 339. and can not have such operands in this context.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 344. Undefined symbol 'op_brq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 344. op_brq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 345. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 348. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 348. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 348. and can not have such operands in this context.
ERROR:HDLParsers:3312 - "C:/DP32/DP32CPU/DP32.vhd" Line 352. Undefined symbol 'op_biq'.
ERROR:HDLParsers:1209 - "C:/DP32/DP32CPU/DP32.vhd" Line 352. op_biq: Undefined symbol (last report in this block)
ERROR:HDLParsers:3326 - "C:/DP32/DP32CPU/DP32.vhd" Line 353. Formal parameter Z of procedure add must be associated with an actual value.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 356. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 356. and can not have such operands in this context.
ERROR:HDLParsers:808 - "C:/DP32/DP32CPU/DP32.vhd" Line 356. and can not have such operands in this context.
WARNING:HDLParsers:1406 - "C:/DP32/DP32CPU/DP32.vhd" Line 30. No sensitivity list and no wait in the process
WARNING:HDLParsers:3481 - Library work has no units. Did not save reference file "xst/work/hdllib.ref" for it.
--> 

Total memory usage is 128028 kilobytes

Number of errors   :  202 (   0 filtered)
Number of warnings :    2 (   0 filtered)
Number of infos    :    0 (   0 filtered)

------------------------------------------------
-- DP32 Top
------------------------------------------------

library dp32_types;
use dp32_types.all;
------------------------------------------------


entity dp32 is
  generic (Tpd : Time := unit_delay);
  port (d_bus : inout bus_bit_32 bus; --data bus is a multidriver(driven by CPU and MMU) resolved signal
        a_bus : out bit_32;
        read, write : out bit;
        fetch : out bit;
        ready : in bit;
        phi1, phi2 : in bit;
        reset : in bit);
   end dp32;
	
------------------------------------------------

architecture behaviour of dp32 is

subtype reg_addr is natural range 0 to 255;
type reg_array is array (reg_addr) of bit_32;

begin -- behaviour of dp32

process
    --register file
    variable reg : reg_array;
    variable PC : bit_32;
    variable current_instr : bit_32;
    variable op: bit_8;
    variable r3, r1, r2 : reg_addr;
    variable i8 : integer;
    alias cm_i : bit is current_instr(19);
    alias cm_V : bit is current_instr(18);
    alias cm_N : bit is current_instr(17);
    alias cm_Z : bit is current_instr(16);
    variable cc_V, cc_N, cc_Z : bit;
    variable temp_V, temp_N, temp_Z : bit;
    variable displacement, effective_addr : bit_32;


---- Later , put those procedures in a Library -------------------------------------------
-- Procedurers below are not synthesizable!!!---------------------------------------------
-- In some of the next revs of this code, make them synthesizable.
-- the prpose of this code is to demo the CPU, instruction set, addressing modes, so forth
------------------------------------------------------------------------------------------
	
---------------------------------------------------------
--------  Memory Read Procedure -------------------------
---------------------------------------------------------
	
procedure memory_read (addr : in bit_32;
                       fetch_cycle : in boolean;
                       result : out bit_32) is
begin
-- start bus cycle with address output
a_bus <= addr after Tpd;
fetch <= bool_to_bit(fetch_cycle) after Tpd;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- T1 phase
--
read <= '1' after Tpd;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- T2 phase
--
loop
wait until phi2 = '0';
if reset = '1' then
return;
end if;
-- end of T2
if ready = '1' then
result := d_bus;
exit;
end if;
end loop;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- Ti phase at end of cycle
--
read <= '0' after Tpd;
end memory_read;	


------------------------------------------------------------------ 
----------------- Memory Write Procedure ------------------------- 
------------------------------------------------------------------
procedure memory_write (addr : in bit_32;
                        data : in bit_32) is
begin
-- start bus cycle with address output
a_bus <= addr after Tpd;
fetch <= '0' after Tpd;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- T1 phase
--
write <= '1' after Tpd;
wait until phi2 = '1';
d_bus <= data after Tpd;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- T2 phase
--
loop
wait until phi2 = '0';
if reset = '1' then
return;
end if;
-- end of T2
exit when ready = '1';
end loop;
wait until phi1 = '1';
if reset = '1' then
return;
end if;
--
-- Ti phase at end of cycle
--
write <= '0' after Tpd;
d_bus <= null after Tpd;
end memory_write;
--------------------------------------------------------------------
-----------  Add procedure -----------------------------------------
--------------------------------------------------------------------
procedure add (result : inout bit_32; op1, op2 : in integer; V, N, Z : out bit) is
begin
if op2 > 0 and op1 > integer'high-op2 then -- positive overflow
int_to_bits(((integer'low+op1)+op2)-integer'high-1, result);
V := '1';
elsif op2 < 0 and op1 < integer'low-op2 then -- negative overflow
int_to_bits(((integer'high+op1)+op2)-integer'low+1, result);
V := '1';
else
int_to_bits(op1 + op2, result);
V := '0';
end if;
N := result(31);
Z := bool_to_bit(result = X"0000_0000"); -differed constants
end add;

---------------------------------------------------------------------
------------------ Subtract procedure -------------------------------
---------------------------------------------------------------------

procedure subtract (result : inout bit_32;op1, op2 : in integer;V, N, Z : out bit) is
begin
if op2 < 0 and op1 > integer'high+op2 then -- positive overflow
int_to_bits(((integer'low+op1)-op2)-integer'high-1, result);
V := '1';
elsif op2 > 0 and op1 < integer'low+op2 then -- negative overflow
int_to_bits(((integer'high+op1)-op2)-integer'low+1, result);
V := '1';
else
int_to_bits(op1 - op2, result);
V := '0';
end if;
N := result(31);
Z := bool_to_bit(result = X"0000_0000");
end subtract;
--------------------------------------------------------------------------
---------------- Multiply procedure --------------------------------------
--------------------------------------------------------------------------

procedure multiply (result : inout bit_32;
op1, op2 : in integer;
V, N, Z : out bit) is
begin
if ((op1>0 and op2>0) or (op1<0 and op2<0)) -- result positive
and (abs op1 > integer'high / abs op2) then -- positive overflow
int_to_bits(integer'high, result);
V := '1';
elsif ((op1>0 and op2<0) or (op1<0 and op2>0)) -- result negative
and ((- abs op1) < integer'low / abs op2) then -- negative overflow
int_to_bits(integer'low, result);
V := '1';
else
int_to_bits(op1 * op2, result);
V := '0';
end if;
N := result(31);
Z := bool_to_bit(result = X"0000_0000");
end multiply;


-----------------------------------------------------------------------
--  Divide Procedure --------------------------------------------------
-----------------------------------------------------------------------
procedure divide (result : inout bit_32;
op1, op2 : in integer;
V, N, Z : out bit) is
begin
if op2=0 then
if op1>=0 then -- positive overflow
int_to_bits(integer'high, result);
else
int_to_bits(integer'low, result);
end if;
V := '1';
else
int_to_bits(op1 / op2, result);
V := '0';
end if;
N := result(31);
Z := bool_to_bit(result = X"0000_0000");
end divide;
------   END PROCEDURES -------------------------------------------------


begin
--
-- check for reset active
--
if reset = '1' then
read <= '0' after Tpd;
write <= '0' after Tpd;
fetch <= '0' after Tpd;
d_bus <= null after Tpd;
PC := X"0000_0000";
wait until reset = '0';
end if;
--
-- fetch next instruction
--
memory_read(PC, true, current_instr);
if reset /= '1' then
add(PC, bits_to_int(PC), 1, temp_V, temp_N, temp_Z);
--
-- decode & execute
--
op := current_instr(31 downto 24);
r3 := bits_to_natural(current_instr(23 downto 16));
r1 := bits_to_natural(current_instr(15 downto 8));
r2 := bits_to_natural(current_instr(7 downto 0));
i8 := bits_to_int(current_instr(7 downto 0));
case op is
when op_add =>
add(reg(r3), bits_to_int(reg(r1)), bits_to_int(reg(r2)),
cc_V, cc_N, cc_Z);
when op_addq =>
add(reg(r3), bits_to_int(reg(r1)), i8, cc_V, cc_N, cc_Z);
when op_sub =>
subtract(reg(r3), bits_to_int(reg(r1)), bits_to_int(reg(r2)),
cc_V, cc_N, cc_Z);
when op_subq =>
subtract(reg(r3), bits_to_int(reg(r1)), i8, cc_V, cc_N, cc_Z);
when op_mul =>
multiply(reg(r3), bits_to_int(reg(r1)), bits_to_int(reg(r2)),
cc_V, cc_N, cc_Z);
when op_mulq =>
multiply(reg(r3), bits_to_int(reg(r1)), i8, cc_V, cc_N, cc_Z);
when op_div =>
divide(reg(r3), bits_to_int(reg(r1)), bits_to_int(reg(r2)),
cc_V, cc_N, cc_Z);
when op_divq =>
divide(reg(r3), bits_to_int(reg(r1)), i8, cc_V, cc_N, cc_Z);
when op_land =>
reg(r3) := reg(r1) and reg(r2);
cc_Z := bool_to_bit(reg(r3) = X"0000_0000");
when op_lor =>
reg(r3) := reg(r1) or reg(r2);
cc_Z := bool_to_bit(reg(r3) = X"0000_0000");
when op_lxor =>
reg(r3) := reg(r1) xor reg(r2);
cc_Z := bool_to_bit(reg(r3) = X"0000_0000");
when op_lmask =>
reg(r3) := reg(r1) and not reg(r2);
cc_Z := bool_to_bit(reg(r3) = X"0000_0000");
when op_ld =>
memory_read(PC, true, displacement);
if reset /= '1' then
add(PC, bits_to_int(PC), 1, temp_V, temp_N, temp_Z);
add(effective_addr,
bits_to_int(reg(r1)), bits_to_int(displacement),
temp_V, temp_N, temp_Z);
memory_read(effective_addr, false, reg(r3));
end if;
when op_ldq =>
add(effective_addr,
bits_to_int(reg(r1)), i8,
temp_V, temp_N, temp_Z);
memory_read(effective_addr, false, reg(r3));
when op_st =>
memory_read(PC, true, displacement);
if reset /= '1' then
add(PC, bits_to_int(PC), 1, temp_V, temp_N, temp_Z);
add(effective_addr,
bits_to_int(reg(r1)), bits_to_int(displacement),
temp_V, temp_N, temp_Z);
memory_write(effective_addr, reg(r3));
end if;

when op_stq =>
add(effective_addr,
bits_to_int(reg(r1)), i8,
temp_V, temp_N, temp_Z);
memory_write(effective_addr, reg(r3));
when op_br =>
memory_read(PC, true, displacement);
if reset /= '1' then
add(PC, bits_to_int(PC), 1, temp_V, temp_N, temp_Z);
add(effective_addr,
bits_to_int(PC), bits_to_int(displacement),
temp_V, temp_N, temp_Z);
if ((cm_V and cc_V) or (cm_N and cc_N) or (cm_Z and cc_Z))
= cm_i then
PC := effective_addr;
end if;
end if;
when op_bi =>
memory_read(PC, true, displacement);
if reset /= '1' then
add(PC, bits_to_int(PC), 1, temp_V, temp_N, temp_Z);
add(effective_addr,
bits_to_int(reg(r1)), bits_to_int(displacement),
temp_V, temp_N, temp_Z);
if ((cm_V and cc_V) or (cm_N and cc_N) or (cm_Z and cc_Z))
= cm_i then
PC := effective_addr;
end if;
end if;
when op_brq =>
add(effective_addr,
bits_to_int(PC), i8,
temp_V, temp_N, temp_Z);
if ((cm_V and cc_V) or (cm_N and cc_N) or (cm_Z and cc_Z))
= cm_i then
PC := effective_addr;
end if;
when op_biq =>
add(effective_addr,
bits_to_int(reg(r1)), i8,
temp_V, temp_N, temp_Z);
if ((cm_V and cc_V) or (cm_N and cc_N) or (cm_Z and cc_Z))
= cm_i then
PC := effective_addr;
end if;
when others =>
assert false report "illegal instruction" severity warning;
end case;
end if; -- reset /= '1'
end process;
end behaviour;

--------------------------------------------------------
set -tmpdir "xst/projnav.tmp"
set -xsthdpdir "xst"
run
-ifn dp32.prj
-ifmt mixed
-ofn dp32
-ofmt NGC
-p xc3s100e-4-vq100
-top dp32
-opt_mode Speed
-opt_level 1
-iuc NO
-keep_hierarchy No
-netlist_hierarchy As_Optimized
-rtlview Yes
-glob_opt AllClockNets
-read_cores YES
-write_timing_constraints NO
-cross_clock_analysis NO
-hierarchy_separator /
-bus_delimiter <>
-case Maintain
-slice_utilization_ratio 100
-bram_utilization_ratio 100
-verilog2001 YES
-fsm_extract YES -fsm_encoding Auto
-safe_implementation No
-fsm_style LUT
-ram_extract Yes
-ram_style Auto
-rom_extract Yes
-mux_style Auto
-decoder_extract YES
-priority_extract Yes
-shreg_extract YES
-shift_extract YES
-xor_collapse YES
-rom_style Auto
-auto_bram_packing NO
-mux_extract Yes
-resource_sharing YES
-async_to_sync NO
-mult_style Auto
-iobuf YES
-max_fanout 500
-bufg 24
-register_duplication YES
-register_balancing No
-slice_packing YES
-optimize_primitives NO
-use_clock_enable Yes
-use_sync_set Yes
-use_sync_reset Yes
-iob Auto
-equivalent_register_removal YES
-slice_utilization_ratio_maxmargin 5
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<generated_project xmlns="http://www.xilinx.com/XMLSchema" xmlns:xil_pn="http://www.xilinx.com/XMLSchema">

  <!--                                                          -->

  <!--             For tool use only. Do not edit.              -->

  <!--                                                          -->

  <!-- ProjectNavigator created generated project file.         -->

  <!-- For use in tracking generated file and other information -->

  <!-- allowing preservation of process status.                 -->

  <!--                                                          -->

  <!-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved. -->

  <version xmlns="http://www.xilinx.com/XMLSchema">11.1</version>

  <sourceproject xmlns="http://www.xilinx.com/XMLSchema" xil_pn:fileType="FILE_XISE" xil_pn:name="DP32CPU.xise"/>

  <files xmlns="http://www.xilinx.com/XMLSchema">
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_LSO" xil_pn:name=".lso"/>
    <file xil_pn:fileType="FILE_XMSGS" xil_pn:name="_xmsgs/xst.xmsgs"/>
    <file xil_pn:fileType="FILE_CMD_LOG" xil_pn:name="dp32.cmd_log"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_LSO" xil_pn:name="dp32.lso"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST_PROJECT" xil_pn:name="dp32.prj"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST_REPORT" xil_pn:name="dp32.syr"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST" xil_pn:name="dp32.xst"/>
    <file xil_pn:fileType="FILE_HTML" xil_pn:name="dp32_envsettings.html"/>
    <file xil_pn:fileType="FILE_XST_PROJECT" xil_pn:name="dp32_stx_beh.prj"/>
    <file xil_pn:fileType="FILE_HTML" xil_pn:name="dp32_summary.html"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST_PROJECT" xil_pn:name="dp32_types.prj"/>
    <file xil_pn:fileType="FILE_XST_STX" xil_pn:name="dp32_types.stx"/>
    <file xil_pn:fileType="FILE_XST" xil_pn:name="dp32_types.xst"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST_PROJECT" xil_pn:name="dp32_types_vhdl.prj"/>
    <file xil_pn:branch="Implementation" xil_pn:fileType="FILE_XST_PROJECT" xil_pn:name="dp32_vhdl.prj"/>
    <file xil_pn:fileType="FILE_XRPT" xil_pn:name="dp32_xst.xrpt"/>
    <file xil_pn:fileType="FILE_FITTER_REPORT" xil_pn:name="webtalk_pn.xml"/>
    <file xil_pn:fileType="FILE_INI" xil_pn:name="xilinxsim.ini"/>
    <file xil_pn:fileType="FILE_DIRECTORY" xil_pn:name="xst"/>
  </files>

  <transforms xmlns="http://www.xilinx.com/XMLSchema">
    <transform xil_pn:end_ts="1300837690" xil_pn:name="TRAN_copyInitialToAbstractSimulation" xil_pn:start_ts="1300837688">
      <status xil_pn:value="SuccessfullyRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837690" xil_pn:in_ck="139352904550913990" xil_pn:name="TRAN_copyAbstractToPostAbstractSimulation" xil_pn:start_ts="1300837690">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
      <outfile xil_pn:name="DP32.vhd"/>
      <outfile xil_pn:name="dp32_types.vhd"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_copyInitialToXSTAbstractSynthesis" xil_pn:start_ts="1300837566">
      <status xil_pn:value="SuccessfullyRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_schematicsToHdl" xil_pn:prop_ck="-7652025633676931738" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_regenerateCores" xil_pn:prop_ck="4334499518700912094" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_SubProjectAbstractToPreProxy" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_xawsTohdl" xil_pn:prop_ck="-2752511849041974300" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_SubProjectPreToStructuralProxy" xil_pn:prop_ck="2988080280845075520" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837567" xil_pn:name="TRAN_platgen" xil_pn:prop_ck="-3983688794457938392" xil_pn:start_ts="1300837567">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
    <transform xil_pn:end_ts="1300837607" xil_pn:in_ck="139352904550913990" xil_pn:name="TRANEXT_xstsynthesize_spartan3e" xil_pn:prop_ck="3124648647202102383" xil_pn:start_ts="1300837601">
      <status xil_pn:value="FailedRun"/>
      <status xil_pn:value="WarningsGenerated"/>
      <status xil_pn:value="ReadyToRun"/>
      <outfile xil_pn:name=".lso"/>
      <outfile xil_pn:name="_xmsgs/xst.xmsgs"/>
      <outfile xil_pn:name="dp32.lso"/>
      <outfile xil_pn:name="dp32.prj"/>
      <outfile xil_pn:name="dp32.syr"/>
      <outfile xil_pn:name="dp32.xst"/>
      <outfile xil_pn:name="dp32_types.prj"/>
      <outfile xil_pn:name="dp32_types_vhdl.prj"/>
      <outfile xil_pn:name="dp32_vhdl.prj"/>
      <outfile xil_pn:name="dp32_xst.xrpt"/>
      <outfile xil_pn:name="webtalk_pn.xml"/>
      <outfile xil_pn:name="xst"/>
    </transform>
    <transform xil_pn:end_ts="1300837587" xil_pn:name="TRAN_compileBCD2" xil_pn:prop_ck="-8480684855717231719" xil_pn:start_ts="1300837586">
      <status xil_pn:value="SuccessfullyRun"/>
      <status xil_pn:value="ReadyToRun"/>
    </transform>
  </transforms>

</generated_project>
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<project xmlns="http://www.xilinx.com/XMLSchema" xmlns:xil_pn="http://www.xilinx.com/XMLSchema">

  <header>
    <!-- ISE source project file created by Project Navigator.             -->
    <!--                                                                   -->
    <!-- This file contains project source information including a list of -->
    <!-- project source files, project and process properties.  This file, -->
    <!-- along with the project source files, is sufficient to open and    -->
    <!-- implement in ISE Project Navigator.                               -->
    <!--                                                                   -->
    <!-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved. -->
  </header>

  <version xil_pn:ise_version="12.3" xil_pn:schema_version="2"/>

  <files>
    <file xil_pn:name="dp32_types.vhd" xil_pn:type="FILE_VHDL">
      <association xil_pn:name="BehavioralSimulation"/>
      <association xil_pn:name="Implementation"/>
      <library xil_pn:name="dp32_types"/>
    </file>
    <file xil_pn:name="DP32.vhd" xil_pn:type="FILE_VHDL">
      <association xil_pn:name="BehavioralSimulation"/>
      <association xil_pn:name="Implementation"/>
    </file>
  </files>

  <properties>
    <property xil_pn:name="Add I/O Buffers" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Allow Logic Optimization Across Hierarchy" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Allow SelectMAP Pins to Persist" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Allow Unexpanded Blocks" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Allow Unmatched LOC Constraints" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Allow Unmatched Timing Group Constraints" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Asynchronous To Synchronous" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Auto Implementation Compile Order" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Auto Implementation Top" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Automatic BRAM Packing" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Automatically Insert glbl Module in the Netlist" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Automatically Run Generate Target PROM/ACE File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="BRAM Utilization Ratio" xil_pn:value="100" xil_pn:valueState="default"/>
    <property xil_pn:name="Bring Out Global Set/Reset Net as a Port" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Bring Out Global Tristate Net as a Port" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Bus Delimiter" xil_pn:value="&lt;>" xil_pn:valueState="default"/>
    <property xil_pn:name="CLB Pack Factor Percentage" xil_pn:value="100" xil_pn:valueState="default"/>
    <property xil_pn:name="Case" xil_pn:value="Maintain" xil_pn:valueState="default"/>
    <property xil_pn:name="Case Implementation Style" xil_pn:value="None" xil_pn:valueState="default"/>
    <property xil_pn:name="Change Device Speed To" xil_pn:value="-4" xil_pn:valueState="default"/>
    <property xil_pn:name="Change Device Speed To Post Trace" xil_pn:value="-4" xil_pn:valueState="default"/>
    <property xil_pn:name="Combinatorial Logic Optimization" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Compile EDK Simulation Library" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Compile SIMPRIM (Timing) Simulation Library" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Compile UNISIM (Functional) Simulation Library" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Compile XilinxCoreLib (CORE Generator) Simulation Library" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Compile for HDL Debugging" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Configuration Pin Done" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="Configuration Pin Program" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="Configuration Rate" xil_pn:value="Default (1)" xil_pn:valueState="default"/>
    <property xil_pn:name="Correlate Output to Input Design" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create ASCII Configuration File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create Binary Configuration File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create Bit File" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Create I/O Pads from Ports" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create IEEE 1532 Configuration File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create Logic Allocation File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create Mask File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Create ReadBack Data Files" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Cross Clock Analysis" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Decoder Extraction" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Delay Values To Be Read from SDF" xil_pn:value="Setup Time" xil_pn:valueState="default"/>
    <property xil_pn:name="Device" xil_pn:value="xc3s100e" xil_pn:valueState="default"/>
    <property xil_pn:name="Device Family" xil_pn:value="Spartan3E" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Device Speed Grade/Select ABS Minimum" xil_pn:value="-4" xil_pn:valueState="default"/>
    <property xil_pn:name="Do Not Escape Signal and Instance Names in Netlist" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Done (Output Events)" xil_pn:value="Default (4)" xil_pn:valueState="default"/>
    <property xil_pn:name="Drive Done Pin High" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable BitStream Compression" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Cyclic Redundancy Checking (CRC)" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Debugging of Serial Mode BitStream" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Hardware Co-Simulation" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Internal Done Pipe" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Message Filtering" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Enable Outputs (Output Events)" xil_pn:value="Default (5)" xil_pn:valueState="default"/>
    <property xil_pn:name="Equivalent Register Removal XST" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Exclude Compilation of Deprecated EDK Cores" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Exclude Compilation of EDK Sub-Libraries" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Extra Effort" xil_pn:value="None" xil_pn:valueState="default"/>
    <property xil_pn:name="Extra Effort (Highest PAR level only)" xil_pn:value="None" xil_pn:valueState="default"/>
    <property xil_pn:name="FPGA Start-Up Clock" xil_pn:value="CCLK" xil_pn:valueState="default"/>
    <property xil_pn:name="FSM Encoding Algorithm" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="FSM Style" xil_pn:value="LUT" xil_pn:valueState="default"/>
    <property xil_pn:name="Filter Files From Compile Order" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Flatten Output Netlist" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Functional Model Target Language ArchWiz" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Functional Model Target Language Coregen" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Functional Model Target Language Schematic" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Architecture Only (No Entity Declaration)" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Asynchronous Delay Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Clock Region Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Constraints Interaction Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Constraints Interaction Report Post Trace" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Datasheet Section" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Datasheet Section Post Trace" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Detailed MAP Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Multiple Hierarchical Netlist Files" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Post-Place &amp; Route Power Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Post-Place &amp; Route Simulation Model" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate RTL Schematic" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate SAIF File for Power Optimization/Estimation Par" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Testbench File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Timegroups Section" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generate Timegroups Section Post Trace" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Generics, Parameters" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Global Optimization Goal" xil_pn:value="AllClockNets" xil_pn:valueState="default"/>
    <property xil_pn:name="Global Set/Reset Port Name" xil_pn:value="GSR_PORT" xil_pn:valueState="default"/>
    <property xil_pn:name="Global Tristate Port Name" xil_pn:value="GTS_PORT" xil_pn:valueState="default"/>
    <property xil_pn:name="Hierarchy Separator" xil_pn:value="/" xil_pn:valueState="default"/>
    <property xil_pn:name="ISim UUT Instance Name" xil_pn:value="UUT" xil_pn:valueState="default"/>
    <property xil_pn:name="Ignore User Timing Constraints Map" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Ignore User Timing Constraints Par" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Implementation Top" xil_pn:value="Architecture|dp32|behaviour" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Implementation Top File" xil_pn:value="DP32.vhd" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Implementation Top Instance Path" xil_pn:value="/dp32" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Include 'uselib Directive in Verilog File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Include SIMPRIM Models in Verilog File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Include UNISIM Models in Verilog File" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Include sdf_annotate task in Verilog File" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Incremental Compilation" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Insert Buffers to Prevent Pulse Swallowing" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Instantiation Template Target Language Xps" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="JTAG Pin TCK" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="JTAG Pin TDI" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="JTAG Pin TDO" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="JTAG Pin TMS" xil_pn:value="Pull Up" xil_pn:valueState="default"/>
    <property xil_pn:name="Keep Hierarchy" xil_pn:value="No" xil_pn:valueState="default"/>
    <property xil_pn:name="Language" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Last Applied Goal" xil_pn:value="Balanced" xil_pn:valueState="default"/>
    <property xil_pn:name="Last Applied Strategy" xil_pn:value="Xilinx Default (unlocked)" xil_pn:valueState="default"/>
    <property xil_pn:name="Last Unlock Status" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Library for Verilog Sources" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Logical Shifter Extraction" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Manual Implementation Compile Order" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Map Effort Level" xil_pn:value="High" xil_pn:valueState="default"/>
    <property xil_pn:name="Map Slice Logic into Unused Block RAMs" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Max Fanout" xil_pn:value="500" xil_pn:valueState="default"/>
    <property xil_pn:name="Maximum Number of Lines in Report" xil_pn:value="1000" xil_pn:valueState="default"/>
    <property xil_pn:name="Maximum Signal Name Length" xil_pn:value="20" xil_pn:valueState="default"/>
    <property xil_pn:name="Move First Flip-Flop Stage" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Move Last Flip-Flop Stage" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Multiplier Style" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="Mux Extraction" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Mux Style" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="Netlist Hierarchy" xil_pn:value="As Optimized" xil_pn:valueState="default"/>
    <property xil_pn:name="Netlist Translation Type" xil_pn:value="Timestamp" xil_pn:valueState="default"/>
    <property xil_pn:name="Number of Clock Buffers" xil_pn:value="24" xil_pn:valueState="default"/>
    <property xil_pn:name="Number of Paths in Error/Verbose Report" xil_pn:value="3" xil_pn:valueState="default"/>
    <property xil_pn:name="Number of Paths in Error/Verbose Report Post Trace" xil_pn:value="3" xil_pn:valueState="default"/>
    <property xil_pn:name="Optimization Effort" xil_pn:value="Normal" xil_pn:valueState="default"/>
    <property xil_pn:name="Optimization Goal" xil_pn:value="Speed" xil_pn:valueState="default"/>
    <property xil_pn:name="Optimization Strategy (Cover Mode)" xil_pn:value="Area" xil_pn:valueState="default"/>
    <property xil_pn:name="Optimize Instantiated Primitives" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Bitgen Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Compiler Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Compiler Options Map" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Compiler Options Par" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Compiler Options Translate" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Compxlib Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Map Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other NETGEN Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Ngdbuild Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Place &amp; Route Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Simulator Commands Behavioral" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Simulator Commands Post-Map" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Simulator Commands Post-Route" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other Simulator Commands Post-Translate" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other XPWR Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Other XST Command Line Options" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Output Extended Identifiers" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Output File Name" xil_pn:value="dp32" xil_pn:valueState="default"/>
    <property xil_pn:name="Overwrite Compiled Libraries" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Pack I/O Registers into IOBs" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="Pack I/O Registers/Latches into IOBs" xil_pn:value="Off" xil_pn:valueState="default"/>
    <property xil_pn:name="Package" xil_pn:value="vq100" xil_pn:valueState="default"/>
    <property xil_pn:name="Perform Advanced Analysis" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Perform Advanced Analysis Post Trace" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Perform Timing-Driven Packing and Placement" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Place &amp; Route Effort Level (Overall)" xil_pn:value="High" xil_pn:valueState="default"/>
    <property xil_pn:name="Place And Route Mode" xil_pn:value="Normal Place and Route" xil_pn:valueState="default"/>
    <property xil_pn:name="Placer Effort Level (Overrides Overall Level)" xil_pn:value="None" xil_pn:valueState="default"/>
    <property xil_pn:name="Port to be used" xil_pn:value="Auto - default" xil_pn:valueState="default"/>
    <property xil_pn:name="Post Map Simulation Model Name" xil_pn:value="dp32_map.vhd" xil_pn:valueState="default"/>
    <property xil_pn:name="Post Place &amp; Route Simulation Model Name" xil_pn:value="dp32_timesim.vhd" xil_pn:valueState="default"/>
    <property xil_pn:name="Post Synthesis Simulation Model Name" xil_pn:value="dp32_synthesis.vhd" xil_pn:valueState="default"/>
    <property xil_pn:name="Post Translate Simulation Model Name" xil_pn:value="dp32_translate.vhd" xil_pn:valueState="default"/>
    <property xil_pn:name="Power Reduction Map" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Power Reduction Par" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Preferred Language" xil_pn:value="VHDL" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Priority Encoder Extraction" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Produce Advanced Verbose Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Produce Verbose Report" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Project Description" xil_pn:value="This project consists of files needed to build DP32 project from VHDL COOKBOOK book" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Property Specification in Project File" xil_pn:value="Store all values" xil_pn:valueState="default"/>
    <property xil_pn:name="RAM Extraction" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="RAM Style" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="ROM Extraction" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="ROM Style" xil_pn:value="Auto" xil_pn:valueState="default"/>
    <property xil_pn:name="Read Cores" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Regenerate Core" xil_pn:value="Under Current Project Setting" xil_pn:valueState="default"/>
    <property xil_pn:name="Register Balancing" xil_pn:value="No" xil_pn:valueState="default"/>
    <property xil_pn:name="Register Duplication" xil_pn:value="Off" xil_pn:valueState="default"/>
    <property xil_pn:name="Register Duplication Xst" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Release Write Enable (Output Events)" xil_pn:value="Default (6)" xil_pn:valueState="default"/>
    <property xil_pn:name="Rename Design Instance in Testbench File to" xil_pn:value="UUT" xil_pn:valueState="default"/>
    <property xil_pn:name="Rename Top Level Architecture To" xil_pn:value="Structure" xil_pn:valueState="default"/>
    <property xil_pn:name="Rename Top Level Entity to" xil_pn:value="dp32" xil_pn:valueState="default"/>
    <property xil_pn:name="Rename Top Level Module To" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Fastest Path(s) in Each Constraint" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Fastest Path(s) in Each Constraint Post Trace" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Paths by Endpoint" xil_pn:value="3" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Paths by Endpoint Post Trace" xil_pn:value="3" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Type" xil_pn:value="Verbose Report" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Type Post Trace" xil_pn:value="Verbose Report" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Unconstrained Paths" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Report Unconstrained Paths Post Trace" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Reset DCM if SHUTDOWN &amp; AGHIGH performed" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Reset On Configuration Pulse Width" xil_pn:value="100" xil_pn:valueState="default"/>
    <property xil_pn:name="Resource Sharing" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Retain Hierarchy" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Router Effort Level (Overrides Overall Level)" xil_pn:value="None" xil_pn:valueState="default"/>
    <property xil_pn:name="Run Design Rules Checker (DRC)" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Run for Specified Time" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Run for Specified Time Map" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Run for Specified Time Par" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Run for Specified Time Translate" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Safe Implementation" xil_pn:value="No" xil_pn:valueState="default"/>
    <property xil_pn:name="Security" xil_pn:value="Enable Readback and Reconfiguration" xil_pn:valueState="default"/>
    <property xil_pn:name="Selected Module Instance Name" xil_pn:value="/dp32" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Selected Simulation Root Source Node Behavioral" xil_pn:value="work.dp32" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Selected Simulation Root Source Node Post-Map" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Selected Simulation Root Source Node Post-Route" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Selected Simulation Root Source Node Post-Translate" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Selected Simulation Source Node" xil_pn:value="UUT" xil_pn:valueState="default"/>
    <property xil_pn:name="Shift Register Extraction" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Show All Models" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulation Model Target" xil_pn:value="VHDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulation Run Time ISim" xil_pn:value="1000 ns" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulation Run Time Map" xil_pn:value="1000 ns" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulation Run Time Par" xil_pn:value="1000 ns" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulation Run Time Translate" xil_pn:value="1000 ns" xil_pn:valueState="default"/>
    <property xil_pn:name="Simulator" xil_pn:value="ISim (VHDL/Verilog)" xil_pn:valueState="default"/>
    <property xil_pn:name="Slice Packing" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Slice Utilization Ratio" xil_pn:value="100" xil_pn:valueState="default"/>
    <property xil_pn:name="Specify 'define Macro Name and Value" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Specify Top Level Instance Names Behavioral" xil_pn:value="work.dp32" xil_pn:valueState="default"/>
    <property xil_pn:name="Specify Top Level Instance Names Post-Map" xil_pn:value="Default" xil_pn:valueState="default"/>
    <property xil_pn:name="Specify Top Level Instance Names Post-Route" xil_pn:value="Default" xil_pn:valueState="default"/>
    <property xil_pn:name="Specify Top Level Instance Names Post-Translate" xil_pn:value="Default" xil_pn:valueState="default"/>
    <property xil_pn:name="Speed Grade" xil_pn:value="-4" xil_pn:valueState="non-default"/>
    <property xil_pn:name="Starting Placer Cost Table (1-100) Map" xil_pn:value="1" xil_pn:valueState="default"/>
    <property xil_pn:name="Starting Placer Cost Table (1-100) Par" xil_pn:value="1" xil_pn:valueState="default"/>
    <property xil_pn:name="Synthesis Tool" xil_pn:value="XST (VHDL/Verilog)" xil_pn:valueState="default"/>
    <property xil_pn:name="Target Simulator" xil_pn:value="Please Specify" xil_pn:valueState="default"/>
    <property xil_pn:name="Timing Mode Map" xil_pn:value="Non Timing Driven" xil_pn:valueState="default"/>
    <property xil_pn:name="Timing Mode Par" xil_pn:value="Performance Evaluation" xil_pn:valueState="default"/>
    <property xil_pn:name="Top-Level Module Name in Output Netlist" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Top-Level Source Type" xil_pn:value="HDL" xil_pn:valueState="default"/>
    <property xil_pn:name="Trim Unconnected Signals" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Tristate On Configuration Pulse Width" xil_pn:value="0" xil_pn:valueState="default"/>
    <property xil_pn:name="Unused IOB Pins" xil_pn:value="Pull Down" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Clock Enable" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Project File Behavioral" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Project File Post-Map" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Project File Post-Route" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Project File Post-Translate" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Simulation Command File Behavioral" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Simulation Command File Map" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Simulation Command File Par" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Simulation Command File Translate" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Waveform Configuration File Behav" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Waveform Configuration File Map" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Waveform Configuration File Par" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Custom Waveform Configuration File Translate" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use LOC Constraints" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Use RLOC Constraints" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Smart Guide" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Synchronous Reset" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Synchronous Set" xil_pn:value="Yes" xil_pn:valueState="default"/>
    <property xil_pn:name="Use Synthesis Constraints File" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="User Browsed Strategy Files" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="UserID Code (8 Digit Hexadecimal)" xil_pn:value="0xFFFFFFFF" xil_pn:valueState="default"/>
    <property xil_pn:name="VHDL Source Analysis Standard" xil_pn:value="VHDL-93" xil_pn:valueState="default"/>
    <property xil_pn:name="Value Range Check" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="Verilog 2001 Xst" xil_pn:value="true" xil_pn:valueState="default"/>
    <property xil_pn:name="Verilog Macros" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="Wait for DLL Lock (Output Events)" xil_pn:value="Default (NoWait)" xil_pn:valueState="default"/>
    <property xil_pn:name="Working Directory" xil_pn:value="." xil_pn:valueState="non-default"/>
    <property xil_pn:name="Write Timing Constraints" xil_pn:value="false" xil_pn:valueState="default"/>
    <property xil_pn:name="XOR Collapsing" xil_pn:value="true" xil_pn:valueState="default"/>
    <!--                                                                                  -->
    <!-- The following properties are for internal use only. These should not be modified.-->
    <!--                                                                                  -->
    <property xil_pn:name="PROP_BehavioralSimTop" xil_pn:value="Architecture|dp32|behaviour" xil_pn:valueState="non-default"/>
    <property xil_pn:name="PROP_DesignName" xil_pn:value="DP32CPU" xil_pn:valueState="non-default"/>
    <property xil_pn:name="PROP_DevFamilyPMName" xil_pn:value="spartan3e" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_FPGAConfiguration" xil_pn:value="FPGAConfiguration" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_PostMapSimTop" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_PostParSimTop" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_PostSynthSimTop" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_PostXlateSimTop" xil_pn:value="" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_PreSynthesis" xil_pn:value="PreSynthesis" xil_pn:valueState="default"/>
    <property xil_pn:name="PROP_intProjectCreationTimestamp" xil_pn:value="2011-03-16T17:54:57" xil_pn:valueState="non-default"/>
    <property xil_pn:name="PROP_intWbtProjectID" xil_pn:value="7F01C6727E6C415C9F4D527F51446612" xil_pn:valueState="non-default"/>
    <property xil_pn:name="PROP_intWorkingDirLocWRTProjDir" xil_pn:value="Same" xil_pn:valueState="non-default"/>
    <property xil_pn:name="PROP_intWorkingDirUsed" xil_pn:value="No" xil_pn:valueState="non-default"/>
  </properties>

  <bindings/>

  <libraries>
    <library xil_pn:name="dp32_types"/>
  </libraries>

  <autoManagedFiles>
    <!-- The following files are identified by `include statements in verilog -->
    <!-- source files and are automatically managed by Project Navigator.     -->
    <!--                                                                      -->
    <!-- Do not hand-edit this section, as it will be overwritten when the    -->
    <!-- project is analyzed based on files automatically identified as       -->
    <!-- include files.                                                       -->
  </autoManagedFiles>

</project>
<HTML><HEAD><TITLE>Xilinx System Settings Report</TITLE></HEAD>
<BODY TEXT='#000000' BGCOLOR='#FFFFFF' LINK='#0000EE' VLINK='#551A8B' ALINK='#FF0000'>
<center><big><big><b>System Settings</b></big></big></center><br>
<A NAME="Environment Settings"></A>
&nbsp;<BR><TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'>
<TD ALIGN=CENTER COLSPAN='5'><B> Environment Settings </B></TD>
</tr>
<tr bgcolor='#ffff99'>
<td><b>Environment Variable</b></td>
<td><b>xst</b></td>
<td><b>ngdbuild</b></td>
<td><b>map</b></td>
<td><b>par</b></td>
</tr>
<tr>
<td>PATHEXT</td>
<td>.COM;<br>.EXE;<br>.BAT;<br>.CMD;<br>.VBS;<br>.VBE;<br>.JS;<br>.JSE;<br>.WSF;<br>.WSH</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>Path</td>
<td>C:\Xilinx\12.3\ISE_DS\ISE\\lib\nt;<br>C:\Xilinx\12.3\ISE_DS\ISE\\bin\nt;<br>C:\Xilinx\12.3\ISE_DS\PlanAhead\bin;<br>C:\Xilinx\12.3\ISE_DS\ISE\bin\nt;<br>C:\Xilinx\12.3\ISE_DS\ISE\lib\nt;<br>C:\Xilinx\12.3\ISE_DS\EDK\bin\nt;<br>C:\Xilinx\12.3\ISE_DS\EDK\lib\nt;<br>C:\Xilinx\12.3\ISE_DS\common\bin\nt;<br>C:\Xilinx\12.3\ISE_DS\common\lib\nt;<br>C:\WINDOWS\system32;<br>C:\WINDOWS;<br>C:\WINDOWS\System32\Wbem;<br>c:\Program Files\Microsoft SQL Server\90\Tools\binn\;<br>c:\altera\80\quartus\bin;<br>C:\Program Files\Subversion\bin;<br>C:\modeltech_6.5\win32</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>XILINX</td>
<td>C:\Xilinx\12.3\ISE_DS\ISE\</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>XILINXD_LICENSE_FILE</td>
<td>C:\Xilinx\12.3\ISE_DS\license.lic</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>XILINX_DSP</td>
<td>C:\Xilinx\12.3\ISE_DS\ISE</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>XILINX_EDK</td>
<td>C:\Xilinx\12.3\ISE_DS\EDK</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
<tr>
<td>XILINX_PLANAHEAD</td>
<td>C:\Xilinx\12.3\ISE_DS\PlanAhead</td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp;data not available&nbsp;&gt;</font></td>
</tr>
</TABLE>
<A NAME="Synthesis Property Settings"></A>
&nbsp;<BR><TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'>
<TD ALIGN=CENTER COLSPAN='4'><B>Synthesis Property Settings </B></TD>
</tr>
<tr bgcolor='#ffff99'>
<td><b>Switch Name</b></td>
<td><b>Property Name</b></td>
<td><b>Value</b></td>
<td><b>Default Value</b></td>
</tr>
<tr>
<td>-ifn</td>
<td>&nbsp;</td>
<td>dp32.prj</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>-ifmt</td>
<td>&nbsp;</td>
<td>mixed</td>
<td>MIXED</td>
</tr>
<tr>
<td>-ofn</td>
<td>&nbsp;</td>
<td>dp32</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>-ofmt</td>
<td>&nbsp;</td>
<td>NGC</td>
<td>NGC</td>
</tr>
<tr>
<td>-p</td>
<td>&nbsp;</td>
<td>xc3s100e-4-vq100</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>-top</td>
<td>&nbsp;</td>
<td>dp32</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>-opt_mode</td>
<td>Optimization Goal</td>
<td>Speed</td>
<td>Speed</td>
</tr>
<tr>
<td>-opt_level</td>
<td>Optimization Effort</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<td>-iuc</td>
<td>Use synthesis Constraints File</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-keep_hierarchy</td>
<td>Keep Hierarchy</td>
<td>No</td>
<td>NO</td>
</tr>
<tr>
<td>-netlist_hierarchy</td>
<td>Netlist Hierarchy</td>
<td>As_Optimized</td>
<td>As_Optimized</td>
</tr>
<tr>
<td>-rtlview</td>
<td>Generate RTL Schematic</td>
<td>Yes</td>
<td>NO</td>
</tr>
<tr>
<td>-glob_opt</td>
<td>Global Optimization Goal</td>
<td>AllClockNets</td>
<td>AllClockNets</td>
</tr>
<tr>
<td>-read_cores</td>
<td>Read Cores</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-write_timing_constraints</td>
<td>Write Timing Constraints</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-cross_clock_analysis</td>
<td>Cross Clock Analysis</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-bus_delimiter</td>
<td>Bus Delimiter</td>
<td>&lt;&gt;</td>
<td>&lt;&gt;</td>
</tr>
<tr>
<td>-slice_utilization_ratio</td>
<td>Slice Utilization Ratio</td>
<td>100</td>
<td>100%</td>
</tr>
<tr>
<td>-bram_utilization_ratio</td>
<td>BRAM Utilization Ratio</td>
<td>100</td>
<td>100%</td>
</tr>
<tr>
<td>-verilog2001</td>
<td>Verilog 2001</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-fsm_extract</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-fsm_encoding</td>
<td>&nbsp;</td>
<td>Auto</td>
<td>AUTO</td>
</tr>
<tr>
<td>-safe_implementation</td>
<td>&nbsp;</td>
<td>No</td>
<td>NO</td>
</tr>
<tr>
<td>-fsm_style</td>
<td>&nbsp;</td>
<td>LUT</td>
<td>LUT</td>
</tr>
<tr>
<td>-ram_extract</td>
<td>&nbsp;</td>
<td>Yes</td>
<td>YES</td>
</tr>
<tr>
<td>-ram_style</td>
<td>&nbsp;</td>
<td>Auto</td>
<td>AUTO</td>
</tr>
<tr>
<td>-rom_extract</td>
<td>&nbsp;</td>
<td>Yes</td>
<td>YES</td>
</tr>
<tr>
<td>-shreg_extract</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-rom_style</td>
<td>&nbsp;</td>
<td>Auto</td>
<td>AUTO</td>
</tr>
<tr>
<td>-auto_bram_packing</td>
<td>&nbsp;</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-resource_sharing</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-async_to_sync</td>
<td>&nbsp;</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-mult_style</td>
<td>&nbsp;</td>
<td>Auto</td>
<td>AUTO</td>
</tr>
<tr>
<td>-iobuf</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-max_fanout</td>
<td>&nbsp;</td>
<td>500</td>
<td>500</td>
</tr>
<tr>
<td>-bufg</td>
<td>&nbsp;</td>
<td>24</td>
<td>24</td>
</tr>
<tr>
<td>-register_duplication</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-register_balancing</td>
<td>&nbsp;</td>
<td>No</td>
<td>NO</td>
</tr>
<tr>
<td>-optimize_primitives</td>
<td>&nbsp;</td>
<td>NO</td>
<td>NO</td>
</tr>
<tr>
<td>-use_clock_enable</td>
<td>&nbsp;</td>
<td>Yes</td>
<td>YES</td>
</tr>
<tr>
<td>-use_sync_set</td>
<td>&nbsp;</td>
<td>Yes</td>
<td>YES</td>
</tr>
<tr>
<td>-use_sync_reset</td>
<td>&nbsp;</td>
<td>Yes</td>
<td>YES</td>
</tr>
<tr>
<td>-iob</td>
<td>&nbsp;</td>
<td>Auto</td>
<td>AUTO</td>
</tr>
<tr>
<td>-equivalent_register_removal</td>
<td>&nbsp;</td>
<td>YES</td>
<td>YES</td>
</tr>
<tr>
<td>-slice_utilization_ratio_maxmargin</td>
<td>&nbsp;</td>
<td>5</td>
<td>0%</td>
</tr>
</TABLE>
<A NAME="Operating System Information"></A>
&nbsp;<BR><TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'>
<TD ALIGN=CENTER COLSPAN='5'><B> Operating System Information </B></TD>
</tr>
<tr bgcolor='#ffff99'>
<td><b>Operating System Information</b></td>
<td><b>xst</b></td>
<td><b>ngdbuild</b></td>
<td><b>map</b></td>
<td><b>par</b></td>
</tr>
<tr>
<td>CPU Architecture/Speed</td>
<td>Intel(R) Core(TM)2 Duo CPU     T5270  @ 1.40GHz/1396 MHz</td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
</tr>
<tr>
<td>Host</td>
<td>lucho-c45d00409</td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
</tr>
<tr>
<td>OS Name</td>
<td>Microsoft Windows XP Professional</td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
</tr>
<tr>
<td>OS Release</td>
<td>Service Pack 2  (build 2600)</td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
<td><font color=gray>&lt;&nbsp; data not available &nbsp;&gt;</font></td>
</tr>
</TABLE>
</BODY> </HTML>vhdl dp32_types "dp32_types.vhd"
vhdl isim_temp "DP32.vhd"
<HTML><HEAD><TITLE>Xilinx Design Summary</TITLE></HEAD>
<BODY TEXT='#000000' BGCOLOR='#FFFFFF' LINK='#0000EE' VLINK='#551A8B' ALINK='#FF0000'>
<TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'>
<TD ALIGN=CENTER COLSPAN='4'><B>dp32 Project Status (03/22/2011 - 16:46:48)</B></TD></TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Project File:</B></TD>
<TD>DP32CPU.xise</TD>
<TD BGCOLOR='#FFFF99'><b>Parser Errors:</b></TD>
<TD ALIGN=LEFT><font color='red'; face='Arial'><b>X </b></font><A HREF_DISABLED='C:/DP32/DP32CPU\_xmsgs/pn_parser.xmsgs?&DataKey=Error'>1 Error</A></TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Module Name:</B></TD>
<TD>dp32</TD>
<TD BGCOLOR='#FFFF99'><B>Implementation State:</B></TD>
<TD>Synthesized (Failed)</TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Target Device:</B></TD>
<TD>xc3s100e-4vq100</TD>
<TD BGCOLOR='#FFFF99'><UL><LI><B>Errors:</B></LI></UL></TD>
<TD>
<font color="red"; face="Arial"><b>X </b></font>
<A HREF_DISABLED='C:/DP32/DP32CPU\_xmsgs/*.xmsgs?&DataKey=Error'>202 Errors (0 new)</A></TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Product Version:</B></TD><TD>ISE 12.3</TD>
<TD BGCOLOR='#FFFF99'><UL><LI><B>Warnings:</B></LI></UL></TD>
<TD ALIGN=LEFT><A HREF_DISABLED='C:/DP32/DP32CPU\_xmsgs/*.xmsgs?&DataKey=Warning'>2 Warnings (0 new)</A></TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Design Goal:</B></dif></TD>
<TD>Balanced</TD>
<TD BGCOLOR='#FFFF99'><UL><LI><B>Routing Results:</B></LI></UL></TD>
<TD>
&nbsp;</TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Design Strategy:</B></dif></TD>
<TD><A HREF_DISABLED='Xilinx Default (unlocked)?&DataKey=Strategy'>Xilinx Default (unlocked)</A></TD>
<TD BGCOLOR='#FFFF99'><UL><LI><B>Timing Constraints:</B></LI></UL></TD>
<TD>&nbsp;</TD>
</TR>
<TR ALIGN=LEFT>
<TD BGCOLOR='#FFFF99'><B>Environment:</B></dif></TD>
<TD>
<A HREF_DISABLED='C:/DP32/DP32CPU\dp32_envsettings.html'>
System Settings</A>
</TD>
<TD BGCOLOR='#FFFF99'><UL><LI><B>Final Timing Score:</B></LI></UL></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>











&nbsp;<BR><TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'><TD ALIGN=CENTER COLSPAN='6'><B>Detailed Reports</B></TD><TD ALIGN=RIGHT WIDTH='10%'COLSPAN=1> <A HREF_DISABLED="?&ExpandedTable=DetailedReports"><B>[-]</B></a></TD></TR>
<TR BGCOLOR='#FFFF99'><TD><B>Report Name</B></TD><TD><B>Status</B></TD><TD><B>Generated</B></TD>
<TD ALIGN=LEFT><B>Errors</B></TD><TD ALIGN=LEFT><B>Warnings</B></TD><TD ALIGN=LEFT COLSPAN='2'><B>Infos</B></TD></TR>
<TR ALIGN=LEFT><TD><A HREF_DISABLED='C:/DP32/DP32CPU\dp32.syr'>Synthesis Report</A></TD><TD>Current</TD><TD>Tue Mar 22 16:46:47 2011</TD><TD ALIGN=LEFT><font color="red"; face="Arial"><b>X </b></font><A HREF_DISABLED='C:/DP32/DP32CPU\_xmsgs/xst.xmsgs?&DataKey=Error'>202 Errors (0 new)</A></TD><TD ALIGN=LEFT><A HREF_DISABLED='C:/DP32/DP32CPU\_xmsgs/xst.xmsgs?&DataKey=Warning'>2 Warnings (0 new)</A></TD><TD ALIGN=LEFT COLSPAN='2'>0</TD></TR>
<TR ALIGN=LEFT><TD>Translation Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
<TR ALIGN=LEFT><TD>Map Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
<TR ALIGN=LEFT><TD>Place and Route Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
<TR ALIGN=LEFT><TD>Power Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
<TR ALIGN=LEFT><TD>Post-PAR Static Timing Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
<TR ALIGN=LEFT><TD>Bitgen Report</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD COLSPAN='2'>&nbsp;</TD></TR>
</TABLE>
&nbsp;<BR><TABLE BORDER CELLSPACING=0 CELLPADDING=3 WIDTH='100%'>
<TR ALIGN=CENTER BGCOLOR='#99CCFF'><TD ALIGN=CENTER COLSPAN='3'><B>Secondary Reports</B></TD><TD ALIGN=RIGHT WIDTH='10%'COLSPAN=1> <A HREF_DISABLED="?&ExpandedTable=SecondaryReports"><B>[-]</B></a></TD></TR>
<TR BGCOLOR='#FFFF99'><TD><B>Report Name</B></TD><TD><B>Status</B></TD><TD COLSPAN='2'><B>Generated</B></TD></TR>
</TABLE>


<br><center><b>Date Generated:</b> 03/22/2011 - 16:46:48</center>
</BODY></HTML>vhdl dp32_types "dp32_types.vhd"
Release 12.3 - xst M.70d (nt)
Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--> Parameter TMPDIR set to C:/DP32/DP32CPU/xst/projnav.tmp


Total REAL time to Xst completion: 0.00 secs
Total CPU time to Xst completion: 0.33 secs
 
--> Parameter xsthdpdir set to C:/DP32/DP32CPU/xst


Total REAL time to Xst completion: 0.00 secs
Total CPU time to Xst completion: 0.33 secs
 
--> WARNING:Xst:3164 - Option "-debug" found multiple times in the command line. Only the first occurence is considered.

=========================================================================
*                          HDL Compilation                              *
=========================================================================
Compiling vhdl file "C:/DP32/DP32CPU/dp32_types.vhd" in Library dp32_types.
Package <dp32_types> compiled.
Package body <dp32_types> compiled.


Total REAL time to Xst completion: 1.00 secs
Total CPU time to Xst completion: 0.53 secs
 
--> 

Total memory usage is 118136 kilobytes

Number of errors   :    0 (   0 filtered)
Number of warnings :    1 (   0 filtered)
Number of infos    :    0 (   0 filtered)

-- dp32_types is a library for DP32 CPU
-- Author:Lachezar Temelkov
-- Date:March/2011
-- rev 1.0   - start

package dp32_types is

------Default Inertial Delay---------------------
constant unit_delay : Time := 1 ns;
-------------------------------------------------

--------Bool to Bit LUT table--------------------
type bool_to_bit_table is array (boolean) of bit;
constant bool_to_bit : bool_to_bit_table;
-------------------------------------------------

----- new types and resolve bus definitions------
subtype bit_32 is bit_vector(31 downto 0);
type bit_32_array is array (integer range <>) of bit_32;
function resolve_bit_32 (driver : in bit_32_array) return bit_32;
subtype bus_bit_32 is resolve_bit_32 bit_32;
-------------------------------------------------


subtype bit_8 is bit_vector(7 downto 0);
subtype CC_bits is bit_vector(2 downto 0);
subtype cm_bits is bit_vector(3 downto 0);

---------- opcode constants----------------------
constant op_add : bit_8 := X"00";
constant op_sub : bit_8 := X"01";
constant op_mul : bit_8 := X"02";
constant op_div : bit_8 := X"03";
constant op_addq : bit_8 := X"10";
constant op_subq : bit_8 := X"11";
constant op_mulq : bit_8 := X"12";
constant op_divq : bit_8 := X"13";
constant op_land : bit_8 := X"04";
constant op_lor  : bit_8 := X"05";
constant op_lxor : bit_8 := X"06";
constant op_lmask : bit_8 := X"07";
constant op_ld : bit_8 := X"20";
constant op_st : bit_8 := X"21";
constant op_ldq : bit_8 := X"30";
constant op_stq : bit_8 := X"31";
constant op_br : bit_8 := X"40";
constant op_brq : bit_8 := X"50";
constant op_bi : bit_8 := X"41";
constant op_biq : bit_8 := X"51";
function bits_to_int (bits : in bit_vector) return integer;
function bits_to_natural (bits : in bit_vector) return natural;
procedure int_to_bits (int : in integer; bits : out bit_vector);
end dp32_types;




--------------------------------------------------------------------
---------------PACKAGE BODY ----------------------------------------
--------------------------------------------------------------------


package body dp32_types is


------- bool to bit LUT  -------------------------------------------
constant bool_to_bit : bool_to_bit_table :=(false => '0', true => '1');
--------------------------------------------------------------------

--default bus result function 
--Description: resolve multiple drivers  into a single signal
--Parameters: IN driver: 2D driver array, each cell is 32 bits
--Returns: a resolved 32 bit bus value when multiple driver present or not
---------------------------------------------------------------------

function resolve_bit_32( driver : in bit_32_array) return bit_32 is
    constant float_value : bit_32 := X"0000_0000";
	 
	 -- float_value is a guarded type, i.e this is the default value , when 
	 --bus drivers are disconnected. i.e this is similar to open-collector with pull-down 
	 --resistors, since the default value is X"0000_0000";
	 
    variable result : bit_32 := float_value;
    begin
       for i in driver'range loop
          result := result or driver(i);
       end loop;
return result;
end resolve_bit_32;
---------------------------------------------------------------------
--Description: function that converts bits to an integer value
---------------------------------------------------------------------
function bits_to_int (bits : in bit_vector) return integer is
variable temp : bit_vector(bits'range);
variable result : integer := 0;
begin
if bits(bits'left) = '1' then -- negative number
temp := not bits;
else
temp := bits;
end if;
for index in bits'range loop -- sign bit of temp = '0'
result := result * 2 + bit'pos(temp(index));
end loop;
if bits(bits'left) = '1' then
result := (-result) - 1;
end if;
return result;
end bits_to_int;


---------------------------------------------------------------------
--Description: function that converts bits to an natural value
---------------------------------------------------------------------

function bits_to_natural (bits : in bit_vector) return natural is
variable result : natural := 0;
begin
for index in bits'range loop
result := result * 2 + bit'pos(bits(index));
end loop;
return result;
end bits_to_natural;
procedure int_to_bits (int : in integer; bits : out bit_vector) is
variable temp : integer;
variable result : bit_vector(bits'range);
begin
if int < 0 then
temp := -(int+1);
else
temp := int;
end if;
for index in bits'reverse_range loop
result(index) := bit'val(temp rem 2);
temp := temp / 2;
end loop;
if int < 0 then
result := not result;
result(bits'left) := '1';
end if;
bits := result;
end int_to_bits;
end dp32_types;
----------------------------------------------------------------------------set -tmpdir "C:/DP32/DP32CPU/xst/projnav.tmp"
set -xsthdpdir "C:/DP32/DP32CPU/xst"
elaborate
-ifn dp32_types.prj
-ifmt mixed
vhdl dp32_types "C:\DP32\DP32CPU\dp32_types.vhd"
vhdl dp32_types "C:\DP32\DP32CPU\dp32_types.vhd"
vhdl work "C:\DP32\DP32CPU\DP32.vhd"
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<document OS="nt" product="ISE" version="12.3">

  <!--The data in this file is primarily intended for consumption by Xilinx tools.
    The structure and the elements are likely to change over the next few releases.
    This means code written to parse this file will need to be revisited each subsequent release.-->

  <application stringID="Xst" timeStamp="Tue Mar 22 16:46:46 2011">
    <section stringID="User_Env">
      <table stringID="User_EnvVar">
        <column stringID="variable"/>
        <column stringID="value"/>
        <row stringID="row" value="0">
          <item stringID="variable" value="Path"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\ISE\\lib\nt;C:\Xilinx\12.3\ISE_DS\ISE\\bin\nt;C:\Xilinx\12.3\ISE_DS\PlanAhead\bin;C:\Xilinx\12.3\ISE_DS\ISE\bin\nt;C:\Xilinx\12.3\ISE_DS\ISE\lib\nt;C:\Xilinx\12.3\ISE_DS\EDK\bin\nt;C:\Xilinx\12.3\ISE_DS\EDK\lib\nt;C:\Xilinx\12.3\ISE_DS\common\bin\nt;C:\Xilinx\12.3\ISE_DS\common\lib\nt;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;c:\Program Files\Microsoft SQL Server\90\Tools\binn\;c:\altera\80\quartus\bin;C:\Program Files\Subversion\bin;C:\modeltech_6.5\win32"/>
        </row>
        <row stringID="row" value="1">
          <item stringID="variable" value="PATHEXT"/>
          <item stringID="value" value=".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH"/>
        </row>
        <row stringID="row" value="2">
          <item stringID="variable" value="XILINX"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\ISE\"/>
        </row>
        <row stringID="row" value="3">
          <item stringID="variable" value="XILINXD_LICENSE_FILE"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\license.lic"/>
        </row>
        <row stringID="row" value="4">
          <item stringID="variable" value="XILINX_DSP"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\ISE"/>
        </row>
        <row stringID="row" value="5">
          <item stringID="variable" value="XILINX_EDK"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\EDK"/>
        </row>
        <row stringID="row" value="6">
          <item stringID="variable" value="XILINX_PLANAHEAD"/>
          <item stringID="value" value="C:\Xilinx\12.3\ISE_DS\PlanAhead"/>
        </row>
      </table>
      <item stringID="User_EnvOs" value="OS Information">
        <item stringID="User_EnvOsname" value="Microsoft Windows XP Professional"/>
        <item stringID="User_EnvOsrelease" value="Service Pack 2  (build 2600)"/>
      </item>
      <item stringID="User_EnvHost" value="lucho-c45d00409"/>
      <table stringID="User_EnvCpu">
        <column stringID="arch"/>
        <column stringID="speed"/>
        <row stringID="row" value="0">
          <item stringID="arch" value="Intel(R) Core(TM)2 Duo CPU     T5270  @ 1.40GHz"/>
          <item stringID="speed" value="1396 MHz"/>
        </row>
      </table>
    </section>
    <section stringID="XST_OPTION_SUMMARY">
      <item DEFAULT="" label="-ifn" stringID="XST_IFN" value="dp32.prj"/>
      <item DEFAULT="MIXED" label="-ifmt" stringID="XST_IFMT" value="mixed"/>
      <item DEFAULT="" label="-ofn" stringID="XST_OFN" value="dp32"/>
      <item DEFAULT="NGC" label="-ofmt" stringID="XST_OFMT" value="NGC"/>
      <item DEFAULT="" label="-p" stringID="XST_P" value="xc3s100e-4-vq100"/>
      <item DEFAULT="" label="-top" stringID="XST_TOP" value="dp32"/>
      <item DEFAULT="Speed" label="-opt_mode" stringID="XST_OPTMODE" value="Speed"/>
      <item DEFAULT="1" label="-opt_level" stringID="XST_OPTLEVEL" value="1"/>
      <item DEFAULT="NO" label="-iuc" stringID="XST_IUC" value="NO"/>
      <item DEFAULT="NO" label="-keep_hierarchy" stringID="XST_KEEPHIERARCHY" value="No"/>
      <item DEFAULT="As_Optimized" label="-netlist_hierarchy" stringID="XST_NETLISTHIERARCHY" value="As_Optimized"/>
      <item DEFAULT="NO" label="-rtlview" stringID="XST_RTLVIEW" value="Yes"/>
      <item DEFAULT="AllClockNets" label="-glob_opt" stringID="XST_GLOBOPT" value="AllClockNets"/>
      <item DEFAULT="YES" label="-read_cores" stringID="XST_READCORES" value="YES"/>
      <item DEFAULT="NO" label="-write_timing_constraints" stringID="XST_WRITETIMINGCONSTRAINTS" value="NO"/>
      <item DEFAULT="NO" label="-cross_clock_analysis" stringID="XST_CROSSCLOCKANALYSIS" value="NO"/>
      <item DEFAULT="/" stringID="XST_HIERARCHYSEPARATOR" value="/"/>
      <item DEFAULT="&lt;>" label="-bus_delimiter" stringID="XST_BUSDELIMITER" value="&lt;>"/>
      <item DEFAULT="MAINTAIN" stringID="XST_CASE" value="Maintain"/>
      <item DEFAULT="100%" label="-slice_utilization_ratio" stringID="XST_SLICEUTILIZATIONRATIO" value="100"/>
      <item DEFAULT="100%" label="-bram_utilization_ratio" stringID="XST_BRAMUTILIZATIONRATIO" value="100"/>
      <item DEFAULT="YES" label="-verilog2001" stringID="XST_VERILOG2001" value="YES"/>
      <item DEFAULT="YES" label="-fsm_extract" stringID="XST_FSMEXTRACT" value="YES"/>
      <item DEFAULT="AUTO" label="-fsm_encoding" stringID="XST_FSMENCODING" value="Auto"/>
      <item DEFAULT="NO" label="-safe_implementation" stringID="XST_SAFEIMPLEMENTATION" value="No"/>
      <item DEFAULT="LUT" label="-fsm_style" stringID="XST_FSMSTYLE" value="LUT"/>
      <item DEFAULT="YES" label="-ram_extract" stringID="XST_RAMEXTRACT" value="Yes"/>
      <item DEFAULT="AUTO" label="-ram_style" stringID="XST_RAMSTYLE" value="Auto"/>
      <item DEFAULT="YES" label="-rom_extract" stringID="XST_ROMEXTRACT" value="Yes"/>
      <item DEFAULT="AUTO" stringID="XST_MUXSTYLE" value="Auto"/>
      <item DEFAULT="NO" stringID="XST_DECODEREXTRACT" value="YES"/>
      <item DEFAULT="NO" stringID="XST_PRIORITYEXTRACT" value="Yes"/>
      <item DEFAULT="YES" label="-shreg_extract" stringID="XST_SHREGEXTRACT" value="YES"/>
      <item DEFAULT="YES" stringID="XST_SHIFTEXTRACT" value="YES"/>
      <item DEFAULT="YES" stringID="XST_XORCOLLAPSE" value="YES"/>
      <item DEFAULT="AUTO" label="-rom_style" stringID="XST_ROMSTYLE" value="Auto"/>
      <item DEFAULT="NO" label="-auto_bram_packing" stringID="XST_AUTOBRAMPACKING" value="NO"/>
      <item DEFAULT="YES" stringID="XST_MUXEXTRACT" value="Yes"/>
      <item DEFAULT="YES" label="-resource_sharing" stringID="XST_RESOURCESHARING" value="YES"/>
      <item DEFAULT="NO" label="-async_to_sync" stringID="XST_ASYNCTOSYNC" value="NO"/>
      <item DEFAULT="AUTO" label="-mult_style" stringID="XST_MULTSTYLE" value="Auto"/>
      <item DEFAULT="YES" label="-iobuf" stringID="XST_IOBUF" value="YES"/>
      <item DEFAULT="500" label="-max_fanout" stringID="XST_MAXFANOUT" value="500"/>
      <item DEFAULT="24" label="-bufg" stringID="XST_BUFG" value="24"/>
      <item DEFAULT="YES" label="-register_duplication" stringID="XST_REGISTERDUPLICATION" value="YES"/>
      <item DEFAULT="NO" label="-register_balancing" stringID="XST_REGISTERBALANCING" value="No"/>
      <item DEFAULT="YES" stringID="XST_SLICEPACKING" value="YES"/>
      <item DEFAULT="NO" label="-optimize_primitives" stringID="XST_OPTIMIZEPRIMITIVES" value="NO"/>
      <item DEFAULT="YES" label="-use_clock_enable" stringID="XST_USECLOCKENABLE" value="Yes"/>
      <item DEFAULT="YES" label="-use_sync_set" stringID="XST_USESYNCSET" value="Yes"/>
      <item DEFAULT="YES" label="-use_sync_reset" stringID="XST_USESYNCRESET" value="Yes"/>
      <item DEFAULT="AUTO" label="-iob" stringID="XST_IOB" value="Auto"/>
      <item DEFAULT="YES" label="-equivalent_register_removal" stringID="XST_EQUIVALENTREGISTERREMOVAL" value="YES"/>
      <item DEFAULT="0%" label="-slice_utilization_ratio_maxmargin" stringID="XST_SLICEUTILIZATIONRATIOMAXMARGIN" value="5"/>
    </section>
    <section stringID="XST_ERRORS_STATISTICS">
      <item dataType="int" filtered="0" stringID="XST_NUMBER_OF_ERRORS" value="202"/>
      <item dataType="int" filtered="0" stringID="XST_NUMBER_OF_WARNINGS" value="2"/>
      <item dataType="int" filtered="0" stringID="XST_NUMBER_OF_INFOS" value="0"/>
    </section>
  </application>

</document>
<?xml version="1.0" encoding="UTF-8" ?>
<document>
<!--The data in this file is primarily intended for consumption by Xilinx tools.
The structure and the elements are likely to change over the next few releases.
This means code written to parse this file will need to be revisited each subsequent release.-->
<application name="pn" timeStamp="Tue Mar 22 16:46:43 2011">
<section name="Project Information" visible="false">
<property name="ProjectID" value="7F01C6727E6C415C9F4D527F51446612" type="project"/>
<property name="ProjectIteration" value="0" type="project"/>
<property name="ProjectFile" value="C:/DP32/DP32CPU/DP32CPU.xise" type="project"/>
<property name="ProjectCreationTimestamp" value="2011-03-16T17:54:57" type="project"/>
</section>
<section name="Project Statistics" visible="true">
<property name="PROP_Enable_Message_Filtering" value="false" type="design"/>
<property name="PROP_FitterReportFormat" value="HTML" type="process"/>
<property name="PROP_LastAppliedGoal" value="Balanced" type="design"/>
<property name="PROP_LastAppliedStrategy" value="Xilinx Default (unlocked)" type="design"/>
<property name="PROP_ManualCompileOrderImp" value="false" type="design"/>
<property name="PROP_ProjectDescription" value="This project consists of files needed to build DP32 project from VHDL COOKBOOK book" type="process"/>
<property name="PROP_PropSpecInProjFile" value="Store all values" type="design"/>
<property name="PROP_Simulator" value="ISim (VHDL/Verilog)" type="design"/>
<property name="PROP_SynthTopFile" value="changed" type="process"/>
<property name="PROP_Top_Level_Module_Type" value="HDL" type="design"/>
<property name="PROP_UseSmartGuide" value="false" type="design"/>
<property name="PROP_UserConstraintEditorPreference" value="Text Editor" type="process"/>
<property name="PROP_intProjectCreationTimestamp" value="2011-03-16T17:54:57" type="design"/>
<property name="PROP_intWbtProjectID" value="7F01C6727E6C415C9F4D527F51446612" type="design"/>
<property name="PROP_intWorkingDirLocWRTProjDir" value="Same" type="design"/>
<property name="PROP_intWorkingDirUsed" value="No" type="design"/>
<property name="PROP_AutoTop" value="true" type="design"/>
<property name="PROP_DevFamily" value="Spartan3E" type="design"/>
<property name="PROP_DevDevice" value="xc3s100e" type="design"/>
<property name="PROP_DevFamilyPMName" value="spartan3e" type="design"/>
<property name="PROP_DevPackage" value="vq100" type="design"/>
<property name="PROP_Synthesis_Tool" value="XST (VHDL/Verilog)" type="design"/>
<property name="PROP_DevSpeed" value="-4" type="design"/>
<property name="PROP_PreferredLanguage" value="VHDL" type="design"/>
<property name="FILE_VHDL" value="2" type="source"/>
</section>
</application>
</document>
isim_temp=isim/temp
