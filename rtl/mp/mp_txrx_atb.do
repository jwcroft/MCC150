# pass in -Gquit_at_end=true to make vsim call exit at the end. Useful for running standalone.
quietly set quit_at_end 0
if {[lsearch $argv -Gquit_at_end=true] != -1} {
    quietly set quit_at_end 1
}

# set up quartus_dir variable for subsequent commands
if [info exists ::env(QUARTUS_ROOTDIR_OVERRIDE)] {
    quietly set quartus_dir $::env(QUARTUS_ROOTDIR_OVERRIDE)
} else {
    quietly set quartus_dir "C:/intelFPGA/18.0/quartus"
}

if {$argc > 0} {
    quietly set base_dir $1
} else {
    quietly set base_dir "C:/git_projects/MCC150/./rtl"
    echo The current directory is: [pwd]
}
quietly set base_dir [file normalize $base_dir]
echo Creating the project under $base_dir

onerror {resume}

if { [string compare [project env] ""] != 0 } {
    quit -sim
    project close
}

if {! [file exists $base_dir/mp_txrx]} {
    file delete -force $base_dir/mp_txrx
}

project new $base_dir mp_txrx
if {! [file exists $base_dir/work/_info]} {
    file delete -force $base_dir/work
    vlib work
}
quietly vmap work $base_dir/work


proc checkDepends {dst src} {
    if {! [file exists $dst]} { return 1 }
    if {[file mtime $dst] < [file mtime $src]} { return 1 }
    return 0
}

quietly set compile(altera) 0
if {[checkDepends $base_dir/altera/_info "$quartus_dir/eda/sim_lib/altera_primitives_components.vhd"]} {
    file delete -force $base_dir/altera
    vlib altera
    quietly set compile(altera) 1
}
quietly vmap altera $base_dir/altera
quietly set compile(altera_mf) 0
if {[checkDepends $base_dir/altera_mf/_info "$quartus_dir/eda/sim_lib/altera_mf_components.vhd"] || [checkDepends $base_dir/altera_mf/_info "$quartus_dir/eda/sim_lib/altera_mf.vhd"]} {
    file delete -force $base_dir/altera_mf
    vlib altera_mf
    quietly set compile(altera_mf) 1
}
quietly vmap altera_mf $base_dir/altera_mf
quietly set compile(lpm) 0
if {[checkDepends $base_dir/lpm/_info "$quartus_dir/eda/sim_lib/220pack.vhd"] || [checkDepends $base_dir/lpm/_info "$quartus_dir/eda/sim_lib/220model.vhd"]} {
    file delete -force $base_dir/lpm
    vlib lpm
    quietly set compile(lpm) 1
}
quietly vmap lpm $base_dir/lpm
quietly set compile(altera_lnsim) 0
if {[checkDepends $base_dir/altera_lnsim/_info "$quartus_dir/eda/sim_lib/altera_lnsim_components.vhd"] || [checkDepends $base_dir/altera_lnsim/_info "$quartus_dir/eda/sim_lib/altera_lnsim.sv"]} {
    file delete -force $base_dir/altera_lnsim
    vlib altera_lnsim
    quietly set compile(altera_lnsim) 1
}
quietly vmap altera_lnsim $base_dir/altera_lnsim
if {[info exists quartus_dir] && [file isdirectory $quartus_dir]} {
    if {$compile(altera)} {
        vcom -93 -quiet -work $base_dir/altera "$quartus_dir/eda/sim_lib/altera_primitives_components.vhd"
    }
    if {$compile(altera_mf)} {
        vcom -93 -quiet -work $base_dir/altera_mf "$quartus_dir/eda/sim_lib/altera_mf_components.vhd"
        vcom -93 -quiet -work $base_dir/altera_mf "$quartus_dir/eda/sim_lib/altera_mf.vhd"
    }
    if {$compile(lpm)} {
        vcom -93 -quiet -work $base_dir/lpm "$quartus_dir/eda/sim_lib/220pack.vhd"
        vcom -93 -quiet -work $base_dir/lpm "$quartus_dir/eda/sim_lib/220model.vhd"
    }
    if {$compile(altera_lnsim)} {
        vcom -93 -quiet -work $base_dir/altera_lnsim "$quartus_dir/eda/sim_lib/altera_lnsim_components.vhd"
        vlog -sv -quiet -work $base_dir/altera_lnsim "$quartus_dir/eda/sim_lib/altera_lnsim.sv"
    }
    do "$base_dir/mp/mp_txrx_fpc.do"
} else {
    echo QUARTUS not found. Not compiling libraries.
}


quietly set vcomfailed 0
onerror {
    quietly set vcomfailed 1
    resume
}

