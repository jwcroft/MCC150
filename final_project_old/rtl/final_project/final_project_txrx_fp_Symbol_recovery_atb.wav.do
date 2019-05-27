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
add wave -noupdate -format Logic /final_project_txrx_fp_Symbol_recovery_atb/dut/clk
add wave -noupdate -format Logic /final_project_txrx_fp_Symbol_recovery_atb/dut/areset
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/sim/in_3_v_stm
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/in_5_c_stm 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/in_1_in_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/in_2_in_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/in_4_sample_crement_stm 2 0 unsigned
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/sim/in_6_v_sample_update_stm
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/dut/out_3_qv
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/sim/out_3_qv_stm
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_8_qc 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_8_qc_stm 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_1_left_I 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_1_left_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_2_left_Q 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_2_left_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_4_main_I 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_4_main_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_5_main_Q 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_5_main_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_6_right_I 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_6_right_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/dut/out_7_right_Q 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Symbol_recovery_atb/sim/out_7_right_Q_stm 12 0 signed
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/dut/out_9_packet_trigger
add wave -noupdate -format Logical /final_project_txrx_fp_Symbol_recovery_atb/sim/out_9_packet_trigger_stm
TreeUpdate [SetDefaultTree]
