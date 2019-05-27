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
add wave -noupdate -format Logic /final_project_txrx_fp_SRlatch1_atb/dut/clk
add wave -noupdate -format Logic /final_project_txrx_fp_SRlatch1_atb/dut/areset
add_fixpt_wave /final_project_txrx_fp_SRlatch1_atb/sim/in_1_s_stm 2 0 unsigned
add wave -noupdate -format Logical /final_project_txrx_fp_SRlatch1_atb/sim/in_2_r_stm
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /final_project_txrx_fp_SRlatch1_atb/dut/out_1_q
add wave -noupdate -format Logical /final_project_txrx_fp_SRlatch1_atb/sim/out_1_q_stm
TreeUpdate [SetDefaultTree]