vcom -quiet $base_dir/mp/mp_txrx.vhd
vcom -quiet $base_dir/mp/mp_txrx_BER_Extraction.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView1.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView2.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView3.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView4.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView5.vhd
vcom -quiet $base_dir/mp/mp_txrx_ChanView6.vhd
vcom -quiet $base_dir/mp/mp_txrx_InterpolatingFIR.vhd
vcom -quiet $base_dir/mp/mp_txrx_Memory.vhd
vcom -quiet $base_dir/mp/mp_txrx_Pwr_extraction.vhd
vcom -quiet $base_dir/mp/mp_txrx_Scale.vhd
vcom -quiet $base_dir/mp/mp_txrx_Scale1.vhd
vcom -quiet $base_dir/mp/mp_txrx_Scale2_Q.vhd
vcom -quiet $base_dir/mp/mp_txrx_Scale3_I.vhd
vcom -quiet $base_dir/mp/mp_txrx_SingleRateFIR1_Q.vhd
vcom -quiet $base_dir/mp/mp_txrx_SingleRateFIR_I.vhd
vcom -quiet $base_dir/mp/mp_txrx_Symbol_Recovery.vhd
vcom -quiet -O0 $base_dir/mp/mp_txrx_atb.vhd
vcom -quiet $base_dir/mp/mp_txrx_stm.vhd

onerror {resume}

proc report_mismatch {signal cycle} {
    puts "Mismatch in ${signal} at system clock cycle ${cycle}"
    set modelsimvalue [examine ${signal}_dut];
    set stmvalue [examine ${signal}_stm];
    puts "\t${signal} (ModelSim):\t${modelsimvalue}"
    puts "\t${signal} (Simulink):\t${stmvalue}"
}

if {$vcomfailed == 0} {
    onbreak {
        quietly set my_tb [string trim [tb]];
        quietly set regOK [regexp {(.*) ([0-9]+) ([\[address]*) ([.]*)} $my_tb \ match atbfile linenum ignore_this];
        if {$regOK == 1} {
            quietly set simtime [expr $now - 200];
            quietly set cyclenum [expr int($simtime / 25000.000000)];
            if { [catch {exa mismatch_toDAC_I} mismatch] == 0 && $mismatch } {
                report_mismatch toDAC_I $cyclenum
            }
            if { [catch {exa mismatch_toDAC_Q} mismatch] == 0 && $mismatch } {
                report_mismatch toDAC_Q $cyclenum
            }
            if { [catch {exa mismatch_sym_phase} mismatch] == 0 && $mismatch } {
                report_mismatch sym_phase $cyclenum
            }
            if { [catch {exa mismatch_BER} mismatch] == 0 && $mismatch } {
                report_mismatch BER $cyclenum
            }
            if { [catch {exa mismatch_bit_error} mismatch] == 0 && $mismatch } {
                report_mismatch bit_error $cyclenum
            }
            if { [catch {exa mismatch_sym_pwr} mismatch] == 0 && $mismatch } {
                report_mismatch sym_pwr $cyclenum
            }
            if { [catch {exa mismatch_BBI} mismatch] == 0 && $mismatch } {
                report_mismatch BBI $cyclenum
            }
            if { [catch {exa mismatch_BBQ} mismatch] == 0 && $mismatch } {
                report_mismatch BBQ $cyclenum
            }
            if { [catch {exa mismatch_mem_o} mismatch] == 0 && $mismatch } {
                report_mismatch mem_o $cyclenum
            }
            if { [catch {exa mismatch_bit_o} mismatch] == 0 && $mismatch } {
                report_mismatch bit_o $cyclenum
            }
            if { [catch {exa mismatch_pow_rx} mismatch] == 0 && $mismatch } {
                report_mismatch pow_rx $cyclenum
            }
            if { [catch {exa mismatch_pow_rx_preshift} mismatch] == 0 && $mismatch } {
                report_mismatch pow_rx_preshift $cyclenum
            }
            if { [catch {exa mismatch_trigger} mismatch] == 0 && $mismatch } {
                report_mismatch trigger $cyclenum
            }
        } else {
            puts "Signal mismatch detected at $my_tb";
        }
        if {$quit_at_end == 1} {
            quit -code 1;
        }
    }
    vsim -quiet -error 3473 -msgmode both -voptargs="+acc" -t ps mp_txrx_atb 
    do $base_dir/mp/mp_txrx_atb.wav.do
# Disable some warnings that occur at the very start of simulation
    quietly set StdArithNoWarnings 1
    run 0ns
    quietly set StdArithNoWarnings 0
    run -all
} else {
    echo At least one module failed to compile, not starting simulation
}

if {$quit_at_end == 1} {
    exit
}
