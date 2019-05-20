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

-- VHDL created from mp_txrx_Symbol_Recovery
-- VHDL created on Mon May 20 17:18:10 2019


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

entity mp_txrx_Symbol_Recovery is
    port (
        in_1_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_pow_in : in std_logic_vector(11 downto 0);  -- sfix12
        in_4_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_5_Q : in std_logic_vector(11 downto 0);  -- sfix12
        out_2_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_bits : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_phase : out std_logic_vector(28 downto 0);  -- sfix29_en14
        out_5_trigger : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_sym_pwr : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic
    );
end mp_txrx_Symbol_Recovery;

architecture normal of mp_txrx_Symbol_Recovery is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_SRlatch_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_SRlatch_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE_a : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_b : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_o : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE2_a : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE2_b : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE2_o : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpGE2_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpLT_a : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpLT_b : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpLT_o : STD_LOGIC_VECTOR (30 downto 0);
    signal CmpLT_c : STD_LOGIC_VECTOR (0 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Not1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_decision_thresh_1_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_decision_thresh_2_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal Sub_a : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_b : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_o : STD_LOGIC_VECTOR (28 downto 0);
    signal Sub_q : STD_LOGIC_VECTOR (28 downto 0);
    signal Threshold_q : STD_LOGIC_VECTOR (64 downto 0);
    signal CmpGE_PreShift_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal CmpGE_PreShift_0_qint : STD_LOGIC_VECTOR (33 downto 0);
    signal CmpLT_PreShift_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpLT_PreShift_1_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpGE2_PreShift_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpGE2_PreShift_1_qint : STD_LOGIC_VECTOR (15 downto 0);
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
    signal Phase_correct_x_CmpYGeZero_s13_qi : STD_LOGIC_VECTOR (0 downto 0);
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
    signal Phase_detect_x_XLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_XgteZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ZeroAddSubX_00_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_ShiftY_s0_in : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_ShiftY_s0_b : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Xout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_detect_x_ShiftY_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal Phase_detect_x_Xout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_detect_x_ShiftY_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal Phase_detect_x_Xout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_detect_x_ShiftY_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal Phase_detect_x_Xout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_detect_x_ShiftY_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal Phase_detect_x_Xout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_detect_x_ShiftY_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal Phase_detect_x_Xout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_detect_x_ShiftY_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal Phase_detect_x_Xout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_detect_x_ShiftY_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal Phase_detect_x_Xout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_detect_x_ShiftY_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal Phase_detect_x_Xout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_detect_x_ShiftY_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Phase_detect_x_Xout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_detect_x_ShiftY_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Phase_detect_x_Xout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Phase_detect_x_ShiftY_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Phase_detect_x_Xout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Xout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Xout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Yout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYLtZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_CmpYGeZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_ShiftX_s12_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Phase_detect_x_Yout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Yout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Yout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_Pout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal Phase_detect_x_CmpYGeZero_s13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s13_a : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s13_b : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s13_o : STD_LOGIC_VECTOR (14 downto 0);
    signal Phase_detect_x_Pout_s13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Phase_detect_x_Pout_s13_q : STD_LOGIC_VECTOR (13 downto 0);
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
    signal redist0_Phase_detect_x_XLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_Phase_correct_x_YLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_Sub_q_1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal redist3_Not_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ChannelIn_in_1_dv_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_ChannelIn_in_2_dc_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_ChannelIn_in_3_pow_in_2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);

