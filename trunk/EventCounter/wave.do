onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /syntheventcounter_tb/uut/clk
add wave -noupdate -format Logic /syntheventcounter_tb/uut/reset
add wave -noupdate -format Literal /syntheventcounter_tb/uut/cntr
add wave -noupdate -format Literal /syntheventcounter_tb/uut/current_state
add wave -noupdate -format Literal /syntheventcounter_tb/uut/next_state
add wave -noupdate -format Literal /syntheventcounter_tb/uut/counter1
add wave -noupdate -format Literal /syntheventcounter_tb/uut/counter2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300 ns} 0}
configure wave -namecolwidth 264
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {946 ns}
