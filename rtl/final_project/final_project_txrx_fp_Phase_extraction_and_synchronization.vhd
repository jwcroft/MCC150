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

-- VHDL created from final_project_txrx_fp_Phase_extraction_and_synchronization
-- VHDL created on Mon May 27 20:44:42 2019


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

entity final_project_txrx_fp_Phase_extraction_and_synchronization is
    port (
        in_9_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_10_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_left_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_left_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_3_main_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_4_main_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_5_right_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_6_right_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_7_packet_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_8_sym_sample : in std_logic_vector(1 downto 0);  -- ufix2
        in_11_sample_update : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_v_sym_update : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_symbols_phase_x : out std_logic_vector(29 downto 0);  -- sfix30_en14
        out_4_packet_trigger_through : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_Phase_extraction_and_synchronization;

architecture normal of final_project_txrx_fp_Phase_extraction_and_synchronization is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_0_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_0_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_0_mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_1_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_1_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_1_mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_2_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_2_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_2_mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_3_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_3_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_3_mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_4_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_4_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_4_mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Negate1_PostCast_primWireOut_sel_x_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Negate_PostCast_primWireOut_sel_x_b : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal BitCombine_q : STD_LOGIC_VECTOR (1 downto 0);
    signal CmpEQ_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpEQ_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE10_a : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE10_b : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE10_o : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE10_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE9_a : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE9_b : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE9_o : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE9_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Const6_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Const7_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Counter_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter_eq : std_logic;
    attribute preserve of Counter_eq : signal is true;
    signal Mode_Meas11_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Mode_Meas12_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Mode_Meas13_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Mode_Meas14_x_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Negate_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Negate1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Not1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Not1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sub_a : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_b : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_o : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub1_a : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub1_b : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub1_o : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub2_a : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub2_b : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub2_o : STD_LOGIC_VECTOR (29 downto 0);
    signal Sub2_q : STD_LOGIC_VECTOR (29 downto 0);
    signal sym_I_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_I_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sym_I1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sym_I1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sym_Q1_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE9_PreShift_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal CmpGE9_PreShift_1_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal CmpGE10_PreShift_0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal CmpGE10_PreShift_0_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal Sub1_PreShift_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal Sub1_PreShift_1_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal Sub2_PreShift_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal Sub2_PreShift_1_qint : STD_LOGIC_VECTOR (19 downto 0);
    signal Add_re_add_0_0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_0_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Add_re_add_1_0_a : STD_LOGIC_VECTOR (13 downto 0);
    signal Add_re_add_1_0_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Add_re_add_1_0_o : STD_LOGIC_VECTOR (13 downto 0);
    signal Add_re_add_1_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Add1_re_add_0_0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_0_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Add1_re_add_1_0_a : STD_LOGIC_VECTOR (13 downto 0);
    signal Add1_re_add_1_0_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Add1_re_add_1_0_o : STD_LOGIC_VECTOR (13 downto 0);
    signal Add1_re_add_1_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstZero_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_XLtZero_00_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_XLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_XgteZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ZeroAddSubX_00_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_ZeroAddSubX_00_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_ZeroAddSubX_00_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_ZeroAddSubX_00_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ZeroAddSubX_00_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_YLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CnstAtan_s0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYGeZero_s0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftY_s0_in : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_ShiftY_s0_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Xout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_correct_x_ShiftY_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_correct_x_Xout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_correct_x_ShiftY_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_correct_x_Xout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_correct_x_ShiftY_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_correct_x_Xout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_correct_x_ShiftY_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_correct_x_Xout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_correct_x_ShiftY_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_correct_x_Xout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_correct_x_ShiftY_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_correct_x_Xout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s7_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_correct_x_ShiftY_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_correct_x_Xout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s8_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_correct_x_ShiftY_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_correct_x_Xout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_correct_x_ShiftY_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_correct_x_Xout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s10_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_correct_x_ShiftY_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_correct_x_Xout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s11_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Phase_correct_x_ShiftY_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Phase_correct_x_Xout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Xout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Xout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Yout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYLtZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_CmpYGeZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_ShiftX_s12_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Phase_correct_x_Yout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Yout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Yout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_Pout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_CnstAtan_s13_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_CmpYGeZero_s13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s13_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s13_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s13_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_correct_x_Pout_s13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_Pout_s13_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_correct_x_LutPlusMinus_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_x_LutSubP_a : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_correct_x_LutSubP_b : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_correct_x_LutSubP_o : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_correct_x_LutSubP_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_correct_x_SelPonX_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_correct_x_SelPonX_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_detect_x_CnstZero_0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_XLtZero_00_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_XLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_XgteZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_YLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftY_s0_in : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_ShiftY_s0_b : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Xout_s0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_ShiftY_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_ShiftY_s2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Xout_s2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_detect_x_ShiftY_s3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_detect_x_Xout_s3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s4_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_detect_x_ShiftY_s4_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_detect_x_Xout_s4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s5_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_detect_x_ShiftY_s5_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_detect_x_Xout_s5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s6_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_detect_x_ShiftY_s6_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_detect_x_Xout_s6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s7_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_detect_x_ShiftY_s7_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_detect_x_Xout_s7_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s7_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s7_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s7_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s7_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s7_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s7_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s7_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s7_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_detect_x_ShiftY_s8_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_detect_x_Xout_s8_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s8_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s8_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s8_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s8_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s8_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s8_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s8_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s8_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s9_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_detect_x_ShiftY_s9_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_detect_x_Xout_s9_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s9_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s9_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s9_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s9_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s9_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s10_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_detect_x_ShiftY_s10_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_detect_x_Xout_s10_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s10_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s10_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s10_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s10_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s10_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s10_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s10_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s10_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s11_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_detect_x_ShiftY_s11_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_detect_x_Xout_s11_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s11_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s11_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s11_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s11_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s11_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s11_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s11_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s11_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s12_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_detect_x_ShiftY_s12_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_detect_x_Xout_s12_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s12_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s12_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Xout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Yout_s12_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s12_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s12_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s12_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s12_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s12_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CmpYLtZero_s13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s13_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Phase_detect_x_Yout_s13_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s13_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s13_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Yout_s13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_Pout_s13_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s13_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s13_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_CnstAtan_s14_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_detect_x_CmpYGeZero_s14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s14_a : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s14_b : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s14_o : STD_LOGIC_VECTOR (16 downto 0);
    signal Phase_detect_x_Pout_s14_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Phase_detect_x_LutPlusMinus_q : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_detect_x_LutSubP_a : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_detect_x_LutSubP_b : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_detect_x_LutSubP_o : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_detect_x_LutSubP_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_detect_x_SelPonX_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_SelPonX_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_in : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_in : STD_LOGIC_VECTOR (27 downto 0);
    signal Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b : STD_LOGIC_VECTOR (27 downto 0);
    signal muxopt_assign_id1_q_const_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist0_Phase_detect_x_YLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_Phase_detect_x_XLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_Phase_correct_x_YLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_Phase_correct_x_XLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ChannelIn_in_9_v_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ChannelIn_in_9_v_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_ChannelIn_in_10_c_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist7_ChannelIn_in_7_packet_trigger_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist16_Demux_4_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_Demux_3_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_Demux_2_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_Demux_1_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist7_ChannelIn_in_7_packet_trigger_4(DELAY,634)
    redist7_ChannelIn_in_7_packet_trigger_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_7_packet_trigger, xout => redist7_ChannelIn_in_7_packet_trigger_4_q, clk => clk, aclr => areset );

    -- Mode_Meas14_x(CONSTANT,82)
    Mode_Meas14_x_q <= "11100110111000";

    -- Sub2_PreShift_1(BITSHIFT,103)@5
    Sub2_PreShift_1_qint <= Mode_Meas14_x_q & "000000";
    Sub2_PreShift_1_q <= Sub2_PreShift_1_qint(19 downto 0);

    -- Sub2(SUB,95)@5
    Sub2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => Sub_q(28)) & Sub_q));
    Sub2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 20 => Sub2_PreShift_1_q(19)) & Sub2_PreShift_1_q));
    Sub2_o <= STD_LOGIC_VECTOR(SIGNED(Sub2_a) - SIGNED(Sub2_b));
    Sub2_q <= Sub2_o(29 downto 0);

    -- Mode_Meas13_x(CONSTANT,81)
    Mode_Meas13_x_q <= "00011001001000";

    -- Sub1_PreShift_1(BITSHIFT,102)@5
    Sub1_PreShift_1_qint <= Mode_Meas13_x_q & "000000";
    Sub1_PreShift_1_q <= Sub1_PreShift_1_qint(19 downto 0);

    -- Sub1(SUB,94)@5
    Sub1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => Sub_q(28)) & Sub_q));
    Sub1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 20 => Sub1_PreShift_1_q(19)) & Sub1_PreShift_1_q));
    Sub1_o <= STD_LOGIC_VECTOR(SIGNED(Sub1_a) - SIGNED(Sub1_b));
    Sub1_q <= Sub1_o(29 downto 0);

    -- Const6(CONSTANT,74)
    Const6_q <= "10";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x(LOGICAL,48)@3
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q <= not (GND_q);

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x(LOGICAL,49)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_qi <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q or in_11_sample_update;
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_qi, xout => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x(LOGICAL,47)@3
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q and final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q;

    -- sym_I1(MUX,97)@2
    sym_I1_s <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q;
    sym_I1_combproc: PROCESS (sym_I1_s, Const6_q, in_8_sym_sample)
    BEGIN
        CASE (sym_I1_s) IS
            WHEN "0" => sym_I1_q <= Const6_q;
            WHEN "1" => sym_I1_q <= in_8_sym_sample;
            WHEN OTHERS => sym_I1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sym_Q(MUX,98)@2
    sym_Q_s <= sym_I1_q;
    sym_Q_combproc: PROCESS (sym_Q_s, in_2_left_Q, in_4_main_Q, in_6_right_Q)
    BEGIN
        CASE (sym_Q_s) IS
            WHEN "00" => sym_Q_q <= in_2_left_Q;
            WHEN "01" => sym_Q_q <= in_4_main_Q;
            WHEN "10" => sym_Q_q <= in_6_right_Q;
            WHEN OTHERS => sym_Q_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1(DELAY,635)
    redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q, xout => redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist4_ChannelIn_in_9_v_2(DELAY,631)
    redist4_ChannelIn_in_9_v_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_9_v, xout => redist4_ChannelIn_in_9_v_2_q, clk => clk, aclr => areset );

    -- redist16_Demux_4_mux_x_q_1(DELAY,643)
    redist16_Demux_4_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_4_mux_x_q, xout => redist16_Demux_4_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Counter(COUNTER,77)@0 + 1
    -- low=0, high=4, step=1, init=0
    Counter_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter_i <= TO_UNSIGNED(0, 3);
            Counter_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (in_9_v = "1") THEN
                IF (Counter_i = TO_UNSIGNED(3, 3)) THEN
                    Counter_eq <= '1';
                ELSE
                    Counter_eq <= '0';
                END IF;
                IF (Counter_eq = '1') THEN
                    Counter_i <= Counter_i + 4;
                ELSE
                    Counter_i <= Counter_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    Counter_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter_i, 3)));

    -- Demux_4_decoder_x(DECODE,16)@1 + 1
    Demux_4_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_4_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(2 downto 0) = "100") THEN
                Demux_4_decoder_x_q <= VCC_q;
            ELSE
                Demux_4_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_4_mux_x(MUX,18)@2
    Demux_4_mux_x_s <= Demux_4_decoder_x_q;
    Demux_4_mux_x_combproc: PROCESS (Demux_4_mux_x_s, redist16_Demux_4_mux_x_q_1_q, redist4_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_4_mux_x_s) IS
            WHEN "0" => Demux_4_mux_x_q <= redist16_Demux_4_mux_x_q_1_q;
            WHEN "1" => Demux_4_mux_x_q <= redist4_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_4_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x(MUX,43)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s <= Demux_4_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s, redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1_q, sym_Q_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= redist8_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= sym_Q_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1(DELAY,636)
    redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q, xout => redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist17_Demux_3_mux_x_q_1(DELAY,644)
    redist17_Demux_3_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_3_mux_x_q, xout => redist17_Demux_3_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_3_decoder_x(DECODE,13)@1 + 1
    Demux_3_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_3_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(2 downto 0) = "011") THEN
                Demux_3_decoder_x_q <= VCC_q;
            ELSE
                Demux_3_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_3_mux_x(MUX,15)@2
    Demux_3_mux_x_s <= Demux_3_decoder_x_q;
    Demux_3_mux_x_combproc: PROCESS (Demux_3_mux_x_s, redist17_Demux_3_mux_x_q_1_q, redist4_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_3_mux_x_s) IS
            WHEN "0" => Demux_3_mux_x_q <= redist17_Demux_3_mux_x_q_1_q;
            WHEN "1" => Demux_3_mux_x_q <= redist4_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_3_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x(MUX,41)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s <= Demux_3_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s, redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1_q, sym_Q_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= redist9_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= sym_Q_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Negate(SUB,84)@2
    Negate_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    Negate_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q));
    Negate_o <= STD_LOGIC_VECTOR(SIGNED(Negate_a) - SIGNED(Negate_b));
    Negate_q <= Negate_o(12 downto 0);

    -- Negate_PostCast_primWireOut_sel_x(BITSELECT,20)@2
    Negate_PostCast_primWireOut_sel_x_b <= STD_LOGIC_VECTOR(Negate_q(11 downto 0));

    -- Add1_re_add_0_1(ADD,108)@2
    Add1_re_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => Negate_PostCast_primWireOut_sel_x_b(11)) & Negate_PostCast_primWireOut_sel_x_b));
    Add1_re_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q));
    Add1_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_0_1_a) + SIGNED(Add1_re_add_0_1_b));
    Add1_re_add_0_1_q <= Add1_re_add_0_1_o(12 downto 0);

    -- redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1(DELAY,637)
    redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q, xout => redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist18_Demux_2_mux_x_q_1(DELAY,645)
    redist18_Demux_2_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_2_mux_x_q, xout => redist18_Demux_2_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_2_decoder_x(DECODE,10)@1 + 1
    Demux_2_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_2_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(2 downto 0) = "010") THEN
                Demux_2_decoder_x_q <= VCC_q;
            ELSE
                Demux_2_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_2_mux_x(MUX,12)@2
    Demux_2_mux_x_s <= Demux_2_decoder_x_q;
    Demux_2_mux_x_combproc: PROCESS (Demux_2_mux_x_s, redist18_Demux_2_mux_x_q_1_q, redist4_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_2_mux_x_s) IS
            WHEN "0" => Demux_2_mux_x_q <= redist18_Demux_2_mux_x_q_1_q;
            WHEN "1" => Demux_2_mux_x_q <= redist4_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_2_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x(MUX,39)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s <= Demux_2_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s, redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1_q, sym_Q_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= redist10_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= sym_Q_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1(DELAY,638)
    redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q, xout => redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist19_Demux_1_mux_x_q_1(DELAY,646)
    redist19_Demux_1_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_1_mux_x_q, xout => redist19_Demux_1_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_1_decoder_x(DECODE,7)@1 + 1
    Demux_1_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_1_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(2 downto 0) = "001") THEN
                Demux_1_decoder_x_q <= VCC_q;
            ELSE
                Demux_1_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_1_mux_x(MUX,9)@2
    Demux_1_mux_x_s <= Demux_1_decoder_x_q;
    Demux_1_mux_x_combproc: PROCESS (Demux_1_mux_x_s, redist19_Demux_1_mux_x_q_1_q, redist4_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_1_mux_x_s) IS
            WHEN "0" => Demux_1_mux_x_q <= redist19_Demux_1_mux_x_q_1_q;
            WHEN "1" => Demux_1_mux_x_q <= redist4_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_1_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x(MUX,37)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s <= Demux_1_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s, redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1_q, sym_Q_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= redist11_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= sym_Q_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Add1_re_add_0_0(ADD,107)@2
    Add1_re_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q));
    Add1_re_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q));
    Add1_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_0_0_a) + SIGNED(Add1_re_add_0_0_b));
    Add1_re_add_0_0_q <= Add1_re_add_0_0_o(12 downto 0);

    -- Add1_re_add_1_0(ADD,109)@2
    Add1_re_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add1_re_add_0_0_q(12)) & Add1_re_add_0_0_q));
    Add1_re_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add1_re_add_0_1_q(12)) & Add1_re_add_0_1_q));
    Add1_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_1_0_a) + SIGNED(Add1_re_add_1_0_b));
    Add1_re_add_1_0_q <= Add1_re_add_1_0_o(13 downto 0);

    -- Not1(LOGICAL,88)@1 + 1
    Not1_qi <= not (final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q);
    Not1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not1_qi, xout => Not1_q, clk => clk, aclr => areset );

    -- Const7(CONSTANT,75)
    Const7_q <= "100";

    -- CmpEQ(LOGICAL,67)@1 + 1
    CmpEQ_qi <= "1" WHEN Counter_q = Const7_q ELSE "0";
    CmpEQ_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CmpEQ_qi, xout => CmpEQ_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x(LOGICAL,54)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_qi <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q or CmpEQ_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_qi, xout => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x(LOGICAL,52)@3
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q and final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q;

    -- And2(LOGICAL,61)@2
    And2_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q and Not1_q;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x(MUX,45)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_s <= And2_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q <= Add1_re_add_1_0_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Phase_detect_x_YLtZero_00(LOGICAL,324)@3
    Phase_detect_x_YLtZero_00_q <= STD_LOGIC_VECTOR(final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q(13 downto 13));

    -- redist0_Phase_detect_x_YLtZero_00_q_2(DELAY,627)
    redist0_Phase_detect_x_YLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_detect_x_YLtZero_00_q, xout => redist0_Phase_detect_x_YLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_detect_x_LutPlusMinus(LOOKUP,540)@5
    Phase_detect_x_LutPlusMinus_combproc: PROCESS (redist0_Phase_detect_x_YLtZero_00_q_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist0_Phase_detect_x_YLtZero_00_q_2_q) IS
            WHEN "0" => Phase_detect_x_LutPlusMinus_q <= "0000000000001100100100010000";
            WHEN "1" => Phase_detect_x_LutPlusMinus_q <= "1111111111110011011011110000";
            WHEN OTHERS => -- unreachable
                           Phase_detect_x_LutPlusMinus_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- Phase_detect_x_LutSubP(SUB,541)@5
    Phase_detect_x_LutSubP_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_detect_x_LutPlusMinus_q(27)) & Phase_detect_x_LutPlusMinus_q));
    Phase_detect_x_LutSubP_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 16 => Phase_detect_x_Pout_s14_q(15)) & Phase_detect_x_Pout_s14_q));
    Phase_detect_x_LutSubP_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_LutSubP_a) - SIGNED(Phase_detect_x_LutSubP_b));
    Phase_detect_x_LutSubP_q <= Phase_detect_x_LutSubP_o(28 downto 0);

    -- Phase_detect_x_CmpYLtZero_s13(LOGICAL,502)@4
    Phase_detect_x_CmpYLtZero_s13_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s12_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s11(LOGICAL,476)@4
    Phase_detect_x_CmpYLtZero_s11_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s10_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s9(LOGICAL,450)@4
    Phase_detect_x_CmpYLtZero_s9_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s8_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s7(LOGICAL,424)@4
    Phase_detect_x_CmpYLtZero_s7_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s6_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s5(LOGICAL,398)@3
    Phase_detect_x_CmpYLtZero_s5_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s4_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s3(LOGICAL,372)@3
    Phase_detect_x_CmpYLtZero_s3_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s2_q(15 downto 15));

    -- Phase_detect_x_CmpYLtZero_s1(LOGICAL,346)@3
    Phase_detect_x_CmpYLtZero_s1_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s0_q(15 downto 15));

    -- Phase_detect_x_CmpYGeZero_s0(LOGICAL,336)@3
    Phase_detect_x_CmpYGeZero_s0_q <= STD_LOGIC_VECTOR(not (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s0(BITSELECT,340)@3
    Phase_detect_x_ShiftY_s0_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q(13)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q));
    Phase_detect_x_ShiftY_s0_b <= STD_LOGIC_VECTOR(Phase_detect_x_ShiftY_s0_in(15 downto 0));

    -- Phase_detect_x_XgteZero_00(LOGICAL,321)@3
    Phase_detect_x_XgteZero_00_q <= STD_LOGIC_VECTOR(not (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q(13 downto 13)));

    -- sym_I(MUX,96)@2
    sym_I_s <= sym_I1_q;
    sym_I_combproc: PROCESS (sym_I_s, in_1_left_I, in_3_main_I, in_5_right_I)
    BEGIN
        CASE (sym_I_s) IS
            WHEN "00" => sym_I_q <= in_1_left_I;
            WHEN "01" => sym_I_q <= in_3_main_I;
            WHEN "10" => sym_I_q <= in_5_right_I;
            WHEN OTHERS => sym_I_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1(DELAY,639)
    redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q, xout => redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x(MUX,29)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s <= Demux_4_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s, redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= redist12_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1(DELAY,640)
    redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q, xout => redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x(MUX,27)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s <= Demux_3_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s, redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= redist13_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Negate1(SUB,85)@2
    Negate1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    Negate1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q));
    Negate1_o <= STD_LOGIC_VECTOR(SIGNED(Negate1_a) - SIGNED(Negate1_b));
    Negate1_q <= Negate1_o(12 downto 0);

    -- Negate1_PostCast_primWireOut_sel_x(BITSELECT,19)@2
    Negate1_PostCast_primWireOut_sel_x_b <= STD_LOGIC_VECTOR(Negate1_q(11 downto 0));

    -- Add_re_add_0_1(ADD,105)@2
    Add_re_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => Negate1_PostCast_primWireOut_sel_x_b(11)) & Negate1_PostCast_primWireOut_sel_x_b));
    Add_re_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q));
    Add_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_0_1_a) + SIGNED(Add_re_add_0_1_b));
    Add_re_add_0_1_q <= Add_re_add_0_1_o(12 downto 0);

    -- redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1(DELAY,641)
    redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q, xout => redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x(MUX,25)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s <= Demux_2_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s, redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= redist14_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1(DELAY,642)
    redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q, xout => redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x(MUX,23)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s <= Demux_1_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s, redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= redist15_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Add_re_add_0_0(ADD,104)@2
    Add_re_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q));
    Add_re_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q));
    Add_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_0_0_a) + SIGNED(Add_re_add_0_0_b));
    Add_re_add_0_0_q <= Add_re_add_0_0_o(12 downto 0);

    -- Add_re_add_1_0(ADD,106)@2
    Add_re_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add_re_add_0_0_q(12)) & Add_re_add_0_0_q));
    Add_re_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add_re_add_0_1_q(12)) & Add_re_add_0_1_q));
    Add_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_1_0_a) + SIGNED(Add_re_add_1_0_b));
    Add_re_add_1_0_q <= Add_re_add_1_0_o(13 downto 0);

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x(MUX,31)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_s <= And2_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q <= Add_re_add_1_0_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Phase_detect_x_CnstZero_0(CONSTANT,316)
    Phase_detect_x_CnstZero_0_q <= "0000000000000000";

    -- Phase_detect_x_ZeroAddSubX_00(ADDSUB,322)@3
    Phase_detect_x_ZeroAddSubX_00_s <= Phase_detect_x_XgteZero_00_q;
    Phase_detect_x_ZeroAddSubX_00_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_CnstZero_0_q(15)) & Phase_detect_x_CnstZero_0_q));
    Phase_detect_x_ZeroAddSubX_00_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q(13)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q));
    Phase_detect_x_ZeroAddSubX_00_combproc: PROCESS (Phase_detect_x_ZeroAddSubX_00_a, Phase_detect_x_ZeroAddSubX_00_b, Phase_detect_x_ZeroAddSubX_00_s)
    BEGIN
        IF (Phase_detect_x_ZeroAddSubX_00_s = "1") THEN
            Phase_detect_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_ZeroAddSubX_00_a) + SIGNED(Phase_detect_x_ZeroAddSubX_00_b));
        ELSE
            Phase_detect_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_ZeroAddSubX_00_a) - SIGNED(Phase_detect_x_ZeroAddSubX_00_b));
        END IF;
    END PROCESS;
    Phase_detect_x_ZeroAddSubX_00_q <= Phase_detect_x_ZeroAddSubX_00_o(15 downto 0);

    -- Phase_detect_x_Xout_s0(ADDSUB,341)@3
    Phase_detect_x_Xout_s0_s <= Phase_detect_x_CmpYGeZero_s0_q;
    Phase_detect_x_Xout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_ZeroAddSubX_00_q(15)) & Phase_detect_x_ZeroAddSubX_00_q));
    Phase_detect_x_Xout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_ShiftY_s0_b(15)) & Phase_detect_x_ShiftY_s0_b));
    Phase_detect_x_Xout_s0_combproc: PROCESS (Phase_detect_x_Xout_s0_a, Phase_detect_x_Xout_s0_b, Phase_detect_x_Xout_s0_s)
    BEGIN
        IF (Phase_detect_x_Xout_s0_s = "1") THEN
            Phase_detect_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s0_a) + SIGNED(Phase_detect_x_Xout_s0_b));
        ELSE
            Phase_detect_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s0_a) - SIGNED(Phase_detect_x_Xout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s0_q <= Phase_detect_x_Xout_s0_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s1(BITSELECT,352)@3
    Phase_detect_x_ShiftX_s1_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s0_q(15 downto 1));

    -- Phase_detect_x_Yout_s0(ADDSUB,342)@3
    Phase_detect_x_Yout_s0_s <= Phase_detect_x_YLtZero_00_q;
    Phase_detect_x_Yout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q(13)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q));
    Phase_detect_x_Yout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_ZeroAddSubX_00_q(15)) & Phase_detect_x_ZeroAddSubX_00_q));
    Phase_detect_x_Yout_s0_combproc: PROCESS (Phase_detect_x_Yout_s0_a, Phase_detect_x_Yout_s0_b, Phase_detect_x_Yout_s0_s)
    BEGIN
        IF (Phase_detect_x_Yout_s0_s = "1") THEN
            Phase_detect_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s0_a) + SIGNED(Phase_detect_x_Yout_s0_b));
        ELSE
            Phase_detect_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s0_a) - SIGNED(Phase_detect_x_Yout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s0_q <= Phase_detect_x_Yout_s0_o(15 downto 0);

    -- Phase_detect_x_Yout_s1(ADDSUB,355)@3
    Phase_detect_x_Yout_s1_s <= Phase_detect_x_CmpYLtZero_s1_q;
    Phase_detect_x_Yout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s0_q(15)) & Phase_detect_x_Yout_s0_q));
    Phase_detect_x_Yout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => Phase_detect_x_ShiftX_s1_b(14)) & Phase_detect_x_ShiftX_s1_b));
    Phase_detect_x_Yout_s1_combproc: PROCESS (Phase_detect_x_Yout_s1_a, Phase_detect_x_Yout_s1_b, Phase_detect_x_Yout_s1_s)
    BEGIN
        IF (Phase_detect_x_Yout_s1_s = "1") THEN
            Phase_detect_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s1_a) + SIGNED(Phase_detect_x_Yout_s1_b));
        ELSE
            Phase_detect_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s1_a) - SIGNED(Phase_detect_x_Yout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s1_q <= Phase_detect_x_Yout_s1_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s2(LOGICAL,362)@3
    Phase_detect_x_CmpYGeZero_s2_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s1_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s2(BITSELECT,366)@3
    Phase_detect_x_ShiftY_s2_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s1_q(15 downto 2));

    -- Phase_detect_x_CmpYGeZero_s1(LOGICAL,349)@3
    Phase_detect_x_CmpYGeZero_s1_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s0_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s1(BITSELECT,353)@3
    Phase_detect_x_ShiftY_s1_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s0_q(15 downto 1));

    -- Phase_detect_x_Xout_s1(ADDSUB,354)@3
    Phase_detect_x_Xout_s1_s <= Phase_detect_x_CmpYGeZero_s1_q;
    Phase_detect_x_Xout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s0_q(15)) & Phase_detect_x_Xout_s0_q));
    Phase_detect_x_Xout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => Phase_detect_x_ShiftY_s1_b(14)) & Phase_detect_x_ShiftY_s1_b));
    Phase_detect_x_Xout_s1_combproc: PROCESS (Phase_detect_x_Xout_s1_a, Phase_detect_x_Xout_s1_b, Phase_detect_x_Xout_s1_s)
    BEGIN
        IF (Phase_detect_x_Xout_s1_s = "1") THEN
            Phase_detect_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s1_a) + SIGNED(Phase_detect_x_Xout_s1_b));
        ELSE
            Phase_detect_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s1_a) - SIGNED(Phase_detect_x_Xout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s1_q <= Phase_detect_x_Xout_s1_o(15 downto 0);

    -- Phase_detect_x_Xout_s2(ADDSUB,367)@3
    Phase_detect_x_Xout_s2_s <= Phase_detect_x_CmpYGeZero_s2_q;
    Phase_detect_x_Xout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s1_q(15)) & Phase_detect_x_Xout_s1_q));
    Phase_detect_x_Xout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => Phase_detect_x_ShiftY_s2_b(13)) & Phase_detect_x_ShiftY_s2_b));
    Phase_detect_x_Xout_s2_combproc: PROCESS (Phase_detect_x_Xout_s2_a, Phase_detect_x_Xout_s2_b, Phase_detect_x_Xout_s2_s)
    BEGIN
        IF (Phase_detect_x_Xout_s2_s = "1") THEN
            Phase_detect_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s2_a) + SIGNED(Phase_detect_x_Xout_s2_b));
        ELSE
            Phase_detect_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s2_a) - SIGNED(Phase_detect_x_Xout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s2_q <= Phase_detect_x_Xout_s2_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s3(BITSELECT,378)@3
    Phase_detect_x_ShiftX_s3_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s2_q(15 downto 3));

    -- Phase_detect_x_CmpYLtZero_s2(LOGICAL,359)@3
    Phase_detect_x_CmpYLtZero_s2_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s1_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s2(BITSELECT,365)@3
    Phase_detect_x_ShiftX_s2_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s1_q(15 downto 2));

    -- Phase_detect_x_Yout_s2(ADDSUB,368)@3
    Phase_detect_x_Yout_s2_s <= Phase_detect_x_CmpYLtZero_s2_q;
    Phase_detect_x_Yout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s1_q(15)) & Phase_detect_x_Yout_s1_q));
    Phase_detect_x_Yout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => Phase_detect_x_ShiftX_s2_b(13)) & Phase_detect_x_ShiftX_s2_b));
    Phase_detect_x_Yout_s2_combproc: PROCESS (Phase_detect_x_Yout_s2_a, Phase_detect_x_Yout_s2_b, Phase_detect_x_Yout_s2_s)
    BEGIN
        IF (Phase_detect_x_Yout_s2_s = "1") THEN
            Phase_detect_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s2_a) + SIGNED(Phase_detect_x_Yout_s2_b));
        ELSE
            Phase_detect_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s2_a) - SIGNED(Phase_detect_x_Yout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s2_q <= Phase_detect_x_Yout_s2_o(15 downto 0);

    -- Phase_detect_x_Yout_s3(ADDSUB,381)@3
    Phase_detect_x_Yout_s3_s <= Phase_detect_x_CmpYLtZero_s3_q;
    Phase_detect_x_Yout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s2_q(15)) & Phase_detect_x_Yout_s2_q));
    Phase_detect_x_Yout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => Phase_detect_x_ShiftX_s3_b(12)) & Phase_detect_x_ShiftX_s3_b));
    Phase_detect_x_Yout_s3_combproc: PROCESS (Phase_detect_x_Yout_s3_a, Phase_detect_x_Yout_s3_b, Phase_detect_x_Yout_s3_s)
    BEGIN
        IF (Phase_detect_x_Yout_s3_s = "1") THEN
            Phase_detect_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s3_a) + SIGNED(Phase_detect_x_Yout_s3_b));
        ELSE
            Phase_detect_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s3_a) - SIGNED(Phase_detect_x_Yout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s3_q <= Phase_detect_x_Yout_s3_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s4(LOGICAL,388)@3
    Phase_detect_x_CmpYGeZero_s4_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s3_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s4(BITSELECT,392)@3
    Phase_detect_x_ShiftY_s4_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s3_q(15 downto 4));

    -- Phase_detect_x_CmpYGeZero_s3(LOGICAL,375)@3
    Phase_detect_x_CmpYGeZero_s3_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s2_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s3(BITSELECT,379)@3
    Phase_detect_x_ShiftY_s3_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s2_q(15 downto 3));

    -- Phase_detect_x_Xout_s3(ADDSUB,380)@3
    Phase_detect_x_Xout_s3_s <= Phase_detect_x_CmpYGeZero_s3_q;
    Phase_detect_x_Xout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s2_q(15)) & Phase_detect_x_Xout_s2_q));
    Phase_detect_x_Xout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => Phase_detect_x_ShiftY_s3_b(12)) & Phase_detect_x_ShiftY_s3_b));
    Phase_detect_x_Xout_s3_combproc: PROCESS (Phase_detect_x_Xout_s3_a, Phase_detect_x_Xout_s3_b, Phase_detect_x_Xout_s3_s)
    BEGIN
        IF (Phase_detect_x_Xout_s3_s = "1") THEN
            Phase_detect_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s3_a) + SIGNED(Phase_detect_x_Xout_s3_b));
        ELSE
            Phase_detect_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s3_a) - SIGNED(Phase_detect_x_Xout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s3_q <= Phase_detect_x_Xout_s3_o(15 downto 0);

    -- Phase_detect_x_Xout_s4(ADDSUB,393)@3
    Phase_detect_x_Xout_s4_s <= Phase_detect_x_CmpYGeZero_s4_q;
    Phase_detect_x_Xout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s3_q(15)) & Phase_detect_x_Xout_s3_q));
    Phase_detect_x_Xout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => Phase_detect_x_ShiftY_s4_b(11)) & Phase_detect_x_ShiftY_s4_b));
    Phase_detect_x_Xout_s4_combproc: PROCESS (Phase_detect_x_Xout_s4_a, Phase_detect_x_Xout_s4_b, Phase_detect_x_Xout_s4_s)
    BEGIN
        IF (Phase_detect_x_Xout_s4_s = "1") THEN
            Phase_detect_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s4_a) + SIGNED(Phase_detect_x_Xout_s4_b));
        ELSE
            Phase_detect_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s4_a) - SIGNED(Phase_detect_x_Xout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s4_q <= Phase_detect_x_Xout_s4_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s5(BITSELECT,404)@3
    Phase_detect_x_ShiftX_s5_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s4_q(15 downto 5));

    -- Phase_detect_x_CmpYLtZero_s4(LOGICAL,385)@3
    Phase_detect_x_CmpYLtZero_s4_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s3_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s4(BITSELECT,391)@3
    Phase_detect_x_ShiftX_s4_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s3_q(15 downto 4));

    -- Phase_detect_x_Yout_s4(ADDSUB,394)@3
    Phase_detect_x_Yout_s4_s <= Phase_detect_x_CmpYLtZero_s4_q;
    Phase_detect_x_Yout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s3_q(15)) & Phase_detect_x_Yout_s3_q));
    Phase_detect_x_Yout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 12 => Phase_detect_x_ShiftX_s4_b(11)) & Phase_detect_x_ShiftX_s4_b));
    Phase_detect_x_Yout_s4_combproc: PROCESS (Phase_detect_x_Yout_s4_a, Phase_detect_x_Yout_s4_b, Phase_detect_x_Yout_s4_s)
    BEGIN
        IF (Phase_detect_x_Yout_s4_s = "1") THEN
            Phase_detect_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s4_a) + SIGNED(Phase_detect_x_Yout_s4_b));
        ELSE
            Phase_detect_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s4_a) - SIGNED(Phase_detect_x_Yout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s4_q <= Phase_detect_x_Yout_s4_o(15 downto 0);

    -- Phase_detect_x_Yout_s5(ADDSUB,407)@3
    Phase_detect_x_Yout_s5_s <= Phase_detect_x_CmpYLtZero_s5_q;
    Phase_detect_x_Yout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s4_q(15)) & Phase_detect_x_Yout_s4_q));
    Phase_detect_x_Yout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => Phase_detect_x_ShiftX_s5_b(10)) & Phase_detect_x_ShiftX_s5_b));
    Phase_detect_x_Yout_s5_combproc: PROCESS (Phase_detect_x_Yout_s5_a, Phase_detect_x_Yout_s5_b, Phase_detect_x_Yout_s5_s)
    BEGIN
        IF (Phase_detect_x_Yout_s5_s = "1") THEN
            Phase_detect_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s5_a) + SIGNED(Phase_detect_x_Yout_s5_b));
        ELSE
            Phase_detect_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s5_a) - SIGNED(Phase_detect_x_Yout_s5_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s5_q <= Phase_detect_x_Yout_s5_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s6(LOGICAL,414)@3
    Phase_detect_x_CmpYGeZero_s6_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s5_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s6(BITSELECT,418)@3
    Phase_detect_x_ShiftY_s6_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s5_q(15 downto 6));

    -- Phase_detect_x_CmpYGeZero_s5(LOGICAL,401)@3
    Phase_detect_x_CmpYGeZero_s5_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s4_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s5(BITSELECT,405)@3
    Phase_detect_x_ShiftY_s5_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s4_q(15 downto 5));

    -- Phase_detect_x_Xout_s5(ADDSUB,406)@3
    Phase_detect_x_Xout_s5_s <= Phase_detect_x_CmpYGeZero_s5_q;
    Phase_detect_x_Xout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s4_q(15)) & Phase_detect_x_Xout_s4_q));
    Phase_detect_x_Xout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => Phase_detect_x_ShiftY_s5_b(10)) & Phase_detect_x_ShiftY_s5_b));
    Phase_detect_x_Xout_s5_combproc: PROCESS (Phase_detect_x_Xout_s5_a, Phase_detect_x_Xout_s5_b, Phase_detect_x_Xout_s5_s)
    BEGIN
        IF (Phase_detect_x_Xout_s5_s = "1") THEN
            Phase_detect_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s5_a) + SIGNED(Phase_detect_x_Xout_s5_b));
        ELSE
            Phase_detect_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s5_a) - SIGNED(Phase_detect_x_Xout_s5_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s5_q <= Phase_detect_x_Xout_s5_o(15 downto 0);

    -- Phase_detect_x_Xout_s6(ADDSUB,419)@3 + 1
    Phase_detect_x_Xout_s6_s <= Phase_detect_x_CmpYGeZero_s6_q;
    Phase_detect_x_Xout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s5_q(15)) & Phase_detect_x_Xout_s5_q));
    Phase_detect_x_Xout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 10 => Phase_detect_x_ShiftY_s6_b(9)) & Phase_detect_x_ShiftY_s6_b));
    Phase_detect_x_Xout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Xout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Xout_s6_s = "1") THEN
                Phase_detect_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s6_a) + SIGNED(Phase_detect_x_Xout_s6_b));
            ELSE
                Phase_detect_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s6_a) - SIGNED(Phase_detect_x_Xout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s6_q <= Phase_detect_x_Xout_s6_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s7(BITSELECT,430)@4
    Phase_detect_x_ShiftX_s7_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s6_q(15 downto 7));

    -- Phase_detect_x_CmpYLtZero_s6(LOGICAL,411)@3
    Phase_detect_x_CmpYLtZero_s6_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s5_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s6(BITSELECT,417)@3
    Phase_detect_x_ShiftX_s6_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s5_q(15 downto 6));

    -- Phase_detect_x_Yout_s6(ADDSUB,420)@3 + 1
    Phase_detect_x_Yout_s6_s <= Phase_detect_x_CmpYLtZero_s6_q;
    Phase_detect_x_Yout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s5_q(15)) & Phase_detect_x_Yout_s5_q));
    Phase_detect_x_Yout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 10 => Phase_detect_x_ShiftX_s6_b(9)) & Phase_detect_x_ShiftX_s6_b));
    Phase_detect_x_Yout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Yout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Yout_s6_s = "1") THEN
                Phase_detect_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s6_a) + SIGNED(Phase_detect_x_Yout_s6_b));
            ELSE
                Phase_detect_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s6_a) - SIGNED(Phase_detect_x_Yout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s6_q <= Phase_detect_x_Yout_s6_o(15 downto 0);

    -- Phase_detect_x_Yout_s7(ADDSUB,433)@4
    Phase_detect_x_Yout_s7_s <= Phase_detect_x_CmpYLtZero_s7_q;
    Phase_detect_x_Yout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s6_q(15)) & Phase_detect_x_Yout_s6_q));
    Phase_detect_x_Yout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 9 => Phase_detect_x_ShiftX_s7_b(8)) & Phase_detect_x_ShiftX_s7_b));
    Phase_detect_x_Yout_s7_combproc: PROCESS (Phase_detect_x_Yout_s7_a, Phase_detect_x_Yout_s7_b, Phase_detect_x_Yout_s7_s)
    BEGIN
        IF (Phase_detect_x_Yout_s7_s = "1") THEN
            Phase_detect_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s7_a) + SIGNED(Phase_detect_x_Yout_s7_b));
        ELSE
            Phase_detect_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s7_a) - SIGNED(Phase_detect_x_Yout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s7_q <= Phase_detect_x_Yout_s7_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s8(LOGICAL,440)@4
    Phase_detect_x_CmpYGeZero_s8_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s7_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s8(BITSELECT,444)@4
    Phase_detect_x_ShiftY_s8_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s7_q(15 downto 8));

    -- Phase_detect_x_CmpYGeZero_s7(LOGICAL,427)@4
    Phase_detect_x_CmpYGeZero_s7_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s6_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s7(BITSELECT,431)@4
    Phase_detect_x_ShiftY_s7_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s6_q(15 downto 7));

    -- Phase_detect_x_Xout_s7(ADDSUB,432)@4
    Phase_detect_x_Xout_s7_s <= Phase_detect_x_CmpYGeZero_s7_q;
    Phase_detect_x_Xout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s6_q(15)) & Phase_detect_x_Xout_s6_q));
    Phase_detect_x_Xout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 9 => Phase_detect_x_ShiftY_s7_b(8)) & Phase_detect_x_ShiftY_s7_b));
    Phase_detect_x_Xout_s7_combproc: PROCESS (Phase_detect_x_Xout_s7_a, Phase_detect_x_Xout_s7_b, Phase_detect_x_Xout_s7_s)
    BEGIN
        IF (Phase_detect_x_Xout_s7_s = "1") THEN
            Phase_detect_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s7_a) + SIGNED(Phase_detect_x_Xout_s7_b));
        ELSE
            Phase_detect_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s7_a) - SIGNED(Phase_detect_x_Xout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s7_q <= Phase_detect_x_Xout_s7_o(15 downto 0);

    -- Phase_detect_x_Xout_s8(ADDSUB,445)@4
    Phase_detect_x_Xout_s8_s <= Phase_detect_x_CmpYGeZero_s8_q;
    Phase_detect_x_Xout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s7_q(15)) & Phase_detect_x_Xout_s7_q));
    Phase_detect_x_Xout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 8 => Phase_detect_x_ShiftY_s8_b(7)) & Phase_detect_x_ShiftY_s8_b));
    Phase_detect_x_Xout_s8_combproc: PROCESS (Phase_detect_x_Xout_s8_a, Phase_detect_x_Xout_s8_b, Phase_detect_x_Xout_s8_s)
    BEGIN
        IF (Phase_detect_x_Xout_s8_s = "1") THEN
            Phase_detect_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s8_a) + SIGNED(Phase_detect_x_Xout_s8_b));
        ELSE
            Phase_detect_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s8_a) - SIGNED(Phase_detect_x_Xout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s8_q <= Phase_detect_x_Xout_s8_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s9(BITSELECT,456)@4
    Phase_detect_x_ShiftX_s9_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s8_q(15 downto 9));

    -- Phase_detect_x_CmpYLtZero_s8(LOGICAL,437)@4
    Phase_detect_x_CmpYLtZero_s8_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s7_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s8(BITSELECT,443)@4
    Phase_detect_x_ShiftX_s8_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s7_q(15 downto 8));

    -- Phase_detect_x_Yout_s8(ADDSUB,446)@4
    Phase_detect_x_Yout_s8_s <= Phase_detect_x_CmpYLtZero_s8_q;
    Phase_detect_x_Yout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s7_q(15)) & Phase_detect_x_Yout_s7_q));
    Phase_detect_x_Yout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 8 => Phase_detect_x_ShiftX_s8_b(7)) & Phase_detect_x_ShiftX_s8_b));
    Phase_detect_x_Yout_s8_combproc: PROCESS (Phase_detect_x_Yout_s8_a, Phase_detect_x_Yout_s8_b, Phase_detect_x_Yout_s8_s)
    BEGIN
        IF (Phase_detect_x_Yout_s8_s = "1") THEN
            Phase_detect_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s8_a) + SIGNED(Phase_detect_x_Yout_s8_b));
        ELSE
            Phase_detect_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s8_a) - SIGNED(Phase_detect_x_Yout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s8_q <= Phase_detect_x_Yout_s8_o(15 downto 0);

    -- Phase_detect_x_Yout_s9(ADDSUB,459)@4
    Phase_detect_x_Yout_s9_s <= Phase_detect_x_CmpYLtZero_s9_q;
    Phase_detect_x_Yout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s8_q(15)) & Phase_detect_x_Yout_s8_q));
    Phase_detect_x_Yout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 7 => Phase_detect_x_ShiftX_s9_b(6)) & Phase_detect_x_ShiftX_s9_b));
    Phase_detect_x_Yout_s9_combproc: PROCESS (Phase_detect_x_Yout_s9_a, Phase_detect_x_Yout_s9_b, Phase_detect_x_Yout_s9_s)
    BEGIN
        IF (Phase_detect_x_Yout_s9_s = "1") THEN
            Phase_detect_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s9_a) + SIGNED(Phase_detect_x_Yout_s9_b));
        ELSE
            Phase_detect_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s9_a) - SIGNED(Phase_detect_x_Yout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s9_q <= Phase_detect_x_Yout_s9_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s10(LOGICAL,466)@4
    Phase_detect_x_CmpYGeZero_s10_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s9_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s10(BITSELECT,470)@4
    Phase_detect_x_ShiftY_s10_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s9_q(15 downto 10));

    -- Phase_detect_x_CmpYGeZero_s9(LOGICAL,453)@4
    Phase_detect_x_CmpYGeZero_s9_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s8_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s9(BITSELECT,457)@4
    Phase_detect_x_ShiftY_s9_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s8_q(15 downto 9));

    -- Phase_detect_x_Xout_s9(ADDSUB,458)@4
    Phase_detect_x_Xout_s9_s <= Phase_detect_x_CmpYGeZero_s9_q;
    Phase_detect_x_Xout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s8_q(15)) & Phase_detect_x_Xout_s8_q));
    Phase_detect_x_Xout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 7 => Phase_detect_x_ShiftY_s9_b(6)) & Phase_detect_x_ShiftY_s9_b));
    Phase_detect_x_Xout_s9_combproc: PROCESS (Phase_detect_x_Xout_s9_a, Phase_detect_x_Xout_s9_b, Phase_detect_x_Xout_s9_s)
    BEGIN
        IF (Phase_detect_x_Xout_s9_s = "1") THEN
            Phase_detect_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s9_a) + SIGNED(Phase_detect_x_Xout_s9_b));
        ELSE
            Phase_detect_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s9_a) - SIGNED(Phase_detect_x_Xout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s9_q <= Phase_detect_x_Xout_s9_o(15 downto 0);

    -- Phase_detect_x_Xout_s10(ADDSUB,471)@4
    Phase_detect_x_Xout_s10_s <= Phase_detect_x_CmpYGeZero_s10_q;
    Phase_detect_x_Xout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s9_q(15)) & Phase_detect_x_Xout_s9_q));
    Phase_detect_x_Xout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 6 => Phase_detect_x_ShiftY_s10_b(5)) & Phase_detect_x_ShiftY_s10_b));
    Phase_detect_x_Xout_s10_combproc: PROCESS (Phase_detect_x_Xout_s10_a, Phase_detect_x_Xout_s10_b, Phase_detect_x_Xout_s10_s)
    BEGIN
        IF (Phase_detect_x_Xout_s10_s = "1") THEN
            Phase_detect_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s10_a) + SIGNED(Phase_detect_x_Xout_s10_b));
        ELSE
            Phase_detect_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s10_a) - SIGNED(Phase_detect_x_Xout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s10_q <= Phase_detect_x_Xout_s10_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s11(BITSELECT,482)@4
    Phase_detect_x_ShiftX_s11_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s10_q(15 downto 11));

    -- Phase_detect_x_CmpYLtZero_s10(LOGICAL,463)@4
    Phase_detect_x_CmpYLtZero_s10_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s9_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s10(BITSELECT,469)@4
    Phase_detect_x_ShiftX_s10_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s9_q(15 downto 10));

    -- Phase_detect_x_Yout_s10(ADDSUB,472)@4
    Phase_detect_x_Yout_s10_s <= Phase_detect_x_CmpYLtZero_s10_q;
    Phase_detect_x_Yout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s9_q(15)) & Phase_detect_x_Yout_s9_q));
    Phase_detect_x_Yout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 6 => Phase_detect_x_ShiftX_s10_b(5)) & Phase_detect_x_ShiftX_s10_b));
    Phase_detect_x_Yout_s10_combproc: PROCESS (Phase_detect_x_Yout_s10_a, Phase_detect_x_Yout_s10_b, Phase_detect_x_Yout_s10_s)
    BEGIN
        IF (Phase_detect_x_Yout_s10_s = "1") THEN
            Phase_detect_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s10_a) + SIGNED(Phase_detect_x_Yout_s10_b));
        ELSE
            Phase_detect_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s10_a) - SIGNED(Phase_detect_x_Yout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s10_q <= Phase_detect_x_Yout_s10_o(15 downto 0);

    -- Phase_detect_x_Yout_s11(ADDSUB,485)@4
    Phase_detect_x_Yout_s11_s <= Phase_detect_x_CmpYLtZero_s11_q;
    Phase_detect_x_Yout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s10_q(15)) & Phase_detect_x_Yout_s10_q));
    Phase_detect_x_Yout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 5 => Phase_detect_x_ShiftX_s11_b(4)) & Phase_detect_x_ShiftX_s11_b));
    Phase_detect_x_Yout_s11_combproc: PROCESS (Phase_detect_x_Yout_s11_a, Phase_detect_x_Yout_s11_b, Phase_detect_x_Yout_s11_s)
    BEGIN
        IF (Phase_detect_x_Yout_s11_s = "1") THEN
            Phase_detect_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s11_a) + SIGNED(Phase_detect_x_Yout_s11_b));
        ELSE
            Phase_detect_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s11_a) - SIGNED(Phase_detect_x_Yout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s11_q <= Phase_detect_x_Yout_s11_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s12(LOGICAL,492)@4
    Phase_detect_x_CmpYGeZero_s12_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s11_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s12(BITSELECT,496)@4
    Phase_detect_x_ShiftY_s12_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s11_q(15 downto 12));

    -- Phase_detect_x_CmpYGeZero_s11(LOGICAL,479)@4
    Phase_detect_x_CmpYGeZero_s11_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s10_q(15 downto 15)));

    -- Phase_detect_x_ShiftY_s11(BITSELECT,483)@4
    Phase_detect_x_ShiftY_s11_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s10_q(15 downto 11));

    -- Phase_detect_x_Xout_s11(ADDSUB,484)@4
    Phase_detect_x_Xout_s11_s <= Phase_detect_x_CmpYGeZero_s11_q;
    Phase_detect_x_Xout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s10_q(15)) & Phase_detect_x_Xout_s10_q));
    Phase_detect_x_Xout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 5 => Phase_detect_x_ShiftY_s11_b(4)) & Phase_detect_x_ShiftY_s11_b));
    Phase_detect_x_Xout_s11_combproc: PROCESS (Phase_detect_x_Xout_s11_a, Phase_detect_x_Xout_s11_b, Phase_detect_x_Xout_s11_s)
    BEGIN
        IF (Phase_detect_x_Xout_s11_s = "1") THEN
            Phase_detect_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s11_a) + SIGNED(Phase_detect_x_Xout_s11_b));
        ELSE
            Phase_detect_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s11_a) - SIGNED(Phase_detect_x_Xout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s11_q <= Phase_detect_x_Xout_s11_o(15 downto 0);

    -- Phase_detect_x_Xout_s12(ADDSUB,497)@4
    Phase_detect_x_Xout_s12_s <= Phase_detect_x_CmpYGeZero_s12_q;
    Phase_detect_x_Xout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Xout_s11_q(15)) & Phase_detect_x_Xout_s11_q));
    Phase_detect_x_Xout_s12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 4 => Phase_detect_x_ShiftY_s12_b(3)) & Phase_detect_x_ShiftY_s12_b));
    Phase_detect_x_Xout_s12_combproc: PROCESS (Phase_detect_x_Xout_s12_a, Phase_detect_x_Xout_s12_b, Phase_detect_x_Xout_s12_s)
    BEGIN
        IF (Phase_detect_x_Xout_s12_s = "1") THEN
            Phase_detect_x_Xout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s12_a) + SIGNED(Phase_detect_x_Xout_s12_b));
        ELSE
            Phase_detect_x_Xout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s12_a) - SIGNED(Phase_detect_x_Xout_s12_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s12_q <= Phase_detect_x_Xout_s12_o(15 downto 0);

    -- Phase_detect_x_ShiftX_s13(BITSELECT,508)@4
    Phase_detect_x_ShiftX_s13_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s12_q(15 downto 13));

    -- Phase_detect_x_CmpYLtZero_s12(LOGICAL,489)@4
    Phase_detect_x_CmpYLtZero_s12_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s11_q(15 downto 15));

    -- Phase_detect_x_ShiftX_s12(BITSELECT,495)@4
    Phase_detect_x_ShiftX_s12_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s11_q(15 downto 12));

    -- Phase_detect_x_Yout_s12(ADDSUB,498)@4
    Phase_detect_x_Yout_s12_s <= Phase_detect_x_CmpYLtZero_s12_q;
    Phase_detect_x_Yout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s11_q(15)) & Phase_detect_x_Yout_s11_q));
    Phase_detect_x_Yout_s12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 4 => Phase_detect_x_ShiftX_s12_b(3)) & Phase_detect_x_ShiftX_s12_b));
    Phase_detect_x_Yout_s12_combproc: PROCESS (Phase_detect_x_Yout_s12_a, Phase_detect_x_Yout_s12_b, Phase_detect_x_Yout_s12_s)
    BEGIN
        IF (Phase_detect_x_Yout_s12_s = "1") THEN
            Phase_detect_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s12_a) + SIGNED(Phase_detect_x_Yout_s12_b));
        ELSE
            Phase_detect_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s12_a) - SIGNED(Phase_detect_x_Yout_s12_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s12_q <= Phase_detect_x_Yout_s12_o(15 downto 0);

    -- Phase_detect_x_Yout_s13(ADDSUB,511)@4
    Phase_detect_x_Yout_s13_s <= Phase_detect_x_CmpYLtZero_s13_q;
    Phase_detect_x_Yout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Yout_s12_q(15)) & Phase_detect_x_Yout_s12_q));
    Phase_detect_x_Yout_s13_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 3 => Phase_detect_x_ShiftX_s13_b(2)) & Phase_detect_x_ShiftX_s13_b));
    Phase_detect_x_Yout_s13_combproc: PROCESS (Phase_detect_x_Yout_s13_a, Phase_detect_x_Yout_s13_b, Phase_detect_x_Yout_s13_s)
    BEGIN
        IF (Phase_detect_x_Yout_s13_s = "1") THEN
            Phase_detect_x_Yout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s13_a) + SIGNED(Phase_detect_x_Yout_s13_b));
        ELSE
            Phase_detect_x_Yout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s13_a) - SIGNED(Phase_detect_x_Yout_s13_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s13_q <= Phase_detect_x_Yout_s13_o(15 downto 0);

    -- Phase_detect_x_CmpYGeZero_s14(LOGICAL,518)@4
    Phase_detect_x_CmpYGeZero_s14_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s13_q(15 downto 15)));

    -- Phase_detect_x_CnstAtan_s14(CONSTANT,514)
    Phase_detect_x_CnstAtan_s14_q <= "0000000000000000000000000001";

    -- Phase_detect_x_CmpYGeZero_s13(LOGICAL,505)@4
    Phase_detect_x_CmpYGeZero_s13_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s12_q(15 downto 15)));

    -- Phase_correct_x_CnstAtan_s13(CONSTANT,295)
    Phase_correct_x_CnstAtan_s13_q <= "0000000000000000000000000010";

    -- Phase_correct_x_CnstAtan_s12(CONSTANT,282)
    Phase_correct_x_CnstAtan_s12_q <= "0000000000000000000000000100";

    -- Phase_correct_x_CnstAtan_s11(CONSTANT,269)
    Phase_correct_x_CnstAtan_s11_q <= "0000000000000000000000001000";

    -- Phase_correct_x_CnstAtan_s10(CONSTANT,256)
    Phase_correct_x_CnstAtan_s10_q <= "0000000000000000000000010000";

    -- Phase_correct_x_CnstAtan_s9(CONSTANT,243)
    Phase_correct_x_CnstAtan_s9_q <= "0000000000000000000000100000";

    -- Phase_correct_x_CnstAtan_s8(CONSTANT,230)
    Phase_correct_x_CnstAtan_s8_q <= "0000000000000000000001000000";

    -- Phase_correct_x_CnstAtan_s7(CONSTANT,217)
    Phase_correct_x_CnstAtan_s7_q <= "0000000000000000000010000000";

    -- Phase_correct_x_CnstAtan_s6(CONSTANT,204)
    Phase_correct_x_CnstAtan_s6_q <= "0000000000000000000100000000";

    -- Phase_correct_x_CnstAtan_s5(CONSTANT,191)
    Phase_correct_x_CnstAtan_s5_q <= "0000000000000000001000000000";

    -- Phase_correct_x_CnstAtan_s4(CONSTANT,178)
    Phase_correct_x_CnstAtan_s4_q <= "0000000000000000001111111111";

    -- Phase_correct_x_CnstAtan_s3(CONSTANT,165)
    Phase_correct_x_CnstAtan_s3_q <= "0000000000000000011111110101";

    -- Phase_correct_x_CnstAtan_s2(CONSTANT,152)
    Phase_correct_x_CnstAtan_s2_q <= "0000000000000000111110101110";

    -- Phase_correct_x_CnstAtan_s1(CONSTANT,139)
    Phase_correct_x_CnstAtan_s1_q <= "0000000000000001110110101100";

    -- Phase_correct_x_CnstAtan_s0(CONSTANT,126)
    Phase_correct_x_CnstAtan_s0_q <= "0000000000000011001001000100";

    -- muxopt_assign_id1_q_const(CONSTANT,626)
    muxopt_assign_id1_q_const_q <= "0000000000000000000000000000";

    -- Phase_detect_x_Pout_s0(ADDSUB,343)@3
    Phase_detect_x_Pout_s0_s <= Phase_detect_x_CmpYGeZero_s0_q;
    Phase_detect_x_Pout_s0_a <= STD_LOGIC_VECTOR(muxopt_assign_id1_q_const_q(16 downto 0));
    Phase_detect_x_Pout_s0_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s0_q(16 downto 0));
    Phase_detect_x_Pout_s0_combproc: PROCESS (Phase_detect_x_Pout_s0_a, Phase_detect_x_Pout_s0_b, Phase_detect_x_Pout_s0_s)
    BEGIN
        IF (Phase_detect_x_Pout_s0_s = "1") THEN
            Phase_detect_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s0_a) + SIGNED(Phase_detect_x_Pout_s0_b));
        ELSE
            Phase_detect_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s0_a) - SIGNED(Phase_detect_x_Pout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s0_q <= Phase_detect_x_Pout_s0_o(15 downto 0);

    -- Phase_detect_x_Pout_s1(ADDSUB,356)@3
    Phase_detect_x_Pout_s1_s <= Phase_detect_x_CmpYGeZero_s1_q;
    Phase_detect_x_Pout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s0_q(15)) & Phase_detect_x_Pout_s0_q));
    Phase_detect_x_Pout_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s1_q(16 downto 0));
    Phase_detect_x_Pout_s1_combproc: PROCESS (Phase_detect_x_Pout_s1_a, Phase_detect_x_Pout_s1_b, Phase_detect_x_Pout_s1_s)
    BEGIN
        IF (Phase_detect_x_Pout_s1_s = "1") THEN
            Phase_detect_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s1_a) + SIGNED(Phase_detect_x_Pout_s1_b));
        ELSE
            Phase_detect_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s1_a) - SIGNED(Phase_detect_x_Pout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s1_q <= Phase_detect_x_Pout_s1_o(15 downto 0);

    -- Phase_detect_x_Pout_s2(ADDSUB,369)@3
    Phase_detect_x_Pout_s2_s <= Phase_detect_x_CmpYGeZero_s2_q;
    Phase_detect_x_Pout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s1_q(15)) & Phase_detect_x_Pout_s1_q));
    Phase_detect_x_Pout_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s2_q(16 downto 0));
    Phase_detect_x_Pout_s2_combproc: PROCESS (Phase_detect_x_Pout_s2_a, Phase_detect_x_Pout_s2_b, Phase_detect_x_Pout_s2_s)
    BEGIN
        IF (Phase_detect_x_Pout_s2_s = "1") THEN
            Phase_detect_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s2_a) + SIGNED(Phase_detect_x_Pout_s2_b));
        ELSE
            Phase_detect_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s2_a) - SIGNED(Phase_detect_x_Pout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s2_q <= Phase_detect_x_Pout_s2_o(15 downto 0);

    -- Phase_detect_x_Pout_s3(ADDSUB,382)@3
    Phase_detect_x_Pout_s3_s <= Phase_detect_x_CmpYGeZero_s3_q;
    Phase_detect_x_Pout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s2_q(15)) & Phase_detect_x_Pout_s2_q));
    Phase_detect_x_Pout_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s3_q(16 downto 0));
    Phase_detect_x_Pout_s3_combproc: PROCESS (Phase_detect_x_Pout_s3_a, Phase_detect_x_Pout_s3_b, Phase_detect_x_Pout_s3_s)
    BEGIN
        IF (Phase_detect_x_Pout_s3_s = "1") THEN
            Phase_detect_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s3_a) + SIGNED(Phase_detect_x_Pout_s3_b));
        ELSE
            Phase_detect_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s3_a) - SIGNED(Phase_detect_x_Pout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s3_q <= Phase_detect_x_Pout_s3_o(15 downto 0);

    -- Phase_detect_x_Pout_s4(ADDSUB,395)@3
    Phase_detect_x_Pout_s4_s <= Phase_detect_x_CmpYGeZero_s4_q;
    Phase_detect_x_Pout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s3_q(15)) & Phase_detect_x_Pout_s3_q));
    Phase_detect_x_Pout_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s4_q(16 downto 0));
    Phase_detect_x_Pout_s4_combproc: PROCESS (Phase_detect_x_Pout_s4_a, Phase_detect_x_Pout_s4_b, Phase_detect_x_Pout_s4_s)
    BEGIN
        IF (Phase_detect_x_Pout_s4_s = "1") THEN
            Phase_detect_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s4_a) + SIGNED(Phase_detect_x_Pout_s4_b));
        ELSE
            Phase_detect_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s4_a) - SIGNED(Phase_detect_x_Pout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s4_q <= Phase_detect_x_Pout_s4_o(15 downto 0);

    -- Phase_detect_x_Pout_s5(ADDSUB,408)@3
    Phase_detect_x_Pout_s5_s <= Phase_detect_x_CmpYGeZero_s5_q;
    Phase_detect_x_Pout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s4_q(15)) & Phase_detect_x_Pout_s4_q));
    Phase_detect_x_Pout_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s5_q(16 downto 0));
    Phase_detect_x_Pout_s5_combproc: PROCESS (Phase_detect_x_Pout_s5_a, Phase_detect_x_Pout_s5_b, Phase_detect_x_Pout_s5_s)
    BEGIN
        IF (Phase_detect_x_Pout_s5_s = "1") THEN
            Phase_detect_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s5_a) + SIGNED(Phase_detect_x_Pout_s5_b));
        ELSE
            Phase_detect_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s5_a) - SIGNED(Phase_detect_x_Pout_s5_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s5_q <= Phase_detect_x_Pout_s5_o(15 downto 0);

    -- Phase_detect_x_Pout_s6(ADDSUB,421)@3 + 1
    Phase_detect_x_Pout_s6_s <= Phase_detect_x_CmpYGeZero_s6_q;
    Phase_detect_x_Pout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s5_q(15)) & Phase_detect_x_Pout_s5_q));
    Phase_detect_x_Pout_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s6_q(16 downto 0));
    Phase_detect_x_Pout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Pout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Pout_s6_s = "1") THEN
                Phase_detect_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s6_a) + SIGNED(Phase_detect_x_Pout_s6_b));
            ELSE
                Phase_detect_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s6_a) - SIGNED(Phase_detect_x_Pout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s6_q <= Phase_detect_x_Pout_s6_o(15 downto 0);

    -- Phase_detect_x_Pout_s7(ADDSUB,434)@4
    Phase_detect_x_Pout_s7_s <= Phase_detect_x_CmpYGeZero_s7_q;
    Phase_detect_x_Pout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s6_q(15)) & Phase_detect_x_Pout_s6_q));
    Phase_detect_x_Pout_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s7_q(16 downto 0));
    Phase_detect_x_Pout_s7_combproc: PROCESS (Phase_detect_x_Pout_s7_a, Phase_detect_x_Pout_s7_b, Phase_detect_x_Pout_s7_s)
    BEGIN
        IF (Phase_detect_x_Pout_s7_s = "1") THEN
            Phase_detect_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s7_a) + SIGNED(Phase_detect_x_Pout_s7_b));
        ELSE
            Phase_detect_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s7_a) - SIGNED(Phase_detect_x_Pout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s7_q <= Phase_detect_x_Pout_s7_o(15 downto 0);

    -- Phase_detect_x_Pout_s8(ADDSUB,447)@4
    Phase_detect_x_Pout_s8_s <= Phase_detect_x_CmpYGeZero_s8_q;
    Phase_detect_x_Pout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s7_q(15)) & Phase_detect_x_Pout_s7_q));
    Phase_detect_x_Pout_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s8_q(16 downto 0));
    Phase_detect_x_Pout_s8_combproc: PROCESS (Phase_detect_x_Pout_s8_a, Phase_detect_x_Pout_s8_b, Phase_detect_x_Pout_s8_s)
    BEGIN
        IF (Phase_detect_x_Pout_s8_s = "1") THEN
            Phase_detect_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s8_a) + SIGNED(Phase_detect_x_Pout_s8_b));
        ELSE
            Phase_detect_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s8_a) - SIGNED(Phase_detect_x_Pout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s8_q <= Phase_detect_x_Pout_s8_o(15 downto 0);

    -- Phase_detect_x_Pout_s9(ADDSUB,460)@4
    Phase_detect_x_Pout_s9_s <= Phase_detect_x_CmpYGeZero_s9_q;
    Phase_detect_x_Pout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s8_q(15)) & Phase_detect_x_Pout_s8_q));
    Phase_detect_x_Pout_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s9_q(16 downto 0));
    Phase_detect_x_Pout_s9_combproc: PROCESS (Phase_detect_x_Pout_s9_a, Phase_detect_x_Pout_s9_b, Phase_detect_x_Pout_s9_s)
    BEGIN
        IF (Phase_detect_x_Pout_s9_s = "1") THEN
            Phase_detect_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s9_a) + SIGNED(Phase_detect_x_Pout_s9_b));
        ELSE
            Phase_detect_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s9_a) - SIGNED(Phase_detect_x_Pout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s9_q <= Phase_detect_x_Pout_s9_o(15 downto 0);

    -- Phase_detect_x_Pout_s10(ADDSUB,473)@4
    Phase_detect_x_Pout_s10_s <= Phase_detect_x_CmpYGeZero_s10_q;
    Phase_detect_x_Pout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s9_q(15)) & Phase_detect_x_Pout_s9_q));
    Phase_detect_x_Pout_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s10_q(16 downto 0));
    Phase_detect_x_Pout_s10_combproc: PROCESS (Phase_detect_x_Pout_s10_a, Phase_detect_x_Pout_s10_b, Phase_detect_x_Pout_s10_s)
    BEGIN
        IF (Phase_detect_x_Pout_s10_s = "1") THEN
            Phase_detect_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s10_a) + SIGNED(Phase_detect_x_Pout_s10_b));
        ELSE
            Phase_detect_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s10_a) - SIGNED(Phase_detect_x_Pout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s10_q <= Phase_detect_x_Pout_s10_o(15 downto 0);

    -- Phase_detect_x_Pout_s11(ADDSUB,486)@4
    Phase_detect_x_Pout_s11_s <= Phase_detect_x_CmpYGeZero_s11_q;
    Phase_detect_x_Pout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s10_q(15)) & Phase_detect_x_Pout_s10_q));
    Phase_detect_x_Pout_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s11_q(16 downto 0));
    Phase_detect_x_Pout_s11_combproc: PROCESS (Phase_detect_x_Pout_s11_a, Phase_detect_x_Pout_s11_b, Phase_detect_x_Pout_s11_s)
    BEGIN
        IF (Phase_detect_x_Pout_s11_s = "1") THEN
            Phase_detect_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s11_a) + SIGNED(Phase_detect_x_Pout_s11_b));
        ELSE
            Phase_detect_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s11_a) - SIGNED(Phase_detect_x_Pout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s11_q <= Phase_detect_x_Pout_s11_o(15 downto 0);

    -- Phase_detect_x_Pout_s12(ADDSUB,499)@4
    Phase_detect_x_Pout_s12_s <= Phase_detect_x_CmpYGeZero_s12_q;
    Phase_detect_x_Pout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s11_q(15)) & Phase_detect_x_Pout_s11_q));
    Phase_detect_x_Pout_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s12_q(16 downto 0));
    Phase_detect_x_Pout_s12_combproc: PROCESS (Phase_detect_x_Pout_s12_a, Phase_detect_x_Pout_s12_b, Phase_detect_x_Pout_s12_s)
    BEGIN
        IF (Phase_detect_x_Pout_s12_s = "1") THEN
            Phase_detect_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s12_a) + SIGNED(Phase_detect_x_Pout_s12_b));
        ELSE
            Phase_detect_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s12_a) - SIGNED(Phase_detect_x_Pout_s12_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s12_q <= Phase_detect_x_Pout_s12_o(15 downto 0);

    -- Phase_detect_x_Pout_s13(ADDSUB,512)@4
    Phase_detect_x_Pout_s13_s <= Phase_detect_x_CmpYGeZero_s13_q;
    Phase_detect_x_Pout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s12_q(15)) & Phase_detect_x_Pout_s12_q));
    Phase_detect_x_Pout_s13_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s13_q(16 downto 0));
    Phase_detect_x_Pout_s13_combproc: PROCESS (Phase_detect_x_Pout_s13_a, Phase_detect_x_Pout_s13_b, Phase_detect_x_Pout_s13_s)
    BEGIN
        IF (Phase_detect_x_Pout_s13_s = "1") THEN
            Phase_detect_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s13_a) + SIGNED(Phase_detect_x_Pout_s13_b));
        ELSE
            Phase_detect_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s13_a) - SIGNED(Phase_detect_x_Pout_s13_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s13_q <= Phase_detect_x_Pout_s13_o(15 downto 0);

    -- Phase_detect_x_Pout_s14(ADDSUB,525)@4 + 1
    Phase_detect_x_Pout_s14_s <= Phase_detect_x_CmpYGeZero_s14_q;
    Phase_detect_x_Pout_s14_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => Phase_detect_x_Pout_s13_q(15)) & Phase_detect_x_Pout_s13_q));
    Phase_detect_x_Pout_s14_b <= STD_LOGIC_VECTOR(Phase_detect_x_CnstAtan_s14_q(16 downto 0));
    Phase_detect_x_Pout_s14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Pout_s14_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Pout_s14_s = "1") THEN
                Phase_detect_x_Pout_s14_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s14_a) + SIGNED(Phase_detect_x_Pout_s14_b));
            ELSE
                Phase_detect_x_Pout_s14_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s14_a) - SIGNED(Phase_detect_x_Pout_s14_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s14_q <= Phase_detect_x_Pout_s14_o(15 downto 0);

    -- Phase_detect_x_XLtZero_00(LOGICAL,320)@3 + 1
    Phase_detect_x_XLtZero_00_qi <= STD_LOGIC_VECTOR(final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q(13 downto 13));
    Phase_detect_x_XLtZero_00_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_detect_x_XLtZero_00_qi, xout => Phase_detect_x_XLtZero_00_q, clk => clk, aclr => areset );

    -- redist1_Phase_detect_x_XLtZero_00_q_2(DELAY,628)
    redist1_Phase_detect_x_XLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_detect_x_XLtZero_00_q, xout => redist1_Phase_detect_x_XLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_detect_x_SelPonX(MUX,544)@5
    Phase_detect_x_SelPonX_s <= redist1_Phase_detect_x_XLtZero_00_q_2_q;
    Phase_detect_x_SelPonX_combproc: PROCESS (Phase_detect_x_SelPonX_s, Phase_detect_x_Pout_s14_q, Phase_detect_x_LutSubP_q)
    BEGIN
        CASE (Phase_detect_x_SelPonX_s) IS
            WHEN "0" => Phase_detect_x_SelPonX_q <= STD_LOGIC_VECTOR((28 downto 16 => Phase_detect_x_Pout_s14_q(15)) & Phase_detect_x_Pout_s14_q);
            WHEN "1" => Phase_detect_x_SelPonX_q <= Phase_detect_x_LutSubP_q;
            WHEN OTHERS => Phase_detect_x_SelPonX_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_detect_PostCast_cordicWireAngle_rnd_x_sel(BITSELECT,551)@5
    Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_in <= STD_LOGIC_VECTOR(Phase_detect_x_SelPonX_q(27 downto 0));
    Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b <= STD_LOGIC_VECTOR(Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_in(27 downto 0));

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x(MUX,35)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_s <= redist4_ChannelIn_in_9_v_2_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q <= sym_Q_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Phase_correct_x_YLtZero_00(LOGICAL,118)@3
    Phase_correct_x_YLtZero_00_q <= STD_LOGIC_VECTOR(final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q(11 downto 11));

    -- redist2_Phase_correct_x_YLtZero_00_q_2(DELAY,629)
    redist2_Phase_correct_x_YLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_YLtZero_00_q, xout => redist2_Phase_correct_x_YLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_correct_x_LutPlusMinus(LOOKUP,308)@5
    Phase_correct_x_LutPlusMinus_combproc: PROCESS (redist2_Phase_correct_x_YLtZero_00_q_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist2_Phase_correct_x_YLtZero_00_q_2_q) IS
            WHEN "0" => Phase_correct_x_LutPlusMinus_q <= "0000000000001100100100010000";
            WHEN "1" => Phase_correct_x_LutPlusMinus_q <= "1111111111110011011011110000";
            WHEN OTHERS => -- unreachable
                           Phase_correct_x_LutPlusMinus_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- Phase_correct_x_LutSubP(SUB,309)@5
    Phase_correct_x_LutSubP_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_correct_x_LutPlusMinus_q(27)) & Phase_correct_x_LutPlusMinus_q));
    Phase_correct_x_LutSubP_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 14 => Phase_correct_x_Pout_s13_q(13)) & Phase_correct_x_Pout_s13_q));
    Phase_correct_x_LutSubP_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_LutSubP_a) - SIGNED(Phase_correct_x_LutSubP_b));
    Phase_correct_x_LutSubP_q <= Phase_correct_x_LutSubP_o(28 downto 0);

    -- Phase_correct_x_CmpYLtZero_s12(LOGICAL,283)@4
    Phase_correct_x_CmpYLtZero_s12_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s11_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s10(LOGICAL,257)@4
    Phase_correct_x_CmpYLtZero_s10_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s9_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s8(LOGICAL,231)@4
    Phase_correct_x_CmpYLtZero_s8_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s7_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s6(LOGICAL,205)@3
    Phase_correct_x_CmpYLtZero_s6_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s5_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s4(LOGICAL,179)@3
    Phase_correct_x_CmpYLtZero_s4_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s3_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s2(LOGICAL,153)@3
    Phase_correct_x_CmpYLtZero_s2_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s1_q(13 downto 13));

    -- Phase_correct_x_XgteZero_00(LOGICAL,115)@3
    Phase_correct_x_XgteZero_00_q <= STD_LOGIC_VECTOR(not (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q(11 downto 11)));

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x(MUX,33)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_s <= redist4_ChannelIn_in_9_v_2_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q <= sym_I_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Phase_correct_x_CnstZero_0(CONSTANT,110)
    Phase_correct_x_CnstZero_0_q <= "00000000000000";

    -- Phase_correct_x_ZeroAddSubX_00(ADDSUB,116)@3
    Phase_correct_x_ZeroAddSubX_00_s <= Phase_correct_x_XgteZero_00_q;
    Phase_correct_x_ZeroAddSubX_00_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_CnstZero_0_q(13)) & Phase_correct_x_CnstZero_0_q));
    Phase_correct_x_ZeroAddSubX_00_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q));
    Phase_correct_x_ZeroAddSubX_00_combproc: PROCESS (Phase_correct_x_ZeroAddSubX_00_a, Phase_correct_x_ZeroAddSubX_00_b, Phase_correct_x_ZeroAddSubX_00_s)
    BEGIN
        IF (Phase_correct_x_ZeroAddSubX_00_s = "1") THEN
            Phase_correct_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_ZeroAddSubX_00_a) + SIGNED(Phase_correct_x_ZeroAddSubX_00_b));
        ELSE
            Phase_correct_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_ZeroAddSubX_00_a) - SIGNED(Phase_correct_x_ZeroAddSubX_00_b));
        END IF;
    END PROCESS;
    Phase_correct_x_ZeroAddSubX_00_q <= Phase_correct_x_ZeroAddSubX_00_o(13 downto 0);

    -- Phase_correct_x_Yout_s0(ADDSUB,136)@3
    Phase_correct_x_Yout_s0_s <= Phase_correct_x_YLtZero_00_q;
    Phase_correct_x_Yout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q));
    Phase_correct_x_Yout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_ZeroAddSubX_00_q(13)) & Phase_correct_x_ZeroAddSubX_00_q));
    Phase_correct_x_Yout_s0_combproc: PROCESS (Phase_correct_x_Yout_s0_a, Phase_correct_x_Yout_s0_b, Phase_correct_x_Yout_s0_s)
    BEGIN
        IF (Phase_correct_x_Yout_s0_s = "1") THEN
            Phase_correct_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s0_a) + SIGNED(Phase_correct_x_Yout_s0_b));
        ELSE
            Phase_correct_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s0_a) - SIGNED(Phase_correct_x_Yout_s0_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s0_q <= Phase_correct_x_Yout_s0_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s1(LOGICAL,143)@3
    Phase_correct_x_CmpYGeZero_s1_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s0_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s1(BITSELECT,147)@3
    Phase_correct_x_ShiftY_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s0_q(13 downto 1));

    -- Phase_correct_x_CmpYGeZero_s0(LOGICAL,130)@3
    Phase_correct_x_CmpYGeZero_s0_q <= STD_LOGIC_VECTOR(not (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q(11 downto 11)));

    -- Phase_correct_x_ShiftY_s0(BITSELECT,134)@3
    Phase_correct_x_ShiftY_s0_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync7_Mux_x_q));
    Phase_correct_x_ShiftY_s0_b <= STD_LOGIC_VECTOR(Phase_correct_x_ShiftY_s0_in(13 downto 0));

    -- Phase_correct_x_Xout_s0(ADDSUB,135)@3
    Phase_correct_x_Xout_s0_s <= Phase_correct_x_CmpYGeZero_s0_q;
    Phase_correct_x_Xout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_ZeroAddSubX_00_q(13)) & Phase_correct_x_ZeroAddSubX_00_q));
    Phase_correct_x_Xout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_ShiftY_s0_b(13)) & Phase_correct_x_ShiftY_s0_b));
    Phase_correct_x_Xout_s0_combproc: PROCESS (Phase_correct_x_Xout_s0_a, Phase_correct_x_Xout_s0_b, Phase_correct_x_Xout_s0_s)
    BEGIN
        IF (Phase_correct_x_Xout_s0_s = "1") THEN
            Phase_correct_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s0_a) + SIGNED(Phase_correct_x_Xout_s0_b));
        ELSE
            Phase_correct_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s0_a) - SIGNED(Phase_correct_x_Xout_s0_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s0_q <= Phase_correct_x_Xout_s0_o(13 downto 0);

    -- Phase_correct_x_Xout_s1(ADDSUB,148)@3
    Phase_correct_x_Xout_s1_s <= Phase_correct_x_CmpYGeZero_s1_q;
    Phase_correct_x_Xout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s0_q(13)) & Phase_correct_x_Xout_s0_q));
    Phase_correct_x_Xout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => Phase_correct_x_ShiftY_s1_b(12)) & Phase_correct_x_ShiftY_s1_b));
    Phase_correct_x_Xout_s1_combproc: PROCESS (Phase_correct_x_Xout_s1_a, Phase_correct_x_Xout_s1_b, Phase_correct_x_Xout_s1_s)
    BEGIN
        IF (Phase_correct_x_Xout_s1_s = "1") THEN
            Phase_correct_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s1_a) + SIGNED(Phase_correct_x_Xout_s1_b));
        ELSE
            Phase_correct_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s1_a) - SIGNED(Phase_correct_x_Xout_s1_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s1_q <= Phase_correct_x_Xout_s1_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s2(BITSELECT,159)@3
    Phase_correct_x_ShiftX_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s1_q(13 downto 2));

    -- Phase_correct_x_CmpYLtZero_s1(LOGICAL,140)@3
    Phase_correct_x_CmpYLtZero_s1_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s0_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s1(BITSELECT,146)@3
    Phase_correct_x_ShiftX_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s0_q(13 downto 1));

    -- Phase_correct_x_Yout_s1(ADDSUB,149)@3
    Phase_correct_x_Yout_s1_s <= Phase_correct_x_CmpYLtZero_s1_q;
    Phase_correct_x_Yout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s0_q(13)) & Phase_correct_x_Yout_s0_q));
    Phase_correct_x_Yout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => Phase_correct_x_ShiftX_s1_b(12)) & Phase_correct_x_ShiftX_s1_b));
    Phase_correct_x_Yout_s1_combproc: PROCESS (Phase_correct_x_Yout_s1_a, Phase_correct_x_Yout_s1_b, Phase_correct_x_Yout_s1_s)
    BEGIN
        IF (Phase_correct_x_Yout_s1_s = "1") THEN
            Phase_correct_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s1_a) + SIGNED(Phase_correct_x_Yout_s1_b));
        ELSE
            Phase_correct_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s1_a) - SIGNED(Phase_correct_x_Yout_s1_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s1_q <= Phase_correct_x_Yout_s1_o(13 downto 0);

    -- Phase_correct_x_Yout_s2(ADDSUB,162)@3
    Phase_correct_x_Yout_s2_s <= Phase_correct_x_CmpYLtZero_s2_q;
    Phase_correct_x_Yout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s1_q(13)) & Phase_correct_x_Yout_s1_q));
    Phase_correct_x_Yout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => Phase_correct_x_ShiftX_s2_b(11)) & Phase_correct_x_ShiftX_s2_b));
    Phase_correct_x_Yout_s2_combproc: PROCESS (Phase_correct_x_Yout_s2_a, Phase_correct_x_Yout_s2_b, Phase_correct_x_Yout_s2_s)
    BEGIN
        IF (Phase_correct_x_Yout_s2_s = "1") THEN
            Phase_correct_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s2_a) + SIGNED(Phase_correct_x_Yout_s2_b));
        ELSE
            Phase_correct_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s2_a) - SIGNED(Phase_correct_x_Yout_s2_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s2_q <= Phase_correct_x_Yout_s2_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s3(LOGICAL,169)@3
    Phase_correct_x_CmpYGeZero_s3_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s2_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s3(BITSELECT,173)@3
    Phase_correct_x_ShiftY_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s2_q(13 downto 3));

    -- Phase_correct_x_CmpYGeZero_s2(LOGICAL,156)@3
    Phase_correct_x_CmpYGeZero_s2_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s1_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s2(BITSELECT,160)@3
    Phase_correct_x_ShiftY_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s1_q(13 downto 2));

    -- Phase_correct_x_Xout_s2(ADDSUB,161)@3
    Phase_correct_x_Xout_s2_s <= Phase_correct_x_CmpYGeZero_s2_q;
    Phase_correct_x_Xout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s1_q(13)) & Phase_correct_x_Xout_s1_q));
    Phase_correct_x_Xout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => Phase_correct_x_ShiftY_s2_b(11)) & Phase_correct_x_ShiftY_s2_b));
    Phase_correct_x_Xout_s2_combproc: PROCESS (Phase_correct_x_Xout_s2_a, Phase_correct_x_Xout_s2_b, Phase_correct_x_Xout_s2_s)
    BEGIN
        IF (Phase_correct_x_Xout_s2_s = "1") THEN
            Phase_correct_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s2_a) + SIGNED(Phase_correct_x_Xout_s2_b));
        ELSE
            Phase_correct_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s2_a) - SIGNED(Phase_correct_x_Xout_s2_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s2_q <= Phase_correct_x_Xout_s2_o(13 downto 0);

    -- Phase_correct_x_Xout_s3(ADDSUB,174)@3
    Phase_correct_x_Xout_s3_s <= Phase_correct_x_CmpYGeZero_s3_q;
    Phase_correct_x_Xout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s2_q(13)) & Phase_correct_x_Xout_s2_q));
    Phase_correct_x_Xout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => Phase_correct_x_ShiftY_s3_b(10)) & Phase_correct_x_ShiftY_s3_b));
    Phase_correct_x_Xout_s3_combproc: PROCESS (Phase_correct_x_Xout_s3_a, Phase_correct_x_Xout_s3_b, Phase_correct_x_Xout_s3_s)
    BEGIN
        IF (Phase_correct_x_Xout_s3_s = "1") THEN
            Phase_correct_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s3_a) + SIGNED(Phase_correct_x_Xout_s3_b));
        ELSE
            Phase_correct_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s3_a) - SIGNED(Phase_correct_x_Xout_s3_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s3_q <= Phase_correct_x_Xout_s3_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s4(BITSELECT,185)@3
    Phase_correct_x_ShiftX_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s3_q(13 downto 4));

    -- Phase_correct_x_CmpYLtZero_s3(LOGICAL,166)@3
    Phase_correct_x_CmpYLtZero_s3_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s2_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s3(BITSELECT,172)@3
    Phase_correct_x_ShiftX_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s2_q(13 downto 3));

    -- Phase_correct_x_Yout_s3(ADDSUB,175)@3
    Phase_correct_x_Yout_s3_s <= Phase_correct_x_CmpYLtZero_s3_q;
    Phase_correct_x_Yout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s2_q(13)) & Phase_correct_x_Yout_s2_q));
    Phase_correct_x_Yout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => Phase_correct_x_ShiftX_s3_b(10)) & Phase_correct_x_ShiftX_s3_b));
    Phase_correct_x_Yout_s3_combproc: PROCESS (Phase_correct_x_Yout_s3_a, Phase_correct_x_Yout_s3_b, Phase_correct_x_Yout_s3_s)
    BEGIN
        IF (Phase_correct_x_Yout_s3_s = "1") THEN
            Phase_correct_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s3_a) + SIGNED(Phase_correct_x_Yout_s3_b));
        ELSE
            Phase_correct_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s3_a) - SIGNED(Phase_correct_x_Yout_s3_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s3_q <= Phase_correct_x_Yout_s3_o(13 downto 0);

    -- Phase_correct_x_Yout_s4(ADDSUB,188)@3
    Phase_correct_x_Yout_s4_s <= Phase_correct_x_CmpYLtZero_s4_q;
    Phase_correct_x_Yout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s3_q(13)) & Phase_correct_x_Yout_s3_q));
    Phase_correct_x_Yout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_correct_x_ShiftX_s4_b(9)) & Phase_correct_x_ShiftX_s4_b));
    Phase_correct_x_Yout_s4_combproc: PROCESS (Phase_correct_x_Yout_s4_a, Phase_correct_x_Yout_s4_b, Phase_correct_x_Yout_s4_s)
    BEGIN
        IF (Phase_correct_x_Yout_s4_s = "1") THEN
            Phase_correct_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s4_a) + SIGNED(Phase_correct_x_Yout_s4_b));
        ELSE
            Phase_correct_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s4_a) - SIGNED(Phase_correct_x_Yout_s4_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s4_q <= Phase_correct_x_Yout_s4_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s5(LOGICAL,195)@3
    Phase_correct_x_CmpYGeZero_s5_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s4_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s5(BITSELECT,199)@3
    Phase_correct_x_ShiftY_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s4_q(13 downto 5));

    -- Phase_correct_x_CmpYGeZero_s4(LOGICAL,182)@3
    Phase_correct_x_CmpYGeZero_s4_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s3_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s4(BITSELECT,186)@3
    Phase_correct_x_ShiftY_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s3_q(13 downto 4));

    -- Phase_correct_x_Xout_s4(ADDSUB,187)@3
    Phase_correct_x_Xout_s4_s <= Phase_correct_x_CmpYGeZero_s4_q;
    Phase_correct_x_Xout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s3_q(13)) & Phase_correct_x_Xout_s3_q));
    Phase_correct_x_Xout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_correct_x_ShiftY_s4_b(9)) & Phase_correct_x_ShiftY_s4_b));
    Phase_correct_x_Xout_s4_combproc: PROCESS (Phase_correct_x_Xout_s4_a, Phase_correct_x_Xout_s4_b, Phase_correct_x_Xout_s4_s)
    BEGIN
        IF (Phase_correct_x_Xout_s4_s = "1") THEN
            Phase_correct_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s4_a) + SIGNED(Phase_correct_x_Xout_s4_b));
        ELSE
            Phase_correct_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s4_a) - SIGNED(Phase_correct_x_Xout_s4_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s4_q <= Phase_correct_x_Xout_s4_o(13 downto 0);

    -- Phase_correct_x_Xout_s5(ADDSUB,200)@3
    Phase_correct_x_Xout_s5_s <= Phase_correct_x_CmpYGeZero_s5_q;
    Phase_correct_x_Xout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s4_q(13)) & Phase_correct_x_Xout_s4_q));
    Phase_correct_x_Xout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => Phase_correct_x_ShiftY_s5_b(8)) & Phase_correct_x_ShiftY_s5_b));
    Phase_correct_x_Xout_s5_combproc: PROCESS (Phase_correct_x_Xout_s5_a, Phase_correct_x_Xout_s5_b, Phase_correct_x_Xout_s5_s)
    BEGIN
        IF (Phase_correct_x_Xout_s5_s = "1") THEN
            Phase_correct_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s5_a) + SIGNED(Phase_correct_x_Xout_s5_b));
        ELSE
            Phase_correct_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s5_a) - SIGNED(Phase_correct_x_Xout_s5_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s5_q <= Phase_correct_x_Xout_s5_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s6(BITSELECT,211)@3
    Phase_correct_x_ShiftX_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s5_q(13 downto 6));

    -- Phase_correct_x_CmpYLtZero_s5(LOGICAL,192)@3
    Phase_correct_x_CmpYLtZero_s5_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s4_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s5(BITSELECT,198)@3
    Phase_correct_x_ShiftX_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s4_q(13 downto 5));

    -- Phase_correct_x_Yout_s5(ADDSUB,201)@3
    Phase_correct_x_Yout_s5_s <= Phase_correct_x_CmpYLtZero_s5_q;
    Phase_correct_x_Yout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s4_q(13)) & Phase_correct_x_Yout_s4_q));
    Phase_correct_x_Yout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => Phase_correct_x_ShiftX_s5_b(8)) & Phase_correct_x_ShiftX_s5_b));
    Phase_correct_x_Yout_s5_combproc: PROCESS (Phase_correct_x_Yout_s5_a, Phase_correct_x_Yout_s5_b, Phase_correct_x_Yout_s5_s)
    BEGIN
        IF (Phase_correct_x_Yout_s5_s = "1") THEN
            Phase_correct_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s5_a) + SIGNED(Phase_correct_x_Yout_s5_b));
        ELSE
            Phase_correct_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s5_a) - SIGNED(Phase_correct_x_Yout_s5_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s5_q <= Phase_correct_x_Yout_s5_o(13 downto 0);

    -- Phase_correct_x_Yout_s6(ADDSUB,214)@3 + 1
    Phase_correct_x_Yout_s6_s <= Phase_correct_x_CmpYLtZero_s6_q;
    Phase_correct_x_Yout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s5_q(13)) & Phase_correct_x_Yout_s5_q));
    Phase_correct_x_Yout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_correct_x_ShiftX_s6_b(7)) & Phase_correct_x_ShiftX_s6_b));
    Phase_correct_x_Yout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Yout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Yout_s6_s = "1") THEN
                Phase_correct_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s6_a) + SIGNED(Phase_correct_x_Yout_s6_b));
            ELSE
                Phase_correct_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s6_a) - SIGNED(Phase_correct_x_Yout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s6_q <= Phase_correct_x_Yout_s6_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s7(LOGICAL,221)@4
    Phase_correct_x_CmpYGeZero_s7_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s6_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s7(BITSELECT,225)@4
    Phase_correct_x_ShiftY_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s6_q(13 downto 7));

    -- Phase_correct_x_CmpYGeZero_s6(LOGICAL,208)@3
    Phase_correct_x_CmpYGeZero_s6_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s5_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s6(BITSELECT,212)@3
    Phase_correct_x_ShiftY_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s5_q(13 downto 6));

    -- Phase_correct_x_Xout_s6(ADDSUB,213)@3 + 1
    Phase_correct_x_Xout_s6_s <= Phase_correct_x_CmpYGeZero_s6_q;
    Phase_correct_x_Xout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s5_q(13)) & Phase_correct_x_Xout_s5_q));
    Phase_correct_x_Xout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_correct_x_ShiftY_s6_b(7)) & Phase_correct_x_ShiftY_s6_b));
    Phase_correct_x_Xout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Xout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Xout_s6_s = "1") THEN
                Phase_correct_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s6_a) + SIGNED(Phase_correct_x_Xout_s6_b));
            ELSE
                Phase_correct_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s6_a) - SIGNED(Phase_correct_x_Xout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s6_q <= Phase_correct_x_Xout_s6_o(13 downto 0);

    -- Phase_correct_x_Xout_s7(ADDSUB,226)@4
    Phase_correct_x_Xout_s7_s <= Phase_correct_x_CmpYGeZero_s7_q;
    Phase_correct_x_Xout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s6_q(13)) & Phase_correct_x_Xout_s6_q));
    Phase_correct_x_Xout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => Phase_correct_x_ShiftY_s7_b(6)) & Phase_correct_x_ShiftY_s7_b));
    Phase_correct_x_Xout_s7_combproc: PROCESS (Phase_correct_x_Xout_s7_a, Phase_correct_x_Xout_s7_b, Phase_correct_x_Xout_s7_s)
    BEGIN
        IF (Phase_correct_x_Xout_s7_s = "1") THEN
            Phase_correct_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s7_a) + SIGNED(Phase_correct_x_Xout_s7_b));
        ELSE
            Phase_correct_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s7_a) - SIGNED(Phase_correct_x_Xout_s7_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s7_q <= Phase_correct_x_Xout_s7_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s8(BITSELECT,237)@4
    Phase_correct_x_ShiftX_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s7_q(13 downto 8));

    -- Phase_correct_x_CmpYLtZero_s7(LOGICAL,218)@4
    Phase_correct_x_CmpYLtZero_s7_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s6_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s7(BITSELECT,224)@4
    Phase_correct_x_ShiftX_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s6_q(13 downto 7));

    -- Phase_correct_x_Yout_s7(ADDSUB,227)@4
    Phase_correct_x_Yout_s7_s <= Phase_correct_x_CmpYLtZero_s7_q;
    Phase_correct_x_Yout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s6_q(13)) & Phase_correct_x_Yout_s6_q));
    Phase_correct_x_Yout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => Phase_correct_x_ShiftX_s7_b(6)) & Phase_correct_x_ShiftX_s7_b));
    Phase_correct_x_Yout_s7_combproc: PROCESS (Phase_correct_x_Yout_s7_a, Phase_correct_x_Yout_s7_b, Phase_correct_x_Yout_s7_s)
    BEGIN
        IF (Phase_correct_x_Yout_s7_s = "1") THEN
            Phase_correct_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s7_a) + SIGNED(Phase_correct_x_Yout_s7_b));
        ELSE
            Phase_correct_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s7_a) - SIGNED(Phase_correct_x_Yout_s7_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s7_q <= Phase_correct_x_Yout_s7_o(13 downto 0);

    -- Phase_correct_x_Yout_s8(ADDSUB,240)@4
    Phase_correct_x_Yout_s8_s <= Phase_correct_x_CmpYLtZero_s8_q;
    Phase_correct_x_Yout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s7_q(13)) & Phase_correct_x_Yout_s7_q));
    Phase_correct_x_Yout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => Phase_correct_x_ShiftX_s8_b(5)) & Phase_correct_x_ShiftX_s8_b));
    Phase_correct_x_Yout_s8_combproc: PROCESS (Phase_correct_x_Yout_s8_a, Phase_correct_x_Yout_s8_b, Phase_correct_x_Yout_s8_s)
    BEGIN
        IF (Phase_correct_x_Yout_s8_s = "1") THEN
            Phase_correct_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s8_a) + SIGNED(Phase_correct_x_Yout_s8_b));
        ELSE
            Phase_correct_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s8_a) - SIGNED(Phase_correct_x_Yout_s8_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s8_q <= Phase_correct_x_Yout_s8_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s9(LOGICAL,247)@4
    Phase_correct_x_CmpYGeZero_s9_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s8_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s9(BITSELECT,251)@4
    Phase_correct_x_ShiftY_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s8_q(13 downto 9));

    -- Phase_correct_x_CmpYGeZero_s8(LOGICAL,234)@4
    Phase_correct_x_CmpYGeZero_s8_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s7_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s8(BITSELECT,238)@4
    Phase_correct_x_ShiftY_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s7_q(13 downto 8));

    -- Phase_correct_x_Xout_s8(ADDSUB,239)@4
    Phase_correct_x_Xout_s8_s <= Phase_correct_x_CmpYGeZero_s8_q;
    Phase_correct_x_Xout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s7_q(13)) & Phase_correct_x_Xout_s7_q));
    Phase_correct_x_Xout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => Phase_correct_x_ShiftY_s8_b(5)) & Phase_correct_x_ShiftY_s8_b));
    Phase_correct_x_Xout_s8_combproc: PROCESS (Phase_correct_x_Xout_s8_a, Phase_correct_x_Xout_s8_b, Phase_correct_x_Xout_s8_s)
    BEGIN
        IF (Phase_correct_x_Xout_s8_s = "1") THEN
            Phase_correct_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s8_a) + SIGNED(Phase_correct_x_Xout_s8_b));
        ELSE
            Phase_correct_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s8_a) - SIGNED(Phase_correct_x_Xout_s8_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s8_q <= Phase_correct_x_Xout_s8_o(13 downto 0);

    -- Phase_correct_x_Xout_s9(ADDSUB,252)@4
    Phase_correct_x_Xout_s9_s <= Phase_correct_x_CmpYGeZero_s9_q;
    Phase_correct_x_Xout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s8_q(13)) & Phase_correct_x_Xout_s8_q));
    Phase_correct_x_Xout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => Phase_correct_x_ShiftY_s9_b(4)) & Phase_correct_x_ShiftY_s9_b));
    Phase_correct_x_Xout_s9_combproc: PROCESS (Phase_correct_x_Xout_s9_a, Phase_correct_x_Xout_s9_b, Phase_correct_x_Xout_s9_s)
    BEGIN
        IF (Phase_correct_x_Xout_s9_s = "1") THEN
            Phase_correct_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s9_a) + SIGNED(Phase_correct_x_Xout_s9_b));
        ELSE
            Phase_correct_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s9_a) - SIGNED(Phase_correct_x_Xout_s9_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s9_q <= Phase_correct_x_Xout_s9_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s10(BITSELECT,263)@4
    Phase_correct_x_ShiftX_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s9_q(13 downto 10));

    -- Phase_correct_x_CmpYLtZero_s9(LOGICAL,244)@4
    Phase_correct_x_CmpYLtZero_s9_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s8_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s9(BITSELECT,250)@4
    Phase_correct_x_ShiftX_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s8_q(13 downto 9));

    -- Phase_correct_x_Yout_s9(ADDSUB,253)@4
    Phase_correct_x_Yout_s9_s <= Phase_correct_x_CmpYLtZero_s9_q;
    Phase_correct_x_Yout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s8_q(13)) & Phase_correct_x_Yout_s8_q));
    Phase_correct_x_Yout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => Phase_correct_x_ShiftX_s9_b(4)) & Phase_correct_x_ShiftX_s9_b));
    Phase_correct_x_Yout_s9_combproc: PROCESS (Phase_correct_x_Yout_s9_a, Phase_correct_x_Yout_s9_b, Phase_correct_x_Yout_s9_s)
    BEGIN
        IF (Phase_correct_x_Yout_s9_s = "1") THEN
            Phase_correct_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s9_a) + SIGNED(Phase_correct_x_Yout_s9_b));
        ELSE
            Phase_correct_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s9_a) - SIGNED(Phase_correct_x_Yout_s9_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s9_q <= Phase_correct_x_Yout_s9_o(13 downto 0);

    -- Phase_correct_x_Yout_s10(ADDSUB,266)@4
    Phase_correct_x_Yout_s10_s <= Phase_correct_x_CmpYLtZero_s10_q;
    Phase_correct_x_Yout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s9_q(13)) & Phase_correct_x_Yout_s9_q));
    Phase_correct_x_Yout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => Phase_correct_x_ShiftX_s10_b(3)) & Phase_correct_x_ShiftX_s10_b));
    Phase_correct_x_Yout_s10_combproc: PROCESS (Phase_correct_x_Yout_s10_a, Phase_correct_x_Yout_s10_b, Phase_correct_x_Yout_s10_s)
    BEGIN
        IF (Phase_correct_x_Yout_s10_s = "1") THEN
            Phase_correct_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s10_a) + SIGNED(Phase_correct_x_Yout_s10_b));
        ELSE
            Phase_correct_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s10_a) - SIGNED(Phase_correct_x_Yout_s10_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s10_q <= Phase_correct_x_Yout_s10_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s11(LOGICAL,273)@4
    Phase_correct_x_CmpYGeZero_s11_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s10_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s11(BITSELECT,277)@4
    Phase_correct_x_ShiftY_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s10_q(13 downto 11));

    -- Phase_correct_x_CmpYGeZero_s10(LOGICAL,260)@4
    Phase_correct_x_CmpYGeZero_s10_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s9_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s10(BITSELECT,264)@4
    Phase_correct_x_ShiftY_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s9_q(13 downto 10));

    -- Phase_correct_x_Xout_s10(ADDSUB,265)@4
    Phase_correct_x_Xout_s10_s <= Phase_correct_x_CmpYGeZero_s10_q;
    Phase_correct_x_Xout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s9_q(13)) & Phase_correct_x_Xout_s9_q));
    Phase_correct_x_Xout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => Phase_correct_x_ShiftY_s10_b(3)) & Phase_correct_x_ShiftY_s10_b));
    Phase_correct_x_Xout_s10_combproc: PROCESS (Phase_correct_x_Xout_s10_a, Phase_correct_x_Xout_s10_b, Phase_correct_x_Xout_s10_s)
    BEGIN
        IF (Phase_correct_x_Xout_s10_s = "1") THEN
            Phase_correct_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s10_a) + SIGNED(Phase_correct_x_Xout_s10_b));
        ELSE
            Phase_correct_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s10_a) - SIGNED(Phase_correct_x_Xout_s10_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s10_q <= Phase_correct_x_Xout_s10_o(13 downto 0);

    -- Phase_correct_x_Xout_s11(ADDSUB,278)@4
    Phase_correct_x_Xout_s11_s <= Phase_correct_x_CmpYGeZero_s11_q;
    Phase_correct_x_Xout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s10_q(13)) & Phase_correct_x_Xout_s10_q));
    Phase_correct_x_Xout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => Phase_correct_x_ShiftY_s11_b(2)) & Phase_correct_x_ShiftY_s11_b));
    Phase_correct_x_Xout_s11_combproc: PROCESS (Phase_correct_x_Xout_s11_a, Phase_correct_x_Xout_s11_b, Phase_correct_x_Xout_s11_s)
    BEGIN
        IF (Phase_correct_x_Xout_s11_s = "1") THEN
            Phase_correct_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s11_a) + SIGNED(Phase_correct_x_Xout_s11_b));
        ELSE
            Phase_correct_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s11_a) - SIGNED(Phase_correct_x_Xout_s11_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s11_q <= Phase_correct_x_Xout_s11_o(13 downto 0);

    -- Phase_correct_x_ShiftX_s12(BITSELECT,289)@4
    Phase_correct_x_ShiftX_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s11_q(13 downto 12));

    -- Phase_correct_x_CmpYLtZero_s11(LOGICAL,270)@4
    Phase_correct_x_CmpYLtZero_s11_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s10_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s11(BITSELECT,276)@4
    Phase_correct_x_ShiftX_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s10_q(13 downto 11));

    -- Phase_correct_x_Yout_s11(ADDSUB,279)@4
    Phase_correct_x_Yout_s11_s <= Phase_correct_x_CmpYLtZero_s11_q;
    Phase_correct_x_Yout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s10_q(13)) & Phase_correct_x_Yout_s10_q));
    Phase_correct_x_Yout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => Phase_correct_x_ShiftX_s11_b(2)) & Phase_correct_x_ShiftX_s11_b));
    Phase_correct_x_Yout_s11_combproc: PROCESS (Phase_correct_x_Yout_s11_a, Phase_correct_x_Yout_s11_b, Phase_correct_x_Yout_s11_s)
    BEGIN
        IF (Phase_correct_x_Yout_s11_s = "1") THEN
            Phase_correct_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s11_a) + SIGNED(Phase_correct_x_Yout_s11_b));
        ELSE
            Phase_correct_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s11_a) - SIGNED(Phase_correct_x_Yout_s11_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s11_q <= Phase_correct_x_Yout_s11_o(13 downto 0);

    -- Phase_correct_x_Yout_s12(ADDSUB,292)@4
    Phase_correct_x_Yout_s12_s <= Phase_correct_x_CmpYLtZero_s12_q;
    Phase_correct_x_Yout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s11_q(13)) & Phase_correct_x_Yout_s11_q));
    Phase_correct_x_Yout_s12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 2 => Phase_correct_x_ShiftX_s12_b(1)) & Phase_correct_x_ShiftX_s12_b));
    Phase_correct_x_Yout_s12_combproc: PROCESS (Phase_correct_x_Yout_s12_a, Phase_correct_x_Yout_s12_b, Phase_correct_x_Yout_s12_s)
    BEGIN
        IF (Phase_correct_x_Yout_s12_s = "1") THEN
            Phase_correct_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s12_a) + SIGNED(Phase_correct_x_Yout_s12_b));
        ELSE
            Phase_correct_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s12_a) - SIGNED(Phase_correct_x_Yout_s12_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s12_q <= Phase_correct_x_Yout_s12_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s13(LOGICAL,299)@4
    Phase_correct_x_CmpYGeZero_s13_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s12_q(13 downto 13)));

    -- Phase_correct_x_CmpYGeZero_s12(LOGICAL,286)@4
    Phase_correct_x_CmpYGeZero_s12_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s11_q(13 downto 13)));

    -- Phase_correct_x_Pout_s0(ADDSUB,137)@3
    Phase_correct_x_Pout_s0_s <= Phase_correct_x_CmpYGeZero_s0_q;
    Phase_correct_x_Pout_s0_a <= STD_LOGIC_VECTOR(muxopt_assign_id1_q_const_q(14 downto 0));
    Phase_correct_x_Pout_s0_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s0_q(14 downto 0));
    Phase_correct_x_Pout_s0_combproc: PROCESS (Phase_correct_x_Pout_s0_a, Phase_correct_x_Pout_s0_b, Phase_correct_x_Pout_s0_s)
    BEGIN
        IF (Phase_correct_x_Pout_s0_s = "1") THEN
            Phase_correct_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s0_a) + SIGNED(Phase_correct_x_Pout_s0_b));
        ELSE
            Phase_correct_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s0_a) - SIGNED(Phase_correct_x_Pout_s0_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s0_q <= Phase_correct_x_Pout_s0_o(13 downto 0);

    -- Phase_correct_x_Pout_s1(ADDSUB,150)@3
    Phase_correct_x_Pout_s1_s <= Phase_correct_x_CmpYGeZero_s1_q;
    Phase_correct_x_Pout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s0_q(13)) & Phase_correct_x_Pout_s0_q));
    Phase_correct_x_Pout_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s1_q(14 downto 0));
    Phase_correct_x_Pout_s1_combproc: PROCESS (Phase_correct_x_Pout_s1_a, Phase_correct_x_Pout_s1_b, Phase_correct_x_Pout_s1_s)
    BEGIN
        IF (Phase_correct_x_Pout_s1_s = "1") THEN
            Phase_correct_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s1_a) + SIGNED(Phase_correct_x_Pout_s1_b));
        ELSE
            Phase_correct_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s1_a) - SIGNED(Phase_correct_x_Pout_s1_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s1_q <= Phase_correct_x_Pout_s1_o(13 downto 0);

    -- Phase_correct_x_Pout_s2(ADDSUB,163)@3
    Phase_correct_x_Pout_s2_s <= Phase_correct_x_CmpYGeZero_s2_q;
    Phase_correct_x_Pout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s1_q(13)) & Phase_correct_x_Pout_s1_q));
    Phase_correct_x_Pout_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s2_q(14 downto 0));
    Phase_correct_x_Pout_s2_combproc: PROCESS (Phase_correct_x_Pout_s2_a, Phase_correct_x_Pout_s2_b, Phase_correct_x_Pout_s2_s)
    BEGIN
        IF (Phase_correct_x_Pout_s2_s = "1") THEN
            Phase_correct_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s2_a) + SIGNED(Phase_correct_x_Pout_s2_b));
        ELSE
            Phase_correct_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s2_a) - SIGNED(Phase_correct_x_Pout_s2_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s2_q <= Phase_correct_x_Pout_s2_o(13 downto 0);

    -- Phase_correct_x_Pout_s3(ADDSUB,176)@3
    Phase_correct_x_Pout_s3_s <= Phase_correct_x_CmpYGeZero_s3_q;
    Phase_correct_x_Pout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s2_q(13)) & Phase_correct_x_Pout_s2_q));
    Phase_correct_x_Pout_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s3_q(14 downto 0));
    Phase_correct_x_Pout_s3_combproc: PROCESS (Phase_correct_x_Pout_s3_a, Phase_correct_x_Pout_s3_b, Phase_correct_x_Pout_s3_s)
    BEGIN
        IF (Phase_correct_x_Pout_s3_s = "1") THEN
            Phase_correct_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s3_a) + SIGNED(Phase_correct_x_Pout_s3_b));
        ELSE
            Phase_correct_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s3_a) - SIGNED(Phase_correct_x_Pout_s3_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s3_q <= Phase_correct_x_Pout_s3_o(13 downto 0);

    -- Phase_correct_x_Pout_s4(ADDSUB,189)@3
    Phase_correct_x_Pout_s4_s <= Phase_correct_x_CmpYGeZero_s4_q;
    Phase_correct_x_Pout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s3_q(13)) & Phase_correct_x_Pout_s3_q));
    Phase_correct_x_Pout_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s4_q(14 downto 0));
    Phase_correct_x_Pout_s4_combproc: PROCESS (Phase_correct_x_Pout_s4_a, Phase_correct_x_Pout_s4_b, Phase_correct_x_Pout_s4_s)
    BEGIN
        IF (Phase_correct_x_Pout_s4_s = "1") THEN
            Phase_correct_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s4_a) + SIGNED(Phase_correct_x_Pout_s4_b));
        ELSE
            Phase_correct_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s4_a) - SIGNED(Phase_correct_x_Pout_s4_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s4_q <= Phase_correct_x_Pout_s4_o(13 downto 0);

    -- Phase_correct_x_Pout_s5(ADDSUB,202)@3
    Phase_correct_x_Pout_s5_s <= Phase_correct_x_CmpYGeZero_s5_q;
    Phase_correct_x_Pout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s4_q(13)) & Phase_correct_x_Pout_s4_q));
    Phase_correct_x_Pout_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s5_q(14 downto 0));
    Phase_correct_x_Pout_s5_combproc: PROCESS (Phase_correct_x_Pout_s5_a, Phase_correct_x_Pout_s5_b, Phase_correct_x_Pout_s5_s)
    BEGIN
        IF (Phase_correct_x_Pout_s5_s = "1") THEN
            Phase_correct_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s5_a) + SIGNED(Phase_correct_x_Pout_s5_b));
        ELSE
            Phase_correct_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s5_a) - SIGNED(Phase_correct_x_Pout_s5_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s5_q <= Phase_correct_x_Pout_s5_o(13 downto 0);

    -- Phase_correct_x_Pout_s6(ADDSUB,215)@3 + 1
    Phase_correct_x_Pout_s6_s <= Phase_correct_x_CmpYGeZero_s6_q;
    Phase_correct_x_Pout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s5_q(13)) & Phase_correct_x_Pout_s5_q));
    Phase_correct_x_Pout_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s6_q(14 downto 0));
    Phase_correct_x_Pout_s6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Pout_s6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Pout_s6_s = "1") THEN
                Phase_correct_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s6_a) + SIGNED(Phase_correct_x_Pout_s6_b));
            ELSE
                Phase_correct_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s6_a) - SIGNED(Phase_correct_x_Pout_s6_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s6_q <= Phase_correct_x_Pout_s6_o(13 downto 0);

    -- Phase_correct_x_Pout_s7(ADDSUB,228)@4
    Phase_correct_x_Pout_s7_s <= Phase_correct_x_CmpYGeZero_s7_q;
    Phase_correct_x_Pout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s6_q(13)) & Phase_correct_x_Pout_s6_q));
    Phase_correct_x_Pout_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s7_q(14 downto 0));
    Phase_correct_x_Pout_s7_combproc: PROCESS (Phase_correct_x_Pout_s7_a, Phase_correct_x_Pout_s7_b, Phase_correct_x_Pout_s7_s)
    BEGIN
        IF (Phase_correct_x_Pout_s7_s = "1") THEN
            Phase_correct_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s7_a) + SIGNED(Phase_correct_x_Pout_s7_b));
        ELSE
            Phase_correct_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s7_a) - SIGNED(Phase_correct_x_Pout_s7_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s7_q <= Phase_correct_x_Pout_s7_o(13 downto 0);

    -- Phase_correct_x_Pout_s8(ADDSUB,241)@4
    Phase_correct_x_Pout_s8_s <= Phase_correct_x_CmpYGeZero_s8_q;
    Phase_correct_x_Pout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s7_q(13)) & Phase_correct_x_Pout_s7_q));
    Phase_correct_x_Pout_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s8_q(14 downto 0));
    Phase_correct_x_Pout_s8_combproc: PROCESS (Phase_correct_x_Pout_s8_a, Phase_correct_x_Pout_s8_b, Phase_correct_x_Pout_s8_s)
    BEGIN
        IF (Phase_correct_x_Pout_s8_s = "1") THEN
            Phase_correct_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s8_a) + SIGNED(Phase_correct_x_Pout_s8_b));
        ELSE
            Phase_correct_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s8_a) - SIGNED(Phase_correct_x_Pout_s8_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s8_q <= Phase_correct_x_Pout_s8_o(13 downto 0);

    -- Phase_correct_x_Pout_s9(ADDSUB,254)@4
    Phase_correct_x_Pout_s9_s <= Phase_correct_x_CmpYGeZero_s9_q;
    Phase_correct_x_Pout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s8_q(13)) & Phase_correct_x_Pout_s8_q));
    Phase_correct_x_Pout_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s9_q(14 downto 0));
    Phase_correct_x_Pout_s9_combproc: PROCESS (Phase_correct_x_Pout_s9_a, Phase_correct_x_Pout_s9_b, Phase_correct_x_Pout_s9_s)
    BEGIN
        IF (Phase_correct_x_Pout_s9_s = "1") THEN
            Phase_correct_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s9_a) + SIGNED(Phase_correct_x_Pout_s9_b));
        ELSE
            Phase_correct_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s9_a) - SIGNED(Phase_correct_x_Pout_s9_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s9_q <= Phase_correct_x_Pout_s9_o(13 downto 0);

    -- Phase_correct_x_Pout_s10(ADDSUB,267)@4
    Phase_correct_x_Pout_s10_s <= Phase_correct_x_CmpYGeZero_s10_q;
    Phase_correct_x_Pout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s9_q(13)) & Phase_correct_x_Pout_s9_q));
    Phase_correct_x_Pout_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s10_q(14 downto 0));
    Phase_correct_x_Pout_s10_combproc: PROCESS (Phase_correct_x_Pout_s10_a, Phase_correct_x_Pout_s10_b, Phase_correct_x_Pout_s10_s)
    BEGIN
        IF (Phase_correct_x_Pout_s10_s = "1") THEN
            Phase_correct_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s10_a) + SIGNED(Phase_correct_x_Pout_s10_b));
        ELSE
            Phase_correct_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s10_a) - SIGNED(Phase_correct_x_Pout_s10_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s10_q <= Phase_correct_x_Pout_s10_o(13 downto 0);

    -- Phase_correct_x_Pout_s11(ADDSUB,280)@4
    Phase_correct_x_Pout_s11_s <= Phase_correct_x_CmpYGeZero_s11_q;
    Phase_correct_x_Pout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s10_q(13)) & Phase_correct_x_Pout_s10_q));
    Phase_correct_x_Pout_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s11_q(14 downto 0));
    Phase_correct_x_Pout_s11_combproc: PROCESS (Phase_correct_x_Pout_s11_a, Phase_correct_x_Pout_s11_b, Phase_correct_x_Pout_s11_s)
    BEGIN
        IF (Phase_correct_x_Pout_s11_s = "1") THEN
            Phase_correct_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s11_a) + SIGNED(Phase_correct_x_Pout_s11_b));
        ELSE
            Phase_correct_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s11_a) - SIGNED(Phase_correct_x_Pout_s11_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s11_q <= Phase_correct_x_Pout_s11_o(13 downto 0);

    -- Phase_correct_x_Pout_s12(ADDSUB,293)@4
    Phase_correct_x_Pout_s12_s <= Phase_correct_x_CmpYGeZero_s12_q;
    Phase_correct_x_Pout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s11_q(13)) & Phase_correct_x_Pout_s11_q));
    Phase_correct_x_Pout_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s12_q(14 downto 0));
    Phase_correct_x_Pout_s12_combproc: PROCESS (Phase_correct_x_Pout_s12_a, Phase_correct_x_Pout_s12_b, Phase_correct_x_Pout_s12_s)
    BEGIN
        IF (Phase_correct_x_Pout_s12_s = "1") THEN
            Phase_correct_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s12_a) + SIGNED(Phase_correct_x_Pout_s12_b));
        ELSE
            Phase_correct_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s12_a) - SIGNED(Phase_correct_x_Pout_s12_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s12_q <= Phase_correct_x_Pout_s12_o(13 downto 0);

    -- Phase_correct_x_Pout_s13(ADDSUB,306)@4 + 1
    Phase_correct_x_Pout_s13_s <= Phase_correct_x_CmpYGeZero_s13_q;
    Phase_correct_x_Pout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s12_q(13)) & Phase_correct_x_Pout_s12_q));
    Phase_correct_x_Pout_s13_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s13_q(14 downto 0));
    Phase_correct_x_Pout_s13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Pout_s13_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Pout_s13_s = "1") THEN
                Phase_correct_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s13_a) + SIGNED(Phase_correct_x_Pout_s13_b));
            ELSE
                Phase_correct_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s13_a) - SIGNED(Phase_correct_x_Pout_s13_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s13_q <= Phase_correct_x_Pout_s13_o(13 downto 0);

    -- Phase_correct_x_XLtZero_00(LOGICAL,114)@3 + 1
    Phase_correct_x_XLtZero_00_qi <= STD_LOGIC_VECTOR(final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync6_Mux_x_q(11 downto 11));
    Phase_correct_x_XLtZero_00_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_XLtZero_00_qi, xout => Phase_correct_x_XLtZero_00_q, clk => clk, aclr => areset );

    -- redist3_Phase_correct_x_XLtZero_00_q_2(DELAY,630)
    redist3_Phase_correct_x_XLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_XLtZero_00_q, xout => redist3_Phase_correct_x_XLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_correct_x_SelPonX(MUX,312)@5
    Phase_correct_x_SelPonX_s <= redist3_Phase_correct_x_XLtZero_00_q_2_q;
    Phase_correct_x_SelPonX_combproc: PROCESS (Phase_correct_x_SelPonX_s, Phase_correct_x_Pout_s13_q, Phase_correct_x_LutSubP_q)
    BEGIN
        CASE (Phase_correct_x_SelPonX_s) IS
            WHEN "0" => Phase_correct_x_SelPonX_q <= STD_LOGIC_VECTOR((28 downto 14 => Phase_correct_x_Pout_s13_q(13)) & Phase_correct_x_Pout_s13_q);
            WHEN "1" => Phase_correct_x_SelPonX_q <= Phase_correct_x_LutSubP_q;
            WHEN OTHERS => Phase_correct_x_SelPonX_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_correct_PostCast_cordicWireAngle_rnd_x_sel(BITSELECT,550)@5
    Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_in <= STD_LOGIC_VECTOR(Phase_correct_x_SelPonX_q(27 downto 0));
    Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b <= STD_LOGIC_VECTOR(Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_in(27 downto 0));

    -- Sub(SUB,93)@5
    Sub_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b(27)) & Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b));
    Sub_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b(27)) & Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b));
    Sub_o <= STD_LOGIC_VECTOR(SIGNED(Sub_a) - SIGNED(Sub_b));
    Sub_q <= Sub_o(28 downto 0);

    -- Mode_Meas12_x(CONSTANT,80)
    Mode_Meas12_x_q <= "11110011011100";

    -- CmpGE10_PreShift_0(BITSHIFT,101)@5
    CmpGE10_PreShift_0_qint <= Mode_Meas12_x_q & "000000";
    CmpGE10_PreShift_0_q <= CmpGE10_PreShift_0_qint(19 downto 0);

    -- CmpGE10(COMPARE,68)@5
    CmpGE10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => CmpGE10_PreShift_0_q(19)) & CmpGE10_PreShift_0_q));
    CmpGE10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => Sub_q(28)) & Sub_q));
    CmpGE10_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE10_a) - SIGNED(CmpGE10_b));
    CmpGE10_n(0) <= not (CmpGE10_o(30));

    -- Mode_Meas11_x(CONSTANT,79)
    Mode_Meas11_x_q <= "00001100100100";

    -- CmpGE9_PreShift_1(BITSHIFT,100)@5
    CmpGE9_PreShift_1_qint <= Mode_Meas11_x_q & "000000";
    CmpGE9_PreShift_1_q <= CmpGE9_PreShift_1_qint(19 downto 0);

    -- CmpGE9(COMPARE,70)@5
    CmpGE9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => Sub_q(28)) & Sub_q));
    CmpGE9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => CmpGE9_PreShift_1_q(19)) & CmpGE9_PreShift_1_q));
    CmpGE9_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE9_a) - SIGNED(CmpGE9_b));
    CmpGE9_n(0) <= not (CmpGE9_o(30));

    -- BitCombine(BITJOIN,64)@5
    BitCombine_q <= CmpGE10_n & CmpGE9_n;

    -- sym_Q1(MUX,99)@5 + 1
    sym_Q1_s <= BitCombine_q;
    sym_Q1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sym_Q1_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sym_Q1_s) IS
                WHEN "00" => sym_Q1_q <= STD_LOGIC_VECTOR((29 downto 29 => Sub_q(28)) & Sub_q);
                WHEN "01" => sym_Q1_q <= Sub1_q;
                WHEN "10" => sym_Q1_q <= Sub2_q;
                WHEN OTHERS => sym_Q1_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist6_ChannelIn_in_10_c_4(DELAY,633)
    redist6_ChannelIn_in_10_c_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_10_c, xout => redist6_ChannelIn_in_10_c_4_q, clk => clk, aclr => areset );

    -- redist5_ChannelIn_in_9_v_6(DELAY,632)
    redist5_ChannelIn_in_9_v_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_ChannelIn_in_9_v_2_q, xout => redist5_ChannelIn_in_9_v_6_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,66)@6 + 1
    out_1_v_sym_update <= redist5_ChannelIn_in_9_v_6_q;
    out_2_qc <= redist6_ChannelIn_in_10_c_4_q;
    out_3_symbols_phase_x <= sym_Q1_q;
    out_4_packet_trigger_through <= redist7_ChannelIn_in_7_packet_trigger_4_q;

    -- Demux_0_decoder_x(DECODE,4)@1 + 1
    Demux_0_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_0_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(2 downto 0) = "000") THEN
                Demux_0_decoder_x_q <= VCC_q;
            ELSE
                Demux_0_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_0_mux_x(MUX,6)@2 + 1
    Demux_0_mux_x_s <= Demux_0_decoder_x_q;
    Demux_0_mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_0_mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (Demux_0_mux_x_s) IS
                WHEN "0" => Demux_0_mux_x_q <= Demux_0_mux_x_q;
                WHEN "1" => Demux_0_mux_x_q <= redist4_ChannelIn_in_9_v_2_q;
                WHEN OTHERS => Demux_0_mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

END normal;