begin


    -- redist6_ChannelIn_in_3_pow_in_2(DELAY,546)
    redist6_ChannelIn_in_3_pow_in_2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_3_pow_in, xout => redist6_ChannelIn_in_3_pow_in_2_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- mp_txrx_Symbol_Recovery_SRlatch_Not_x(LOGICAL,18)@1
    mp_txrx_Symbol_Recovery_SRlatch_Not_x_q <= not (GND_q);

    -- Threshold(CONSTANT,50)
    Threshold_q <= "00000000000000000000000000000000000001100100000000000000000000000";

    -- CmpGE_PreShift_0(BITSHIFT,51)@1
    CmpGE_PreShift_0_qint <= in_3_pow_in & "0000000000000000000000";
    CmpGE_PreShift_0_q <= CmpGE_PreShift_0_qint(33 downto 0);

    -- CmpGE(COMPARE,32)@1
    CmpGE_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 34 => CmpGE_PreShift_0_q(33)) & CmpGE_PreShift_0_q));
    CmpGE_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 65 => Threshold_q(64)) & Threshold_q));
    CmpGE_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE_a) - SIGNED(CmpGE_b));
    CmpGE_n(0) <= not (CmpGE_o(66));

    -- redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1(DELAY,547)
    redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_SRlatch_And_x_q, xout => redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_SRlatch_Or_x(LOGICAL,19)@1
    mp_txrx_Symbol_Recovery_SRlatch_Or_x_q <= redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q or CmpGE_n;

    -- mp_txrx_Symbol_Recovery_SRlatch_And_x(LOGICAL,17)@1
    mp_txrx_Symbol_Recovery_SRlatch_And_x_q <= mp_txrx_Symbol_Recovery_SRlatch_Or_x_q and mp_txrx_Symbol_Recovery_SRlatch_Not_x_q;

    -- Sequence_rsrvd_fix(SEQUENCE,48)@0 + 1
    Sequence_rsrvd_fix_clkproc: PROCESS (clk, areset)
        variable Sequence_rsrvd_fix_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence_rsrvd_fix_c := "11011101";
            Sequence_rsrvd_fix_q <= "1";
            Sequence_rsrvd_fix_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mp_txrx_Symbol_Recovery_SRlatch_And_x_q = "1") THEN
                IF (Sequence_rsrvd_fix_c = "11011010") THEN
                    Sequence_rsrvd_fix_eq <= '1';
                ELSE
                    Sequence_rsrvd_fix_eq <= '0';
                END IF;
                IF (Sequence_rsrvd_fix_eq = '1') THEN
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c + 39;
                ELSE
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c - 1;
                END IF;
                Sequence_rsrvd_fix_q <= STD_LOGIC_VECTOR(Sequence_rsrvd_fix_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- Not_rsrvd_fix(LOGICAL,41)@1
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- redist3_Not_rsrvd_fix_q_2(DELAY,543)
    redist3_Not_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not_rsrvd_fix_q, xout => redist3_Not_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- mp_txrx_Symbol_Recovery_latch_0L_Mux_x(MUX,22)@3 + 1
    mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s <= redist3_Not_rsrvd_fix_q_2_q;
    mp_txrx_Symbol_Recovery_latch_0L_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s) IS
                WHEN "0" => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q;
                WHEN "1" => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= redist6_ChannelIn_in_3_pow_in_2_q;
                WHEN OTHERS => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2(DELAY,548)
    redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q, xout => redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2_q, clk => clk, aclr => areset );

    -- redist9_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4(DELAY,549)
    redist9_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2_q, xout => redist9_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q, clk => clk, aclr => areset );

    -- Phase_detect_x_LutPlusMinus(LOOKUP,458)@3
    Phase_detect_x_LutPlusMinus_combproc: PROCESS (redist0_Phase_detect_x_XLtZero_00_q_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist0_Phase_detect_x_XLtZero_00_q_2_q) IS
            WHEN "0" => Phase_detect_x_LutPlusMinus_q <= "0000000000001100100100010000";
            WHEN "1" => Phase_detect_x_LutPlusMinus_q <= "1111111111110011011011110000";
            WHEN OTHERS => -- unreachable
                           Phase_detect_x_LutPlusMinus_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- Phase_detect_x_LutSubP(SUB,459)@3
    Phase_detect_x_LutSubP_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_detect_x_LutPlusMinus_q(27)) & Phase_detect_x_LutPlusMinus_q));
    Phase_detect_x_LutSubP_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 14 => Phase_detect_x_Pout_s13_q(13)) & Phase_detect_x_Pout_s13_q));
    Phase_detect_x_LutSubP_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_LutSubP_a) - SIGNED(Phase_detect_x_LutSubP_b));
    Phase_detect_x_LutSubP_q <= Phase_detect_x_LutSubP_o(28 downto 0);

    -- Phase_detect_x_CmpYLtZero_s12(LOGICAL,433)@2
    Phase_detect_x_CmpYLtZero_s12_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s11_q(13 downto 13));

    -- Phase_detect_x_CmpYLtZero_s10(LOGICAL,407)@2
    Phase_detect_x_CmpYLtZero_s10_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s9_q(13 downto 13));

    -- Phase_detect_x_CmpYLtZero_s8(LOGICAL,381)@2
    Phase_detect_x_CmpYLtZero_s8_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s7_q(13 downto 13));

    -- Phase_detect_x_CmpYLtZero_s6(LOGICAL,355)@2
    Phase_detect_x_CmpYLtZero_s6_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s5_q(13 downto 13));

    -- Phase_detect_x_CmpYLtZero_s4(LOGICAL,329)@1
    Phase_detect_x_CmpYLtZero_s4_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s3_q(13 downto 13));

    -- Phase_detect_x_CmpYLtZero_s2(LOGICAL,303)@1
    Phase_detect_x_CmpYLtZero_s2_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s1_q(13 downto 13));

    -- Phase_detect_x_XLtZero_00(LOGICAL,264)@1
    Phase_detect_x_XLtZero_00_q <= STD_LOGIC_VECTOR(mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q(11 downto 11));

    -- Phase_detect_x_XgteZero_00(LOGICAL,265)@1
    Phase_detect_x_XgteZero_00_q <= STD_LOGIC_VECTOR(not (mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q(11 downto 11)));

    -- Phase_correct_x_CnstZero_0(CONSTANT,54)
    Phase_correct_x_CnstZero_0_q <= "00000000000000";

    -- Phase_detect_x_ZeroAddSubX_00(ADDSUB,266)@1
    Phase_detect_x_ZeroAddSubX_00_s <= Phase_detect_x_XgteZero_00_q;
    Phase_detect_x_ZeroAddSubX_00_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_CnstZero_0_q(13)) & Phase_correct_x_CnstZero_0_q));
    Phase_detect_x_ZeroAddSubX_00_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q));
    Phase_detect_x_ZeroAddSubX_00_combproc: PROCESS (Phase_detect_x_ZeroAddSubX_00_a, Phase_detect_x_ZeroAddSubX_00_b, Phase_detect_x_ZeroAddSubX_00_s)
    BEGIN
        IF (Phase_detect_x_ZeroAddSubX_00_s = "1") THEN
            Phase_detect_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_ZeroAddSubX_00_a) + SIGNED(Phase_detect_x_ZeroAddSubX_00_b));
        ELSE
            Phase_detect_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_ZeroAddSubX_00_a) - SIGNED(Phase_detect_x_ZeroAddSubX_00_b));
        END IF;
    END PROCESS;
    Phase_detect_x_ZeroAddSubX_00_q <= Phase_detect_x_ZeroAddSubX_00_o(13 downto 0);

    -- redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1(DELAY,551)
    redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q, xout => redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- Not1(LOGICAL,42)@1
    Not1_q <= not (redist8_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_2_q);

    -- And1(LOGICAL,27)@1
    And1_q <= redist7_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q and Not1_q;

    -- mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x(MUX,9)@1
    mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_s <= And1_q;
    mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_combproc: PROCESS (mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_s, redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1_q, in_4_I)
    BEGIN
        CASE (mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_s) IS
            WHEN "0" => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q <= redist11_mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q_1_q;
            WHEN "1" => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q <= in_4_I;
            WHEN OTHERS => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_detect_x_Yout_s0(ADDSUB,286)@1
    Phase_detect_x_Yout_s0_s <= Phase_detect_x_XLtZero_00_q;
    Phase_detect_x_Yout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q));
    Phase_detect_x_Yout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_ZeroAddSubX_00_q(13)) & Phase_detect_x_ZeroAddSubX_00_q));
    Phase_detect_x_Yout_s0_combproc: PROCESS (Phase_detect_x_Yout_s0_a, Phase_detect_x_Yout_s0_b, Phase_detect_x_Yout_s0_s)
    BEGIN
        IF (Phase_detect_x_Yout_s0_s = "1") THEN
            Phase_detect_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s0_a) + SIGNED(Phase_detect_x_Yout_s0_b));
        ELSE
            Phase_detect_x_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s0_a) - SIGNED(Phase_detect_x_Yout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s0_q <= Phase_detect_x_Yout_s0_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s1(LOGICAL,293)@1
    Phase_detect_x_CmpYGeZero_s1_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s0_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s1(BITSELECT,297)@1
    Phase_detect_x_ShiftY_s1_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s0_q(13 downto 1));

    -- Phase_detect_x_ShiftY_s0(BITSELECT,284)@1
    Phase_detect_x_ShiftY_s0_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_I_for_sync_Mux_x_q));
    Phase_detect_x_ShiftY_s0_b <= STD_LOGIC_VECTOR(Phase_detect_x_ShiftY_s0_in(13 downto 0));

    -- Phase_detect_x_Xout_s0(ADDSUB,285)@1
    Phase_detect_x_Xout_s0_s <= Phase_detect_x_XgteZero_00_q;
    Phase_detect_x_Xout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_ZeroAddSubX_00_q(13)) & Phase_detect_x_ZeroAddSubX_00_q));
    Phase_detect_x_Xout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_ShiftY_s0_b(13)) & Phase_detect_x_ShiftY_s0_b));
    Phase_detect_x_Xout_s0_combproc: PROCESS (Phase_detect_x_Xout_s0_a, Phase_detect_x_Xout_s0_b, Phase_detect_x_Xout_s0_s)
    BEGIN
        IF (Phase_detect_x_Xout_s0_s = "1") THEN
            Phase_detect_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s0_a) + SIGNED(Phase_detect_x_Xout_s0_b));
        ELSE
            Phase_detect_x_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s0_a) - SIGNED(Phase_detect_x_Xout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s0_q <= Phase_detect_x_Xout_s0_o(13 downto 0);

    -- Phase_detect_x_Xout_s1(ADDSUB,298)@1
    Phase_detect_x_Xout_s1_s <= Phase_detect_x_CmpYGeZero_s1_q;
    Phase_detect_x_Xout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s0_q(13)) & Phase_detect_x_Xout_s0_q));
    Phase_detect_x_Xout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => Phase_detect_x_ShiftY_s1_b(12)) & Phase_detect_x_ShiftY_s1_b));
    Phase_detect_x_Xout_s1_combproc: PROCESS (Phase_detect_x_Xout_s1_a, Phase_detect_x_Xout_s1_b, Phase_detect_x_Xout_s1_s)
    BEGIN
        IF (Phase_detect_x_Xout_s1_s = "1") THEN
            Phase_detect_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s1_a) + SIGNED(Phase_detect_x_Xout_s1_b));
        ELSE
            Phase_detect_x_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s1_a) - SIGNED(Phase_detect_x_Xout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s1_q <= Phase_detect_x_Xout_s1_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s2(BITSELECT,309)@1
    Phase_detect_x_ShiftX_s2_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s1_q(13 downto 2));

    -- Phase_detect_x_CmpYLtZero_s1(LOGICAL,290)@1
    Phase_detect_x_CmpYLtZero_s1_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s0_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s1(BITSELECT,296)@1
    Phase_detect_x_ShiftX_s1_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s0_q(13 downto 1));

    -- Phase_detect_x_Yout_s1(ADDSUB,299)@1
    Phase_detect_x_Yout_s1_s <= Phase_detect_x_CmpYLtZero_s1_q;
    Phase_detect_x_Yout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s0_q(13)) & Phase_detect_x_Yout_s0_q));
    Phase_detect_x_Yout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => Phase_detect_x_ShiftX_s1_b(12)) & Phase_detect_x_ShiftX_s1_b));
    Phase_detect_x_Yout_s1_combproc: PROCESS (Phase_detect_x_Yout_s1_a, Phase_detect_x_Yout_s1_b, Phase_detect_x_Yout_s1_s)
    BEGIN
        IF (Phase_detect_x_Yout_s1_s = "1") THEN
            Phase_detect_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s1_a) + SIGNED(Phase_detect_x_Yout_s1_b));
        ELSE
            Phase_detect_x_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s1_a) - SIGNED(Phase_detect_x_Yout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s1_q <= Phase_detect_x_Yout_s1_o(13 downto 0);

    -- Phase_detect_x_Yout_s2(ADDSUB,312)@1
    Phase_detect_x_Yout_s2_s <= Phase_detect_x_CmpYLtZero_s2_q;
    Phase_detect_x_Yout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s1_q(13)) & Phase_detect_x_Yout_s1_q));
    Phase_detect_x_Yout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => Phase_detect_x_ShiftX_s2_b(11)) & Phase_detect_x_ShiftX_s2_b));
    Phase_detect_x_Yout_s2_combproc: PROCESS (Phase_detect_x_Yout_s2_a, Phase_detect_x_Yout_s2_b, Phase_detect_x_Yout_s2_s)
    BEGIN
        IF (Phase_detect_x_Yout_s2_s = "1") THEN
            Phase_detect_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s2_a) + SIGNED(Phase_detect_x_Yout_s2_b));
        ELSE
            Phase_detect_x_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s2_a) - SIGNED(Phase_detect_x_Yout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s2_q <= Phase_detect_x_Yout_s2_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s3(LOGICAL,319)@1
    Phase_detect_x_CmpYGeZero_s3_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s2_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s3(BITSELECT,323)@1
    Phase_detect_x_ShiftY_s3_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s2_q(13 downto 3));

    -- Phase_detect_x_CmpYGeZero_s2(LOGICAL,306)@1
    Phase_detect_x_CmpYGeZero_s2_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s1_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s2(BITSELECT,310)@1
    Phase_detect_x_ShiftY_s2_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s1_q(13 downto 2));

    -- Phase_detect_x_Xout_s2(ADDSUB,311)@1
    Phase_detect_x_Xout_s2_s <= Phase_detect_x_CmpYGeZero_s2_q;
    Phase_detect_x_Xout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s1_q(13)) & Phase_detect_x_Xout_s1_q));
    Phase_detect_x_Xout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => Phase_detect_x_ShiftY_s2_b(11)) & Phase_detect_x_ShiftY_s2_b));
    Phase_detect_x_Xout_s2_combproc: PROCESS (Phase_detect_x_Xout_s2_a, Phase_detect_x_Xout_s2_b, Phase_detect_x_Xout_s2_s)
    BEGIN
        IF (Phase_detect_x_Xout_s2_s = "1") THEN
            Phase_detect_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s2_a) + SIGNED(Phase_detect_x_Xout_s2_b));
        ELSE
            Phase_detect_x_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s2_a) - SIGNED(Phase_detect_x_Xout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s2_q <= Phase_detect_x_Xout_s2_o(13 downto 0);

    -- Phase_detect_x_Xout_s3(ADDSUB,324)@1
    Phase_detect_x_Xout_s3_s <= Phase_detect_x_CmpYGeZero_s3_q;
    Phase_detect_x_Xout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s2_q(13)) & Phase_detect_x_Xout_s2_q));
    Phase_detect_x_Xout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => Phase_detect_x_ShiftY_s3_b(10)) & Phase_detect_x_ShiftY_s3_b));
    Phase_detect_x_Xout_s3_combproc: PROCESS (Phase_detect_x_Xout_s3_a, Phase_detect_x_Xout_s3_b, Phase_detect_x_Xout_s3_s)
    BEGIN
        IF (Phase_detect_x_Xout_s3_s = "1") THEN
            Phase_detect_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s3_a) + SIGNED(Phase_detect_x_Xout_s3_b));
        ELSE
            Phase_detect_x_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s3_a) - SIGNED(Phase_detect_x_Xout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s3_q <= Phase_detect_x_Xout_s3_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s4(BITSELECT,335)@1
    Phase_detect_x_ShiftX_s4_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s3_q(13 downto 4));

    -- Phase_detect_x_CmpYLtZero_s3(LOGICAL,316)@1
    Phase_detect_x_CmpYLtZero_s3_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s2_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s3(BITSELECT,322)@1
    Phase_detect_x_ShiftX_s3_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s2_q(13 downto 3));

    -- Phase_detect_x_Yout_s3(ADDSUB,325)@1
    Phase_detect_x_Yout_s3_s <= Phase_detect_x_CmpYLtZero_s3_q;
    Phase_detect_x_Yout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s2_q(13)) & Phase_detect_x_Yout_s2_q));
    Phase_detect_x_Yout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => Phase_detect_x_ShiftX_s3_b(10)) & Phase_detect_x_ShiftX_s3_b));
    Phase_detect_x_Yout_s3_combproc: PROCESS (Phase_detect_x_Yout_s3_a, Phase_detect_x_Yout_s3_b, Phase_detect_x_Yout_s3_s)
    BEGIN
        IF (Phase_detect_x_Yout_s3_s = "1") THEN
            Phase_detect_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s3_a) + SIGNED(Phase_detect_x_Yout_s3_b));
        ELSE
            Phase_detect_x_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s3_a) - SIGNED(Phase_detect_x_Yout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s3_q <= Phase_detect_x_Yout_s3_o(13 downto 0);

    -- Phase_detect_x_Yout_s4(ADDSUB,338)@1
    Phase_detect_x_Yout_s4_s <= Phase_detect_x_CmpYLtZero_s4_q;
    Phase_detect_x_Yout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s3_q(13)) & Phase_detect_x_Yout_s3_q));
    Phase_detect_x_Yout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_detect_x_ShiftX_s4_b(9)) & Phase_detect_x_ShiftX_s4_b));
    Phase_detect_x_Yout_s4_combproc: PROCESS (Phase_detect_x_Yout_s4_a, Phase_detect_x_Yout_s4_b, Phase_detect_x_Yout_s4_s)
    BEGIN
        IF (Phase_detect_x_Yout_s4_s = "1") THEN
            Phase_detect_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s4_a) + SIGNED(Phase_detect_x_Yout_s4_b));
        ELSE
            Phase_detect_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s4_a) - SIGNED(Phase_detect_x_Yout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s4_q <= Phase_detect_x_Yout_s4_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s5(LOGICAL,345)@1
    Phase_detect_x_CmpYGeZero_s5_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s4_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s5(BITSELECT,349)@1
    Phase_detect_x_ShiftY_s5_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s4_q(13 downto 5));

    -- Phase_detect_x_CmpYGeZero_s4(LOGICAL,332)@1
    Phase_detect_x_CmpYGeZero_s4_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s3_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s4(BITSELECT,336)@1
    Phase_detect_x_ShiftY_s4_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s3_q(13 downto 4));

    -- Phase_detect_x_Xout_s4(ADDSUB,337)@1
    Phase_detect_x_Xout_s4_s <= Phase_detect_x_CmpYGeZero_s4_q;
    Phase_detect_x_Xout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s3_q(13)) & Phase_detect_x_Xout_s3_q));
    Phase_detect_x_Xout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_detect_x_ShiftY_s4_b(9)) & Phase_detect_x_ShiftY_s4_b));
    Phase_detect_x_Xout_s4_combproc: PROCESS (Phase_detect_x_Xout_s4_a, Phase_detect_x_Xout_s4_b, Phase_detect_x_Xout_s4_s)
    BEGIN
        IF (Phase_detect_x_Xout_s4_s = "1") THEN
            Phase_detect_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s4_a) + SIGNED(Phase_detect_x_Xout_s4_b));
        ELSE
            Phase_detect_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s4_a) - SIGNED(Phase_detect_x_Xout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s4_q <= Phase_detect_x_Xout_s4_o(13 downto 0);

    -- Phase_detect_x_Xout_s5(ADDSUB,350)@1 + 1
    Phase_detect_x_Xout_s5_s <= Phase_detect_x_CmpYGeZero_s5_q;
    Phase_detect_x_Xout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s4_q(13)) & Phase_detect_x_Xout_s4_q));
    Phase_detect_x_Xout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => Phase_detect_x_ShiftY_s5_b(8)) & Phase_detect_x_ShiftY_s5_b));
    Phase_detect_x_Xout_s5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Xout_s5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Xout_s5_s = "1") THEN
                Phase_detect_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s5_a) + SIGNED(Phase_detect_x_Xout_s5_b));
            ELSE
                Phase_detect_x_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s5_a) - SIGNED(Phase_detect_x_Xout_s5_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s5_q <= Phase_detect_x_Xout_s5_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s6(BITSELECT,361)@2
    Phase_detect_x_ShiftX_s6_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s5_q(13 downto 6));

    -- Phase_detect_x_CmpYLtZero_s5(LOGICAL,342)@1
    Phase_detect_x_CmpYLtZero_s5_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s4_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s5(BITSELECT,348)@1
    Phase_detect_x_ShiftX_s5_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s4_q(13 downto 5));

    -- Phase_detect_x_Yout_s5(ADDSUB,351)@1 + 1
    Phase_detect_x_Yout_s5_s <= Phase_detect_x_CmpYLtZero_s5_q;
    Phase_detect_x_Yout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s4_q(13)) & Phase_detect_x_Yout_s4_q));
    Phase_detect_x_Yout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => Phase_detect_x_ShiftX_s5_b(8)) & Phase_detect_x_ShiftX_s5_b));
    Phase_detect_x_Yout_s5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Yout_s5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Yout_s5_s = "1") THEN
                Phase_detect_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s5_a) + SIGNED(Phase_detect_x_Yout_s5_b));
            ELSE
                Phase_detect_x_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s5_a) - SIGNED(Phase_detect_x_Yout_s5_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s5_q <= Phase_detect_x_Yout_s5_o(13 downto 0);

    -- Phase_detect_x_Yout_s6(ADDSUB,364)@2
    Phase_detect_x_Yout_s6_s <= Phase_detect_x_CmpYLtZero_s6_q;
    Phase_detect_x_Yout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s5_q(13)) & Phase_detect_x_Yout_s5_q));
    Phase_detect_x_Yout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_detect_x_ShiftX_s6_b(7)) & Phase_detect_x_ShiftX_s6_b));
    Phase_detect_x_Yout_s6_combproc: PROCESS (Phase_detect_x_Yout_s6_a, Phase_detect_x_Yout_s6_b, Phase_detect_x_Yout_s6_s)
    BEGIN
        IF (Phase_detect_x_Yout_s6_s = "1") THEN
            Phase_detect_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s6_a) + SIGNED(Phase_detect_x_Yout_s6_b));
        ELSE
            Phase_detect_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s6_a) - SIGNED(Phase_detect_x_Yout_s6_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s6_q <= Phase_detect_x_Yout_s6_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s7(LOGICAL,371)@2
    Phase_detect_x_CmpYGeZero_s7_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s6_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s7(BITSELECT,375)@2
    Phase_detect_x_ShiftY_s7_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s6_q(13 downto 7));

    -- Phase_detect_x_CmpYGeZero_s6(LOGICAL,358)@2
    Phase_detect_x_CmpYGeZero_s6_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s5_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s6(BITSELECT,362)@2
    Phase_detect_x_ShiftY_s6_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s5_q(13 downto 6));

    -- Phase_detect_x_Xout_s6(ADDSUB,363)@2
    Phase_detect_x_Xout_s6_s <= Phase_detect_x_CmpYGeZero_s6_q;
    Phase_detect_x_Xout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s5_q(13)) & Phase_detect_x_Xout_s5_q));
    Phase_detect_x_Xout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_detect_x_ShiftY_s6_b(7)) & Phase_detect_x_ShiftY_s6_b));
    Phase_detect_x_Xout_s6_combproc: PROCESS (Phase_detect_x_Xout_s6_a, Phase_detect_x_Xout_s6_b, Phase_detect_x_Xout_s6_s)
    BEGIN
        IF (Phase_detect_x_Xout_s6_s = "1") THEN
            Phase_detect_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s6_a) + SIGNED(Phase_detect_x_Xout_s6_b));
        ELSE
            Phase_detect_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s6_a) - SIGNED(Phase_detect_x_Xout_s6_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s6_q <= Phase_detect_x_Xout_s6_o(13 downto 0);

    -- Phase_detect_x_Xout_s7(ADDSUB,376)@2
    Phase_detect_x_Xout_s7_s <= Phase_detect_x_CmpYGeZero_s7_q;
    Phase_detect_x_Xout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s6_q(13)) & Phase_detect_x_Xout_s6_q));
    Phase_detect_x_Xout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => Phase_detect_x_ShiftY_s7_b(6)) & Phase_detect_x_ShiftY_s7_b));
    Phase_detect_x_Xout_s7_combproc: PROCESS (Phase_detect_x_Xout_s7_a, Phase_detect_x_Xout_s7_b, Phase_detect_x_Xout_s7_s)
    BEGIN
        IF (Phase_detect_x_Xout_s7_s = "1") THEN
            Phase_detect_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s7_a) + SIGNED(Phase_detect_x_Xout_s7_b));
        ELSE
            Phase_detect_x_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s7_a) - SIGNED(Phase_detect_x_Xout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s7_q <= Phase_detect_x_Xout_s7_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s8(BITSELECT,387)@2
    Phase_detect_x_ShiftX_s8_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s7_q(13 downto 8));

    -- Phase_detect_x_CmpYLtZero_s7(LOGICAL,368)@2
    Phase_detect_x_CmpYLtZero_s7_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s6_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s7(BITSELECT,374)@2
    Phase_detect_x_ShiftX_s7_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s6_q(13 downto 7));

    -- Phase_detect_x_Yout_s7(ADDSUB,377)@2
    Phase_detect_x_Yout_s7_s <= Phase_detect_x_CmpYLtZero_s7_q;
    Phase_detect_x_Yout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s6_q(13)) & Phase_detect_x_Yout_s6_q));
    Phase_detect_x_Yout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => Phase_detect_x_ShiftX_s7_b(6)) & Phase_detect_x_ShiftX_s7_b));
    Phase_detect_x_Yout_s7_combproc: PROCESS (Phase_detect_x_Yout_s7_a, Phase_detect_x_Yout_s7_b, Phase_detect_x_Yout_s7_s)
    BEGIN
        IF (Phase_detect_x_Yout_s7_s = "1") THEN
            Phase_detect_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s7_a) + SIGNED(Phase_detect_x_Yout_s7_b));
        ELSE
            Phase_detect_x_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s7_a) - SIGNED(Phase_detect_x_Yout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s7_q <= Phase_detect_x_Yout_s7_o(13 downto 0);

    -- Phase_detect_x_Yout_s8(ADDSUB,390)@2
    Phase_detect_x_Yout_s8_s <= Phase_detect_x_CmpYLtZero_s8_q;
    Phase_detect_x_Yout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s7_q(13)) & Phase_detect_x_Yout_s7_q));
    Phase_detect_x_Yout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => Phase_detect_x_ShiftX_s8_b(5)) & Phase_detect_x_ShiftX_s8_b));
    Phase_detect_x_Yout_s8_combproc: PROCESS (Phase_detect_x_Yout_s8_a, Phase_detect_x_Yout_s8_b, Phase_detect_x_Yout_s8_s)
    BEGIN
        IF (Phase_detect_x_Yout_s8_s = "1") THEN
            Phase_detect_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s8_a) + SIGNED(Phase_detect_x_Yout_s8_b));
        ELSE
            Phase_detect_x_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s8_a) - SIGNED(Phase_detect_x_Yout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s8_q <= Phase_detect_x_Yout_s8_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s9(LOGICAL,397)@2
    Phase_detect_x_CmpYGeZero_s9_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s8_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s9(BITSELECT,401)@2
    Phase_detect_x_ShiftY_s9_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s8_q(13 downto 9));

    -- Phase_detect_x_CmpYGeZero_s8(LOGICAL,384)@2
    Phase_detect_x_CmpYGeZero_s8_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s7_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s8(BITSELECT,388)@2
    Phase_detect_x_ShiftY_s8_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s7_q(13 downto 8));

    -- Phase_detect_x_Xout_s8(ADDSUB,389)@2
    Phase_detect_x_Xout_s8_s <= Phase_detect_x_CmpYGeZero_s8_q;
    Phase_detect_x_Xout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s7_q(13)) & Phase_detect_x_Xout_s7_q));
    Phase_detect_x_Xout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => Phase_detect_x_ShiftY_s8_b(5)) & Phase_detect_x_ShiftY_s8_b));
    Phase_detect_x_Xout_s8_combproc: PROCESS (Phase_detect_x_Xout_s8_a, Phase_detect_x_Xout_s8_b, Phase_detect_x_Xout_s8_s)
    BEGIN
        IF (Phase_detect_x_Xout_s8_s = "1") THEN
            Phase_detect_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s8_a) + SIGNED(Phase_detect_x_Xout_s8_b));
        ELSE
            Phase_detect_x_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s8_a) - SIGNED(Phase_detect_x_Xout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s8_q <= Phase_detect_x_Xout_s8_o(13 downto 0);

    -- Phase_detect_x_Xout_s9(ADDSUB,402)@2
    Phase_detect_x_Xout_s9_s <= Phase_detect_x_CmpYGeZero_s9_q;
    Phase_detect_x_Xout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s8_q(13)) & Phase_detect_x_Xout_s8_q));
    Phase_detect_x_Xout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => Phase_detect_x_ShiftY_s9_b(4)) & Phase_detect_x_ShiftY_s9_b));
    Phase_detect_x_Xout_s9_combproc: PROCESS (Phase_detect_x_Xout_s9_a, Phase_detect_x_Xout_s9_b, Phase_detect_x_Xout_s9_s)
    BEGIN
        IF (Phase_detect_x_Xout_s9_s = "1") THEN
            Phase_detect_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s9_a) + SIGNED(Phase_detect_x_Xout_s9_b));
        ELSE
            Phase_detect_x_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s9_a) - SIGNED(Phase_detect_x_Xout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s9_q <= Phase_detect_x_Xout_s9_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s10(BITSELECT,413)@2
    Phase_detect_x_ShiftX_s10_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s9_q(13 downto 10));

    -- Phase_detect_x_CmpYLtZero_s9(LOGICAL,394)@2
    Phase_detect_x_CmpYLtZero_s9_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s8_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s9(BITSELECT,400)@2
    Phase_detect_x_ShiftX_s9_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s8_q(13 downto 9));

    -- Phase_detect_x_Yout_s9(ADDSUB,403)@2
    Phase_detect_x_Yout_s9_s <= Phase_detect_x_CmpYLtZero_s9_q;
    Phase_detect_x_Yout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s8_q(13)) & Phase_detect_x_Yout_s8_q));
    Phase_detect_x_Yout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => Phase_detect_x_ShiftX_s9_b(4)) & Phase_detect_x_ShiftX_s9_b));
    Phase_detect_x_Yout_s9_combproc: PROCESS (Phase_detect_x_Yout_s9_a, Phase_detect_x_Yout_s9_b, Phase_detect_x_Yout_s9_s)
    BEGIN
        IF (Phase_detect_x_Yout_s9_s = "1") THEN
            Phase_detect_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s9_a) + SIGNED(Phase_detect_x_Yout_s9_b));
        ELSE
            Phase_detect_x_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s9_a) - SIGNED(Phase_detect_x_Yout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s9_q <= Phase_detect_x_Yout_s9_o(13 downto 0);

    -- Phase_detect_x_Yout_s10(ADDSUB,416)@2
    Phase_detect_x_Yout_s10_s <= Phase_detect_x_CmpYLtZero_s10_q;
    Phase_detect_x_Yout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s9_q(13)) & Phase_detect_x_Yout_s9_q));
    Phase_detect_x_Yout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => Phase_detect_x_ShiftX_s10_b(3)) & Phase_detect_x_ShiftX_s10_b));
    Phase_detect_x_Yout_s10_combproc: PROCESS (Phase_detect_x_Yout_s10_a, Phase_detect_x_Yout_s10_b, Phase_detect_x_Yout_s10_s)
    BEGIN
        IF (Phase_detect_x_Yout_s10_s = "1") THEN
            Phase_detect_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s10_a) + SIGNED(Phase_detect_x_Yout_s10_b));
        ELSE
            Phase_detect_x_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s10_a) - SIGNED(Phase_detect_x_Yout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s10_q <= Phase_detect_x_Yout_s10_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s11(LOGICAL,423)@2
    Phase_detect_x_CmpYGeZero_s11_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s10_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s11(BITSELECT,427)@2
    Phase_detect_x_ShiftY_s11_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s10_q(13 downto 11));

    -- Phase_detect_x_CmpYGeZero_s10(LOGICAL,410)@2
    Phase_detect_x_CmpYGeZero_s10_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s9_q(13 downto 13)));

    -- Phase_detect_x_ShiftY_s10(BITSELECT,414)@2
    Phase_detect_x_ShiftY_s10_b <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s9_q(13 downto 10));

    -- Phase_detect_x_Xout_s10(ADDSUB,415)@2
    Phase_detect_x_Xout_s10_s <= Phase_detect_x_CmpYGeZero_s10_q;
    Phase_detect_x_Xout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s9_q(13)) & Phase_detect_x_Xout_s9_q));
    Phase_detect_x_Xout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => Phase_detect_x_ShiftY_s10_b(3)) & Phase_detect_x_ShiftY_s10_b));
    Phase_detect_x_Xout_s10_combproc: PROCESS (Phase_detect_x_Xout_s10_a, Phase_detect_x_Xout_s10_b, Phase_detect_x_Xout_s10_s)
    BEGIN
        IF (Phase_detect_x_Xout_s10_s = "1") THEN
            Phase_detect_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s10_a) + SIGNED(Phase_detect_x_Xout_s10_b));
        ELSE
            Phase_detect_x_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s10_a) - SIGNED(Phase_detect_x_Xout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s10_q <= Phase_detect_x_Xout_s10_o(13 downto 0);

    -- Phase_detect_x_Xout_s11(ADDSUB,428)@2
    Phase_detect_x_Xout_s11_s <= Phase_detect_x_CmpYGeZero_s11_q;
    Phase_detect_x_Xout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Xout_s10_q(13)) & Phase_detect_x_Xout_s10_q));
    Phase_detect_x_Xout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => Phase_detect_x_ShiftY_s11_b(2)) & Phase_detect_x_ShiftY_s11_b));
    Phase_detect_x_Xout_s11_combproc: PROCESS (Phase_detect_x_Xout_s11_a, Phase_detect_x_Xout_s11_b, Phase_detect_x_Xout_s11_s)
    BEGIN
        IF (Phase_detect_x_Xout_s11_s = "1") THEN
            Phase_detect_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s11_a) + SIGNED(Phase_detect_x_Xout_s11_b));
        ELSE
            Phase_detect_x_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Xout_s11_a) - SIGNED(Phase_detect_x_Xout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Xout_s11_q <= Phase_detect_x_Xout_s11_o(13 downto 0);

    -- Phase_detect_x_ShiftX_s12(BITSELECT,439)@2
    Phase_detect_x_ShiftX_s12_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s11_q(13 downto 12));

    -- Phase_detect_x_CmpYLtZero_s11(LOGICAL,420)@2
    Phase_detect_x_CmpYLtZero_s11_q <= STD_LOGIC_VECTOR(Phase_detect_x_Yout_s10_q(13 downto 13));

    -- Phase_detect_x_ShiftX_s11(BITSELECT,426)@2
    Phase_detect_x_ShiftX_s11_b <= STD_LOGIC_VECTOR(Phase_detect_x_Xout_s10_q(13 downto 11));

    -- Phase_detect_x_Yout_s11(ADDSUB,429)@2
    Phase_detect_x_Yout_s11_s <= Phase_detect_x_CmpYLtZero_s11_q;
    Phase_detect_x_Yout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s10_q(13)) & Phase_detect_x_Yout_s10_q));
    Phase_detect_x_Yout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => Phase_detect_x_ShiftX_s11_b(2)) & Phase_detect_x_ShiftX_s11_b));
    Phase_detect_x_Yout_s11_combproc: PROCESS (Phase_detect_x_Yout_s11_a, Phase_detect_x_Yout_s11_b, Phase_detect_x_Yout_s11_s)
    BEGIN
        IF (Phase_detect_x_Yout_s11_s = "1") THEN
            Phase_detect_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s11_a) + SIGNED(Phase_detect_x_Yout_s11_b));
        ELSE
            Phase_detect_x_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s11_a) - SIGNED(Phase_detect_x_Yout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s11_q <= Phase_detect_x_Yout_s11_o(13 downto 0);

    -- Phase_detect_x_Yout_s12(ADDSUB,442)@2
    Phase_detect_x_Yout_s12_s <= Phase_detect_x_CmpYLtZero_s12_q;
    Phase_detect_x_Yout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Yout_s11_q(13)) & Phase_detect_x_Yout_s11_q));
    Phase_detect_x_Yout_s12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 2 => Phase_detect_x_ShiftX_s12_b(1)) & Phase_detect_x_ShiftX_s12_b));
    Phase_detect_x_Yout_s12_combproc: PROCESS (Phase_detect_x_Yout_s12_a, Phase_detect_x_Yout_s12_b, Phase_detect_x_Yout_s12_s)
    BEGIN
        IF (Phase_detect_x_Yout_s12_s = "1") THEN
            Phase_detect_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s12_a) + SIGNED(Phase_detect_x_Yout_s12_b));
        ELSE
            Phase_detect_x_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Yout_s12_a) - SIGNED(Phase_detect_x_Yout_s12_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Yout_s12_q <= Phase_detect_x_Yout_s12_o(13 downto 0);

    -- Phase_detect_x_CmpYGeZero_s13(LOGICAL,449)@2
    Phase_detect_x_CmpYGeZero_s13_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s12_q(13 downto 13)));

    -- Phase_correct_x_CnstAtan_s13(CONSTANT,239)
    Phase_correct_x_CnstAtan_s13_q <= "0000000000000000000000000010";

    -- Phase_detect_x_CmpYGeZero_s12(LOGICAL,436)@2
    Phase_detect_x_CmpYGeZero_s12_q <= STD_LOGIC_VECTOR(not (Phase_detect_x_Yout_s11_q(13 downto 13)));

    -- Phase_correct_x_CnstAtan_s12(CONSTANT,226)
    Phase_correct_x_CnstAtan_s12_q <= "0000000000000000000000000100";

    -- Phase_correct_x_CnstAtan_s11(CONSTANT,213)
    Phase_correct_x_CnstAtan_s11_q <= "0000000000000000000000001000";

    -- Phase_correct_x_CnstAtan_s10(CONSTANT,200)
    Phase_correct_x_CnstAtan_s10_q <= "0000000000000000000000010000";

    -- Phase_correct_x_CnstAtan_s9(CONSTANT,187)
    Phase_correct_x_CnstAtan_s9_q <= "0000000000000000000000100000";

    -- Phase_correct_x_CnstAtan_s8(CONSTANT,174)
    Phase_correct_x_CnstAtan_s8_q <= "0000000000000000000001000000";

    -- Phase_correct_x_CnstAtan_s7(CONSTANT,161)
    Phase_correct_x_CnstAtan_s7_q <= "0000000000000000000010000000";

    -- Phase_correct_x_CnstAtan_s6(CONSTANT,148)
    Phase_correct_x_CnstAtan_s6_q <= "0000000000000000000100000000";

    -- Phase_correct_x_CnstAtan_s5(CONSTANT,135)
    Phase_correct_x_CnstAtan_s5_q <= "0000000000000000001000000000";

    -- Phase_correct_x_CnstAtan_s4(CONSTANT,122)
    Phase_correct_x_CnstAtan_s4_q <= "0000000000000000001111111111";

    -- Phase_correct_x_CnstAtan_s3(CONSTANT,109)
    Phase_correct_x_CnstAtan_s3_q <= "0000000000000000011111110101";

    -- Phase_correct_x_CnstAtan_s2(CONSTANT,96)
    Phase_correct_x_CnstAtan_s2_q <= "0000000000000000111110101110";

    -- Phase_correct_x_CnstAtan_s1(CONSTANT,83)
    Phase_correct_x_CnstAtan_s1_q <= "0000000000000001110110101100";

    -- Phase_correct_x_CnstAtan_s0(CONSTANT,70)
    Phase_correct_x_CnstAtan_s0_q <= "0000000000000011001001000100";

    -- muxopt_assign_id1_q_const(CONSTANT,539)
    muxopt_assign_id1_q_const_q <= "0000000000000000000000000000";

    -- Phase_detect_x_Pout_s0(ADDSUB,287)@1
    Phase_detect_x_Pout_s0_s <= Phase_detect_x_XgteZero_00_q;
    Phase_detect_x_Pout_s0_a <= STD_LOGIC_VECTOR(muxopt_assign_id1_q_const_q(14 downto 0));
    Phase_detect_x_Pout_s0_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s0_q(14 downto 0));
    Phase_detect_x_Pout_s0_combproc: PROCESS (Phase_detect_x_Pout_s0_a, Phase_detect_x_Pout_s0_b, Phase_detect_x_Pout_s0_s)
    BEGIN
        IF (Phase_detect_x_Pout_s0_s = "1") THEN
            Phase_detect_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s0_a) + SIGNED(Phase_detect_x_Pout_s0_b));
        ELSE
            Phase_detect_x_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s0_a) - SIGNED(Phase_detect_x_Pout_s0_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s0_q <= Phase_detect_x_Pout_s0_o(13 downto 0);

    -- Phase_detect_x_Pout_s1(ADDSUB,300)@1
    Phase_detect_x_Pout_s1_s <= Phase_detect_x_CmpYGeZero_s1_q;
    Phase_detect_x_Pout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s0_q(13)) & Phase_detect_x_Pout_s0_q));
    Phase_detect_x_Pout_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s1_q(14 downto 0));
    Phase_detect_x_Pout_s1_combproc: PROCESS (Phase_detect_x_Pout_s1_a, Phase_detect_x_Pout_s1_b, Phase_detect_x_Pout_s1_s)
    BEGIN
        IF (Phase_detect_x_Pout_s1_s = "1") THEN
            Phase_detect_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s1_a) + SIGNED(Phase_detect_x_Pout_s1_b));
        ELSE
            Phase_detect_x_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s1_a) - SIGNED(Phase_detect_x_Pout_s1_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s1_q <= Phase_detect_x_Pout_s1_o(13 downto 0);

    -- Phase_detect_x_Pout_s2(ADDSUB,313)@1
    Phase_detect_x_Pout_s2_s <= Phase_detect_x_CmpYGeZero_s2_q;
    Phase_detect_x_Pout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s1_q(13)) & Phase_detect_x_Pout_s1_q));
    Phase_detect_x_Pout_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s2_q(14 downto 0));
    Phase_detect_x_Pout_s2_combproc: PROCESS (Phase_detect_x_Pout_s2_a, Phase_detect_x_Pout_s2_b, Phase_detect_x_Pout_s2_s)
    BEGIN
        IF (Phase_detect_x_Pout_s2_s = "1") THEN
            Phase_detect_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s2_a) + SIGNED(Phase_detect_x_Pout_s2_b));
        ELSE
            Phase_detect_x_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s2_a) - SIGNED(Phase_detect_x_Pout_s2_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s2_q <= Phase_detect_x_Pout_s2_o(13 downto 0);

    -- Phase_detect_x_Pout_s3(ADDSUB,326)@1
    Phase_detect_x_Pout_s3_s <= Phase_detect_x_CmpYGeZero_s3_q;
    Phase_detect_x_Pout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s2_q(13)) & Phase_detect_x_Pout_s2_q));
    Phase_detect_x_Pout_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s3_q(14 downto 0));
    Phase_detect_x_Pout_s3_combproc: PROCESS (Phase_detect_x_Pout_s3_a, Phase_detect_x_Pout_s3_b, Phase_detect_x_Pout_s3_s)
    BEGIN
        IF (Phase_detect_x_Pout_s3_s = "1") THEN
            Phase_detect_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s3_a) + SIGNED(Phase_detect_x_Pout_s3_b));
        ELSE
            Phase_detect_x_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s3_a) - SIGNED(Phase_detect_x_Pout_s3_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s3_q <= Phase_detect_x_Pout_s3_o(13 downto 0);

    -- Phase_detect_x_Pout_s4(ADDSUB,339)@1
    Phase_detect_x_Pout_s4_s <= Phase_detect_x_CmpYGeZero_s4_q;
    Phase_detect_x_Pout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s3_q(13)) & Phase_detect_x_Pout_s3_q));
    Phase_detect_x_Pout_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s4_q(14 downto 0));
    Phase_detect_x_Pout_s4_combproc: PROCESS (Phase_detect_x_Pout_s4_a, Phase_detect_x_Pout_s4_b, Phase_detect_x_Pout_s4_s)
    BEGIN
        IF (Phase_detect_x_Pout_s4_s = "1") THEN
            Phase_detect_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s4_a) + SIGNED(Phase_detect_x_Pout_s4_b));
        ELSE
            Phase_detect_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s4_a) - SIGNED(Phase_detect_x_Pout_s4_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s4_q <= Phase_detect_x_Pout_s4_o(13 downto 0);

    -- Phase_detect_x_Pout_s5(ADDSUB,352)@1 + 1
    Phase_detect_x_Pout_s5_s <= Phase_detect_x_CmpYGeZero_s5_q;
    Phase_detect_x_Pout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s4_q(13)) & Phase_detect_x_Pout_s4_q));
    Phase_detect_x_Pout_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s5_q(14 downto 0));
    Phase_detect_x_Pout_s5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Pout_s5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Pout_s5_s = "1") THEN
                Phase_detect_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s5_a) + SIGNED(Phase_detect_x_Pout_s5_b));
            ELSE
                Phase_detect_x_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s5_a) - SIGNED(Phase_detect_x_Pout_s5_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s5_q <= Phase_detect_x_Pout_s5_o(13 downto 0);

    -- Phase_detect_x_Pout_s6(ADDSUB,365)@2
    Phase_detect_x_Pout_s6_s <= Phase_detect_x_CmpYGeZero_s6_q;
    Phase_detect_x_Pout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s5_q(13)) & Phase_detect_x_Pout_s5_q));
    Phase_detect_x_Pout_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s6_q(14 downto 0));
    Phase_detect_x_Pout_s6_combproc: PROCESS (Phase_detect_x_Pout_s6_a, Phase_detect_x_Pout_s6_b, Phase_detect_x_Pout_s6_s)
    BEGIN
        IF (Phase_detect_x_Pout_s6_s = "1") THEN
            Phase_detect_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s6_a) + SIGNED(Phase_detect_x_Pout_s6_b));
        ELSE
            Phase_detect_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s6_a) - SIGNED(Phase_detect_x_Pout_s6_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s6_q <= Phase_detect_x_Pout_s6_o(13 downto 0);

    -- Phase_detect_x_Pout_s7(ADDSUB,378)@2
    Phase_detect_x_Pout_s7_s <= Phase_detect_x_CmpYGeZero_s7_q;
    Phase_detect_x_Pout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s6_q(13)) & Phase_detect_x_Pout_s6_q));
    Phase_detect_x_Pout_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s7_q(14 downto 0));
    Phase_detect_x_Pout_s7_combproc: PROCESS (Phase_detect_x_Pout_s7_a, Phase_detect_x_Pout_s7_b, Phase_detect_x_Pout_s7_s)
    BEGIN
        IF (Phase_detect_x_Pout_s7_s = "1") THEN
            Phase_detect_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s7_a) + SIGNED(Phase_detect_x_Pout_s7_b));
        ELSE
            Phase_detect_x_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s7_a) - SIGNED(Phase_detect_x_Pout_s7_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s7_q <= Phase_detect_x_Pout_s7_o(13 downto 0);

    -- Phase_detect_x_Pout_s8(ADDSUB,391)@2
    Phase_detect_x_Pout_s8_s <= Phase_detect_x_CmpYGeZero_s8_q;
    Phase_detect_x_Pout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s7_q(13)) & Phase_detect_x_Pout_s7_q));
    Phase_detect_x_Pout_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s8_q(14 downto 0));
    Phase_detect_x_Pout_s8_combproc: PROCESS (Phase_detect_x_Pout_s8_a, Phase_detect_x_Pout_s8_b, Phase_detect_x_Pout_s8_s)
    BEGIN
        IF (Phase_detect_x_Pout_s8_s = "1") THEN
            Phase_detect_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s8_a) + SIGNED(Phase_detect_x_Pout_s8_b));
        ELSE
            Phase_detect_x_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s8_a) - SIGNED(Phase_detect_x_Pout_s8_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s8_q <= Phase_detect_x_Pout_s8_o(13 downto 0);

    -- Phase_detect_x_Pout_s9(ADDSUB,404)@2
    Phase_detect_x_Pout_s9_s <= Phase_detect_x_CmpYGeZero_s9_q;
    Phase_detect_x_Pout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s8_q(13)) & Phase_detect_x_Pout_s8_q));
    Phase_detect_x_Pout_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s9_q(14 downto 0));
    Phase_detect_x_Pout_s9_combproc: PROCESS (Phase_detect_x_Pout_s9_a, Phase_detect_x_Pout_s9_b, Phase_detect_x_Pout_s9_s)
    BEGIN
        IF (Phase_detect_x_Pout_s9_s = "1") THEN
            Phase_detect_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s9_a) + SIGNED(Phase_detect_x_Pout_s9_b));
        ELSE
            Phase_detect_x_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s9_a) - SIGNED(Phase_detect_x_Pout_s9_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s9_q <= Phase_detect_x_Pout_s9_o(13 downto 0);

    -- Phase_detect_x_Pout_s10(ADDSUB,417)@2
    Phase_detect_x_Pout_s10_s <= Phase_detect_x_CmpYGeZero_s10_q;
    Phase_detect_x_Pout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s9_q(13)) & Phase_detect_x_Pout_s9_q));
    Phase_detect_x_Pout_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s10_q(14 downto 0));
    Phase_detect_x_Pout_s10_combproc: PROCESS (Phase_detect_x_Pout_s10_a, Phase_detect_x_Pout_s10_b, Phase_detect_x_Pout_s10_s)
    BEGIN
        IF (Phase_detect_x_Pout_s10_s = "1") THEN
            Phase_detect_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s10_a) + SIGNED(Phase_detect_x_Pout_s10_b));
        ELSE
            Phase_detect_x_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s10_a) - SIGNED(Phase_detect_x_Pout_s10_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s10_q <= Phase_detect_x_Pout_s10_o(13 downto 0);

    -- Phase_detect_x_Pout_s11(ADDSUB,430)@2
    Phase_detect_x_Pout_s11_s <= Phase_detect_x_CmpYGeZero_s11_q;
    Phase_detect_x_Pout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s10_q(13)) & Phase_detect_x_Pout_s10_q));
    Phase_detect_x_Pout_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s11_q(14 downto 0));
    Phase_detect_x_Pout_s11_combproc: PROCESS (Phase_detect_x_Pout_s11_a, Phase_detect_x_Pout_s11_b, Phase_detect_x_Pout_s11_s)
    BEGIN
        IF (Phase_detect_x_Pout_s11_s = "1") THEN
            Phase_detect_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s11_a) + SIGNED(Phase_detect_x_Pout_s11_b));
        ELSE
            Phase_detect_x_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s11_a) - SIGNED(Phase_detect_x_Pout_s11_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s11_q <= Phase_detect_x_Pout_s11_o(13 downto 0);

    -- Phase_detect_x_Pout_s12(ADDSUB,443)@2
    Phase_detect_x_Pout_s12_s <= Phase_detect_x_CmpYGeZero_s12_q;
    Phase_detect_x_Pout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s11_q(13)) & Phase_detect_x_Pout_s11_q));
    Phase_detect_x_Pout_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s12_q(14 downto 0));
    Phase_detect_x_Pout_s12_combproc: PROCESS (Phase_detect_x_Pout_s12_a, Phase_detect_x_Pout_s12_b, Phase_detect_x_Pout_s12_s)
    BEGIN
        IF (Phase_detect_x_Pout_s12_s = "1") THEN
            Phase_detect_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s12_a) + SIGNED(Phase_detect_x_Pout_s12_b));
        ELSE
            Phase_detect_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s12_a) - SIGNED(Phase_detect_x_Pout_s12_b));
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s12_q <= Phase_detect_x_Pout_s12_o(13 downto 0);

    -- Phase_detect_x_Pout_s13(ADDSUB,456)@2 + 1
    Phase_detect_x_Pout_s13_s <= Phase_detect_x_CmpYGeZero_s13_q;
    Phase_detect_x_Pout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_detect_x_Pout_s12_q(13)) & Phase_detect_x_Pout_s12_q));
    Phase_detect_x_Pout_s13_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s13_q(14 downto 0));
    Phase_detect_x_Pout_s13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_detect_x_Pout_s13_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_detect_x_Pout_s13_s = "1") THEN
                Phase_detect_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s13_a) + SIGNED(Phase_detect_x_Pout_s13_b));
            ELSE
                Phase_detect_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_detect_x_Pout_s13_a) - SIGNED(Phase_detect_x_Pout_s13_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_detect_x_Pout_s13_q <= Phase_detect_x_Pout_s13_o(13 downto 0);

    -- redist0_Phase_detect_x_XLtZero_00_q_2(DELAY,540)
    redist0_Phase_detect_x_XLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_detect_x_XLtZero_00_q, xout => redist0_Phase_detect_x_XLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_detect_x_SelPonX(MUX,462)@3
    Phase_detect_x_SelPonX_s <= redist0_Phase_detect_x_XLtZero_00_q_2_q;
    Phase_detect_x_SelPonX_combproc: PROCESS (Phase_detect_x_SelPonX_s, Phase_detect_x_Pout_s13_q, Phase_detect_x_LutSubP_q)
    BEGIN
        CASE (Phase_detect_x_SelPonX_s) IS
            WHEN "0" => Phase_detect_x_SelPonX_q <= STD_LOGIC_VECTOR((28 downto 14 => Phase_detect_x_Pout_s13_q(13)) & Phase_detect_x_Pout_s13_q);
            WHEN "1" => Phase_detect_x_SelPonX_q <= Phase_detect_x_LutSubP_q;
            WHEN OTHERS => Phase_detect_x_SelPonX_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_detect_PostCast_cordicWireAngle_rnd_x_sel(BITSELECT,469)@3
    Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_in <= STD_LOGIC_VECTOR(Phase_detect_x_SelPonX_q(27 downto 0));
    Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b <= STD_LOGIC_VECTOR(Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_in(27 downto 0));

    -- redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1(DELAY,550)
    redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q, xout => redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x(MUX,11)@1
    mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_s <= Not_rsrvd_fix_q;
    mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_combproc: PROCESS (mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_s, redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1_q, in_5_Q)
    BEGIN
        CASE (mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_s) IS
            WHEN "0" => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q <= redist10_mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q_1_q;
            WHEN "1" => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q <= in_5_Q;
            WHEN OTHERS => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_correct_x_YLtZero_00(LOGICAL,62)@1
    Phase_correct_x_YLtZero_00_q <= STD_LOGIC_VECTOR(mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q(11 downto 11));

    -- redist1_Phase_correct_x_YLtZero_00_q_2(DELAY,541)
    redist1_Phase_correct_x_YLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_YLtZero_00_q, xout => redist1_Phase_correct_x_YLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- Phase_correct_x_LutPlusMinus(LOOKUP,252)@3
    Phase_correct_x_LutPlusMinus_combproc: PROCESS (redist1_Phase_correct_x_YLtZero_00_q_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist1_Phase_correct_x_YLtZero_00_q_2_q) IS
            WHEN "0" => Phase_correct_x_LutPlusMinus_q <= "0000000000001100100100010000";
            WHEN "1" => Phase_correct_x_LutPlusMinus_q <= "1111111111110011011011110000";
            WHEN OTHERS => -- unreachable
                           Phase_correct_x_LutPlusMinus_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- Phase_correct_x_LutSubP(SUB,253)@3
    Phase_correct_x_LutSubP_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_correct_x_LutPlusMinus_q(27)) & Phase_correct_x_LutPlusMinus_q));
    Phase_correct_x_LutSubP_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 14 => Phase_correct_x_Pout_s13_q(13)) & Phase_correct_x_Pout_s13_q));
    Phase_correct_x_LutSubP_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_LutSubP_a) - SIGNED(Phase_correct_x_LutSubP_b));
    Phase_correct_x_LutSubP_q <= Phase_correct_x_LutSubP_o(28 downto 0);

    -- Phase_correct_x_CmpYLtZero_s12(LOGICAL,227)@2
    Phase_correct_x_CmpYLtZero_s12_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s11_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s10(LOGICAL,201)@2
    Phase_correct_x_CmpYLtZero_s10_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s9_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s8(LOGICAL,175)@2
    Phase_correct_x_CmpYLtZero_s8_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s7_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s6(LOGICAL,149)@2
    Phase_correct_x_CmpYLtZero_s6_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s5_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s4(LOGICAL,123)@1
    Phase_correct_x_CmpYLtZero_s4_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s3_q(13 downto 13));

    -- Phase_correct_x_CmpYLtZero_s2(LOGICAL,97)@1
    Phase_correct_x_CmpYLtZero_s2_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s1_q(13 downto 13));

    -- Phase_correct_x_XgteZero_00(LOGICAL,59)@1
    Phase_correct_x_XgteZero_00_q <= STD_LOGIC_VECTOR(not (mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q(11 downto 11)));

    -- redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1(DELAY,552)
    redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q, xout => redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x(MUX,7)@1
    mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_s <= Not_rsrvd_fix_q;
    mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_combproc: PROCESS (mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_s, redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1_q, in_4_I)
    BEGIN
        CASE (mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_s) IS
            WHEN "0" => mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q <= redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1_q;
            WHEN "1" => mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q <= in_4_I;
            WHEN OTHERS => mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_correct_x_ZeroAddSubX_00(ADDSUB,60)@1
    Phase_correct_x_ZeroAddSubX_00_s <= Phase_correct_x_XgteZero_00_q;
    Phase_correct_x_ZeroAddSubX_00_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_CnstZero_0_q(13)) & Phase_correct_x_CnstZero_0_q));
    Phase_correct_x_ZeroAddSubX_00_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q));
    Phase_correct_x_ZeroAddSubX_00_combproc: PROCESS (Phase_correct_x_ZeroAddSubX_00_a, Phase_correct_x_ZeroAddSubX_00_b, Phase_correct_x_ZeroAddSubX_00_s)
    BEGIN
        IF (Phase_correct_x_ZeroAddSubX_00_s = "1") THEN
            Phase_correct_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_ZeroAddSubX_00_a) + SIGNED(Phase_correct_x_ZeroAddSubX_00_b));
        ELSE
            Phase_correct_x_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_ZeroAddSubX_00_a) - SIGNED(Phase_correct_x_ZeroAddSubX_00_b));
        END IF;
    END PROCESS;
    Phase_correct_x_ZeroAddSubX_00_q <= Phase_correct_x_ZeroAddSubX_00_o(13 downto 0);

    -- Phase_correct_x_Yout_s0(ADDSUB,80)@1
    Phase_correct_x_Yout_s0_s <= Phase_correct_x_YLtZero_00_q;
    Phase_correct_x_Yout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q));
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

    -- Phase_correct_x_CmpYGeZero_s1(LOGICAL,87)@1
    Phase_correct_x_CmpYGeZero_s1_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s0_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s1(BITSELECT,91)@1
    Phase_correct_x_ShiftY_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s0_q(13 downto 1));

    -- Phase_correct_x_CmpYGeZero_s0(LOGICAL,74)@1
    Phase_correct_x_CmpYGeZero_s0_q <= STD_LOGIC_VECTOR(not (mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q(11 downto 11)));

    -- Phase_correct_x_ShiftY_s0(BITSELECT,78)@1
    Phase_correct_x_ShiftY_s0_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_Catch_Q_for_sample_Mux_x_q));
    Phase_correct_x_ShiftY_s0_b <= STD_LOGIC_VECTOR(Phase_correct_x_ShiftY_s0_in(13 downto 0));

    -- Phase_correct_x_Xout_s0(ADDSUB,79)@1
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

    -- Phase_correct_x_Xout_s1(ADDSUB,92)@1
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

    -- Phase_correct_x_ShiftX_s2(BITSELECT,103)@1
    Phase_correct_x_ShiftX_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s1_q(13 downto 2));

    -- Phase_correct_x_CmpYLtZero_s1(LOGICAL,84)@1
    Phase_correct_x_CmpYLtZero_s1_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s0_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s1(BITSELECT,90)@1
    Phase_correct_x_ShiftX_s1_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s0_q(13 downto 1));

    -- Phase_correct_x_Yout_s1(ADDSUB,93)@1
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

    -- Phase_correct_x_Yout_s2(ADDSUB,106)@1
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

    -- Phase_correct_x_CmpYGeZero_s3(LOGICAL,113)@1
    Phase_correct_x_CmpYGeZero_s3_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s2_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s3(BITSELECT,117)@1
    Phase_correct_x_ShiftY_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s2_q(13 downto 3));

    -- Phase_correct_x_CmpYGeZero_s2(LOGICAL,100)@1
    Phase_correct_x_CmpYGeZero_s2_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s1_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s2(BITSELECT,104)@1
    Phase_correct_x_ShiftY_s2_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s1_q(13 downto 2));

    -- Phase_correct_x_Xout_s2(ADDSUB,105)@1
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

    -- Phase_correct_x_Xout_s3(ADDSUB,118)@1
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

    -- Phase_correct_x_ShiftX_s4(BITSELECT,129)@1
    Phase_correct_x_ShiftX_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s3_q(13 downto 4));

    -- Phase_correct_x_CmpYLtZero_s3(LOGICAL,110)@1
    Phase_correct_x_CmpYLtZero_s3_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s2_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s3(BITSELECT,116)@1
    Phase_correct_x_ShiftX_s3_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s2_q(13 downto 3));

    -- Phase_correct_x_Yout_s3(ADDSUB,119)@1
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

    -- Phase_correct_x_Yout_s4(ADDSUB,132)@1 + 1
    Phase_correct_x_Yout_s4_s <= Phase_correct_x_CmpYLtZero_s4_q;
    Phase_correct_x_Yout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s3_q(13)) & Phase_correct_x_Yout_s3_q));
    Phase_correct_x_Yout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_correct_x_ShiftX_s4_b(9)) & Phase_correct_x_ShiftX_s4_b));
    Phase_correct_x_Yout_s4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Yout_s4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Yout_s4_s = "1") THEN
                Phase_correct_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s4_a) + SIGNED(Phase_correct_x_Yout_s4_b));
            ELSE
                Phase_correct_x_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s4_a) - SIGNED(Phase_correct_x_Yout_s4_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s4_q <= Phase_correct_x_Yout_s4_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s5(LOGICAL,139)@2
    Phase_correct_x_CmpYGeZero_s5_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s4_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s5(BITSELECT,143)@2
    Phase_correct_x_ShiftY_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s4_q(13 downto 5));

    -- Phase_correct_x_CmpYGeZero_s4(LOGICAL,126)@1
    Phase_correct_x_CmpYGeZero_s4_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s3_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s4(BITSELECT,130)@1
    Phase_correct_x_ShiftY_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s3_q(13 downto 4));

    -- Phase_correct_x_Xout_s4(ADDSUB,131)@1 + 1
    Phase_correct_x_Xout_s4_s <= Phase_correct_x_CmpYGeZero_s4_q;
    Phase_correct_x_Xout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s3_q(13)) & Phase_correct_x_Xout_s3_q));
    Phase_correct_x_Xout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => Phase_correct_x_ShiftY_s4_b(9)) & Phase_correct_x_ShiftY_s4_b));
    Phase_correct_x_Xout_s4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Xout_s4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Xout_s4_s = "1") THEN
                Phase_correct_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s4_a) + SIGNED(Phase_correct_x_Xout_s4_b));
            ELSE
                Phase_correct_x_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s4_a) - SIGNED(Phase_correct_x_Xout_s4_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s4_q <= Phase_correct_x_Xout_s4_o(13 downto 0);

    -- Phase_correct_x_Xout_s5(ADDSUB,144)@2
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

    -- Phase_correct_x_ShiftX_s6(BITSELECT,155)@2
    Phase_correct_x_ShiftX_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s5_q(13 downto 6));

    -- Phase_correct_x_CmpYLtZero_s5(LOGICAL,136)@2
    Phase_correct_x_CmpYLtZero_s5_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s4_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s5(BITSELECT,142)@2
    Phase_correct_x_ShiftX_s5_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s4_q(13 downto 5));

    -- Phase_correct_x_Yout_s5(ADDSUB,145)@2
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

    -- Phase_correct_x_Yout_s6(ADDSUB,158)@2
    Phase_correct_x_Yout_s6_s <= Phase_correct_x_CmpYLtZero_s6_q;
    Phase_correct_x_Yout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Yout_s5_q(13)) & Phase_correct_x_Yout_s5_q));
    Phase_correct_x_Yout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_correct_x_ShiftX_s6_b(7)) & Phase_correct_x_ShiftX_s6_b));
    Phase_correct_x_Yout_s6_combproc: PROCESS (Phase_correct_x_Yout_s6_a, Phase_correct_x_Yout_s6_b, Phase_correct_x_Yout_s6_s)
    BEGIN
        IF (Phase_correct_x_Yout_s6_s = "1") THEN
            Phase_correct_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s6_a) + SIGNED(Phase_correct_x_Yout_s6_b));
        ELSE
            Phase_correct_x_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Yout_s6_a) - SIGNED(Phase_correct_x_Yout_s6_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Yout_s6_q <= Phase_correct_x_Yout_s6_o(13 downto 0);

    -- Phase_correct_x_CmpYGeZero_s7(LOGICAL,165)@2
    Phase_correct_x_CmpYGeZero_s7_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s6_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s7(BITSELECT,169)@2
    Phase_correct_x_ShiftY_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s6_q(13 downto 7));

    -- Phase_correct_x_CmpYGeZero_s6(LOGICAL,152)@2
    Phase_correct_x_CmpYGeZero_s6_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s5_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s6(BITSELECT,156)@2
    Phase_correct_x_ShiftY_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s5_q(13 downto 6));

    -- Phase_correct_x_Xout_s6(ADDSUB,157)@2
    Phase_correct_x_Xout_s6_s <= Phase_correct_x_CmpYGeZero_s6_q;
    Phase_correct_x_Xout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Xout_s5_q(13)) & Phase_correct_x_Xout_s5_q));
    Phase_correct_x_Xout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => Phase_correct_x_ShiftY_s6_b(7)) & Phase_correct_x_ShiftY_s6_b));
    Phase_correct_x_Xout_s6_combproc: PROCESS (Phase_correct_x_Xout_s6_a, Phase_correct_x_Xout_s6_b, Phase_correct_x_Xout_s6_s)
    BEGIN
        IF (Phase_correct_x_Xout_s6_s = "1") THEN
            Phase_correct_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s6_a) + SIGNED(Phase_correct_x_Xout_s6_b));
        ELSE
            Phase_correct_x_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Xout_s6_a) - SIGNED(Phase_correct_x_Xout_s6_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Xout_s6_q <= Phase_correct_x_Xout_s6_o(13 downto 0);

    -- Phase_correct_x_Xout_s7(ADDSUB,170)@2
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

    -- Phase_correct_x_ShiftX_s8(BITSELECT,181)@2
    Phase_correct_x_ShiftX_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s7_q(13 downto 8));

    -- Phase_correct_x_CmpYLtZero_s7(LOGICAL,162)@2
    Phase_correct_x_CmpYLtZero_s7_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s6_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s7(BITSELECT,168)@2
    Phase_correct_x_ShiftX_s7_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s6_q(13 downto 7));

    -- Phase_correct_x_Yout_s7(ADDSUB,171)@2
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

    -- Phase_correct_x_Yout_s8(ADDSUB,184)@2
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

    -- Phase_correct_x_CmpYGeZero_s9(LOGICAL,191)@2
    Phase_correct_x_CmpYGeZero_s9_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s8_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s9(BITSELECT,195)@2
    Phase_correct_x_ShiftY_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s8_q(13 downto 9));

    -- Phase_correct_x_CmpYGeZero_s8(LOGICAL,178)@2
    Phase_correct_x_CmpYGeZero_s8_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s7_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s8(BITSELECT,182)@2
    Phase_correct_x_ShiftY_s8_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s7_q(13 downto 8));

    -- Phase_correct_x_Xout_s8(ADDSUB,183)@2
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

    -- Phase_correct_x_Xout_s9(ADDSUB,196)@2
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

    -- Phase_correct_x_ShiftX_s10(BITSELECT,207)@2
    Phase_correct_x_ShiftX_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s9_q(13 downto 10));

    -- Phase_correct_x_CmpYLtZero_s9(LOGICAL,188)@2
    Phase_correct_x_CmpYLtZero_s9_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s8_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s9(BITSELECT,194)@2
    Phase_correct_x_ShiftX_s9_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s8_q(13 downto 9));

    -- Phase_correct_x_Yout_s9(ADDSUB,197)@2
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

    -- Phase_correct_x_Yout_s10(ADDSUB,210)@2
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

    -- Phase_correct_x_CmpYGeZero_s11(LOGICAL,217)@2
    Phase_correct_x_CmpYGeZero_s11_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s10_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s11(BITSELECT,221)@2
    Phase_correct_x_ShiftY_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s10_q(13 downto 11));

    -- Phase_correct_x_CmpYGeZero_s10(LOGICAL,204)@2
    Phase_correct_x_CmpYGeZero_s10_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s9_q(13 downto 13)));

    -- Phase_correct_x_ShiftY_s10(BITSELECT,208)@2
    Phase_correct_x_ShiftY_s10_b <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s9_q(13 downto 10));

    -- Phase_correct_x_Xout_s10(ADDSUB,209)@2
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

    -- Phase_correct_x_Xout_s11(ADDSUB,222)@2
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

    -- Phase_correct_x_ShiftX_s12(BITSELECT,233)@2
    Phase_correct_x_ShiftX_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s11_q(13 downto 12));

    -- Phase_correct_x_CmpYLtZero_s11(LOGICAL,214)@2
    Phase_correct_x_CmpYLtZero_s11_q <= STD_LOGIC_VECTOR(Phase_correct_x_Yout_s10_q(13 downto 13));

    -- Phase_correct_x_ShiftX_s11(BITSELECT,220)@2
    Phase_correct_x_ShiftX_s11_b <= STD_LOGIC_VECTOR(Phase_correct_x_Xout_s10_q(13 downto 11));

    -- Phase_correct_x_Yout_s11(ADDSUB,223)@2
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

    -- Phase_correct_x_Yout_s12(ADDSUB,236)@2
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

    -- Phase_correct_x_CmpYGeZero_s13(LOGICAL,243)@2 + 1
    Phase_correct_x_CmpYGeZero_s13_qi <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s12_q(13 downto 13)));
    Phase_correct_x_CmpYGeZero_s13_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_CmpYGeZero_s13_qi, xout => Phase_correct_x_CmpYGeZero_s13_q, clk => clk, aclr => areset );

    -- Phase_correct_x_CmpYGeZero_s12(LOGICAL,230)@2
    Phase_correct_x_CmpYGeZero_s12_q <= STD_LOGIC_VECTOR(not (Phase_correct_x_Yout_s11_q(13 downto 13)));

    -- Phase_correct_x_Pout_s0(ADDSUB,81)@1
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

    -- Phase_correct_x_Pout_s1(ADDSUB,94)@1
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

    -- Phase_correct_x_Pout_s2(ADDSUB,107)@1
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

    -- Phase_correct_x_Pout_s3(ADDSUB,120)@1
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

    -- Phase_correct_x_Pout_s4(ADDSUB,133)@1 + 1
    Phase_correct_x_Pout_s4_s <= Phase_correct_x_CmpYGeZero_s4_q;
    Phase_correct_x_Pout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s3_q(13)) & Phase_correct_x_Pout_s3_q));
    Phase_correct_x_Pout_s4_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s4_q(14 downto 0));
    Phase_correct_x_Pout_s4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Pout_s4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Pout_s4_s = "1") THEN
                Phase_correct_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s4_a) + SIGNED(Phase_correct_x_Pout_s4_b));
            ELSE
                Phase_correct_x_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s4_a) - SIGNED(Phase_correct_x_Pout_s4_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s4_q <= Phase_correct_x_Pout_s4_o(13 downto 0);

    -- Phase_correct_x_Pout_s5(ADDSUB,146)@2
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

    -- Phase_correct_x_Pout_s6(ADDSUB,159)@2
    Phase_correct_x_Pout_s6_s <= Phase_correct_x_CmpYGeZero_s6_q;
    Phase_correct_x_Pout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s5_q(13)) & Phase_correct_x_Pout_s5_q));
    Phase_correct_x_Pout_s6_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s6_q(14 downto 0));
    Phase_correct_x_Pout_s6_combproc: PROCESS (Phase_correct_x_Pout_s6_a, Phase_correct_x_Pout_s6_b, Phase_correct_x_Pout_s6_s)
    BEGIN
        IF (Phase_correct_x_Pout_s6_s = "1") THEN
            Phase_correct_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s6_a) + SIGNED(Phase_correct_x_Pout_s6_b));
        ELSE
            Phase_correct_x_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s6_a) - SIGNED(Phase_correct_x_Pout_s6_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s6_q <= Phase_correct_x_Pout_s6_o(13 downto 0);

    -- Phase_correct_x_Pout_s7(ADDSUB,172)@2
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

    -- Phase_correct_x_Pout_s8(ADDSUB,185)@2
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

    -- Phase_correct_x_Pout_s9(ADDSUB,198)@2
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

    -- Phase_correct_x_Pout_s10(ADDSUB,211)@2
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

    -- Phase_correct_x_Pout_s11(ADDSUB,224)@2
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

    -- Phase_correct_x_Pout_s12(ADDSUB,237)@2 + 1
    Phase_correct_x_Pout_s12_s <= Phase_correct_x_CmpYGeZero_s12_q;
    Phase_correct_x_Pout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s11_q(13)) & Phase_correct_x_Pout_s11_q));
    Phase_correct_x_Pout_s12_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s12_q(14 downto 0));
    Phase_correct_x_Pout_s12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Phase_correct_x_Pout_s12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Phase_correct_x_Pout_s12_s = "1") THEN
                Phase_correct_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s12_a) + SIGNED(Phase_correct_x_Pout_s12_b));
            ELSE
                Phase_correct_x_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s12_a) - SIGNED(Phase_correct_x_Pout_s12_b));
            END IF;
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s12_q <= Phase_correct_x_Pout_s12_o(13 downto 0);

    -- Phase_correct_x_Pout_s13(ADDSUB,250)@3
    Phase_correct_x_Pout_s13_s <= Phase_correct_x_CmpYGeZero_s13_q;
    Phase_correct_x_Pout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => Phase_correct_x_Pout_s12_q(13)) & Phase_correct_x_Pout_s12_q));
    Phase_correct_x_Pout_s13_b <= STD_LOGIC_VECTOR(Phase_correct_x_CnstAtan_s13_q(14 downto 0));
    Phase_correct_x_Pout_s13_combproc: PROCESS (Phase_correct_x_Pout_s13_a, Phase_correct_x_Pout_s13_b, Phase_correct_x_Pout_s13_s)
    BEGIN
        IF (Phase_correct_x_Pout_s13_s = "1") THEN
            Phase_correct_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s13_a) + SIGNED(Phase_correct_x_Pout_s13_b));
        ELSE
            Phase_correct_x_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(Phase_correct_x_Pout_s13_a) - SIGNED(Phase_correct_x_Pout_s13_b));
        END IF;
    END PROCESS;
    Phase_correct_x_Pout_s13_q <= Phase_correct_x_Pout_s13_o(13 downto 0);

    -- Phase_correct_x_XLtZero_00(LOGICAL,58)@2 + 1
    Phase_correct_x_XLtZero_00_qi <= STD_LOGIC_VECTOR(redist12_mp_txrx_Symbol_Recovery_Catch_I_for_sample_Mux_x_q_1_q(11 downto 11));
    Phase_correct_x_XLtZero_00_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Phase_correct_x_XLtZero_00_qi, xout => Phase_correct_x_XLtZero_00_q, clk => clk, aclr => areset );

    -- Phase_correct_x_SelPonX(MUX,256)@3
    Phase_correct_x_SelPonX_s <= Phase_correct_x_XLtZero_00_q;
    Phase_correct_x_SelPonX_combproc: PROCESS (Phase_correct_x_SelPonX_s, Phase_correct_x_Pout_s13_q, Phase_correct_x_LutSubP_q)
    BEGIN
        CASE (Phase_correct_x_SelPonX_s) IS
            WHEN "0" => Phase_correct_x_SelPonX_q <= STD_LOGIC_VECTOR((28 downto 14 => Phase_correct_x_Pout_s13_q(13)) & Phase_correct_x_Pout_s13_q);
            WHEN "1" => Phase_correct_x_SelPonX_q <= Phase_correct_x_LutSubP_q;
            WHEN OTHERS => Phase_correct_x_SelPonX_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Phase_correct_PostCast_cordicWireAngle_rnd_x_sel(BITSELECT,468)@3
    Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_in <= STD_LOGIC_VECTOR(Phase_correct_x_SelPonX_q(27 downto 0));
    Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b <= STD_LOGIC_VECTOR(Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_in(27 downto 0));

    -- Sub(SUB,49)@3
    Sub_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b(27)) & Phase_correct_PostCast_cordicWireAngle_rnd_x_sel_b));
    Sub_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b(27)) & Phase_detect_PostCast_cordicWireAngle_rnd_x_sel_b));
    Sub_o <= STD_LOGIC_VECTOR(SIGNED(Sub_a) - SIGNED(Sub_b));
    Sub_q <= Sub_o(28 downto 0);

    -- redist2_Sub_q_1(DELAY,542)
    redist2_Sub_q_1 : dspba_delay
    GENERIC MAP ( width => 29, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Sub_q, xout => redist2_Sub_q_1_q, clk => clk, aclr => areset );

    -- Phase_decision_thresh_2_x(CONSTANT,45)
    Phase_decision_thresh_2_x_q <= "100110111000";

    -- CmpGE2_PreShift_1(BITSHIFT,53)@3
    CmpGE2_PreShift_1_qint <= Phase_decision_thresh_2_x_q & "0000";
    CmpGE2_PreShift_1_q <= CmpGE2_PreShift_1_qint(15 downto 0);

    -- CmpGE2(COMPARE,33)@3
    CmpGE2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => Sub_q(28)) & Sub_q));
    CmpGE2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 16 => CmpGE2_PreShift_1_q(15)) & CmpGE2_PreShift_1_q));
    CmpGE2_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE2_a) - SIGNED(CmpGE2_b));
    CmpGE2_n(0) <= not (CmpGE2_o(30));

    -- Phase_decision_thresh_1_x(CONSTANT,44)
    Phase_decision_thresh_1_x_q <= "011001001000";

    -- CmpLT_PreShift_1(BITSHIFT,52)@3
    CmpLT_PreShift_1_qint <= Phase_decision_thresh_1_x_q & "0000";
    CmpLT_PreShift_1_q <= CmpLT_PreShift_1_qint(15 downto 0);

    -- CmpLT(COMPARE,36)@3
    CmpLT_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => Sub_q(28)) & Sub_q));
    CmpLT_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 16 => CmpLT_PreShift_1_q(15)) & CmpLT_PreShift_1_q));
    CmpLT_o <= STD_LOGIC_VECTOR(SIGNED(CmpLT_a) - SIGNED(CmpLT_b));
    CmpLT_c(0) <= CmpLT_o(30);

    -- And_rsrvd_fix(LOGICAL,26)@3
    And_rsrvd_fix_q <= CmpLT_c and CmpGE2_n;

    -- mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x(MUX,15)@3 + 1
    mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_s <= redist3_Not_rsrvd_fix_q_2_q;
    mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_s) IS
                WHEN "0" => mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q <= mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q;
                WHEN "1" => mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q <= And_rsrvd_fix_q;
                WHEN OTHERS => mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_ChannelIn_in_2_dc_3(DELAY,545)
    redist5_ChannelIn_in_2_dc_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_2_dc, xout => redist5_ChannelIn_in_2_dc_3_q, clk => clk, aclr => areset );

    -- redist4_ChannelIn_in_1_dv_3(DELAY,544)
    redist4_ChannelIn_in_1_dv_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_1_dv, xout => redist4_ChannelIn_in_1_dv_3_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,31)@4 + 1
    out_2_qv <= redist4_ChannelIn_in_1_dv_3_q;
    out_3_qc <= redist5_ChannelIn_in_2_dc_3_q;
    out_1_bits <= mp_txrx_Symbol_Recovery_Catch_bit_decision_Mux_x_q;
    out_4_phase <= redist2_Sub_q_1_q;
    out_5_trigger <= redist9_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q;
    out_6_sym_pwr <= mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q;

END normal;
