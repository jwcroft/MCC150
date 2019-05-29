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
add wave -noupdate -format Logic /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/clk
add wave -noupdate -format Logic /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/areset
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_9_v_stm
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_10_c_stm 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_1_left_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_2_left_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_3_main_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_4_main_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_5_right_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_6_right_Q_stm 12 0 signed
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_7_packet_trigger_stm
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_8_sym_sample_stm 2 0 unsigned
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/in_11_sample_update_stm
add wave -noupdate -divider {Output Ports}
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/out_1_v_sym_update
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/out_1_v_sym_update_stm
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/out_2_qc 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/out_2_qc_stm 8 0 unsigned
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/out_3_symbols_phase_x 30 14 signed
add_fixpt_wave /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/out_3_symbols_phase_x_stm 30 14 signed
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/dut/out_4_packet_trigger_through
add wave -noupdate -format Logical /final_project_txrx_fp_Phase_extraction_and_synchronization_atb/sim/out_4_packet_trigger_through_stm
TreeUpdate [SetDefaultTree]