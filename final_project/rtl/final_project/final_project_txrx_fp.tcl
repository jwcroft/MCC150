# This is the top level tcl file for 'final_project_txrx_fp'

package require ::quartus::project

set overwrite_opt 0
set compile_opt 1

foreach arg $argv {
    switch $arg {
        overwrite { set overwrite_opt 1 }
        no_compile { set compile_opt 0 }
        default { puts "got unknown command: $arg" }
    }
}

if {!$overwrite_opt && [project_exists final_project_txrx_fp]} {
    puts "The final_project_txrx_fp quartus project already exists."
    puts "Use 'overwrite option' to force project to be over-written/"
} elseif {![file exists "./rtl/final_project/final_project_txrx_fp.tcl"]}    {
    puts "You must run final_project_txrx_fp.tcl "
    puts "from the ../quartus directory or else "
    puts "some of the dependant scripts won't be found."
    puts "The current directory is:" 
    puts [pwd]
    error "Exiting..."
} 

set quartus_dir $::env(QUARTUS_ROOTDIR)
puts "Creating final_project_txrx_fp Quartus project..."

if $overwrite_opt {
    project_new -overwrite final_project_txrx_fp
} else {
    project_new final_project_txrx_fp
}

set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name TOP_LEVEL_ENTITY final_project_txrx_fp
set_global_assignment -name DEVICE 5CSXFC6D6F31C6
set_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER ON
set_global_assignment -name SDC_FILE ./rtl/final_project/final_project_txrx_fp.sdc
source ./rtl/final_project/final_project_txrx_fp.add.tcl

set_instance_assignment -name VIRTUAL_PIN ON -to ADC_I
set_instance_assignment -name VIRTUAL_PIN ON -to ADC_Q
set_instance_assignment -name VIRTUAL_PIN ON -to Reset
set_instance_assignment -name VIRTUAL_PIN ON -to DAC_I
set_instance_assignment -name VIRTUAL_PIN ON -to DAC_Q
set_instance_assignment -name VIRTUAL_PIN ON -to mem_o
set_instance_assignment -name VIRTUAL_PIN ON -to BBI
set_instance_assignment -name VIRTUAL_PIN ON -to BBQ
set_instance_assignment -name VIRTUAL_PIN ON -to rx_bits
set_instance_assignment -name VIRTUAL_PIN ON -to mem_read_bits
set_instance_assignment -name VIRTUAL_PIN ON -to sym_phase
set_instance_assignment -name VIRTUAL_PIN ON -to left_power
set_instance_assignment -name VIRTUAL_PIN ON -to main_power
set_instance_assignment -name VIRTUAL_PIN ON -to right_power

source "./rtl/final_project/final_project_txrx_fp_fpc.add.tcl"


if $compile_opt {
    package require ::quartus::flow
    puts "Running Compile flow..."
    execute_flow -compile

    package require ::quartus::report 

    # The output you get out of this script
    # is two lines of CSV formatted data (header line 1, real data line 2)
    # followed by the critical path

    load_report

    proc print_csv {expr} {
        regsub -all , $expr {} out
        regsub -all { .*} $out {} final
        if [string match $final ""] {
            # If quartus failed to find any value here, report -1
            set final -1
        }
        puts -nonewline $final
        puts -nonewline ","
    }

    create_timing_netlist -model slow
    read_sdc
    update_timing_netlist
    set clk_fmaxinfo [get_clock_fmax_info]

    puts "Extracting key data from report..."
    puts "Logic,ALM_Logic_Regs,ALM_Logic,ALM_Regs,ALM_Mem,Comb_Aluts,Comb_ALUT_Logic,Comb_ALUT_Route,Mem_ALUT,Regs,Regs_1,Regs_2,ALM,DSP,Mem_Bits,MLAB_Bits,M10K,IO,FMax,Slack,Required"
    print_csv [get_fitter_resource_usage -resource "*Logic utilization*"]
    print_csv [get_fitter_resource_usage -resource "*ALMs*LUT logic*register*"]
    print_csv [get_fitter_resource_usage -resource "*b*ALMs*LUT logic*"]
    print_csv [get_fitter_resource_usage -resource "*ALMs*for register*"]
    print_csv [get_fitter_resource_usage -resource "*ALMs*memory*"]
    print_csv [get_fitter_resource_usage -resource "*Combinational ALUTs*logic*"]
    print_csv [get_fitter_resource_usage -resource "*Combinational ALUT usage*logic*"]
    print_csv [get_fitter_resource_usage -resource "*Combinational ALUT usage*route*"]
    print_csv [get_fitter_resource_usage -resource "*Memory ALUT usage*"]
    print_csv [get_fitter_resource_usage -resource "*Dedicated logic registers*"]
    print_csv [get_fitter_resource_usage -resource "*Primary logic registers*"]
    print_csv [get_fitter_resource_usage -resource "*Secondary logic registers*"]
    print_csv [get_fitter_resource_usage -alm]
    print_csv [get_fitter_resource_usage -resource "*DSP Block*"]
    print_csv [get_fitter_resource_usage -resource "*Total block memory bits*"]
    print_csv [get_fitter_resource_usage -resource "*Total MLAB memory bits*"]
    print_csv [get_fitter_resource_usage -resource "*M10K*"]
    print_csv [get_fitter_resource_usage -used -io_pin]

    set family [get_report_panel_data -name {Flow Summary} -col 1 -row_name Family]
    set device Unknown
    set fmax -1
    set restricted_fmax -1
    set clk {clk}

    foreach clkinfo $clk_fmaxinfo {
        if ([string equal $clk [lindex $clkinfo 0] ]) {
            set fmax [lindex $clkinfo 1]
            set restricted_fmax [lindex $clkinfo 2]
        }
    }

    set slack None
    set required_fmax Unavailable
    if {[string is double $restricted_fmax] && [expr {$restricted_fmax >= 0.0}]} {
        set required_period [get_clock_info -period $clk]
        set slack [expr {$required_period - 1000.0 / $fmax}]
        set required_fmax [expr {1000.0 / $required_period}]
    } else {
        set required_period Unavailable
    }

    print_csv $restricted_fmax
    print_csv $slack
    print_csv $required_fmax
    print_csv $fmax

    puts ""

    puts "FAMILY $family"
    puts "DEVICE $device"
    puts "TIMING PATH"
    set cpi 0
    foreach_in_collection path [get_timing_paths -npaths 1 -setup -pairs_only] {
        set from [get_node_info -name [get_path_info $path -from]]
        set to [get_node_info -name [get_path_info $path -to]]
        file delete cpath$cpi.fit
        report_timing -from_clock $clk -to_clock $clk -from $from -to $to -setup -npaths 1 -show_routing -detail full_path -file cpath$cpi.fit
        set ignore [catch {
          set f [open cpath$cpi.fit]
          puts [read $f]}]
        incr cpi
    }
}

project_close

