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
-- VHDL created on Tue May 28 19:39:05 2019


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
        out_3_symbols_phase_x : out std_logic_vector(17 downto 0);  -- sfix18_en14
        out_4_packet_trigger_through : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_corrected_phase : out std_logic_vector(17 downto 0);  -- sfix18_en14
        out_6_offset_phase : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_Phase_extraction_and_synchronization;

architecture normal of final_project_txrx_fp_Phase_extraction_and_synchronization is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_addBloA0Z0k614004ki026142iyc5 is
        port (
            in_0 : in std_logic_vector(63 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(63 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(63 downto 0);  -- Floating Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA0Zcp06of03p06o303d0doz is
        port (
            in_0 : in std_logic_vector(13 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(63 downto 0);  -- Floating Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;



    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz is
        port (
            in_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            out_primWireOut : out std_logic_vector(63 downto 0);  -- Floating Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;



    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz is
        port (
            in_0 : in std_logic_vector(63 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(17 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;



    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u is
        port (
            in_0 : in std_logic_vector(63 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(63 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(63 downto 0);  -- Floating Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;



    component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u is
        port (
            in_0 : in std_logic_vector(63 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(63 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(63 downto 0);  -- Floating Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;



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
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Add2_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal And2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal BitCombine1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal CmpEQ_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpEQ_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Const6_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Const7_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Convert1_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Convert2_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Convert3_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Convert4_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Convert5_out_primWireOut : STD_LOGIC_VECTOR (17 downto 0);
    signal Convert6_out_primWireOut : STD_LOGIC_VECTOR (17 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Counter_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter_eq : std_logic;
    attribute preserve of Counter_eq : signal is true;
    signal Mode_Meas1_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal Mode_Meas2_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal Mode_Meas3_x_q : STD_LOGIC_VECTOR (63 downto 0);
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
    signal Sub3_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Sub4_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Trig1_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal Trig2_out_primWireOut : STD_LOGIC_VECTOR (63 downto 0);
    signal sym_I_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_I_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sym_I1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sym_I1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sym_Q2_s : STD_LOGIC_VECTOR (1 downto 0);
    signal sym_Q2_q : STD_LOGIC_VECTOR (63 downto 0);
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
    signal cstAllOWE_uid101_CmpGE1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid102_CmpGE1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid103_CmpGE1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_x_uid104_CmpGE1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_x_uid105_CmpGE1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid106_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid107_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid108_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid109_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid111_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid118_CmpGE1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_y_uid119_CmpGE1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_y_uid120_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid121_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid122_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid123_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid125_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid129_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xNotZero_uid134_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid135_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXPS_uid136_CmpGE1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracXPS_uid136_CmpGE1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracYPS_uid137_CmpGE1_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracYPS_uid137_CmpGE1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expFracX_uid138_CmpGE1_q : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid140_CmpGE1_q : STD_LOGIC_VECTOR (62 downto 0);
    signal efxGTEefy_uid144_CmpGE1_a : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid144_CmpGE1_b : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid144_CmpGE1_o : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid144_CmpGE1_n : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTEefy_uid145_CmpGE1_a : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid145_CmpGE1_b : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid145_CmpGE1_o : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid145_CmpGE1_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroInputs_uid146_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid147_CmpGE1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid148_CmpGE1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal concSYSX_uid150_CmpGE1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxGTsy_uid151_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid152_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid153_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid154_CmpGE1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid154_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid155_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid156_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid157_CmpGE1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid157_CmpGE1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid176_CmpGE2_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_y_uid177_CmpGE2_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_y_uid178_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid179_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid180_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid181_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid183_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid187_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yNotZero_uid193_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPS_uid195_CmpGE2_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracYPS_uid195_CmpGE2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expFracY_uid198_CmpGE2_q : STD_LOGIC_VECTOR (62 downto 0);
    signal efxGTEefy_uid202_CmpGE2_a : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid202_CmpGE2_b : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid202_CmpGE2_o : STD_LOGIC_VECTOR (64 downto 0);
    signal efxGTEefy_uid202_CmpGE2_n : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTEefy_uid203_CmpGE2_a : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid203_CmpGE2_b : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid203_CmpGE2_o : STD_LOGIC_VECTOR (64 downto 0);
    signal efxLTEefy_uid203_CmpGE2_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroInputs_uid204_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid206_CmpGE2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal concSYSX_uid208_CmpGE2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal sxGTsy_uid209_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid210_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid211_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid212_CmpGE2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid212_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid213_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid214_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid215_CmpGE2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid215_CmpGE2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sym_Q_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist2_sym_I_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist3_Trig2_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_Trig1_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_Sub4_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_Sub3_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_Convert5_out_primWireOut_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist10_Convert4_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist11_Convert3_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_Convert2_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_Convert1_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist14_ChannelIn_in_9_v_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_ChannelIn_in_9_v_60_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_ChannelIn_in_7_packet_trigger_58_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_And2_q_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_Add2_out_primWireOut_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist24_Demux_4_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_Demux_4_mux_x_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_Demux_3_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_Demux_3_mux_x_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_Demux_2_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_Demux_2_mux_x_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_Demux_1_mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_Demux_1_mux_x_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sym_Q_q_9_outputreg_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist0_sym_Q_q_9_mem_reset0 : std_logic;
    signal redist0_sym_Q_q_9_mem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal redist0_sym_Q_q_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sym_Q_q_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sym_Q_q_9_mem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal redist0_sym_Q_q_9_mem_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist0_sym_Q_q_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sym_Q_q_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist0_sym_Q_q_9_rdcnt_i : signal is true;
    signal redist0_sym_Q_q_9_rdcnt_eq : std_logic;
    attribute preserve of redist0_sym_Q_q_9_rdcnt_eq : signal is true;
    signal redist0_sym_Q_q_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_sym_Q_q_9_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_sym_Q_q_9_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_sym_Q_q_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sym_Q_q_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sym_Q_q_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sym_Q_q_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sym_Q_q_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist0_sym_Q_q_9_sticky_ena_q : signal is true;
    signal redist0_sym_Q_q_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_outputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_Sub3_out_primWireOut_5_mem_reset0 : std_logic;
    signal redist7_Sub3_out_primWireOut_5_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_Sub3_out_primWireOut_5_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_Sub3_out_primWireOut_5_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_Sub3_out_primWireOut_5_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist7_Sub3_out_primWireOut_5_rdcnt_i : signal is true;
    signal redist7_Sub3_out_primWireOut_5_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_Sub3_out_primWireOut_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist7_Sub3_out_primWireOut_5_sticky_ena_q : signal is true;
    signal redist7_Sub3_out_primWireOut_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_Convert6_out_primWireOut_10_inputreg_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist8_Convert6_out_primWireOut_10_outputreg_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_reset0 : std_logic;
    signal redist8_Convert6_out_primWireOut_10_mem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_iq : STD_LOGIC_VECTOR (17 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist8_Convert6_out_primWireOut_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_Convert6_out_primWireOut_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist8_Convert6_out_primWireOut_10_rdcnt_i : signal is true;
    signal redist8_Convert6_out_primWireOut_10_rdcnt_eq : std_logic;
    attribute preserve of redist8_Convert6_out_primWireOut_10_rdcnt_eq : signal is true;
    signal redist8_Convert6_out_primWireOut_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist8_Convert6_out_primWireOut_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_Convert6_out_primWireOut_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_Convert6_out_primWireOut_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_Convert6_out_primWireOut_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_Convert6_out_primWireOut_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_Convert6_out_primWireOut_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_Convert6_out_primWireOut_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist8_Convert6_out_primWireOut_10_sticky_ena_q : signal is true;
    signal redist8_Convert6_out_primWireOut_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_reset0 : std_logic;
    signal redist16_ChannelIn_in_10_c_58_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist16_ChannelIn_in_10_c_58_rdcnt_i : signal is true;
    signal redist16_ChannelIn_in_10_c_58_rdcnt_eq : std_logic;
    attribute preserve of redist16_ChannelIn_in_10_c_58_rdcnt_eq : signal is true;
    signal redist16_ChannelIn_in_10_c_58_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_ChannelIn_in_10_c_58_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_ChannelIn_in_10_c_58_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist16_ChannelIn_in_10_c_58_sticky_ena_q : signal is true;
    signal redist16_ChannelIn_in_10_c_58_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_reset0 : std_logic;
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i : signal is true;
    signal redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq : std_logic;
    attribute preserve of redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq : signal is true;
    signal redist16_ChannelIn_in_10_c_58_split_0_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q : signal is true;
    signal redist16_ChannelIn_in_10_c_58_split_0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist8_Convert6_out_primWireOut_10_notEnable(LOGICAL,281)
    redist8_Convert6_out_primWireOut_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist8_Convert6_out_primWireOut_10_nor(LOGICAL,282)
    redist8_Convert6_out_primWireOut_10_nor_q <= not (redist8_Convert6_out_primWireOut_10_notEnable_q or redist8_Convert6_out_primWireOut_10_sticky_ena_q);

    -- redist8_Convert6_out_primWireOut_10_mem_last(CONSTANT,278)
    redist8_Convert6_out_primWireOut_10_mem_last_q <= "0101";

    -- redist8_Convert6_out_primWireOut_10_cmp(LOGICAL,279)
    redist8_Convert6_out_primWireOut_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist8_Convert6_out_primWireOut_10_rdcnt_q);
    redist8_Convert6_out_primWireOut_10_cmp_q <= "1" WHEN redist8_Convert6_out_primWireOut_10_mem_last_q = redist8_Convert6_out_primWireOut_10_cmp_b ELSE "0";

    -- redist8_Convert6_out_primWireOut_10_cmpReg(REG,280)
    redist8_Convert6_out_primWireOut_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_Convert6_out_primWireOut_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist8_Convert6_out_primWireOut_10_cmpReg_q <= STD_LOGIC_VECTOR(redist8_Convert6_out_primWireOut_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist8_Convert6_out_primWireOut_10_sticky_ena(REG,283)
    redist8_Convert6_out_primWireOut_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_Convert6_out_primWireOut_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist8_Convert6_out_primWireOut_10_nor_q = "1") THEN
                redist8_Convert6_out_primWireOut_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_Convert6_out_primWireOut_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_Convert6_out_primWireOut_10_enaAnd(LOGICAL,284)
    redist8_Convert6_out_primWireOut_10_enaAnd_q <= redist8_Convert6_out_primWireOut_10_sticky_ena_q and VCC_q;

    -- redist8_Convert6_out_primWireOut_10_rdcnt(COUNTER,276)
    -- low=0, high=6, step=1, init=0
    redist8_Convert6_out_primWireOut_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_Convert6_out_primWireOut_10_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist8_Convert6_out_primWireOut_10_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist8_Convert6_out_primWireOut_10_rdcnt_i = TO_UNSIGNED(5, 3)) THEN
                redist8_Convert6_out_primWireOut_10_rdcnt_eq <= '1';
            ELSE
                redist8_Convert6_out_primWireOut_10_rdcnt_eq <= '0';
            END IF;
            IF (redist8_Convert6_out_primWireOut_10_rdcnt_eq = '1') THEN
                redist8_Convert6_out_primWireOut_10_rdcnt_i <= redist8_Convert6_out_primWireOut_10_rdcnt_i + 2;
            ELSE
                redist8_Convert6_out_primWireOut_10_rdcnt_i <= redist8_Convert6_out_primWireOut_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist8_Convert6_out_primWireOut_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_Convert6_out_primWireOut_10_rdcnt_i, 3)));

    -- Const6(CONSTANT,66)
    Const6_q <= "10";

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x(LOGICAL,42)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q <= not (GND_q);

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x(LOGICAL,43)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q or in_11_sample_update;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x(LOGICAL,41)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_qi <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Or_x_q and final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_qi, xout => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q, clk => clk, aclr => areset );

    -- sym_I1(MUX,91)@2
    sym_I1_s <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_And_x_q;
    sym_I1_combproc: PROCESS (sym_I1_s, Const6_q, in_8_sym_sample)
    BEGIN
        CASE (sym_I1_s) IS
            WHEN "0" => sym_I1_q <= Const6_q;
            WHEN "1" => sym_I1_q <= in_8_sym_sample;
            WHEN OTHERS => sym_I1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sym_I(MUX,90)@2
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

    -- redist2_sym_I_q_1(DELAY,222)
    redist2_sym_I_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sym_I_q, xout => redist2_sym_I_q_1_q, clk => clk, aclr => areset );

    -- Convert3(BLACKBOX,71)@3
    -- out out_primWireOut@4
    theConvert3 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => redist2_sym_I_q_1_q,
        out_primWireOut => Convert3_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist11_Convert3_out_primWireOut_1(DELAY,231)
    redist11_Convert3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert3_out_primWireOut, xout => redist11_Convert3_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- redist0_sym_Q_q_9_notEnable(LOGICAL,260)
    redist0_sym_Q_q_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_sym_Q_q_9_nor(LOGICAL,261)
    redist0_sym_Q_q_9_nor_q <= not (redist0_sym_Q_q_9_notEnable_q or redist0_sym_Q_q_9_sticky_ena_q);

    -- redist0_sym_Q_q_9_mem_last(CONSTANT,257)
    redist0_sym_Q_q_9_mem_last_q <= "0100";

    -- redist0_sym_Q_q_9_cmp(LOGICAL,258)
    redist0_sym_Q_q_9_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_sym_Q_q_9_rdcnt_q);
    redist0_sym_Q_q_9_cmp_q <= "1" WHEN redist0_sym_Q_q_9_mem_last_q = redist0_sym_Q_q_9_cmp_b ELSE "0";

    -- redist0_sym_Q_q_9_cmpReg(REG,259)
    redist0_sym_Q_q_9_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_sym_Q_q_9_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_sym_Q_q_9_cmpReg_q <= STD_LOGIC_VECTOR(redist0_sym_Q_q_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_sym_Q_q_9_sticky_ena(REG,262)
    redist0_sym_Q_q_9_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_sym_Q_q_9_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist0_sym_Q_q_9_nor_q = "1") THEN
                redist0_sym_Q_q_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_sym_Q_q_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_sym_Q_q_9_enaAnd(LOGICAL,263)
    redist0_sym_Q_q_9_enaAnd_q <= redist0_sym_Q_q_9_sticky_ena_q and VCC_q;

    -- redist0_sym_Q_q_9_rdcnt(COUNTER,255)
    -- low=0, high=5, step=1, init=0
    redist0_sym_Q_q_9_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_sym_Q_q_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist0_sym_Q_q_9_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist0_sym_Q_q_9_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist0_sym_Q_q_9_rdcnt_eq <= '1';
            ELSE
                redist0_sym_Q_q_9_rdcnt_eq <= '0';
            END IF;
            IF (redist0_sym_Q_q_9_rdcnt_eq = '1') THEN
                redist0_sym_Q_q_9_rdcnt_i <= redist0_sym_Q_q_9_rdcnt_i + 3;
            ELSE
                redist0_sym_Q_q_9_rdcnt_i <= redist0_sym_Q_q_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_sym_Q_q_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_sym_Q_q_9_rdcnt_i, 3)));

    -- sym_Q(MUX,92)@2 + 1
    sym_Q_s <= sym_I1_q;
    sym_Q_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sym_Q_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sym_Q_s) IS
                WHEN "00" => sym_Q_q <= in_2_left_Q;
                WHEN "01" => sym_Q_q <= in_4_main_Q;
                WHEN "10" => sym_Q_q <= in_6_right_Q;
                WHEN OTHERS => sym_Q_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_sym_Q_q_9_wraddr(REG,256)
    redist0_sym_Q_q_9_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_sym_Q_q_9_wraddr_q <= "101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_sym_Q_q_9_wraddr_q <= STD_LOGIC_VECTOR(redist0_sym_Q_q_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_sym_Q_q_9_mem(DUALMEM,254)
    redist0_sym_Q_q_9_mem_ia <= STD_LOGIC_VECTOR(sym_Q_q);
    redist0_sym_Q_q_9_mem_aa <= redist0_sym_Q_q_9_wraddr_q;
    redist0_sym_Q_q_9_mem_ab <= redist0_sym_Q_q_9_rdcnt_q;
    redist0_sym_Q_q_9_mem_reset0 <= areset;
    redist0_sym_Q_q_9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 12,
        widthad_b => 3,
        numwords_b => 6,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist0_sym_Q_q_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist0_sym_Q_q_9_mem_reset0,
        clock1 => clk,
        address_a => redist0_sym_Q_q_9_mem_aa,
        data_a => redist0_sym_Q_q_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_sym_Q_q_9_mem_ab,
        q_b => redist0_sym_Q_q_9_mem_iq
    );
    redist0_sym_Q_q_9_mem_q <= redist0_sym_Q_q_9_mem_iq(11 downto 0);

    -- redist0_sym_Q_q_9_outputreg(DELAY,253)
    redist0_sym_Q_q_9_outputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_sym_Q_q_9_mem_q, xout => redist0_sym_Q_q_9_outputreg_q, clk => clk, aclr => areset );

    -- redist1_sym_Q_q_11(DELAY,221)
    redist1_sym_Q_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_sym_Q_q_9_outputreg_q, xout => redist1_sym_Q_q_11_q, clk => clk, aclr => areset );

    -- Convert4(BLACKBOX,72)@13
    -- out out_primWireOut@14
    theConvert4 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => redist1_sym_Q_q_11_q,
        out_primWireOut => Convert4_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist10_Convert4_out_primWireOut_1(DELAY,230)
    redist10_Convert4_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert4_out_primWireOut, xout => redist10_Convert4_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Trig1(BLACKBOX,88)@5
    -- in in_0@15
    -- out out_primWireOut@49
    theTrig1 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u
    PORT MAP (
        in_0 => redist10_Convert4_out_primWireOut_1_q,
        in_1 => redist11_Convert3_out_primWireOut_1_q,
        out_primWireOut => Trig1_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist4_Trig1_out_primWireOut_1(DELAY,224)
    redist4_Trig1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Trig1_out_primWireOut, xout => redist4_Trig1_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Convert6(BLACKBOX,74)@50
    theConvert6 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => redist4_Trig1_out_primWireOut_1_q,
        out_primWireOut => Convert6_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist8_Convert6_out_primWireOut_10_inputreg(DELAY,273)
    redist8_Convert6_out_primWireOut_10_inputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert6_out_primWireOut, xout => redist8_Convert6_out_primWireOut_10_inputreg_q, clk => clk, aclr => areset );

    -- redist8_Convert6_out_primWireOut_10_wraddr(REG,277)
    redist8_Convert6_out_primWireOut_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_Convert6_out_primWireOut_10_wraddr_q <= "110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist8_Convert6_out_primWireOut_10_wraddr_q <= STD_LOGIC_VECTOR(redist8_Convert6_out_primWireOut_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_Convert6_out_primWireOut_10_mem(DUALMEM,275)
    redist8_Convert6_out_primWireOut_10_mem_ia <= STD_LOGIC_VECTOR(redist8_Convert6_out_primWireOut_10_inputreg_q);
    redist8_Convert6_out_primWireOut_10_mem_aa <= redist8_Convert6_out_primWireOut_10_wraddr_q;
    redist8_Convert6_out_primWireOut_10_mem_ab <= redist8_Convert6_out_primWireOut_10_rdcnt_q;
    redist8_Convert6_out_primWireOut_10_mem_reset0 <= areset;
    redist8_Convert6_out_primWireOut_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 18,
        widthad_b => 3,
        numwords_b => 7,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist8_Convert6_out_primWireOut_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist8_Convert6_out_primWireOut_10_mem_reset0,
        clock1 => clk,
        address_a => redist8_Convert6_out_primWireOut_10_mem_aa,
        data_a => redist8_Convert6_out_primWireOut_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_Convert6_out_primWireOut_10_mem_ab,
        q_b => redist8_Convert6_out_primWireOut_10_mem_iq
    );
    redist8_Convert6_out_primWireOut_10_mem_q <= redist8_Convert6_out_primWireOut_10_mem_iq(17 downto 0);

    -- redist8_Convert6_out_primWireOut_10_outputreg(DELAY,274)
    redist8_Convert6_out_primWireOut_10_outputreg : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_Convert6_out_primWireOut_10_mem_q, xout => redist8_Convert6_out_primWireOut_10_outputreg_q, clk => clk, aclr => areset );

    -- redist17_ChannelIn_in_7_packet_trigger_58(DELAY,237)
    redist17_ChannelIn_in_7_packet_trigger_58 : dspba_delay
    GENERIC MAP ( width => 1, depth => 58, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_7_packet_trigger, xout => redist17_ChannelIn_in_7_packet_trigger_58_q, clk => clk, aclr => areset );

    -- Mode_Meas3_x(FLOATCONSTANT,78)
    Mode_Meas3_x_q <= "0100000000011001001000011111101101010100010001000010110100011000";

    -- redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1(DELAY,240)
    redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q, xout => redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist14_ChannelIn_in_9_v_2(DELAY,234)
    redist14_ChannelIn_in_9_v_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_9_v, xout => redist14_ChannelIn_in_9_v_2_q, clk => clk, aclr => areset );

    -- redist24_Demux_4_mux_x_q_1(DELAY,244)
    redist24_Demux_4_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_4_mux_x_q, xout => redist24_Demux_4_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Counter(COUNTER,75)@0 + 1
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
    Demux_4_mux_x_combproc: PROCESS (Demux_4_mux_x_s, redist24_Demux_4_mux_x_q_1_q, redist14_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_4_mux_x_s) IS
            WHEN "0" => Demux_4_mux_x_q <= redist24_Demux_4_mux_x_q_1_q;
            WHEN "1" => Demux_4_mux_x_q <= redist14_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_4_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x(MUX,27)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s <= Demux_4_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s, redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= redist20_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1(DELAY,241)
    redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q, xout => redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist26_Demux_3_mux_x_q_1(DELAY,246)
    redist26_Demux_3_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_3_mux_x_q, xout => redist26_Demux_3_mux_x_q_1_q, clk => clk, aclr => areset );

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
    Demux_3_mux_x_combproc: PROCESS (Demux_3_mux_x_s, redist26_Demux_3_mux_x_q_1_q, redist14_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_3_mux_x_s) IS
            WHEN "0" => Demux_3_mux_x_q <= redist26_Demux_3_mux_x_q_1_q;
            WHEN "1" => Demux_3_mux_x_q <= redist14_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_3_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x(MUX,25)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s <= Demux_3_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s, redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= redist21_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Negate1(SUB,80)@2
    Negate1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    Negate1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync2_Mux_x_q));
    Negate1_o <= STD_LOGIC_VECTOR(SIGNED(Negate1_a) - SIGNED(Negate1_b));
    Negate1_q <= Negate1_o(12 downto 0);

    -- Negate1_PostCast_primWireOut_sel_x(BITSELECT,19)@2
    Negate1_PostCast_primWireOut_sel_x_b <= STD_LOGIC_VECTOR(Negate1_q(11 downto 0));

    -- Add_re_add_0_1(ADD,95)@2
    Add_re_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => Negate1_PostCast_primWireOut_sel_x_b(11)) & Negate1_PostCast_primWireOut_sel_x_b));
    Add_re_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync3_Mux_x_q));
    Add_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_0_1_a) + SIGNED(Add_re_add_0_1_b));
    Add_re_add_0_1_q <= Add_re_add_0_1_o(12 downto 0);

    -- redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1(DELAY,242)
    redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q, xout => redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist28_Demux_2_mux_x_q_1(DELAY,248)
    redist28_Demux_2_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_2_mux_x_q, xout => redist28_Demux_2_mux_x_q_1_q, clk => clk, aclr => areset );

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
    Demux_2_mux_x_combproc: PROCESS (Demux_2_mux_x_s, redist28_Demux_2_mux_x_q_1_q, redist14_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_2_mux_x_s) IS
            WHEN "0" => Demux_2_mux_x_q <= redist28_Demux_2_mux_x_q_1_q;
            WHEN "1" => Demux_2_mux_x_q <= redist14_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_2_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x(MUX,23)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s <= Demux_2_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s, redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= redist22_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1(DELAY,243)
    redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q, xout => redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- redist30_Demux_1_mux_x_q_1(DELAY,250)
    redist30_Demux_1_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_1_mux_x_q, xout => redist30_Demux_1_mux_x_q_1_q, clk => clk, aclr => areset );

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
    Demux_1_mux_x_combproc: PROCESS (Demux_1_mux_x_s, redist30_Demux_1_mux_x_q_1_q, redist14_ChannelIn_in_9_v_2_q)
    BEGIN
        CASE (Demux_1_mux_x_s) IS
            WHEN "0" => Demux_1_mux_x_q <= redist30_Demux_1_mux_x_q_1_q;
            WHEN "1" => Demux_1_mux_x_q <= redist14_ChannelIn_in_9_v_2_q;
            WHEN OTHERS => Demux_1_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x(MUX,21)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s <= Demux_1_mux_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_combproc: PROCESS (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s, redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q, sym_I_q)
    BEGIN
        CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= redist23_final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= sym_I_q;
            WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Add_re_add_0_0(ADD,94)@2
    Add_re_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync_Mux_x_q));
    Add_re_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync1_Mux_x_q));
    Add_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_0_0_a) + SIGNED(Add_re_add_0_0_b));
    Add_re_add_0_0_q <= Add_re_add_0_0_o(12 downto 0);

    -- Add_re_add_1_0(ADD,96)@2
    Add_re_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add_re_add_0_0_q(12)) & Add_re_add_0_0_q));
    Add_re_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add_re_add_0_1_q(12)) & Add_re_add_0_1_q));
    Add_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_re_add_1_0_a) + SIGNED(Add_re_add_1_0_b));
    Add_re_add_1_0_q <= Add_re_add_1_0_o(13 downto 0);

    -- Not1(LOGICAL,83)@1 + 1
    Not1_qi <= not (final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q);
    Not1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not1_qi, xout => Not1_q, clk => clk, aclr => areset );

    -- Const7(CONSTANT,67)
    Const7_q <= "100";

    -- CmpEQ(LOGICAL,58)@1 + 1
    CmpEQ_qi <= "1" WHEN Counter_q = Const7_q ELSE "0";
    CmpEQ_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CmpEQ_qi, xout => CmpEQ_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x(LOGICAL,48)@2
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q or CmpEQ_q;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x(LOGICAL,46)@2 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_qi <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_Or_x_q and final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch1_Not_x_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_qi, xout => final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q, clk => clk, aclr => areset );

    -- And2(LOGICAL,54)@2
    And2_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_SRlatch2_And_x_q and Not1_q;

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x(MUX,29)@2 + 1
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

    -- Convert1(BLACKBOX,69)@3
    -- out out_primWireOut@4
    theConvert1 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA0Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_I_for_sync4_Mux_x_q,
        out_primWireOut => Convert1_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist13_Convert1_out_primWireOut_1(DELAY,233)
    redist13_Convert1_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert1_out_primWireOut, xout => redist13_Convert1_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- redist25_Demux_4_mux_x_q_9(DELAY,245)
    redist25_Demux_4_mux_x_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist24_Demux_4_mux_x_q_1_q, xout => redist25_Demux_4_mux_x_q_9_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x(MUX,37)@11 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s <= redist25_Demux_4_mux_x_q_9_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= redist0_sym_Q_q_9_outputreg_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist27_Demux_3_mux_x_q_9(DELAY,247)
    redist27_Demux_3_mux_x_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist26_Demux_3_mux_x_q_1_q, xout => redist27_Demux_3_mux_x_q_9_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x(MUX,35)@11 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s <= redist27_Demux_3_mux_x_q_9_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= redist0_sym_Q_q_9_outputreg_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Negate(SUB,79)@12
    Negate_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    Negate_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync2_Mux_x_q));
    Negate_o <= STD_LOGIC_VECTOR(SIGNED(Negate_a) - SIGNED(Negate_b));
    Negate_q <= Negate_o(12 downto 0);

    -- Negate_PostCast_primWireOut_sel_x(BITSELECT,20)@12
    Negate_PostCast_primWireOut_sel_x_b <= STD_LOGIC_VECTOR(Negate_q(11 downto 0));

    -- Add1_re_add_0_1(ADD,98)@12
    Add1_re_add_0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => Negate_PostCast_primWireOut_sel_x_b(11)) & Negate_PostCast_primWireOut_sel_x_b));
    Add1_re_add_0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync3_Mux_x_q));
    Add1_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_0_1_a) + SIGNED(Add1_re_add_0_1_b));
    Add1_re_add_0_1_q <= Add1_re_add_0_1_o(12 downto 0);

    -- redist29_Demux_2_mux_x_q_9(DELAY,249)
    redist29_Demux_2_mux_x_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist28_Demux_2_mux_x_q_1_q, xout => redist29_Demux_2_mux_x_q_9_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x(MUX,33)@11 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s <= redist29_Demux_2_mux_x_q_9_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= redist0_sym_Q_q_9_outputreg_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist31_Demux_1_mux_x_q_9(DELAY,251)
    redist31_Demux_1_mux_x_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist30_Demux_1_mux_x_q_1_q, xout => redist31_Demux_1_mux_x_q_9_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x(MUX,31)@11 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s <= redist31_Demux_1_mux_x_q_9_q;
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= redist0_sym_Q_q_9_outputreg_q;
                WHEN OTHERS => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Add1_re_add_0_0(ADD,97)@12
    Add1_re_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync_Mux_x_q));
    Add1_re_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q(11)) & final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync1_Mux_x_q));
    Add1_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_0_0_a) + SIGNED(Add1_re_add_0_0_b));
    Add1_re_add_0_0_q <= Add1_re_add_0_0_o(12 downto 0);

    -- Add1_re_add_1_0(ADD,99)@12
    Add1_re_add_1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add1_re_add_0_0_q(12)) & Add1_re_add_0_0_q));
    Add1_re_add_1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => Add1_re_add_0_1_q(12)) & Add1_re_add_0_1_q));
    Add1_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add1_re_add_1_0_a) + SIGNED(Add1_re_add_1_0_b));
    Add1_re_add_1_0_q <= Add1_re_add_1_0_o(13 downto 0);

    -- redist18_And2_q_10(DELAY,238)
    redist18_And2_q_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => And2_q, xout => redist18_And2_q_10_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x(MUX,39)@12 + 1
    final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_s <= redist18_And2_q_10_q;
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

    -- Convert2(BLACKBOX,70)@13
    -- out out_primWireOut@14
    theConvert2 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA0Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => final_project_txrx_fp_Phase_extraction_and_synchronization_Catch_Q_for_sync4_Mux_x_q,
        out_primWireOut => Convert2_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist12_Convert2_out_primWireOut_1(DELAY,232)
    redist12_Convert2_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert2_out_primWireOut, xout => redist12_Convert2_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Trig2(BLACKBOX,89)@5
    -- in in_0@15
    -- out out_primWireOut@49
    theTrig2 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u
    PORT MAP (
        in_0 => redist12_Convert2_out_primWireOut_1_q,
        in_1 => redist13_Convert1_out_primWireOut_1_q,
        out_primWireOut => Trig2_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist3_Trig2_out_primWireOut_1(DELAY,223)
    redist3_Trig2_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Trig2_out_primWireOut, xout => redist3_Trig2_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Sub3(BLACKBOX,86)@50
    -- out out_primWireOut@53
    theSub3 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u
    PORT MAP (
        in_0 => redist4_Trig1_out_primWireOut_1_q,
        in_1 => redist3_Trig2_out_primWireOut_1_q,
        out_primWireOut => Sub3_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist6_Sub3_out_primWireOut_1(DELAY,226)
    redist6_Sub3_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Sub3_out_primWireOut, xout => redist6_Sub3_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Add2(BLACKBOX,53)@54
    -- out out_primWireOut@57
    theAdd2 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_addBloA0Z0k614004ki026142iyc5
    PORT MAP (
        in_0 => redist6_Sub3_out_primWireOut_1_q,
        in_1 => Mode_Meas3_x_q,
        out_primWireOut => Add2_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist19_Add2_out_primWireOut_1(DELAY,239)
    redist19_Add2_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Add2_out_primWireOut, xout => redist19_Add2_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- Sub4(BLACKBOX,87)@54
    -- out out_primWireOut@57
    theSub4 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u
    PORT MAP (
        in_0 => redist6_Sub3_out_primWireOut_1_q,
        in_1 => Mode_Meas3_x_q,
        out_primWireOut => Sub4_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist5_Sub4_out_primWireOut_1(DELAY,225)
    redist5_Sub4_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Sub4_out_primWireOut, xout => redist5_Sub4_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- redist7_Sub3_out_primWireOut_5_notEnable(LOGICAL,269)
    redist7_Sub3_out_primWireOut_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist7_Sub3_out_primWireOut_5_nor(LOGICAL,270)
    redist7_Sub3_out_primWireOut_5_nor_q <= not (redist7_Sub3_out_primWireOut_5_notEnable_q or redist7_Sub3_out_primWireOut_5_sticky_ena_q);

    -- redist7_Sub3_out_primWireOut_5_cmpReg(REG,268)
    redist7_Sub3_out_primWireOut_5_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_Sub3_out_primWireOut_5_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist7_Sub3_out_primWireOut_5_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist7_Sub3_out_primWireOut_5_sticky_ena(REG,271)
    redist7_Sub3_out_primWireOut_5_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_Sub3_out_primWireOut_5_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist7_Sub3_out_primWireOut_5_nor_q = "1") THEN
                redist7_Sub3_out_primWireOut_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist7_Sub3_out_primWireOut_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_Sub3_out_primWireOut_5_enaAnd(LOGICAL,272)
    redist7_Sub3_out_primWireOut_5_enaAnd_q <= redist7_Sub3_out_primWireOut_5_sticky_ena_q and VCC_q;

    -- redist7_Sub3_out_primWireOut_5_rdcnt(COUNTER,266)
    -- low=0, high=1, step=1, init=0
    redist7_Sub3_out_primWireOut_5_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_Sub3_out_primWireOut_5_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist7_Sub3_out_primWireOut_5_rdcnt_i <= redist7_Sub3_out_primWireOut_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist7_Sub3_out_primWireOut_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist7_Sub3_out_primWireOut_5_rdcnt_i, 1)));

    -- redist7_Sub3_out_primWireOut_5_wraddr(REG,267)
    redist7_Sub3_out_primWireOut_5_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist7_Sub3_out_primWireOut_5_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist7_Sub3_out_primWireOut_5_wraddr_q <= STD_LOGIC_VECTOR(redist7_Sub3_out_primWireOut_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist7_Sub3_out_primWireOut_5_mem(DUALMEM,265)
    redist7_Sub3_out_primWireOut_5_mem_ia <= STD_LOGIC_VECTOR(redist6_Sub3_out_primWireOut_1_q);
    redist7_Sub3_out_primWireOut_5_mem_aa <= redist7_Sub3_out_primWireOut_5_wraddr_q;
    redist7_Sub3_out_primWireOut_5_mem_ab <= redist7_Sub3_out_primWireOut_5_rdcnt_q;
    redist7_Sub3_out_primWireOut_5_mem_reset0 <= areset;
    redist7_Sub3_out_primWireOut_5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 64,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist7_Sub3_out_primWireOut_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist7_Sub3_out_primWireOut_5_mem_reset0,
        clock1 => clk,
        address_a => redist7_Sub3_out_primWireOut_5_mem_aa,
        data_a => redist7_Sub3_out_primWireOut_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist7_Sub3_out_primWireOut_5_mem_ab,
        q_b => redist7_Sub3_out_primWireOut_5_mem_iq
    );
    redist7_Sub3_out_primWireOut_5_mem_q <= redist7_Sub3_out_primWireOut_5_mem_iq(63 downto 0);

    -- redist7_Sub3_out_primWireOut_5_outputreg(DELAY,264)
    redist7_Sub3_out_primWireOut_5_outputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_Sub3_out_primWireOut_5_mem_q, xout => redist7_Sub3_out_primWireOut_5_outputreg_q, clk => clk, aclr => areset );

    -- cstAllZWE_uid103_CmpGE1(CONSTANT,102)
    cstAllZWE_uid103_CmpGE1_q <= "00000000000";

    -- exp_y_uid118_CmpGE1(BITSELECT,117)@58
    exp_y_uid118_CmpGE1_b <= redist7_Sub3_out_primWireOut_5_outputreg_q(62 downto 52);

    -- excZ_y_uid120_CmpGE1(LOGICAL,119)@58
    excZ_y_uid120_CmpGE1_q <= "1" WHEN exp_y_uid118_CmpGE1_b = cstAllZWE_uid103_CmpGE1_q ELSE "0";

    -- Mode_Meas2_x(FLOATCONSTANT,77)
    Mode_Meas2_x_q <= "1100000000001001001000011111101101010100010001000010110100011000";

    -- exp_x_uid104_CmpGE1(BITSELECT,103)@58
    exp_x_uid104_CmpGE1_b <= Mode_Meas2_x_q(62 downto 52);

    -- excZ_x_uid106_CmpGE1(LOGICAL,105)@58
    excZ_x_uid106_CmpGE1_q <= "1" WHEN exp_x_uid104_CmpGE1_b = cstAllZWE_uid103_CmpGE1_q ELSE "0";

    -- zeroInputs_uid146_CmpGE1(LOGICAL,145)@58
    zeroInputs_uid146_CmpGE1_q <= excZ_x_uid106_CmpGE1_q and excZ_y_uid120_CmpGE1_q;

    -- signY_uid148_CmpGE1(BITSELECT,147)@58
    signY_uid148_CmpGE1_b <= STD_LOGIC_VECTOR(redist7_Sub3_out_primWireOut_5_outputreg_q(63 downto 63));

    -- signX_uid147_CmpGE1(BITSELECT,146)@58
    signX_uid147_CmpGE1_b <= STD_LOGIC_VECTOR(Mode_Meas2_x_q(63 downto 63));

    -- concSYSX_uid150_CmpGE1(BITJOIN,149)@58
    concSYSX_uid150_CmpGE1_q <= signY_uid148_CmpGE1_b & signX_uid147_CmpGE1_b;

    -- sxGTsy_uid151_CmpGE1(LOGICAL,150)@58
    sxGTsy_uid151_CmpGE1_q <= "1" WHEN concSYSX_uid150_CmpGE1_q = Const6_q ELSE "0";

    -- xNotZero_uid134_CmpGE1(LOGICAL,133)@58
    xNotZero_uid134_CmpGE1_q <= not (excZ_x_uid106_CmpGE1_q);

    -- frac_x_uid105_CmpGE1(BITSELECT,104)@58
    frac_x_uid105_CmpGE1_b <= Mode_Meas2_x_q(51 downto 0);

    -- fracXPS_uid136_CmpGE1(LOGICAL,135)@58
    fracXPS_uid136_CmpGE1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => xNotZero_uid134_CmpGE1_q(0)) & xNotZero_uid134_CmpGE1_q));
    fracXPS_uid136_CmpGE1_q <= frac_x_uid105_CmpGE1_b and fracXPS_uid136_CmpGE1_b;

    -- expFracX_uid138_CmpGE1(BITJOIN,137)@58
    expFracX_uid138_CmpGE1_q <= exp_x_uid104_CmpGE1_b & fracXPS_uid136_CmpGE1_q;

    -- yNotZero_uid135_CmpGE1(LOGICAL,134)@58
    yNotZero_uid135_CmpGE1_q <= not (excZ_y_uid120_CmpGE1_q);

    -- frac_y_uid119_CmpGE1(BITSELECT,118)@58
    frac_y_uid119_CmpGE1_b <= redist7_Sub3_out_primWireOut_5_outputreg_q(51 downto 0);

    -- fracYPS_uid137_CmpGE1(LOGICAL,136)@58
    fracYPS_uid137_CmpGE1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => yNotZero_uid135_CmpGE1_q(0)) & yNotZero_uid135_CmpGE1_q));
    fracYPS_uid137_CmpGE1_q <= frac_y_uid119_CmpGE1_b and fracYPS_uid137_CmpGE1_b;

    -- expFracY_uid140_CmpGE1(BITJOIN,139)@58
    expFracY_uid140_CmpGE1_q <= exp_y_uid118_CmpGE1_b & fracYPS_uid137_CmpGE1_q;

    -- efxLTEefy_uid145_CmpGE1(COMPARE,144)@58
    efxLTEefy_uid145_CmpGE1_a <= STD_LOGIC_VECTOR("00" & expFracY_uid140_CmpGE1_q);
    efxLTEefy_uid145_CmpGE1_b <= STD_LOGIC_VECTOR("00" & expFracX_uid138_CmpGE1_q);
    efxLTEefy_uid145_CmpGE1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTEefy_uid145_CmpGE1_a) - UNSIGNED(efxLTEefy_uid145_CmpGE1_b));
    efxLTEefy_uid145_CmpGE1_n(0) <= not (efxLTEefy_uid145_CmpGE1_o(64));

    -- efxGTEefy_uid144_CmpGE1(COMPARE,143)@58
    efxGTEefy_uid144_CmpGE1_a <= STD_LOGIC_VECTOR("00" & expFracX_uid138_CmpGE1_q);
    efxGTEefy_uid144_CmpGE1_b <= STD_LOGIC_VECTOR("00" & expFracY_uid140_CmpGE1_q);
    efxGTEefy_uid144_CmpGE1_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTEefy_uid144_CmpGE1_a) - UNSIGNED(efxGTEefy_uid144_CmpGE1_b));
    efxGTEefy_uid144_CmpGE1_n(0) <= not (efxGTEefy_uid144_CmpGE1_o(64));

    -- expFracCompMux_uid154_CmpGE1(MUX,153)@58
    expFracCompMux_uid154_CmpGE1_s <= signX_uid147_CmpGE1_b;
    expFracCompMux_uid154_CmpGE1_combproc: PROCESS (expFracCompMux_uid154_CmpGE1_s, efxGTEefy_uid144_CmpGE1_n, efxLTEefy_uid145_CmpGE1_n)
    BEGIN
        CASE (expFracCompMux_uid154_CmpGE1_s) IS
            WHEN "0" => expFracCompMux_uid154_CmpGE1_q <= efxGTEefy_uid144_CmpGE1_n;
            WHEN "1" => expFracCompMux_uid154_CmpGE1_q <= efxLTEefy_uid145_CmpGE1_n;
            WHEN OTHERS => expFracCompMux_uid154_CmpGE1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid152_CmpGE1(LOGICAL,151)@58
    xorSigns_uid152_CmpGE1_q <= signX_uid147_CmpGE1_b xor signY_uid148_CmpGE1_b;

    -- sxEQsy_uid153_CmpGE1(LOGICAL,152)@58
    sxEQsy_uid153_CmpGE1_q <= not (xorSigns_uid152_CmpGE1_q);

    -- sxEQsyExpFracCompMux_uid155_CmpGE1(LOGICAL,154)@58
    sxEQsyExpFracCompMux_uid155_CmpGE1_q <= sxEQsy_uid153_CmpGE1_q and expFracCompMux_uid154_CmpGE1_q;

    -- r_uid156_CmpGE1(LOGICAL,155)@58
    r_uid156_CmpGE1_q <= sxEQsyExpFracCompMux_uid155_CmpGE1_q or sxGTsy_uid151_CmpGE1_q or zeroInputs_uid146_CmpGE1_q;

    -- cstZeroWF_uid102_CmpGE1(CONSTANT,101)
    cstZeroWF_uid102_CmpGE1_q <= "0000000000000000000000000000000000000000000000000000";

    -- fracXIsZero_uid122_CmpGE1(LOGICAL,121)@58
    fracXIsZero_uid122_CmpGE1_q <= "1" WHEN cstZeroWF_uid102_CmpGE1_q = frac_y_uid119_CmpGE1_b ELSE "0";

    -- fracXIsNotZero_uid123_CmpGE1(LOGICAL,122)@58
    fracXIsNotZero_uid123_CmpGE1_q <= not (fracXIsZero_uid122_CmpGE1_q);

    -- cstAllOWE_uid101_CmpGE1(CONSTANT,100)
    cstAllOWE_uid101_CmpGE1_q <= "11111111111";

    -- expXIsMax_uid121_CmpGE1(LOGICAL,120)@58
    expXIsMax_uid121_CmpGE1_q <= "1" WHEN exp_y_uid118_CmpGE1_b = cstAllOWE_uid101_CmpGE1_q ELSE "0";

    -- excN_y_uid125_CmpGE1(LOGICAL,124)@58
    excN_y_uid125_CmpGE1_q <= expXIsMax_uid121_CmpGE1_q and fracXIsNotZero_uid123_CmpGE1_q;

    -- fracXIsZero_uid108_CmpGE1(LOGICAL,107)@58
    fracXIsZero_uid108_CmpGE1_q <= "1" WHEN cstZeroWF_uid102_CmpGE1_q = frac_x_uid105_CmpGE1_b ELSE "0";

    -- fracXIsNotZero_uid109_CmpGE1(LOGICAL,108)@58
    fracXIsNotZero_uid109_CmpGE1_q <= not (fracXIsZero_uid108_CmpGE1_q);

    -- expXIsMax_uid107_CmpGE1(LOGICAL,106)@58
    expXIsMax_uid107_CmpGE1_q <= "1" WHEN exp_x_uid104_CmpGE1_b = cstAllOWE_uid101_CmpGE1_q ELSE "0";

    -- excN_x_uid111_CmpGE1(LOGICAL,110)@58
    excN_x_uid111_CmpGE1_q <= expXIsMax_uid107_CmpGE1_q and fracXIsNotZero_uid109_CmpGE1_q;

    -- oneIsNaN_uid129_CmpGE1(LOGICAL,128)@58
    oneIsNaN_uid129_CmpGE1_q <= excN_x_uid111_CmpGE1_q or excN_y_uid125_CmpGE1_q;

    -- rPostExc_uid157_CmpGE1(MUX,156)@58
    rPostExc_uid157_CmpGE1_s <= oneIsNaN_uid129_CmpGE1_q;
    rPostExc_uid157_CmpGE1_combproc: PROCESS (rPostExc_uid157_CmpGE1_s, r_uid156_CmpGE1_q, GND_q)
    BEGIN
        CASE (rPostExc_uid157_CmpGE1_s) IS
            WHEN "0" => rPostExc_uid157_CmpGE1_q <= r_uid156_CmpGE1_q;
            WHEN "1" => rPostExc_uid157_CmpGE1_q <= GND_q;
            WHEN OTHERS => rPostExc_uid157_CmpGE1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mode_Meas1_x(FLOATCONSTANT,76)
    Mode_Meas1_x_q <= "0100000000001001001000011111101101010100010001000010110100011000";

    -- exp_y_uid176_CmpGE2(BITSELECT,175)@58
    exp_y_uid176_CmpGE2_b <= Mode_Meas1_x_q(62 downto 52);

    -- excZ_y_uid178_CmpGE2(LOGICAL,177)@58
    excZ_y_uid178_CmpGE2_q <= "1" WHEN exp_y_uid176_CmpGE2_b = cstAllZWE_uid103_CmpGE1_q ELSE "0";

    -- zeroInputs_uid204_CmpGE2(LOGICAL,203)@58
    zeroInputs_uid204_CmpGE2_q <= excZ_y_uid120_CmpGE1_q and excZ_y_uid178_CmpGE2_q;

    -- signY_uid206_CmpGE2(BITSELECT,205)@58
    signY_uid206_CmpGE2_b <= STD_LOGIC_VECTOR(Mode_Meas1_x_q(63 downto 63));

    -- concSYSX_uid208_CmpGE2(BITJOIN,207)@58
    concSYSX_uid208_CmpGE2_q <= signY_uid206_CmpGE2_b & signY_uid148_CmpGE1_b;

    -- sxGTsy_uid209_CmpGE2(LOGICAL,208)@58
    sxGTsy_uid209_CmpGE2_q <= "1" WHEN concSYSX_uid208_CmpGE2_q = Const6_q ELSE "0";

    -- yNotZero_uid193_CmpGE2(LOGICAL,192)@58
    yNotZero_uid193_CmpGE2_q <= not (excZ_y_uid178_CmpGE2_q);

    -- frac_y_uid177_CmpGE2(BITSELECT,176)@58
    frac_y_uid177_CmpGE2_b <= Mode_Meas1_x_q(51 downto 0);

    -- fracYPS_uid195_CmpGE2(LOGICAL,194)@58
    fracYPS_uid195_CmpGE2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => yNotZero_uid193_CmpGE2_q(0)) & yNotZero_uid193_CmpGE2_q));
    fracYPS_uid195_CmpGE2_q <= frac_y_uid177_CmpGE2_b and fracYPS_uid195_CmpGE2_b;

    -- expFracY_uid198_CmpGE2(BITJOIN,197)@58
    expFracY_uid198_CmpGE2_q <= exp_y_uid176_CmpGE2_b & fracYPS_uid195_CmpGE2_q;

    -- efxLTEefy_uid203_CmpGE2(COMPARE,202)@58
    efxLTEefy_uid203_CmpGE2_a <= STD_LOGIC_VECTOR("00" & expFracY_uid198_CmpGE2_q);
    efxLTEefy_uid203_CmpGE2_b <= STD_LOGIC_VECTOR("00" & expFracY_uid140_CmpGE1_q);
    efxLTEefy_uid203_CmpGE2_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTEefy_uid203_CmpGE2_a) - UNSIGNED(efxLTEefy_uid203_CmpGE2_b));
    efxLTEefy_uid203_CmpGE2_n(0) <= not (efxLTEefy_uid203_CmpGE2_o(64));

    -- efxGTEefy_uid202_CmpGE2(COMPARE,201)@58
    efxGTEefy_uid202_CmpGE2_a <= STD_LOGIC_VECTOR("00" & expFracY_uid140_CmpGE1_q);
    efxGTEefy_uid202_CmpGE2_b <= STD_LOGIC_VECTOR("00" & expFracY_uid198_CmpGE2_q);
    efxGTEefy_uid202_CmpGE2_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTEefy_uid202_CmpGE2_a) - UNSIGNED(efxGTEefy_uid202_CmpGE2_b));
    efxGTEefy_uid202_CmpGE2_n(0) <= not (efxGTEefy_uid202_CmpGE2_o(64));

    -- expFracCompMux_uid212_CmpGE2(MUX,211)@58
    expFracCompMux_uid212_CmpGE2_s <= signY_uid148_CmpGE1_b;
    expFracCompMux_uid212_CmpGE2_combproc: PROCESS (expFracCompMux_uid212_CmpGE2_s, efxGTEefy_uid202_CmpGE2_n, efxLTEefy_uid203_CmpGE2_n)
    BEGIN
        CASE (expFracCompMux_uid212_CmpGE2_s) IS
            WHEN "0" => expFracCompMux_uid212_CmpGE2_q <= efxGTEefy_uid202_CmpGE2_n;
            WHEN "1" => expFracCompMux_uid212_CmpGE2_q <= efxLTEefy_uid203_CmpGE2_n;
            WHEN OTHERS => expFracCompMux_uid212_CmpGE2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid210_CmpGE2(LOGICAL,209)@58
    xorSigns_uid210_CmpGE2_q <= signY_uid148_CmpGE1_b xor signY_uid206_CmpGE2_b;

    -- sxEQsy_uid211_CmpGE2(LOGICAL,210)@58
    sxEQsy_uid211_CmpGE2_q <= not (xorSigns_uid210_CmpGE2_q);

    -- sxEQsyExpFracCompMux_uid213_CmpGE2(LOGICAL,212)@58
    sxEQsyExpFracCompMux_uid213_CmpGE2_q <= sxEQsy_uid211_CmpGE2_q and expFracCompMux_uid212_CmpGE2_q;

    -- r_uid214_CmpGE2(LOGICAL,213)@58
    r_uid214_CmpGE2_q <= sxEQsyExpFracCompMux_uid213_CmpGE2_q or sxGTsy_uid209_CmpGE2_q or zeroInputs_uid204_CmpGE2_q;

    -- fracXIsZero_uid180_CmpGE2(LOGICAL,179)@58
    fracXIsZero_uid180_CmpGE2_q <= "1" WHEN cstZeroWF_uid102_CmpGE1_q = frac_y_uid177_CmpGE2_b ELSE "0";

    -- fracXIsNotZero_uid181_CmpGE2(LOGICAL,180)@58
    fracXIsNotZero_uid181_CmpGE2_q <= not (fracXIsZero_uid180_CmpGE2_q);

    -- expXIsMax_uid179_CmpGE2(LOGICAL,178)@58
    expXIsMax_uid179_CmpGE2_q <= "1" WHEN exp_y_uid176_CmpGE2_b = cstAllOWE_uid101_CmpGE1_q ELSE "0";

    -- excN_y_uid183_CmpGE2(LOGICAL,182)@58
    excN_y_uid183_CmpGE2_q <= expXIsMax_uid179_CmpGE2_q and fracXIsNotZero_uid181_CmpGE2_q;

    -- oneIsNaN_uid187_CmpGE2(LOGICAL,186)@58
    oneIsNaN_uid187_CmpGE2_q <= excN_y_uid125_CmpGE1_q or excN_y_uid183_CmpGE2_q;

    -- rPostExc_uid215_CmpGE2(MUX,214)@58
    rPostExc_uid215_CmpGE2_s <= oneIsNaN_uid187_CmpGE2_q;
    rPostExc_uid215_CmpGE2_combproc: PROCESS (rPostExc_uid215_CmpGE2_s, r_uid214_CmpGE2_q, GND_q)
    BEGIN
        CASE (rPostExc_uid215_CmpGE2_s) IS
            WHEN "0" => rPostExc_uid215_CmpGE2_q <= r_uid214_CmpGE2_q;
            WHEN "1" => rPostExc_uid215_CmpGE2_q <= GND_q;
            WHEN OTHERS => rPostExc_uid215_CmpGE2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- BitCombine1(BITJOIN,55)@58
    BitCombine1_q <= rPostExc_uid157_CmpGE1_q & rPostExc_uid215_CmpGE2_q;

    -- sym_Q2(MUX,93)@58 + 1
    sym_Q2_s <= BitCombine1_q;
    sym_Q2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sym_Q2_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (sym_Q2_s) IS
                WHEN "00" => sym_Q2_q <= redist7_Sub3_out_primWireOut_5_outputreg_q;
                WHEN "01" => sym_Q2_q <= redist5_Sub4_out_primWireOut_1_q;
                WHEN "10" => sym_Q2_q <= redist19_Add2_out_primWireOut_1_q;
                WHEN OTHERS => sym_Q2_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Convert5(BLACKBOX,73)@59
    theConvert5 : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz
    PORT MAP (
        in_0 => sym_Q2_q,
        out_primWireOut => Convert5_out_primWireOut,
        clk => clk,
        areset => areset
    );

    -- redist9_Convert5_out_primWireOut_1(DELAY,229)
    redist9_Convert5_out_primWireOut_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert5_out_primWireOut, xout => redist9_Convert5_out_primWireOut_1_q, clk => clk, aclr => areset );

    -- redist16_ChannelIn_in_10_c_58_notEnable(LOGICAL,292)
    redist16_ChannelIn_in_10_c_58_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist16_ChannelIn_in_10_c_58_nor(LOGICAL,293)
    redist16_ChannelIn_in_10_c_58_nor_q <= not (redist16_ChannelIn_in_10_c_58_notEnable_q or redist16_ChannelIn_in_10_c_58_sticky_ena_q);

    -- redist16_ChannelIn_in_10_c_58_mem_last(CONSTANT,289)
    redist16_ChannelIn_in_10_c_58_mem_last_q <= "010101";

    -- redist16_ChannelIn_in_10_c_58_cmp(LOGICAL,290)
    redist16_ChannelIn_in_10_c_58_cmp_b <= STD_LOGIC_VECTOR("0" & redist16_ChannelIn_in_10_c_58_rdcnt_q);
    redist16_ChannelIn_in_10_c_58_cmp_q <= "1" WHEN redist16_ChannelIn_in_10_c_58_mem_last_q = redist16_ChannelIn_in_10_c_58_cmp_b ELSE "0";

    -- redist16_ChannelIn_in_10_c_58_cmpReg(REG,291)
    redist16_ChannelIn_in_10_c_58_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_ChannelIn_in_10_c_58_cmpReg_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_cmp_q);
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_sticky_ena(REG,294)
    redist16_ChannelIn_in_10_c_58_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_ChannelIn_in_10_c_58_nor_q = "1") THEN
                redist16_ChannelIn_in_10_c_58_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_enaAnd(LOGICAL,295)
    redist16_ChannelIn_in_10_c_58_enaAnd_q <= redist16_ChannelIn_in_10_c_58_sticky_ena_q and VCC_q;

    -- redist16_ChannelIn_in_10_c_58_rdcnt(COUNTER,287)
    -- low=0, high=22, step=1, init=0
    redist16_ChannelIn_in_10_c_58_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist16_ChannelIn_in_10_c_58_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_ChannelIn_in_10_c_58_rdcnt_i = TO_UNSIGNED(21, 5)) THEN
                redist16_ChannelIn_in_10_c_58_rdcnt_eq <= '1';
            ELSE
                redist16_ChannelIn_in_10_c_58_rdcnt_eq <= '0';
            END IF;
            IF (redist16_ChannelIn_in_10_c_58_rdcnt_eq = '1') THEN
                redist16_ChannelIn_in_10_c_58_rdcnt_i <= redist16_ChannelIn_in_10_c_58_rdcnt_i + 10;
            ELSE
                redist16_ChannelIn_in_10_c_58_rdcnt_i <= redist16_ChannelIn_in_10_c_58_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist16_ChannelIn_in_10_c_58_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_ChannelIn_in_10_c_58_rdcnt_i, 5)));

    -- redist16_ChannelIn_in_10_c_58_split_0_nor(LOGICAL,304)
    redist16_ChannelIn_in_10_c_58_split_0_nor_q <= not (redist16_ChannelIn_in_10_c_58_notEnable_q or redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q);

    -- redist16_ChannelIn_in_10_c_58_split_0_mem_last(CONSTANT,300)
    redist16_ChannelIn_in_10_c_58_split_0_mem_last_q <= "011101";

    -- redist16_ChannelIn_in_10_c_58_split_0_cmp(LOGICAL,301)
    redist16_ChannelIn_in_10_c_58_split_0_cmp_b <= STD_LOGIC_VECTOR("0" & redist16_ChannelIn_in_10_c_58_split_0_rdcnt_q);
    redist16_ChannelIn_in_10_c_58_split_0_cmp_q <= "1" WHEN redist16_ChannelIn_in_10_c_58_split_0_mem_last_q = redist16_ChannelIn_in_10_c_58_split_0_cmp_b ELSE "0";

    -- redist16_ChannelIn_in_10_c_58_split_0_cmpReg(REG,302)
    redist16_ChannelIn_in_10_c_58_split_0_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_cmpReg_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_split_0_cmp_q);
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_split_0_sticky_ena(REG,305)
    redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_ChannelIn_in_10_c_58_split_0_nor_q = "1") THEN
                redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_split_0_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_split_0_enaAnd(LOGICAL,306)
    redist16_ChannelIn_in_10_c_58_split_0_enaAnd_q <= redist16_ChannelIn_in_10_c_58_split_0_sticky_ena_q and VCC_q;

    -- redist16_ChannelIn_in_10_c_58_split_0_rdcnt(COUNTER,298)
    -- low=0, high=30, step=1, init=0
    redist16_ChannelIn_in_10_c_58_split_0_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i <= TO_UNSIGNED(0, 5);
            redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i = TO_UNSIGNED(29, 5)) THEN
                redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq <= '1';
            ELSE
                redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq <= '0';
            END IF;
            IF (redist16_ChannelIn_in_10_c_58_split_0_rdcnt_eq = '1') THEN
                redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i <= redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i + 2;
            ELSE
                redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i <= redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist16_ChannelIn_in_10_c_58_split_0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist16_ChannelIn_in_10_c_58_split_0_rdcnt_i, 5)));

    -- redist16_ChannelIn_in_10_c_58_split_0_wraddr(REG,299)
    redist16_ChannelIn_in_10_c_58_split_0_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_wraddr_q <= "11110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_ChannelIn_in_10_c_58_split_0_wraddr_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_split_0_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_split_0_mem(DUALMEM,297)
    redist16_ChannelIn_in_10_c_58_split_0_mem_ia <= STD_LOGIC_VECTOR(in_10_c);
    redist16_ChannelIn_in_10_c_58_split_0_mem_aa <= redist16_ChannelIn_in_10_c_58_split_0_wraddr_q;
    redist16_ChannelIn_in_10_c_58_split_0_mem_ab <= redist16_ChannelIn_in_10_c_58_split_0_rdcnt_q;
    redist16_ChannelIn_in_10_c_58_split_0_mem_reset0 <= areset;
    redist16_ChannelIn_in_10_c_58_split_0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 31,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist16_ChannelIn_in_10_c_58_split_0_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist16_ChannelIn_in_10_c_58_split_0_mem_reset0,
        clock1 => clk,
        address_a => redist16_ChannelIn_in_10_c_58_split_0_mem_aa,
        data_a => redist16_ChannelIn_in_10_c_58_split_0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist16_ChannelIn_in_10_c_58_split_0_mem_ab,
        q_b => redist16_ChannelIn_in_10_c_58_split_0_mem_iq
    );
    redist16_ChannelIn_in_10_c_58_split_0_mem_q <= redist16_ChannelIn_in_10_c_58_split_0_mem_iq(7 downto 0);

    -- redist16_ChannelIn_in_10_c_58_split_0_outputreg(DELAY,296)
    redist16_ChannelIn_in_10_c_58_split_0_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_ChannelIn_in_10_c_58_split_0_mem_q, xout => redist16_ChannelIn_in_10_c_58_split_0_outputreg_q, clk => clk, aclr => areset );

    -- redist16_ChannelIn_in_10_c_58_wraddr(REG,288)
    redist16_ChannelIn_in_10_c_58_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist16_ChannelIn_in_10_c_58_wraddr_q <= "10110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist16_ChannelIn_in_10_c_58_wraddr_q <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist16_ChannelIn_in_10_c_58_mem(DUALMEM,286)
    redist16_ChannelIn_in_10_c_58_mem_ia <= STD_LOGIC_VECTOR(redist16_ChannelIn_in_10_c_58_split_0_outputreg_q);
    redist16_ChannelIn_in_10_c_58_mem_aa <= redist16_ChannelIn_in_10_c_58_wraddr_q;
    redist16_ChannelIn_in_10_c_58_mem_ab <= redist16_ChannelIn_in_10_c_58_rdcnt_q;
    redist16_ChannelIn_in_10_c_58_mem_reset0 <= areset;
    redist16_ChannelIn_in_10_c_58_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 23,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 23,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist16_ChannelIn_in_10_c_58_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist16_ChannelIn_in_10_c_58_mem_reset0,
        clock1 => clk,
        address_a => redist16_ChannelIn_in_10_c_58_mem_aa,
        data_a => redist16_ChannelIn_in_10_c_58_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist16_ChannelIn_in_10_c_58_mem_ab,
        q_b => redist16_ChannelIn_in_10_c_58_mem_iq
    );
    redist16_ChannelIn_in_10_c_58_mem_q <= redist16_ChannelIn_in_10_c_58_mem_iq(7 downto 0);

    -- redist16_ChannelIn_in_10_c_58_outputreg(DELAY,285)
    redist16_ChannelIn_in_10_c_58_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_ChannelIn_in_10_c_58_mem_q, xout => redist16_ChannelIn_in_10_c_58_outputreg_q, clk => clk, aclr => areset );

    -- redist15_ChannelIn_in_9_v_60(DELAY,235)
    redist15_ChannelIn_in_9_v_60 : dspba_delay
    GENERIC MAP ( width => 1, depth => 58, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist14_ChannelIn_in_9_v_2_q, xout => redist15_ChannelIn_in_9_v_60_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,57)@60 + 1
    out_1_v_sym_update <= redist15_ChannelIn_in_9_v_60_q;
    out_2_qc <= redist16_ChannelIn_in_10_c_58_outputreg_q;
    out_3_symbols_phase_x <= redist9_Convert5_out_primWireOut_1_q;
    out_4_packet_trigger_through <= redist17_ChannelIn_in_7_packet_trigger_58_q;
    out_5_corrected_phase <= redist8_Convert6_out_primWireOut_10_outputreg_q;
    out_6_offset_phase <= GND_q;

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
                WHEN "1" => Demux_0_mux_x_q <= redist14_ChannelIn_in_9_v_2_q;
                WHEN OTHERS => Demux_0_mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

END normal;
