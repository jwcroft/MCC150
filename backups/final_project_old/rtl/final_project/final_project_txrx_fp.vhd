-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from final_project_txrx_fp
-- VHDL created on Fri May 24 15:27:34 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity final_project_txrx_fp is
    port (
        busIn_writedata : in std_logic_vector(15 downto 0);  -- ufix16
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- ufix16
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        ADC_I : in std_logic_vector(11 downto 0);  -- sfix12
        ADC_Q : in std_logic_vector(11 downto 0);  -- sfix12
        Reset : in std_logic_vector(63 downto 0);  -- float64_m52
        DAC_I : out std_logic_vector(11 downto 0);  -- sfix12
        DAC_Q : out std_logic_vector(11 downto 0);  -- sfix12
        mem_o : out std_logic_vector(0 downto 0);  -- ufix1
        BBI : out std_logic_vector(27 downto 0);  -- sfix28_en10
        BBQ : out std_logic_vector(27 downto 0);  -- sfix28_en10
        ma_0 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_1 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_2 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_3 : out std_logic_vector(24 downto 0);  -- sfix25
        ma_4 : out std_logic_vector(24 downto 0);  -- sfix25
        ma_5 : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end final_project_txrx_fp;

architecture normal of final_project_txrx_fp is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component final_project_txrx_fp_8_PSK_Mapper is
        port (
            in_1_bit_stream : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_2_dv : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_3_dc : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_1_symbol_I : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_2_symbol_Q : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_3_qv : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_4_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_ChanView is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(11 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_ChanView1 is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(11 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_ChanView2 is
        port (
            xIn_0 : in std_logic_vector(27 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(27 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_ChanView3 is
        port (
            xIn_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_ChanView4 is
        port (
            xIn_0 : in std_logic_vector(27 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(27 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_InterpolatingFIR is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(24 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_InterpolatingFIR1 is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(24 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Memory is
        port (
            in_1_dv : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_2_dc : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_3_trigger_rx : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_4_dc1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_1_mem_tx : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_2_qv : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_3_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_4_mem_rx : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_5_qv1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_6_qc1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Power_extraction is
        port (
            in_1_left_I : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_2_left_Q : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_3_main_I : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_4_main_Q : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_5_right_I : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_6_right_Q : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_7_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_8_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_1_qv : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_2_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_3_left_power : out std_logic_vector(24 downto 0);  -- Fixed Point
            out_4_main_power : out std_logic_vector(24 downto 0);  -- Fixed Point
            out_5_right_power : out std_logic_vector(24 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale is
        port (
            xIn_0 : in std_logic_vector(24 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale1 is
        port (
            xIn_0 : in std_logic_vector(24 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale2_Q is
        port (
            xIn_0 : in std_logic_vector(27 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I is
        port (
            xIn_0 : in std_logic_vector(27 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I1 is
        port (
            xIn_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I2 is
        port (
            xIn_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I3 is
        port (
            xIn_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I4 is
        port (
            xIn_0 : in std_logic_vector(24 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(17 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I5 is
        port (
            xIn_0 : in std_logic_vector(24 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(17 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Scale3_I6 is
        port (
            xIn_0 : in std_logic_vector(24 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(17 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_SingleRateFIR is
        port (
            xIn_0 : in std_logic_vector(17 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_SingleRateFIR1 is
        port (
            xIn_0 : in std_logic_vector(17 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_SingleRateFIR2 is
        port (
            xIn_0 : in std_logic_vector(17 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_SingleRateFIR_I is
        port (
            busIn_writedata : in std_logic_vector(15 downto 0);  -- Fixed Point
            busIn_address : in std_logic_vector(9 downto 0);  -- Fixed Point
            busIn_write : in std_logic_vector(0 downto 0);  -- Fixed Point
            busIn_read : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            busOut_readdata : out std_logic_vector(15 downto 0);  -- Fixed Point
            busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(27 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic;
            h_areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_SingleRateFIR_Q is
        port (
            busIn_writedata : in std_logic_vector(15 downto 0);  -- Fixed Point
            busIn_address : in std_logic_vector(9 downto 0);  -- Fixed Point
            busIn_write : in std_logic_vector(0 downto 0);  -- Fixed Point
            busIn_read : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            busOut_readdata : out std_logic_vector(15 downto 0);  -- Fixed Point
            busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(27 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic;
            h_areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Symbol_recovery is
        port (
            in_1_in_I : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_2_in_Q : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_3_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_4_sample_crement : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_5_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_6_v_sample_update : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_1_left_I : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_2_left_Q : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_3_qv : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_4_main_I : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_5_main_Q : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_6_right_I : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_7_right_Q : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_8_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_9_packet_trigger : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component final_project_txrx_fp_Symbol_sample_adaptation is
        port (
            in_1_left_power : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_2_main_power : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_3_right_power : in std_logic_vector(11 downto 0);  -- Fixed Point
            in_4_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_5_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_1_v_sample_update : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_2_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_3_sample_crement : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_4_sym_sample : out std_logic_vector(1 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal num8_PSK_Mapper_x_out_1_symbol_I : STD_LOGIC_VECTOR (11 downto 0);
    signal num8_PSK_Mapper_x_out_2_symbol_Q : STD_LOGIC_VECTOR (11 downto 0);
    signal num8_PSK_Mapper_x_out_3_qv : STD_LOGIC_VECTOR (0 downto 0);
    signal num8_PSK_Mapper_x_out_4_qc : STD_LOGIC_VECTOR (7 downto 0);
    signal ChanView_c0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ChanView1_c0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ChanView2_c0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal ChanView3_c0_o : STD_LOGIC_VECTOR (0 downto 0);
    signal ChanView4_c0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal Channel_q : STD_LOGIC_VECTOR (7 downto 0);
    signal InterpolatingFIR_xOut_0 : STD_LOGIC_VECTOR (24 downto 0);
    signal InterpolatingFIR_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal InterpolatingFIR_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal InterpolatingFIR1_xOut_0 : STD_LOGIC_VECTOR (24 downto 0);
    signal InterpolatingFIR1_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal InterpolatingFIR1_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Memory_out_1_mem_tx : STD_LOGIC_VECTOR (0 downto 0);
    signal Memory_out_2_qv : STD_LOGIC_VECTOR (0 downto 0);
    signal Memory_out_3_qc : STD_LOGIC_VECTOR (7 downto 0);
    signal Power_extraction_x_out_1_qv : STD_LOGIC_VECTOR (0 downto 0);
    signal Power_extraction_x_out_2_qc : STD_LOGIC_VECTOR (7 downto 0);
    signal Power_extraction_x_out_3_left_power : STD_LOGIC_VECTOR (24 downto 0);
    signal Power_extraction_x_out_4_main_power : STD_LOGIC_VECTOR (24 downto 0);
    signal Power_extraction_x_out_5_right_power : STD_LOGIC_VECTOR (24 downto 0);
    signal SampleDelay1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal SampleDelay3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Scale1_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale1_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale1_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Scale2_Q_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale2_Q_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale2_Q_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Scale3_I_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale3_I1_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale3_I2_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale3_I3_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale3_I4_qOut_0 : STD_LOGIC_VECTOR (17 downto 0);
    signal Scale3_I4_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale3_I4_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Scale3_I5_qOut_0 : STD_LOGIC_VECTOR (17 downto 0);
    signal Scale3_I5_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale3_I5_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Scale3_I6_qOut_0 : STD_LOGIC_VECTOR (17 downto 0);
    signal Scale3_I6_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale3_I6_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR_xOut_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SingleRateFIR_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR1_xOut_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SingleRateFIR1_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR1_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR2_xOut_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SingleRateFIR2_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR2_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR_I_busOut_readdata : STD_LOGIC_VECTOR (15 downto 0);
    signal SingleRateFIR_I_busOut_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_I_xOut_0 : STD_LOGIC_VECTOR (27 downto 0);
    signal SingleRateFIR_I_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_I_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR_Q_busOut_readdata : STD_LOGIC_VECTOR (15 downto 0);
    signal SingleRateFIR_Q_busOut_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_Q_xOut_0 : STD_LOGIC_VECTOR (27 downto 0);
    signal SingleRateFIR_Q_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_Q_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Symbol_recovery_x_out_1_left_I : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_2_left_Q : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_3_qv : STD_LOGIC_VECTOR (0 downto 0);
    signal Symbol_recovery_x_out_4_main_I : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_5_main_Q : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_6_right_I : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_7_right_Q : STD_LOGIC_VECTOR (11 downto 0);
    signal Symbol_recovery_x_out_8_qc : STD_LOGIC_VECTOR (7 downto 0);
    signal Symbol_sample_adaptation_x_out_1_v_sample_update : STD_LOGIC_VECTOR (0 downto 0);
    signal Symbol_sample_adaptation_x_out_3_sample_crement : STD_LOGIC_VECTOR (1 downto 0);
    signal bus_selector_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bus_selector_v : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_readDelayed_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_readDataValid_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Channel(CONSTANT,12)
    Channel_q <= "00000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SingleRateFIR_Q(BLACKBOX,34)
    theSingleRateFIR_Q : final_project_txrx_fp_SingleRateFIR_Q
    PORT MAP (
        busIn_writedata => busIn_writedata,
        busIn_address => busIn_address,
        busIn_write => busIn_write,
        busIn_read => busIn_read,
        xIn_0 => ADC_Q,
        xIn_v => VCC_q,
        xIn_c => Channel_q,
        busOut_readdata => SingleRateFIR_Q_busOut_readdata,
        busOut_readdatavalid => SingleRateFIR_Q_busOut_readdatavalid,
        xOut_0 => SingleRateFIR_Q_xOut_0,
        xOut_v => SingleRateFIR_Q_xOut_v,
        xOut_c => SingleRateFIR_Q_xOut_c,
        clk => clk,
        areset => areset,
        h_areset => h_areset
    );

    -- SingleRateFIR_I(BLACKBOX,33)
    theSingleRateFIR_I : final_project_txrx_fp_SingleRateFIR_I
    PORT MAP (
        busIn_writedata => busIn_writedata,
        busIn_address => busIn_address,
        busIn_write => busIn_write,
        busIn_read => busIn_read,
        xIn_0 => ADC_I,
        xIn_v => VCC_q,
        xIn_c => Channel_q,
        busOut_readdata => SingleRateFIR_I_busOut_readdata,
        busOut_readdatavalid => SingleRateFIR_I_busOut_readdatavalid,
        xOut_0 => SingleRateFIR_I_xOut_0,
        xOut_v => SingleRateFIR_I_xOut_v,
        xOut_c => SingleRateFIR_I_xOut_c,
        clk => clk,
        areset => areset,
        h_areset => h_areset
    );

    -- bus_selector(SELECTOR,41)
    bus_selector_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            bus_selector_q <= (others => '0');
            bus_selector_v <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            bus_selector_q <= STD_LOGIC_VECTOR("000000000000000" & GND_q);
            bus_selector_v <= "0";
            IF (SingleRateFIR_Q_busOut_readdatavalid = "1") THEN
                bus_selector_q <= SingleRateFIR_Q_busOut_readdata;
                bus_selector_v <= "1";
            END IF;
            IF (SingleRateFIR_I_busOut_readdatavalid = "1") THEN
                bus_selector_q <= SingleRateFIR_I_busOut_readdata;
                bus_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_readDelayed(DELAY,66)
    final_project_txrx_fp_readDelayed : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_read, xout => final_project_txrx_fp_readDelayed_q, clk => clk, aclr => h_areset );

    -- final_project_txrx_fp_readDataValid(LOGICAL,67)
    final_project_txrx_fp_readDataValid_q <= bus_selector_v or final_project_txrx_fp_readDelayed_q;

    -- busOut(BUSOUT,40)
    busOut_readdatavalid <= final_project_txrx_fp_readDataValid_q;
    busOut_readdata <= bus_selector_q;
    busOut_waitrequest <= GND_q;

    -- Memory(BLACKBOX,16)
    theMemory : final_project_txrx_fp_Memory
    PORT MAP (
        in_1_dv => VCC_q,
        in_2_dc => Channel_q,
        in_3_trigger_rx => GND_q,
        in_4_dc1 => Channel_q,
        out_1_mem_tx => Memory_out_1_mem_tx,
        out_2_qv => Memory_out_2_qv,
        out_3_qc => Memory_out_3_qc,
        clk => clk,
        areset => areset
    );

    -- num8_PSK_Mapper_x(BLACKBOX,6)
    thenum8_PSK_Mapper_x : final_project_txrx_fp_8_PSK_Mapper
    PORT MAP (
        in_1_bit_stream => Memory_out_1_mem_tx,
        in_2_dv => Memory_out_2_qv,
        in_3_dc => Memory_out_3_qc,
        out_1_symbol_I => num8_PSK_Mapper_x_out_1_symbol_I,
        out_2_symbol_Q => num8_PSK_Mapper_x_out_2_symbol_Q,
        out_3_qv => num8_PSK_Mapper_x_out_3_qv,
        out_4_qc => num8_PSK_Mapper_x_out_4_qc,
        clk => clk,
        areset => areset
    );

    -- InterpolatingFIR(BLACKBOX,14)
    theInterpolatingFIR : final_project_txrx_fp_InterpolatingFIR
    PORT MAP (
        xIn_0 => num8_PSK_Mapper_x_out_1_symbol_I,
        xIn_v => num8_PSK_Mapper_x_out_3_qv,
        xIn_c => num8_PSK_Mapper_x_out_4_qc,
        xOut_0 => InterpolatingFIR_xOut_0,
        xOut_v => InterpolatingFIR_xOut_v,
        xOut_c => InterpolatingFIR_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale(BLACKBOX,20)
    theScale : final_project_txrx_fp_Scale
    PORT MAP (
        xIn_0 => InterpolatingFIR_xOut_0,
        xIn_v => InterpolatingFIR_xOut_v,
        xIn_c => InterpolatingFIR_xOut_c,
        qOut_0 => Scale_qOut_0,
        qOut_v => Scale_qOut_v,
        qOut_c => Scale_qOut_c,
        clk => clk,
        areset => areset
    );

    -- ChanView(BLACKBOX,7)
    theChanView : final_project_txrx_fp_ChanView
    PORT MAP (
        xIn_0 => Scale_qOut_0,
        xIn_v => Scale_qOut_v,
        xIn_c => Scale_qOut_c,
        c0_o => ChanView_c0_o,
        clk => clk,
        areset => areset
    );

    -- DAC_I(GPOUT,46)
    DAC_I <= ChanView_c0_o;

    -- InterpolatingFIR1(BLACKBOX,15)
    theInterpolatingFIR1 : final_project_txrx_fp_InterpolatingFIR1
    PORT MAP (
        xIn_0 => num8_PSK_Mapper_x_out_2_symbol_Q,
        xIn_v => num8_PSK_Mapper_x_out_3_qv,
        xIn_c => num8_PSK_Mapper_x_out_4_qc,
        xOut_0 => InterpolatingFIR1_xOut_0,
        xOut_v => InterpolatingFIR1_xOut_v,
        xOut_c => InterpolatingFIR1_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale1(BLACKBOX,21)
    theScale1 : final_project_txrx_fp_Scale1
    PORT MAP (
        xIn_0 => InterpolatingFIR1_xOut_0,
        xIn_v => InterpolatingFIR1_xOut_v,
        xIn_c => InterpolatingFIR1_xOut_c,
        qOut_0 => Scale1_qOut_0,
        qOut_v => Scale1_qOut_v,
        qOut_c => Scale1_qOut_c,
        clk => clk,
        areset => areset
    );

    -- ChanView1(BLACKBOX,8)
    theChanView1 : final_project_txrx_fp_ChanView1
    PORT MAP (
        xIn_0 => Scale1_qOut_0,
        xIn_v => Scale1_qOut_v,
        xIn_c => Scale1_qOut_c,
        c0_o => ChanView1_c0_o,
        clk => clk,
        areset => areset
    );

    -- DAC_Q(GPOUT,47)
    DAC_Q <= ChanView1_c0_o;

    -- ChanView3(BLACKBOX,10)
    theChanView3 : final_project_txrx_fp_ChanView3
    PORT MAP (
        xIn_0 => Memory_out_1_mem_tx,
        xIn_v => Memory_out_2_qv,
        xIn_c => Memory_out_3_qc,
        c0_o => ChanView3_c0_o,
        clk => clk,
        areset => areset
    );

    -- mem_o(GPOUT,48)
    mem_o <= ChanView3_c0_o;

    -- ChanView2(BLACKBOX,9)
    theChanView2 : final_project_txrx_fp_ChanView2
    PORT MAP (
        xIn_0 => SingleRateFIR_I_xOut_0,
        xIn_v => SingleRateFIR_I_xOut_v,
        xIn_c => SingleRateFIR_I_xOut_c,
        c0_o => ChanView2_c0_o,
        clk => clk,
        areset => areset
    );

    -- BBI(GPOUT,49)
    BBI <= ChanView2_c0_o;

    -- ChanView4(BLACKBOX,11)
    theChanView4 : final_project_txrx_fp_ChanView4
    PORT MAP (
        xIn_0 => SingleRateFIR_Q_xOut_0,
        xIn_v => SingleRateFIR_Q_xOut_v,
        xIn_c => SingleRateFIR_Q_xOut_c,
        c0_o => ChanView4_c0_o,
        clk => clk,
        areset => areset
    );

    -- BBQ(GPOUT,50)
    BBQ <= ChanView4_c0_o;

    -- Scale3_I6(BLACKBOX,29)
    theScale3_I6 : final_project_txrx_fp_Scale3_I6
    PORT MAP (
        xIn_0 => Power_extraction_x_out_5_right_power,
        xIn_v => Power_extraction_x_out_1_qv,
        xIn_c => Power_extraction_x_out_2_qc,
        qOut_0 => Scale3_I6_qOut_0,
        qOut_v => Scale3_I6_qOut_v,
        qOut_c => Scale3_I6_qOut_c,
        clk => clk,
        areset => areset
    );

    -- SingleRateFIR2(BLACKBOX,32)
    theSingleRateFIR2 : final_project_txrx_fp_SingleRateFIR2
    PORT MAP (
        xIn_0 => Scale3_I6_qOut_0,
        xIn_v => Scale3_I6_qOut_v,
        xIn_c => Scale3_I6_qOut_c,
        xOut_0 => SingleRateFIR2_xOut_0,
        xOut_v => SingleRateFIR2_xOut_v,
        xOut_c => SingleRateFIR2_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale3_I3(BLACKBOX,26)
    theScale3_I3 : final_project_txrx_fp_Scale3_I3
    PORT MAP (
        xIn_0 => SingleRateFIR2_xOut_0,
        xIn_v => SingleRateFIR2_xOut_v,
        xIn_c => SingleRateFIR2_xOut_c,
        qOut_0 => Scale3_I3_qOut_0,
        clk => clk,
        areset => areset
    );

    -- Scale3_I5(BLACKBOX,28)
    theScale3_I5 : final_project_txrx_fp_Scale3_I5
    PORT MAP (
        xIn_0 => Power_extraction_x_out_4_main_power,
        xIn_v => Power_extraction_x_out_1_qv,
        xIn_c => Power_extraction_x_out_2_qc,
        qOut_0 => Scale3_I5_qOut_0,
        qOut_v => Scale3_I5_qOut_v,
        qOut_c => Scale3_I5_qOut_c,
        clk => clk,
        areset => areset
    );

    -- SingleRateFIR(BLACKBOX,30)
    theSingleRateFIR : final_project_txrx_fp_SingleRateFIR
    PORT MAP (
        xIn_0 => Scale3_I5_qOut_0,
        xIn_v => Scale3_I5_qOut_v,
        xIn_c => Scale3_I5_qOut_c,
        xOut_0 => SingleRateFIR_xOut_0,
        xOut_v => SingleRateFIR_xOut_v,
        xOut_c => SingleRateFIR_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale3_I2(BLACKBOX,25)
    theScale3_I2 : final_project_txrx_fp_Scale3_I2
    PORT MAP (
        xIn_0 => SingleRateFIR_xOut_0,
        xIn_v => SingleRateFIR_xOut_v,
        xIn_c => SingleRateFIR_xOut_c,
        qOut_0 => Scale3_I2_qOut_0,
        clk => clk,
        areset => areset
    );

    -- Symbol_sample_adaptation_x(BLACKBOX,36)
    theSymbol_sample_adaptation_x : final_project_txrx_fp_Symbol_sample_adaptation
    PORT MAP (
        in_1_left_power => Scale3_I1_qOut_0,
        in_2_main_power => Scale3_I2_qOut_0,
        in_3_right_power => Scale3_I3_qOut_0,
        in_4_v => Power_extraction_x_out_1_qv,
        in_5_c => Power_extraction_x_out_2_qc,
        out_1_v_sample_update => Symbol_sample_adaptation_x_out_1_v_sample_update,
        out_3_sample_crement => Symbol_sample_adaptation_x_out_3_sample_crement,
        clk => clk,
        areset => areset
    );

    -- SampleDelay3(DELAY,19)
    SampleDelay3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Symbol_sample_adaptation_x_out_1_v_sample_update, xout => SampleDelay3_q, clk => clk, aclr => areset );

    -- SampleDelay1(DELAY,18)
    SampleDelay1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Symbol_sample_adaptation_x_out_3_sample_crement, xout => SampleDelay1_q, clk => clk, aclr => areset );

    -- Scale2_Q(BLACKBOX,22)
    theScale2_Q : final_project_txrx_fp_Scale2_Q
    PORT MAP (
        xIn_0 => SingleRateFIR_Q_xOut_0,
        xIn_v => SingleRateFIR_Q_xOut_v,
        xIn_c => SingleRateFIR_Q_xOut_c,
        qOut_0 => Scale2_Q_qOut_0,
        qOut_v => Scale2_Q_qOut_v,
        qOut_c => Scale2_Q_qOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale3_I(BLACKBOX,23)
    theScale3_I : final_project_txrx_fp_Scale3_I
    PORT MAP (
        xIn_0 => SingleRateFIR_I_xOut_0,
        xIn_v => SingleRateFIR_I_xOut_v,
        xIn_c => SingleRateFIR_I_xOut_c,
        qOut_0 => Scale3_I_qOut_0,
        clk => clk,
        areset => areset
    );

    -- Symbol_recovery_x(BLACKBOX,35)
    theSymbol_recovery_x : final_project_txrx_fp_Symbol_recovery
    PORT MAP (
        in_1_in_I => Scale3_I_qOut_0,
        in_2_in_Q => Scale2_Q_qOut_0,
        in_3_v => Scale2_Q_qOut_v,
        in_4_sample_crement => SampleDelay1_q,
        in_5_c => Scale2_Q_qOut_c,
        in_6_v_sample_update => SampleDelay3_q,
        out_1_left_I => Symbol_recovery_x_out_1_left_I,
        out_2_left_Q => Symbol_recovery_x_out_2_left_Q,
        out_3_qv => Symbol_recovery_x_out_3_qv,
        out_4_main_I => Symbol_recovery_x_out_4_main_I,
        out_5_main_Q => Symbol_recovery_x_out_5_main_Q,
        out_6_right_I => Symbol_recovery_x_out_6_right_I,
        out_7_right_Q => Symbol_recovery_x_out_7_right_Q,
        out_8_qc => Symbol_recovery_x_out_8_qc,
        clk => clk,
        areset => areset
    );

    -- Power_extraction_x(BLACKBOX,17)
    thePower_extraction_x : final_project_txrx_fp_Power_extraction
    PORT MAP (
        in_1_left_I => Symbol_recovery_x_out_1_left_I,
        in_2_left_Q => Symbol_recovery_x_out_2_left_Q,
        in_3_main_I => Symbol_recovery_x_out_4_main_I,
        in_4_main_Q => Symbol_recovery_x_out_5_main_Q,
        in_5_right_I => Symbol_recovery_x_out_6_right_I,
        in_6_right_Q => Symbol_recovery_x_out_7_right_Q,
        in_7_v => Symbol_recovery_x_out_3_qv,
        in_8_c => Symbol_recovery_x_out_8_qc,
        out_1_qv => Power_extraction_x_out_1_qv,
        out_2_qc => Power_extraction_x_out_2_qc,
        out_3_left_power => Power_extraction_x_out_3_left_power,
        out_4_main_power => Power_extraction_x_out_4_main_power,
        out_5_right_power => Power_extraction_x_out_5_right_power,
        clk => clk,
        areset => areset
    );

    -- Scale3_I4(BLACKBOX,27)
    theScale3_I4 : final_project_txrx_fp_Scale3_I4
    PORT MAP (
        xIn_0 => Power_extraction_x_out_3_left_power,
        xIn_v => Power_extraction_x_out_1_qv,
        xIn_c => Power_extraction_x_out_2_qc,
        qOut_0 => Scale3_I4_qOut_0,
        qOut_v => Scale3_I4_qOut_v,
        qOut_c => Scale3_I4_qOut_c,
        clk => clk,
        areset => areset
    );

    -- SingleRateFIR1(BLACKBOX,31)
    theSingleRateFIR1 : final_project_txrx_fp_SingleRateFIR1
    PORT MAP (
        xIn_0 => Scale3_I4_qOut_0,
        xIn_v => Scale3_I4_qOut_v,
        xIn_c => Scale3_I4_qOut_c,
        xOut_0 => SingleRateFIR1_xOut_0,
        xOut_v => SingleRateFIR1_xOut_v,
        xOut_c => SingleRateFIR1_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale3_I1(BLACKBOX,24)
    theScale3_I1 : final_project_txrx_fp_Scale3_I1
    PORT MAP (
        xIn_0 => SingleRateFIR1_xOut_0,
        xIn_v => SingleRateFIR1_xOut_v,
        xIn_c => SingleRateFIR1_xOut_c,
        qOut_0 => Scale3_I1_qOut_0,
        clk => clk,
        areset => areset
    );

    -- ma_0(GPOUT,51)
    ma_0 <= Scale3_I1_qOut_0;

    -- ma_1(GPOUT,52)
    ma_1 <= Scale3_I2_qOut_0;

    -- ma_2(GPOUT,53)
    ma_2 <= Scale3_I3_qOut_0;

    -- ma_3(GPOUT,54)
    ma_3 <= Power_extraction_x_out_3_left_power;

    -- ma_4(GPOUT,55)
    ma_4 <= Power_extraction_x_out_4_main_power;

    -- ma_5(GPOUT,56)
    ma_5 <= Power_extraction_x_out_5_right_power;

END normal;
