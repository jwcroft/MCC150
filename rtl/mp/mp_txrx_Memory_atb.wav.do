onerror {resume}

# obtain Modelsim version and extract the NN.Nc part after vsim
quietly set vsim_ver [regexp -inline {vsim (\d+\.\d+)(\w?)} [vsim -version]]
quietly set has_fixpt_radix 0
if {[lindex $vsim_ver 1] == 10.2} {
    if {[lindex $vsim_ver 2] >= "d"} {
        quietly set has_fixpt_radix 1
    }
} elseif {[lindex $vsim_ver 1] > 10.2} {
    quietly set has_fixpt_radix 1
}

proc add_fixpt_wave {name width frac_width signed} {
    global has_fixpt_radix
    if {$frac_width > 0 && $has_fixpt_radix} {
        set type "[string index $signed 0]fix${width}_En${frac_width}"
        if {[lsearch [radix names] $type] < 0} {
            if {$signed == "signed"} {
                radix define $type -fixed -signed -fraction $frac_width
            } else {
                radix define $type -fixed -fraction $frac_width
            }
        }
        add wave -noupdate -format Literal -radix $type $name
    } else {
        add wave -noupdate -format Literal -radix $signed $name
    }
}

add wave -noupdate -divider {Input Ports}
add wave -noupdate -format Logic /mp_txrx_Memory_atb/dut/clk
add wave -noupdate -format Logic /mp_txrx_Memory_atb/dut/areset
add wave -noupdate -format Logical /mp_txrx_Memory_atb/sim/in_1_dv_stm
add_fixpt_wave /mp_txrx_Memory_atb/sim/in_2_dc_stm 8 0 unsigned
add wave -noupdate -format Logical /mp_txrx_Memory_atb/sim/in_3_trigger_stm
add_fixpt_wave /mp_txrx_Memory_atb/sim/in_4_dc1_stm 8 0 unsigned
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /mp_txrx_Memory_atb/dut/out_2_qv
add wave -noupdate -format Logical /mp_txrx_Memory_atb/sim/out_2_qv_stm
add_fixpt_wave /mp_txrx_Memory_atb/dut/out_3_qc 8 0 unsigned
add_fixpt_wave /mp_txrx_Memory_atb/sim/out_3_qc_stm 8 0 unsigned
add_fixpt_wave /mp_txrx_Memory_atb/dut/out_1_m2 12 0 signed
add_fixpt_wave /mp_txrx_Memory_atb/sim/out_1_m2_stm 12 0 signed
add wave -noupdate -format Logical /mp_txrx_Memory_atb/dut/out_5_qv1
add wave -noupdate -format Logical /mp_txrx_Memory_atb/sim/out_5_qv1_stm
add_fixpt_wave /mp_txrx_Memory_atb/dut/out_6_qc1 8 0 unsigned
add_fixpt_wave /mp_txrx_Memory_atb/sim/out_6_qc1_stm 8 0 unsigned
add_fixpt_wave /mp_txrx_Memory_atb/dut/out_4_m1 12 0 unsigned
add_fixpt_wave /mp_txrx_Memory_atb/sim/out_4_m1_stm 12 0 unsigned
TreeUpdate [SetDefaultTree]
