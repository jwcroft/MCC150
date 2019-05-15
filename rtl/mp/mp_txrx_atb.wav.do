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
add wave -noupdate -format Logic /mp_txrx_atb/dut/clk
add wave -noupdate -format Logic /mp_txrx_atb/dut/areset
add wave -noupdate -format Logic /mp_txrx_atb/dut/h_areset
add_fixpt_wave /mp_txrx_atb/sim/fromADC_I_stm 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/fromADC_Q_stm 12 0 signed
add wave -noupdate -divider {Output Ports}
add_fixpt_wave /mp_txrx_atb/dut/toDAC_I 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/toDAC_I_stm 12 0 signed
add_fixpt_wave /mp_txrx_atb/dut/toDAC_Q 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/toDAC_Q_stm 12 0 signed
add_fixpt_wave /mp_txrx_atb/dut/sym_phase 29 14 signed
add_fixpt_wave /mp_txrx_atb/sim/sym_phase_stm 29 14 signed
add wave -noupdate -format Logical /mp_txrx_atb/dut/BER
add wave -noupdate -format Logical /mp_txrx_atb/sim/BER_stm
add wave -noupdate -format Logical /mp_txrx_atb/dut/bit_error
add wave -noupdate -format Logical /mp_txrx_atb/sim/bit_error_stm
add_fixpt_wave /mp_txrx_atb/dut/sym_pwr 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/sym_pwr_stm 12 0 signed
add_fixpt_wave /mp_txrx_atb/dut/BBI 30 11 signed
add_fixpt_wave /mp_txrx_atb/sim/BBI_stm 30 11 signed
add_fixpt_wave /mp_txrx_atb/dut/BBQ 30 11 signed
add_fixpt_wave /mp_txrx_atb/sim/BBQ_stm 30 11 signed
add_fixpt_wave /mp_txrx_atb/dut/mem_o 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/mem_o_stm 12 0 signed
add wave -noupdate -format Logical /mp_txrx_atb/dut/bit_o
add wave -noupdate -format Logical /mp_txrx_atb/sim/bit_o_stm
add_fixpt_wave /mp_txrx_atb/dut/pow_rx 12 0 signed
add_fixpt_wave /mp_txrx_atb/sim/pow_rx_stm 12 0 signed
add_fixpt_wave /mp_txrx_atb/dut/pow_rx_preshift 25 0 signed
add_fixpt_wave /mp_txrx_atb/sim/pow_rx_preshift_stm 25 0 signed
add wave -noupdate -format Logical /mp_txrx_atb/dut/trigger
add wave -noupdate -format Logical /mp_txrx_atb/sim/trigger_stm
TreeUpdate [SetDefaultTree]
