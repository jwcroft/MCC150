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
add wave -noupdate -format Logic /final_project_txrx_fp_atb/dut/clk
add wave -noupdate -format Logic /final_project_txrx_fp_atb/dut/areset
add_fixpt_wave /final_project_txrx_fp_atb/sim/ADC_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/ADC_Q_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/Reset_stm 64 0 signed
add wave -noupdate -format Literal -radix binary -group Reset_stm -label {sign} {/final_project_txrx_fp_atb/sim/Reset_stm(63 downto 63)} -label {exp} {/final_project_txrx_fp_atb/sim/Reset_stm(62 downto 52)} -label {frac} {/final_project_txrx_fp_atb/sim/Reset_stm(51 downto 0)} 
add wave -noupdate -format Literal -radix decimal /final_project_txrx_fp_atb/checkReset/Reset_stm_real
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /final_project_txrx_fp_atb/dut/DAC_I 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/DAC_I_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/dut/DAC_Q 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/DAC_Q_stm 12 0 signed
add wave -noupdate -format Logical /final_project_txrx_fp_atb/dut/mem_o
add wave -noupdate -format Logical /final_project_txrx_fp_atb/sim/mem_o_stm
add_fixpt_wave /final_project_txrx_fp_atb/dut/BBI 28 10 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/BBI_stm 28 10 signed
add_fixpt_wave /final_project_txrx_fp_atb/dut/BBQ 28 10 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/BBQ_stm 28 10 signed
add wave -noupdate -format Logical /final_project_txrx_fp_atb/dut/rx_bits
add wave -noupdate -format Logical /final_project_txrx_fp_atb/sim/rx_bits_stm
add wave -noupdate -format Logical /final_project_txrx_fp_atb/dut/mem_read_bits
add wave -noupdate -format Logical /final_project_txrx_fp_atb/sim/mem_read_bits_stm
add_fixpt_wave /final_project_txrx_fp_atb/dut/sym_phase 63 47 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/sym_phase_stm 63 47 signed
add_fixpt_wave /final_project_txrx_fp_atb/dut/left_power 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/left_power_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/dut/main_power 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/main_power_stm 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/dut/right_power 12 0 signed
add_fixpt_wave /final_project_txrx_fp_atb/sim/right_power_stm 12 0 signed
TreeUpdate [SetDefaultTree]
