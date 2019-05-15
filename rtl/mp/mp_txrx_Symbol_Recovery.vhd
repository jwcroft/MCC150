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
-- VHDL created on Wed May 15 10:15:07 2019


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
        out_4_phase : out std_logic_vector(27 downto 0);  -- sfix28_en14
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
    signal mp_txrx_Symbol_Recovery_SRlatch_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_SRlatch_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal CmpGE_a : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_b : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_o : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal Threshold_q : STD_LOGIC_VECTOR (64 downto 0);
    signal Threshold1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal CmpGE_PreShift_0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal CmpGE_PreShift_0_qint : STD_LOGIC_VECTOR (33 downto 0);
    signal CORDIC_CnstZero_0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_XLtZero_00_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_XLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_XgteZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ZeroAddSubX_00_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_ZeroAddSubX_00_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_ZeroAddSubX_00_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_ZeroAddSubX_00_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ZeroAddSubX_00_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_YLtZero_00_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CnstAtan_s0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYGeZero_s0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftY_s0_in : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_ShiftY_s0_b : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Xout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal CORDIC_ShiftY_s1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal CORDIC_Xout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s2_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal CORDIC_ShiftY_s2_b : STD_LOGIC_VECTOR (11 downto 0);
    signal CORDIC_Xout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s3_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal CORDIC_ShiftY_s3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal CORDIC_Xout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s4_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal CORDIC_ShiftY_s4_b : STD_LOGIC_VECTOR (9 downto 0);
    signal CORDIC_Xout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s4_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s4_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s4_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s4_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s5_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal CORDIC_ShiftY_s5_b : STD_LOGIC_VECTOR (8 downto 0);
    signal CORDIC_Xout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s5_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s5_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s6_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal CORDIC_ShiftY_s6_b : STD_LOGIC_VECTOR (7 downto 0);
    signal CORDIC_Xout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s6_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s6_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s7_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal CORDIC_ShiftY_s7_b : STD_LOGIC_VECTOR (6 downto 0);
    signal CORDIC_Xout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s7_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s7_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s7_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s7_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s7_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s8_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal CORDIC_ShiftY_s8_b : STD_LOGIC_VECTOR (5 downto 0);
    signal CORDIC_Xout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s8_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s8_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s9_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal CORDIC_ShiftY_s9_b : STD_LOGIC_VECTOR (4 downto 0);
    signal CORDIC_Xout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s9_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s9_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s9_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s9_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s9_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s10_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal CORDIC_ShiftY_s10_b : STD_LOGIC_VECTOR (3 downto 0);
    signal CORDIC_Xout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s10_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s10_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s10_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s10_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s10_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s11_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal CORDIC_ShiftY_s11_b : STD_LOGIC_VECTOR (2 downto 0);
    signal CORDIC_Xout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Xout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Xout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Yout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s11_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s11_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s11_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s11_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s11_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s12_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYLtZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s12_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_ShiftX_s12_b : STD_LOGIC_VECTOR (1 downto 0);
    signal CORDIC_Yout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Yout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Yout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_Pout_s12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s12_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s12_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_CnstAtan_s13_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_CmpYGeZero_s13_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_CmpYGeZero_s13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s13_a : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s13_b : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s13_o : STD_LOGIC_VECTOR (14 downto 0);
    signal CORDIC_Pout_s13_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_Pout_s13_q : STD_LOGIC_VECTOR (13 downto 0);
    signal CORDIC_LutPlusMinus_q : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_LutSubP_a : STD_LOGIC_VECTOR (28 downto 0);
    signal CORDIC_LutSubP_b : STD_LOGIC_VECTOR (28 downto 0);
    signal CORDIC_LutSubP_o : STD_LOGIC_VECTOR (28 downto 0);
    signal CORDIC_LutSubP_q : STD_LOGIC_VECTOR (28 downto 0);
    signal CORDIC_SelPonX_s : STD_LOGIC_VECTOR (0 downto 0);
    signal CORDIC_SelPonX_q : STD_LOGIC_VECTOR (28 downto 0);
    signal CORDIC_PostCast_cordicWireAngle_rnd_sel_in : STD_LOGIC_VECTOR (27 downto 0);
    signal CORDIC_PostCast_cordicWireAngle_rnd_sel_b : STD_LOGIC_VECTOR (27 downto 0);
    signal muxopt_assign_id1_q_const_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist0_CORDIC_PostCast_cordicWireAngle_rnd_sel_b_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist1_CORDIC_CmpYGeZero_s11_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_CORDIC_CmpYGeZero_s10_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_CORDIC_CmpYGeZero_s9_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_CORDIC_CmpYGeZero_s8_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_CORDIC_CmpYGeZero_s4_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_CORDIC_CmpYGeZero_s3_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_CORDIC_CmpYGeZero_s2_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_CORDIC_CmpYGeZero_s1_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_CORDIC_CmpYGeZero_s0_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_CORDIC_YLtZero_00_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_ChannelIn_in_1_dv_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_ChannelIn_in_2_dc_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist16_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- mp_txrx_Symbol_Recovery_SRlatch_Not_x(LOGICAL,6)@1
    mp_txrx_Symbol_Recovery_SRlatch_Not_x_q <= not (GND_q);

    -- Threshold(CONSTANT,29)
    Threshold_q <= "00000000000000000000000000000001000100101100000000000000000000000";

    -- CmpGE_PreShift_0(BITSHIFT,31)@1
    CmpGE_PreShift_0_qint <= in_3_pow_in & "0000000000000000000000";
    CmpGE_PreShift_0_q <= CmpGE_PreShift_0_qint(33 downto 0);

    -- CmpGE(COMPARE,21)@1
    CmpGE_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 34 => CmpGE_PreShift_0_q(33)) & CmpGE_PreShift_0_q));
    CmpGE_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 65 => Threshold_q(64)) & Threshold_q));
    CmpGE_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE_a) - SIGNED(CmpGE_b));
    CmpGE_n(0) <= not (CmpGE_o(66));

    -- redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1(DELAY,293)
    redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_SRlatch_And_x_q, xout => redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_SRlatch_Or_x(LOGICAL,7)@1
    mp_txrx_Symbol_Recovery_SRlatch_Or_x_q <= redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q or CmpGE_n;

    -- mp_txrx_Symbol_Recovery_SRlatch_And_x(LOGICAL,5)@1
    mp_txrx_Symbol_Recovery_SRlatch_And_x_q <= mp_txrx_Symbol_Recovery_SRlatch_Or_x_q and mp_txrx_Symbol_Recovery_SRlatch_Not_x_q;

    -- Sequence_rsrvd_fix(SEQUENCE,28)@0 + 1
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

    -- Not_rsrvd_fix(LOGICAL,27)@1
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- mp_txrx_Symbol_Recovery_latch_0L_Mux_x(MUX,10)@1 + 1
    mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s <= Not_rsrvd_fix_q;
    mp_txrx_Symbol_Recovery_latch_0L_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (mp_txrx_Symbol_Recovery_latch_0L_Mux_x_s) IS
                WHEN "0" => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q;
                WHEN "1" => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= in_3_pow_in;
                WHEN OTHERS => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2(DELAY,291)
    redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q, xout => redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2_q, clk => clk, aclr => areset );

    -- redist16_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_3(DELAY,292)
    redist16_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_3 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2_q, xout => redist16_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_3_q, clk => clk, aclr => areset );

    -- redist18_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4(DELAY,294)
    redist18_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist17_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_1_q, xout => redist18_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q, clk => clk, aclr => areset );

    -- redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1(DELAY,289)
    redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q, xout => redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_latch_0L2_Mux_x(MUX,14)@1
    mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_s <= Not_rsrvd_fix_q;
    mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_combproc: PROCESS (mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_s, redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1_q, in_5_Q)
    BEGIN
        CASE (mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_s) IS
            WHEN "0" => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q <= redist13_mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q_1_q;
            WHEN "1" => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q <= in_5_Q;
            WHEN OTHERS => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- CORDIC_YLtZero_00(LOGICAL,40)@1
    CORDIC_YLtZero_00_q <= STD_LOGIC_VECTOR(mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q(11 downto 11));

    -- redist10_CORDIC_YLtZero_00_q_2(DELAY,286)
    redist10_CORDIC_YLtZero_00_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_YLtZero_00_q, xout => redist10_CORDIC_YLtZero_00_q_2_q, clk => clk, aclr => areset );

    -- CORDIC_LutPlusMinus(LOOKUP,230)@3
    CORDIC_LutPlusMinus_combproc: PROCESS (redist10_CORDIC_YLtZero_00_q_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist10_CORDIC_YLtZero_00_q_2_q) IS
            WHEN "0" => CORDIC_LutPlusMinus_q <= "0000000000001100100100010000";
            WHEN "1" => CORDIC_LutPlusMinus_q <= "1111111111110011011011110000";
            WHEN OTHERS => -- unreachable
                           CORDIC_LutPlusMinus_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- CORDIC_LutSubP(SUB,231)@3
    CORDIC_LutSubP_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => CORDIC_LutPlusMinus_q(27)) & CORDIC_LutPlusMinus_q));
    CORDIC_LutSubP_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 14 => CORDIC_Pout_s13_q(13)) & CORDIC_Pout_s13_q));
    CORDIC_LutSubP_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_LutSubP_a) - SIGNED(CORDIC_LutSubP_b));
    CORDIC_LutSubP_q <= CORDIC_LutSubP_o(28 downto 0);

    -- CORDIC_CmpYLtZero_s12(LOGICAL,205)@2
    CORDIC_CmpYLtZero_s12_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s11_q(13 downto 13));

    -- CORDIC_CmpYLtZero_s10(LOGICAL,179)@2
    CORDIC_CmpYLtZero_s10_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s9_q(13 downto 13));

    -- CORDIC_CmpYLtZero_s8(LOGICAL,153)@2
    CORDIC_CmpYLtZero_s8_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s7_q(13 downto 13));

    -- CORDIC_CmpYLtZero_s6(LOGICAL,127)@2
    CORDIC_CmpYLtZero_s6_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s5_q(13 downto 13));

    -- CORDIC_CmpYLtZero_s4(LOGICAL,101)@1
    CORDIC_CmpYLtZero_s4_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s3_q(13 downto 13));

    -- CORDIC_CmpYLtZero_s2(LOGICAL,75)@1
    CORDIC_CmpYLtZero_s2_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s1_q(13 downto 13));

    -- CORDIC_XgteZero_00(LOGICAL,37)@1
    CORDIC_XgteZero_00_q <= STD_LOGIC_VECTOR(not (mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q(11 downto 11)));

    -- redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1(DELAY,290)
    redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q, xout => redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- mp_txrx_Symbol_Recovery_latch_0L1_Mux_x(MUX,12)@1
    mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_s <= Not_rsrvd_fix_q;
    mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_combproc: PROCESS (mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_s, redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1_q, in_4_I)
    BEGIN
        CASE (mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_s) IS
            WHEN "0" => mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q <= redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1_q;
            WHEN "1" => mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q <= in_4_I;
            WHEN OTHERS => mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- CORDIC_CnstZero_0(CONSTANT,32)
    CORDIC_CnstZero_0_q <= "00000000000000";

    -- CORDIC_ZeroAddSubX_00(ADDSUB,38)@1
    CORDIC_ZeroAddSubX_00_s <= CORDIC_XgteZero_00_q;
    CORDIC_ZeroAddSubX_00_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_CnstZero_0_q(13)) & CORDIC_CnstZero_0_q));
    CORDIC_ZeroAddSubX_00_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q));
    CORDIC_ZeroAddSubX_00_combproc: PROCESS (CORDIC_ZeroAddSubX_00_a, CORDIC_ZeroAddSubX_00_b, CORDIC_ZeroAddSubX_00_s)
    BEGIN
        IF (CORDIC_ZeroAddSubX_00_s = "1") THEN
            CORDIC_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_ZeroAddSubX_00_a) + SIGNED(CORDIC_ZeroAddSubX_00_b));
        ELSE
            CORDIC_ZeroAddSubX_00_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_ZeroAddSubX_00_a) - SIGNED(CORDIC_ZeroAddSubX_00_b));
        END IF;
    END PROCESS;
    CORDIC_ZeroAddSubX_00_q <= CORDIC_ZeroAddSubX_00_o(13 downto 0);

    -- CORDIC_Yout_s0(ADDSUB,58)@1
    CORDIC_Yout_s0_s <= CORDIC_YLtZero_00_q;
    CORDIC_Yout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q));
    CORDIC_Yout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_ZeroAddSubX_00_q(13)) & CORDIC_ZeroAddSubX_00_q));
    CORDIC_Yout_s0_combproc: PROCESS (CORDIC_Yout_s0_a, CORDIC_Yout_s0_b, CORDIC_Yout_s0_s)
    BEGIN
        IF (CORDIC_Yout_s0_s = "1") THEN
            CORDIC_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s0_a) + SIGNED(CORDIC_Yout_s0_b));
        ELSE
            CORDIC_Yout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s0_a) - SIGNED(CORDIC_Yout_s0_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s0_q <= CORDIC_Yout_s0_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s1(LOGICAL,65)@1
    CORDIC_CmpYGeZero_s1_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s0_q(13 downto 13)));

    -- CORDIC_ShiftY_s1(BITSELECT,69)@1
    CORDIC_ShiftY_s1_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s0_q(13 downto 1));

    -- CORDIC_CmpYGeZero_s0(LOGICAL,52)@1
    CORDIC_CmpYGeZero_s0_q <= STD_LOGIC_VECTOR(not (mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q(11 downto 11)));

    -- CORDIC_ShiftY_s0(BITSELECT,56)@1
    CORDIC_ShiftY_s0_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q(11)) & mp_txrx_Symbol_Recovery_latch_0L2_Mux_x_q));
    CORDIC_ShiftY_s0_b <= STD_LOGIC_VECTOR(CORDIC_ShiftY_s0_in(13 downto 0));

    -- CORDIC_Xout_s0(ADDSUB,57)@1
    CORDIC_Xout_s0_s <= CORDIC_CmpYGeZero_s0_q;
    CORDIC_Xout_s0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_ZeroAddSubX_00_q(13)) & CORDIC_ZeroAddSubX_00_q));
    CORDIC_Xout_s0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_ShiftY_s0_b(13)) & CORDIC_ShiftY_s0_b));
    CORDIC_Xout_s0_combproc: PROCESS (CORDIC_Xout_s0_a, CORDIC_Xout_s0_b, CORDIC_Xout_s0_s)
    BEGIN
        IF (CORDIC_Xout_s0_s = "1") THEN
            CORDIC_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s0_a) + SIGNED(CORDIC_Xout_s0_b));
        ELSE
            CORDIC_Xout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s0_a) - SIGNED(CORDIC_Xout_s0_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s0_q <= CORDIC_Xout_s0_o(13 downto 0);

    -- CORDIC_Xout_s1(ADDSUB,70)@1
    CORDIC_Xout_s1_s <= CORDIC_CmpYGeZero_s1_q;
    CORDIC_Xout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s0_q(13)) & CORDIC_Xout_s0_q));
    CORDIC_Xout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => CORDIC_ShiftY_s1_b(12)) & CORDIC_ShiftY_s1_b));
    CORDIC_Xout_s1_combproc: PROCESS (CORDIC_Xout_s1_a, CORDIC_Xout_s1_b, CORDIC_Xout_s1_s)
    BEGIN
        IF (CORDIC_Xout_s1_s = "1") THEN
            CORDIC_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s1_a) + SIGNED(CORDIC_Xout_s1_b));
        ELSE
            CORDIC_Xout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s1_a) - SIGNED(CORDIC_Xout_s1_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s1_q <= CORDIC_Xout_s1_o(13 downto 0);

    -- CORDIC_ShiftX_s2(BITSELECT,81)@1
    CORDIC_ShiftX_s2_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s1_q(13 downto 2));

    -- CORDIC_CmpYLtZero_s1(LOGICAL,62)@1
    CORDIC_CmpYLtZero_s1_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s0_q(13 downto 13));

    -- CORDIC_ShiftX_s1(BITSELECT,68)@1
    CORDIC_ShiftX_s1_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s0_q(13 downto 1));

    -- CORDIC_Yout_s1(ADDSUB,71)@1
    CORDIC_Yout_s1_s <= CORDIC_CmpYLtZero_s1_q;
    CORDIC_Yout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s0_q(13)) & CORDIC_Yout_s0_q));
    CORDIC_Yout_s1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => CORDIC_ShiftX_s1_b(12)) & CORDIC_ShiftX_s1_b));
    CORDIC_Yout_s1_combproc: PROCESS (CORDIC_Yout_s1_a, CORDIC_Yout_s1_b, CORDIC_Yout_s1_s)
    BEGIN
        IF (CORDIC_Yout_s1_s = "1") THEN
            CORDIC_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s1_a) + SIGNED(CORDIC_Yout_s1_b));
        ELSE
            CORDIC_Yout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s1_a) - SIGNED(CORDIC_Yout_s1_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s1_q <= CORDIC_Yout_s1_o(13 downto 0);

    -- CORDIC_Yout_s2(ADDSUB,84)@1
    CORDIC_Yout_s2_s <= CORDIC_CmpYLtZero_s2_q;
    CORDIC_Yout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s1_q(13)) & CORDIC_Yout_s1_q));
    CORDIC_Yout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => CORDIC_ShiftX_s2_b(11)) & CORDIC_ShiftX_s2_b));
    CORDIC_Yout_s2_combproc: PROCESS (CORDIC_Yout_s2_a, CORDIC_Yout_s2_b, CORDIC_Yout_s2_s)
    BEGIN
        IF (CORDIC_Yout_s2_s = "1") THEN
            CORDIC_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s2_a) + SIGNED(CORDIC_Yout_s2_b));
        ELSE
            CORDIC_Yout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s2_a) - SIGNED(CORDIC_Yout_s2_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s2_q <= CORDIC_Yout_s2_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s3(LOGICAL,91)@1
    CORDIC_CmpYGeZero_s3_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s2_q(13 downto 13)));

    -- CORDIC_ShiftY_s3(BITSELECT,95)@1
    CORDIC_ShiftY_s3_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s2_q(13 downto 3));

    -- CORDIC_CmpYGeZero_s2(LOGICAL,78)@1
    CORDIC_CmpYGeZero_s2_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s1_q(13 downto 13)));

    -- CORDIC_ShiftY_s2(BITSELECT,82)@1
    CORDIC_ShiftY_s2_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s1_q(13 downto 2));

    -- CORDIC_Xout_s2(ADDSUB,83)@1
    CORDIC_Xout_s2_s <= CORDIC_CmpYGeZero_s2_q;
    CORDIC_Xout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s1_q(13)) & CORDIC_Xout_s1_q));
    CORDIC_Xout_s2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => CORDIC_ShiftY_s2_b(11)) & CORDIC_ShiftY_s2_b));
    CORDIC_Xout_s2_combproc: PROCESS (CORDIC_Xout_s2_a, CORDIC_Xout_s2_b, CORDIC_Xout_s2_s)
    BEGIN
        IF (CORDIC_Xout_s2_s = "1") THEN
            CORDIC_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s2_a) + SIGNED(CORDIC_Xout_s2_b));
        ELSE
            CORDIC_Xout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s2_a) - SIGNED(CORDIC_Xout_s2_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s2_q <= CORDIC_Xout_s2_o(13 downto 0);

    -- CORDIC_Xout_s3(ADDSUB,96)@1
    CORDIC_Xout_s3_s <= CORDIC_CmpYGeZero_s3_q;
    CORDIC_Xout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s2_q(13)) & CORDIC_Xout_s2_q));
    CORDIC_Xout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => CORDIC_ShiftY_s3_b(10)) & CORDIC_ShiftY_s3_b));
    CORDIC_Xout_s3_combproc: PROCESS (CORDIC_Xout_s3_a, CORDIC_Xout_s3_b, CORDIC_Xout_s3_s)
    BEGIN
        IF (CORDIC_Xout_s3_s = "1") THEN
            CORDIC_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s3_a) + SIGNED(CORDIC_Xout_s3_b));
        ELSE
            CORDIC_Xout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s3_a) - SIGNED(CORDIC_Xout_s3_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s3_q <= CORDIC_Xout_s3_o(13 downto 0);

    -- CORDIC_ShiftX_s4(BITSELECT,107)@1
    CORDIC_ShiftX_s4_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s3_q(13 downto 4));

    -- CORDIC_CmpYLtZero_s3(LOGICAL,88)@1
    CORDIC_CmpYLtZero_s3_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s2_q(13 downto 13));

    -- CORDIC_ShiftX_s3(BITSELECT,94)@1
    CORDIC_ShiftX_s3_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s2_q(13 downto 3));

    -- CORDIC_Yout_s3(ADDSUB,97)@1
    CORDIC_Yout_s3_s <= CORDIC_CmpYLtZero_s3_q;
    CORDIC_Yout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s2_q(13)) & CORDIC_Yout_s2_q));
    CORDIC_Yout_s3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => CORDIC_ShiftX_s3_b(10)) & CORDIC_ShiftX_s3_b));
    CORDIC_Yout_s3_combproc: PROCESS (CORDIC_Yout_s3_a, CORDIC_Yout_s3_b, CORDIC_Yout_s3_s)
    BEGIN
        IF (CORDIC_Yout_s3_s = "1") THEN
            CORDIC_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s3_a) + SIGNED(CORDIC_Yout_s3_b));
        ELSE
            CORDIC_Yout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s3_a) - SIGNED(CORDIC_Yout_s3_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s3_q <= CORDIC_Yout_s3_o(13 downto 0);

    -- CORDIC_Yout_s4(ADDSUB,110)@1 + 1
    CORDIC_Yout_s4_s <= CORDIC_CmpYLtZero_s4_q;
    CORDIC_Yout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s3_q(13)) & CORDIC_Yout_s3_q));
    CORDIC_Yout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => CORDIC_ShiftX_s4_b(9)) & CORDIC_ShiftX_s4_b));
    CORDIC_Yout_s4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            CORDIC_Yout_s4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (CORDIC_Yout_s4_s = "1") THEN
                CORDIC_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s4_a) + SIGNED(CORDIC_Yout_s4_b));
            ELSE
                CORDIC_Yout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s4_a) - SIGNED(CORDIC_Yout_s4_b));
            END IF;
        END IF;
    END PROCESS;
    CORDIC_Yout_s4_q <= CORDIC_Yout_s4_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s5(LOGICAL,117)@2
    CORDIC_CmpYGeZero_s5_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s4_q(13 downto 13)));

    -- CORDIC_ShiftY_s5(BITSELECT,121)@2
    CORDIC_ShiftY_s5_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s4_q(13 downto 5));

    -- CORDIC_CmpYGeZero_s4(LOGICAL,104)@1
    CORDIC_CmpYGeZero_s4_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s3_q(13 downto 13)));

    -- CORDIC_ShiftY_s4(BITSELECT,108)@1
    CORDIC_ShiftY_s4_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s3_q(13 downto 4));

    -- CORDIC_Xout_s4(ADDSUB,109)@1 + 1
    CORDIC_Xout_s4_s <= CORDIC_CmpYGeZero_s4_q;
    CORDIC_Xout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s3_q(13)) & CORDIC_Xout_s3_q));
    CORDIC_Xout_s4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 10 => CORDIC_ShiftY_s4_b(9)) & CORDIC_ShiftY_s4_b));
    CORDIC_Xout_s4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            CORDIC_Xout_s4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (CORDIC_Xout_s4_s = "1") THEN
                CORDIC_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s4_a) + SIGNED(CORDIC_Xout_s4_b));
            ELSE
                CORDIC_Xout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s4_a) - SIGNED(CORDIC_Xout_s4_b));
            END IF;
        END IF;
    END PROCESS;
    CORDIC_Xout_s4_q <= CORDIC_Xout_s4_o(13 downto 0);

    -- CORDIC_Xout_s5(ADDSUB,122)@2
    CORDIC_Xout_s5_s <= CORDIC_CmpYGeZero_s5_q;
    CORDIC_Xout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s4_q(13)) & CORDIC_Xout_s4_q));
    CORDIC_Xout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => CORDIC_ShiftY_s5_b(8)) & CORDIC_ShiftY_s5_b));
    CORDIC_Xout_s5_combproc: PROCESS (CORDIC_Xout_s5_a, CORDIC_Xout_s5_b, CORDIC_Xout_s5_s)
    BEGIN
        IF (CORDIC_Xout_s5_s = "1") THEN
            CORDIC_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s5_a) + SIGNED(CORDIC_Xout_s5_b));
        ELSE
            CORDIC_Xout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s5_a) - SIGNED(CORDIC_Xout_s5_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s5_q <= CORDIC_Xout_s5_o(13 downto 0);

    -- CORDIC_ShiftX_s6(BITSELECT,133)@2
    CORDIC_ShiftX_s6_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s5_q(13 downto 6));

    -- CORDIC_CmpYLtZero_s5(LOGICAL,114)@2
    CORDIC_CmpYLtZero_s5_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s4_q(13 downto 13));

    -- CORDIC_ShiftX_s5(BITSELECT,120)@2
    CORDIC_ShiftX_s5_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s4_q(13 downto 5));

    -- CORDIC_Yout_s5(ADDSUB,123)@2
    CORDIC_Yout_s5_s <= CORDIC_CmpYLtZero_s5_q;
    CORDIC_Yout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s4_q(13)) & CORDIC_Yout_s4_q));
    CORDIC_Yout_s5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 9 => CORDIC_ShiftX_s5_b(8)) & CORDIC_ShiftX_s5_b));
    CORDIC_Yout_s5_combproc: PROCESS (CORDIC_Yout_s5_a, CORDIC_Yout_s5_b, CORDIC_Yout_s5_s)
    BEGIN
        IF (CORDIC_Yout_s5_s = "1") THEN
            CORDIC_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s5_a) + SIGNED(CORDIC_Yout_s5_b));
        ELSE
            CORDIC_Yout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s5_a) - SIGNED(CORDIC_Yout_s5_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s5_q <= CORDIC_Yout_s5_o(13 downto 0);

    -- CORDIC_Yout_s6(ADDSUB,136)@2
    CORDIC_Yout_s6_s <= CORDIC_CmpYLtZero_s6_q;
    CORDIC_Yout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s5_q(13)) & CORDIC_Yout_s5_q));
    CORDIC_Yout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => CORDIC_ShiftX_s6_b(7)) & CORDIC_ShiftX_s6_b));
    CORDIC_Yout_s6_combproc: PROCESS (CORDIC_Yout_s6_a, CORDIC_Yout_s6_b, CORDIC_Yout_s6_s)
    BEGIN
        IF (CORDIC_Yout_s6_s = "1") THEN
            CORDIC_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s6_a) + SIGNED(CORDIC_Yout_s6_b));
        ELSE
            CORDIC_Yout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s6_a) - SIGNED(CORDIC_Yout_s6_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s6_q <= CORDIC_Yout_s6_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s7(LOGICAL,143)@2
    CORDIC_CmpYGeZero_s7_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s6_q(13 downto 13)));

    -- CORDIC_ShiftY_s7(BITSELECT,147)@2
    CORDIC_ShiftY_s7_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s6_q(13 downto 7));

    -- CORDIC_CmpYGeZero_s6(LOGICAL,130)@2
    CORDIC_CmpYGeZero_s6_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s5_q(13 downto 13)));

    -- CORDIC_ShiftY_s6(BITSELECT,134)@2
    CORDIC_ShiftY_s6_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s5_q(13 downto 6));

    -- CORDIC_Xout_s6(ADDSUB,135)@2
    CORDIC_Xout_s6_s <= CORDIC_CmpYGeZero_s6_q;
    CORDIC_Xout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s5_q(13)) & CORDIC_Xout_s5_q));
    CORDIC_Xout_s6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 8 => CORDIC_ShiftY_s6_b(7)) & CORDIC_ShiftY_s6_b));
    CORDIC_Xout_s6_combproc: PROCESS (CORDIC_Xout_s6_a, CORDIC_Xout_s6_b, CORDIC_Xout_s6_s)
    BEGIN
        IF (CORDIC_Xout_s6_s = "1") THEN
            CORDIC_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s6_a) + SIGNED(CORDIC_Xout_s6_b));
        ELSE
            CORDIC_Xout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s6_a) - SIGNED(CORDIC_Xout_s6_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s6_q <= CORDIC_Xout_s6_o(13 downto 0);

    -- CORDIC_Xout_s7(ADDSUB,148)@2
    CORDIC_Xout_s7_s <= CORDIC_CmpYGeZero_s7_q;
    CORDIC_Xout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s6_q(13)) & CORDIC_Xout_s6_q));
    CORDIC_Xout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => CORDIC_ShiftY_s7_b(6)) & CORDIC_ShiftY_s7_b));
    CORDIC_Xout_s7_combproc: PROCESS (CORDIC_Xout_s7_a, CORDIC_Xout_s7_b, CORDIC_Xout_s7_s)
    BEGIN
        IF (CORDIC_Xout_s7_s = "1") THEN
            CORDIC_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s7_a) + SIGNED(CORDIC_Xout_s7_b));
        ELSE
            CORDIC_Xout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s7_a) - SIGNED(CORDIC_Xout_s7_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s7_q <= CORDIC_Xout_s7_o(13 downto 0);

    -- CORDIC_ShiftX_s8(BITSELECT,159)@2
    CORDIC_ShiftX_s8_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s7_q(13 downto 8));

    -- CORDIC_CmpYLtZero_s7(LOGICAL,140)@2
    CORDIC_CmpYLtZero_s7_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s6_q(13 downto 13));

    -- CORDIC_ShiftX_s7(BITSELECT,146)@2
    CORDIC_ShiftX_s7_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s6_q(13 downto 7));

    -- CORDIC_Yout_s7(ADDSUB,149)@2
    CORDIC_Yout_s7_s <= CORDIC_CmpYLtZero_s7_q;
    CORDIC_Yout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s6_q(13)) & CORDIC_Yout_s6_q));
    CORDIC_Yout_s7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 7 => CORDIC_ShiftX_s7_b(6)) & CORDIC_ShiftX_s7_b));
    CORDIC_Yout_s7_combproc: PROCESS (CORDIC_Yout_s7_a, CORDIC_Yout_s7_b, CORDIC_Yout_s7_s)
    BEGIN
        IF (CORDIC_Yout_s7_s = "1") THEN
            CORDIC_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s7_a) + SIGNED(CORDIC_Yout_s7_b));
        ELSE
            CORDIC_Yout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s7_a) - SIGNED(CORDIC_Yout_s7_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s7_q <= CORDIC_Yout_s7_o(13 downto 0);

    -- CORDIC_Yout_s8(ADDSUB,162)@2
    CORDIC_Yout_s8_s <= CORDIC_CmpYLtZero_s8_q;
    CORDIC_Yout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s7_q(13)) & CORDIC_Yout_s7_q));
    CORDIC_Yout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => CORDIC_ShiftX_s8_b(5)) & CORDIC_ShiftX_s8_b));
    CORDIC_Yout_s8_combproc: PROCESS (CORDIC_Yout_s8_a, CORDIC_Yout_s8_b, CORDIC_Yout_s8_s)
    BEGIN
        IF (CORDIC_Yout_s8_s = "1") THEN
            CORDIC_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s8_a) + SIGNED(CORDIC_Yout_s8_b));
        ELSE
            CORDIC_Yout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s8_a) - SIGNED(CORDIC_Yout_s8_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s8_q <= CORDIC_Yout_s8_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s9(LOGICAL,169)@2
    CORDIC_CmpYGeZero_s9_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s8_q(13 downto 13)));

    -- CORDIC_ShiftY_s9(BITSELECT,173)@2
    CORDIC_ShiftY_s9_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s8_q(13 downto 9));

    -- CORDIC_CmpYGeZero_s8(LOGICAL,156)@2
    CORDIC_CmpYGeZero_s8_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s7_q(13 downto 13)));

    -- CORDIC_ShiftY_s8(BITSELECT,160)@2
    CORDIC_ShiftY_s8_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s7_q(13 downto 8));

    -- CORDIC_Xout_s8(ADDSUB,161)@2
    CORDIC_Xout_s8_s <= CORDIC_CmpYGeZero_s8_q;
    CORDIC_Xout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s7_q(13)) & CORDIC_Xout_s7_q));
    CORDIC_Xout_s8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 6 => CORDIC_ShiftY_s8_b(5)) & CORDIC_ShiftY_s8_b));
    CORDIC_Xout_s8_combproc: PROCESS (CORDIC_Xout_s8_a, CORDIC_Xout_s8_b, CORDIC_Xout_s8_s)
    BEGIN
        IF (CORDIC_Xout_s8_s = "1") THEN
            CORDIC_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s8_a) + SIGNED(CORDIC_Xout_s8_b));
        ELSE
            CORDIC_Xout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s8_a) - SIGNED(CORDIC_Xout_s8_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s8_q <= CORDIC_Xout_s8_o(13 downto 0);

    -- CORDIC_Xout_s9(ADDSUB,174)@2
    CORDIC_Xout_s9_s <= CORDIC_CmpYGeZero_s9_q;
    CORDIC_Xout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s8_q(13)) & CORDIC_Xout_s8_q));
    CORDIC_Xout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => CORDIC_ShiftY_s9_b(4)) & CORDIC_ShiftY_s9_b));
    CORDIC_Xout_s9_combproc: PROCESS (CORDIC_Xout_s9_a, CORDIC_Xout_s9_b, CORDIC_Xout_s9_s)
    BEGIN
        IF (CORDIC_Xout_s9_s = "1") THEN
            CORDIC_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s9_a) + SIGNED(CORDIC_Xout_s9_b));
        ELSE
            CORDIC_Xout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s9_a) - SIGNED(CORDIC_Xout_s9_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s9_q <= CORDIC_Xout_s9_o(13 downto 0);

    -- CORDIC_ShiftX_s10(BITSELECT,185)@2
    CORDIC_ShiftX_s10_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s9_q(13 downto 10));

    -- CORDIC_CmpYLtZero_s9(LOGICAL,166)@2
    CORDIC_CmpYLtZero_s9_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s8_q(13 downto 13));

    -- CORDIC_ShiftX_s9(BITSELECT,172)@2
    CORDIC_ShiftX_s9_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s8_q(13 downto 9));

    -- CORDIC_Yout_s9(ADDSUB,175)@2
    CORDIC_Yout_s9_s <= CORDIC_CmpYLtZero_s9_q;
    CORDIC_Yout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s8_q(13)) & CORDIC_Yout_s8_q));
    CORDIC_Yout_s9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 5 => CORDIC_ShiftX_s9_b(4)) & CORDIC_ShiftX_s9_b));
    CORDIC_Yout_s9_combproc: PROCESS (CORDIC_Yout_s9_a, CORDIC_Yout_s9_b, CORDIC_Yout_s9_s)
    BEGIN
        IF (CORDIC_Yout_s9_s = "1") THEN
            CORDIC_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s9_a) + SIGNED(CORDIC_Yout_s9_b));
        ELSE
            CORDIC_Yout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s9_a) - SIGNED(CORDIC_Yout_s9_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s9_q <= CORDIC_Yout_s9_o(13 downto 0);

    -- CORDIC_Yout_s10(ADDSUB,188)@2
    CORDIC_Yout_s10_s <= CORDIC_CmpYLtZero_s10_q;
    CORDIC_Yout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s9_q(13)) & CORDIC_Yout_s9_q));
    CORDIC_Yout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => CORDIC_ShiftX_s10_b(3)) & CORDIC_ShiftX_s10_b));
    CORDIC_Yout_s10_combproc: PROCESS (CORDIC_Yout_s10_a, CORDIC_Yout_s10_b, CORDIC_Yout_s10_s)
    BEGIN
        IF (CORDIC_Yout_s10_s = "1") THEN
            CORDIC_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s10_a) + SIGNED(CORDIC_Yout_s10_b));
        ELSE
            CORDIC_Yout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s10_a) - SIGNED(CORDIC_Yout_s10_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s10_q <= CORDIC_Yout_s10_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s11(LOGICAL,195)@2
    CORDIC_CmpYGeZero_s11_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s10_q(13 downto 13)));

    -- CORDIC_ShiftY_s11(BITSELECT,199)@2
    CORDIC_ShiftY_s11_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s10_q(13 downto 11));

    -- CORDIC_CmpYGeZero_s10(LOGICAL,182)@2
    CORDIC_CmpYGeZero_s10_q <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s9_q(13 downto 13)));

    -- CORDIC_ShiftY_s10(BITSELECT,186)@2
    CORDIC_ShiftY_s10_b <= STD_LOGIC_VECTOR(CORDIC_Yout_s9_q(13 downto 10));

    -- CORDIC_Xout_s10(ADDSUB,187)@2
    CORDIC_Xout_s10_s <= CORDIC_CmpYGeZero_s10_q;
    CORDIC_Xout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s9_q(13)) & CORDIC_Xout_s9_q));
    CORDIC_Xout_s10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 4 => CORDIC_ShiftY_s10_b(3)) & CORDIC_ShiftY_s10_b));
    CORDIC_Xout_s10_combproc: PROCESS (CORDIC_Xout_s10_a, CORDIC_Xout_s10_b, CORDIC_Xout_s10_s)
    BEGIN
        IF (CORDIC_Xout_s10_s = "1") THEN
            CORDIC_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s10_a) + SIGNED(CORDIC_Xout_s10_b));
        ELSE
            CORDIC_Xout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s10_a) - SIGNED(CORDIC_Xout_s10_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s10_q <= CORDIC_Xout_s10_o(13 downto 0);

    -- CORDIC_Xout_s11(ADDSUB,200)@2
    CORDIC_Xout_s11_s <= CORDIC_CmpYGeZero_s11_q;
    CORDIC_Xout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Xout_s10_q(13)) & CORDIC_Xout_s10_q));
    CORDIC_Xout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => CORDIC_ShiftY_s11_b(2)) & CORDIC_ShiftY_s11_b));
    CORDIC_Xout_s11_combproc: PROCESS (CORDIC_Xout_s11_a, CORDIC_Xout_s11_b, CORDIC_Xout_s11_s)
    BEGIN
        IF (CORDIC_Xout_s11_s = "1") THEN
            CORDIC_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s11_a) + SIGNED(CORDIC_Xout_s11_b));
        ELSE
            CORDIC_Xout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Xout_s11_a) - SIGNED(CORDIC_Xout_s11_b));
        END IF;
    END PROCESS;
    CORDIC_Xout_s11_q <= CORDIC_Xout_s11_o(13 downto 0);

    -- CORDIC_ShiftX_s12(BITSELECT,211)@2
    CORDIC_ShiftX_s12_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s11_q(13 downto 12));

    -- CORDIC_CmpYLtZero_s11(LOGICAL,192)@2
    CORDIC_CmpYLtZero_s11_q <= STD_LOGIC_VECTOR(CORDIC_Yout_s10_q(13 downto 13));

    -- CORDIC_ShiftX_s11(BITSELECT,198)@2
    CORDIC_ShiftX_s11_b <= STD_LOGIC_VECTOR(CORDIC_Xout_s10_q(13 downto 11));

    -- CORDIC_Yout_s11(ADDSUB,201)@2
    CORDIC_Yout_s11_s <= CORDIC_CmpYLtZero_s11_q;
    CORDIC_Yout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s10_q(13)) & CORDIC_Yout_s10_q));
    CORDIC_Yout_s11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 3 => CORDIC_ShiftX_s11_b(2)) & CORDIC_ShiftX_s11_b));
    CORDIC_Yout_s11_combproc: PROCESS (CORDIC_Yout_s11_a, CORDIC_Yout_s11_b, CORDIC_Yout_s11_s)
    BEGIN
        IF (CORDIC_Yout_s11_s = "1") THEN
            CORDIC_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s11_a) + SIGNED(CORDIC_Yout_s11_b));
        ELSE
            CORDIC_Yout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s11_a) - SIGNED(CORDIC_Yout_s11_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s11_q <= CORDIC_Yout_s11_o(13 downto 0);

    -- CORDIC_Yout_s12(ADDSUB,214)@2
    CORDIC_Yout_s12_s <= CORDIC_CmpYLtZero_s12_q;
    CORDIC_Yout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Yout_s11_q(13)) & CORDIC_Yout_s11_q));
    CORDIC_Yout_s12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 2 => CORDIC_ShiftX_s12_b(1)) & CORDIC_ShiftX_s12_b));
    CORDIC_Yout_s12_combproc: PROCESS (CORDIC_Yout_s12_a, CORDIC_Yout_s12_b, CORDIC_Yout_s12_s)
    BEGIN
        IF (CORDIC_Yout_s12_s = "1") THEN
            CORDIC_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s12_a) + SIGNED(CORDIC_Yout_s12_b));
        ELSE
            CORDIC_Yout_s12_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Yout_s12_a) - SIGNED(CORDIC_Yout_s12_b));
        END IF;
    END PROCESS;
    CORDIC_Yout_s12_q <= CORDIC_Yout_s12_o(13 downto 0);

    -- CORDIC_CmpYGeZero_s13(LOGICAL,221)@2 + 1
    CORDIC_CmpYGeZero_s13_qi <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s12_q(13 downto 13)));
    CORDIC_CmpYGeZero_s13_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s13_qi, xout => CORDIC_CmpYGeZero_s13_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s13(CONSTANT,217)
    CORDIC_CnstAtan_s13_q <= "0000000000000000000000000010";

    -- CORDIC_CmpYGeZero_s12(LOGICAL,208)@2 + 1
    CORDIC_CmpYGeZero_s12_qi <= STD_LOGIC_VECTOR(not (CORDIC_Yout_s11_q(13 downto 13)));
    CORDIC_CmpYGeZero_s12_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s12_qi, xout => CORDIC_CmpYGeZero_s12_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s12(CONSTANT,204)
    CORDIC_CnstAtan_s12_q <= "0000000000000000000000000100";

    -- redist1_CORDIC_CmpYGeZero_s11_q_1(DELAY,277)
    redist1_CORDIC_CmpYGeZero_s11_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s11_q, xout => redist1_CORDIC_CmpYGeZero_s11_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s11(CONSTANT,191)
    CORDIC_CnstAtan_s11_q <= "0000000000000000000000001000";

    -- redist2_CORDIC_CmpYGeZero_s10_q_1(DELAY,278)
    redist2_CORDIC_CmpYGeZero_s10_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s10_q, xout => redist2_CORDIC_CmpYGeZero_s10_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s10(CONSTANT,178)
    CORDIC_CnstAtan_s10_q <= "0000000000000000000000010000";

    -- redist3_CORDIC_CmpYGeZero_s9_q_1(DELAY,279)
    redist3_CORDIC_CmpYGeZero_s9_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s9_q, xout => redist3_CORDIC_CmpYGeZero_s9_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s9(CONSTANT,165)
    CORDIC_CnstAtan_s9_q <= "0000000000000000000000100000";

    -- redist4_CORDIC_CmpYGeZero_s8_q_1(DELAY,280)
    redist4_CORDIC_CmpYGeZero_s8_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s8_q, xout => redist4_CORDIC_CmpYGeZero_s8_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s8(CONSTANT,152)
    CORDIC_CnstAtan_s8_q <= "0000000000000000000001000000";

    -- CORDIC_CnstAtan_s7(CONSTANT,139)
    CORDIC_CnstAtan_s7_q <= "0000000000000000000010000000";

    -- CORDIC_CnstAtan_s6(CONSTANT,126)
    CORDIC_CnstAtan_s6_q <= "0000000000000000000100000000";

    -- CORDIC_CnstAtan_s5(CONSTANT,113)
    CORDIC_CnstAtan_s5_q <= "0000000000000000001000000000";

    -- redist5_CORDIC_CmpYGeZero_s4_q_1(DELAY,281)
    redist5_CORDIC_CmpYGeZero_s4_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s4_q, xout => redist5_CORDIC_CmpYGeZero_s4_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s4(CONSTANT,100)
    CORDIC_CnstAtan_s4_q <= "0000000000000000001111111111";

    -- redist6_CORDIC_CmpYGeZero_s3_q_1(DELAY,282)
    redist6_CORDIC_CmpYGeZero_s3_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s3_q, xout => redist6_CORDIC_CmpYGeZero_s3_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s3(CONSTANT,87)
    CORDIC_CnstAtan_s3_q <= "0000000000000000011111110101";

    -- redist7_CORDIC_CmpYGeZero_s2_q_1(DELAY,283)
    redist7_CORDIC_CmpYGeZero_s2_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s2_q, xout => redist7_CORDIC_CmpYGeZero_s2_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s2(CONSTANT,74)
    CORDIC_CnstAtan_s2_q <= "0000000000000000111110101110";

    -- redist8_CORDIC_CmpYGeZero_s1_q_1(DELAY,284)
    redist8_CORDIC_CmpYGeZero_s1_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s1_q, xout => redist8_CORDIC_CmpYGeZero_s1_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s1(CONSTANT,61)
    CORDIC_CnstAtan_s1_q <= "0000000000000001110110101100";

    -- redist9_CORDIC_CmpYGeZero_s0_q_1(DELAY,285)
    redist9_CORDIC_CmpYGeZero_s0_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_CmpYGeZero_s0_q, xout => redist9_CORDIC_CmpYGeZero_s0_q_1_q, clk => clk, aclr => areset );

    -- CORDIC_CnstAtan_s0(CONSTANT,48)
    CORDIC_CnstAtan_s0_q <= "0000000000000011001001000100";

    -- muxopt_assign_id1_q_const(CONSTANT,275)
    muxopt_assign_id1_q_const_q <= "0000000000000000000000000000";

    -- CORDIC_Pout_s0(ADDSUB,59)@2
    CORDIC_Pout_s0_s <= redist9_CORDIC_CmpYGeZero_s0_q_1_q;
    CORDIC_Pout_s0_a <= STD_LOGIC_VECTOR(muxopt_assign_id1_q_const_q(14 downto 0));
    CORDIC_Pout_s0_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s0_q(14 downto 0));
    CORDIC_Pout_s0_combproc: PROCESS (CORDIC_Pout_s0_a, CORDIC_Pout_s0_b, CORDIC_Pout_s0_s)
    BEGIN
        IF (CORDIC_Pout_s0_s = "1") THEN
            CORDIC_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s0_a) + SIGNED(CORDIC_Pout_s0_b));
        ELSE
            CORDIC_Pout_s0_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s0_a) - SIGNED(CORDIC_Pout_s0_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s0_q <= CORDIC_Pout_s0_o(13 downto 0);

    -- CORDIC_Pout_s1(ADDSUB,72)@2
    CORDIC_Pout_s1_s <= redist8_CORDIC_CmpYGeZero_s1_q_1_q;
    CORDIC_Pout_s1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s0_q(13)) & CORDIC_Pout_s0_q));
    CORDIC_Pout_s1_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s1_q(14 downto 0));
    CORDIC_Pout_s1_combproc: PROCESS (CORDIC_Pout_s1_a, CORDIC_Pout_s1_b, CORDIC_Pout_s1_s)
    BEGIN
        IF (CORDIC_Pout_s1_s = "1") THEN
            CORDIC_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s1_a) + SIGNED(CORDIC_Pout_s1_b));
        ELSE
            CORDIC_Pout_s1_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s1_a) - SIGNED(CORDIC_Pout_s1_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s1_q <= CORDIC_Pout_s1_o(13 downto 0);

    -- CORDIC_Pout_s2(ADDSUB,85)@2
    CORDIC_Pout_s2_s <= redist7_CORDIC_CmpYGeZero_s2_q_1_q;
    CORDIC_Pout_s2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s1_q(13)) & CORDIC_Pout_s1_q));
    CORDIC_Pout_s2_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s2_q(14 downto 0));
    CORDIC_Pout_s2_combproc: PROCESS (CORDIC_Pout_s2_a, CORDIC_Pout_s2_b, CORDIC_Pout_s2_s)
    BEGIN
        IF (CORDIC_Pout_s2_s = "1") THEN
            CORDIC_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s2_a) + SIGNED(CORDIC_Pout_s2_b));
        ELSE
            CORDIC_Pout_s2_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s2_a) - SIGNED(CORDIC_Pout_s2_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s2_q <= CORDIC_Pout_s2_o(13 downto 0);

    -- CORDIC_Pout_s3(ADDSUB,98)@2
    CORDIC_Pout_s3_s <= redist6_CORDIC_CmpYGeZero_s3_q_1_q;
    CORDIC_Pout_s3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s2_q(13)) & CORDIC_Pout_s2_q));
    CORDIC_Pout_s3_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s3_q(14 downto 0));
    CORDIC_Pout_s3_combproc: PROCESS (CORDIC_Pout_s3_a, CORDIC_Pout_s3_b, CORDIC_Pout_s3_s)
    BEGIN
        IF (CORDIC_Pout_s3_s = "1") THEN
            CORDIC_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s3_a) + SIGNED(CORDIC_Pout_s3_b));
        ELSE
            CORDIC_Pout_s3_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s3_a) - SIGNED(CORDIC_Pout_s3_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s3_q <= CORDIC_Pout_s3_o(13 downto 0);

    -- CORDIC_Pout_s4(ADDSUB,111)@2
    CORDIC_Pout_s4_s <= redist5_CORDIC_CmpYGeZero_s4_q_1_q;
    CORDIC_Pout_s4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s3_q(13)) & CORDIC_Pout_s3_q));
    CORDIC_Pout_s4_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s4_q(14 downto 0));
    CORDIC_Pout_s4_combproc: PROCESS (CORDIC_Pout_s4_a, CORDIC_Pout_s4_b, CORDIC_Pout_s4_s)
    BEGIN
        IF (CORDIC_Pout_s4_s = "1") THEN
            CORDIC_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s4_a) + SIGNED(CORDIC_Pout_s4_b));
        ELSE
            CORDIC_Pout_s4_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s4_a) - SIGNED(CORDIC_Pout_s4_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s4_q <= CORDIC_Pout_s4_o(13 downto 0);

    -- CORDIC_Pout_s5(ADDSUB,124)@2
    CORDIC_Pout_s5_s <= CORDIC_CmpYGeZero_s5_q;
    CORDIC_Pout_s5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s4_q(13)) & CORDIC_Pout_s4_q));
    CORDIC_Pout_s5_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s5_q(14 downto 0));
    CORDIC_Pout_s5_combproc: PROCESS (CORDIC_Pout_s5_a, CORDIC_Pout_s5_b, CORDIC_Pout_s5_s)
    BEGIN
        IF (CORDIC_Pout_s5_s = "1") THEN
            CORDIC_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s5_a) + SIGNED(CORDIC_Pout_s5_b));
        ELSE
            CORDIC_Pout_s5_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s5_a) - SIGNED(CORDIC_Pout_s5_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s5_q <= CORDIC_Pout_s5_o(13 downto 0);

    -- CORDIC_Pout_s6(ADDSUB,137)@2
    CORDIC_Pout_s6_s <= CORDIC_CmpYGeZero_s6_q;
    CORDIC_Pout_s6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s5_q(13)) & CORDIC_Pout_s5_q));
    CORDIC_Pout_s6_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s6_q(14 downto 0));
    CORDIC_Pout_s6_combproc: PROCESS (CORDIC_Pout_s6_a, CORDIC_Pout_s6_b, CORDIC_Pout_s6_s)
    BEGIN
        IF (CORDIC_Pout_s6_s = "1") THEN
            CORDIC_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s6_a) + SIGNED(CORDIC_Pout_s6_b));
        ELSE
            CORDIC_Pout_s6_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s6_a) - SIGNED(CORDIC_Pout_s6_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s6_q <= CORDIC_Pout_s6_o(13 downto 0);

    -- CORDIC_Pout_s7(ADDSUB,150)@2 + 1
    CORDIC_Pout_s7_s <= CORDIC_CmpYGeZero_s7_q;
    CORDIC_Pout_s7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s6_q(13)) & CORDIC_Pout_s6_q));
    CORDIC_Pout_s7_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s7_q(14 downto 0));
    CORDIC_Pout_s7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            CORDIC_Pout_s7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (CORDIC_Pout_s7_s = "1") THEN
                CORDIC_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s7_a) + SIGNED(CORDIC_Pout_s7_b));
            ELSE
                CORDIC_Pout_s7_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s7_a) - SIGNED(CORDIC_Pout_s7_b));
            END IF;
        END IF;
    END PROCESS;
    CORDIC_Pout_s7_q <= CORDIC_Pout_s7_o(13 downto 0);

    -- CORDIC_Pout_s8(ADDSUB,163)@3
    CORDIC_Pout_s8_s <= redist4_CORDIC_CmpYGeZero_s8_q_1_q;
    CORDIC_Pout_s8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s7_q(13)) & CORDIC_Pout_s7_q));
    CORDIC_Pout_s8_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s8_q(14 downto 0));
    CORDIC_Pout_s8_combproc: PROCESS (CORDIC_Pout_s8_a, CORDIC_Pout_s8_b, CORDIC_Pout_s8_s)
    BEGIN
        IF (CORDIC_Pout_s8_s = "1") THEN
            CORDIC_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s8_a) + SIGNED(CORDIC_Pout_s8_b));
        ELSE
            CORDIC_Pout_s8_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s8_a) - SIGNED(CORDIC_Pout_s8_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s8_q <= CORDIC_Pout_s8_o(13 downto 0);

    -- CORDIC_Pout_s9(ADDSUB,176)@3
    CORDIC_Pout_s9_s <= redist3_CORDIC_CmpYGeZero_s9_q_1_q;
    CORDIC_Pout_s9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s8_q(13)) & CORDIC_Pout_s8_q));
    CORDIC_Pout_s9_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s9_q(14 downto 0));
    CORDIC_Pout_s9_combproc: PROCESS (CORDIC_Pout_s9_a, CORDIC_Pout_s9_b, CORDIC_Pout_s9_s)
    BEGIN
        IF (CORDIC_Pout_s9_s = "1") THEN
            CORDIC_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s9_a) + SIGNED(CORDIC_Pout_s9_b));
        ELSE
            CORDIC_Pout_s9_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s9_a) - SIGNED(CORDIC_Pout_s9_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s9_q <= CORDIC_Pout_s9_o(13 downto 0);

    -- CORDIC_Pout_s10(ADDSUB,189)@3
    CORDIC_Pout_s10_s <= redist2_CORDIC_CmpYGeZero_s10_q_1_q;
    CORDIC_Pout_s10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s9_q(13)) & CORDIC_Pout_s9_q));
    CORDIC_Pout_s10_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s10_q(14 downto 0));
    CORDIC_Pout_s10_combproc: PROCESS (CORDIC_Pout_s10_a, CORDIC_Pout_s10_b, CORDIC_Pout_s10_s)
    BEGIN
        IF (CORDIC_Pout_s10_s = "1") THEN
            CORDIC_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s10_a) + SIGNED(CORDIC_Pout_s10_b));
        ELSE
            CORDIC_Pout_s10_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s10_a) - SIGNED(CORDIC_Pout_s10_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s10_q <= CORDIC_Pout_s10_o(13 downto 0);

    -- CORDIC_Pout_s11(ADDSUB,202)@3
    CORDIC_Pout_s11_s <= redist1_CORDIC_CmpYGeZero_s11_q_1_q;
    CORDIC_Pout_s11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s10_q(13)) & CORDIC_Pout_s10_q));
    CORDIC_Pout_s11_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s11_q(14 downto 0));
    CORDIC_Pout_s11_combproc: PROCESS (CORDIC_Pout_s11_a, CORDIC_Pout_s11_b, CORDIC_Pout_s11_s)
    BEGIN
        IF (CORDIC_Pout_s11_s = "1") THEN
            CORDIC_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s11_a) + SIGNED(CORDIC_Pout_s11_b));
        ELSE
            CORDIC_Pout_s11_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s11_a) - SIGNED(CORDIC_Pout_s11_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s11_q <= CORDIC_Pout_s11_o(13 downto 0);

    -- CORDIC_Pout_s12(ADDSUB,215)@3
    CORDIC_Pout_s12_s <= CORDIC_CmpYGeZero_s12_q;
    CORDIC_Pout_s12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s11_q(13)) & CORDIC_Pout_s11_q));
    CORDIC_Pout_s12_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s12_q(14 downto 0));
    CORDIC_Pout_s12_combproc: PROCESS (CORDIC_Pout_s12_a, CORDIC_Pout_s12_b, CORDIC_Pout_s12_s)
    BEGIN
        IF (CORDIC_Pout_s12_s = "1") THEN
            CORDIC_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s12_a) + SIGNED(CORDIC_Pout_s12_b));
        ELSE
            CORDIC_Pout_s12_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s12_a) - SIGNED(CORDIC_Pout_s12_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s12_q <= CORDIC_Pout_s12_o(13 downto 0);

    -- CORDIC_Pout_s13(ADDSUB,228)@3
    CORDIC_Pout_s13_s <= CORDIC_CmpYGeZero_s13_q;
    CORDIC_Pout_s13_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => CORDIC_Pout_s12_q(13)) & CORDIC_Pout_s12_q));
    CORDIC_Pout_s13_b <= STD_LOGIC_VECTOR(CORDIC_CnstAtan_s13_q(14 downto 0));
    CORDIC_Pout_s13_combproc: PROCESS (CORDIC_Pout_s13_a, CORDIC_Pout_s13_b, CORDIC_Pout_s13_s)
    BEGIN
        IF (CORDIC_Pout_s13_s = "1") THEN
            CORDIC_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s13_a) + SIGNED(CORDIC_Pout_s13_b));
        ELSE
            CORDIC_Pout_s13_o <= STD_LOGIC_VECTOR(SIGNED(CORDIC_Pout_s13_a) - SIGNED(CORDIC_Pout_s13_b));
        END IF;
    END PROCESS;
    CORDIC_Pout_s13_q <= CORDIC_Pout_s13_o(13 downto 0);

    -- CORDIC_XLtZero_00(LOGICAL,36)@2 + 1
    CORDIC_XLtZero_00_qi <= STD_LOGIC_VECTOR(redist14_mp_txrx_Symbol_Recovery_latch_0L1_Mux_x_q_1_q(11 downto 11));
    CORDIC_XLtZero_00_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_XLtZero_00_qi, xout => CORDIC_XLtZero_00_q, clk => clk, aclr => areset );

    -- CORDIC_SelPonX(MUX,234)@3
    CORDIC_SelPonX_s <= CORDIC_XLtZero_00_q;
    CORDIC_SelPonX_combproc: PROCESS (CORDIC_SelPonX_s, CORDIC_Pout_s13_q, CORDIC_LutSubP_q)
    BEGIN
        CASE (CORDIC_SelPonX_s) IS
            WHEN "0" => CORDIC_SelPonX_q <= STD_LOGIC_VECTOR((28 downto 14 => CORDIC_Pout_s13_q(13)) & CORDIC_Pout_s13_q);
            WHEN "1" => CORDIC_SelPonX_q <= CORDIC_LutSubP_q;
            WHEN OTHERS => CORDIC_SelPonX_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- CORDIC_PostCast_cordicWireAngle_rnd_sel(BITSELECT,239)@3
    CORDIC_PostCast_cordicWireAngle_rnd_sel_in <= STD_LOGIC_VECTOR(CORDIC_SelPonX_q(27 downto 0));
    CORDIC_PostCast_cordicWireAngle_rnd_sel_b <= STD_LOGIC_VECTOR(CORDIC_PostCast_cordicWireAngle_rnd_sel_in(27 downto 0));

    -- redist0_CORDIC_PostCast_cordicWireAngle_rnd_sel_b_1(DELAY,276)
    redist0_CORDIC_PostCast_cordicWireAngle_rnd_sel_b_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CORDIC_PostCast_cordicWireAngle_rnd_sel_b, xout => redist0_CORDIC_PostCast_cordicWireAngle_rnd_sel_b_1_q, clk => clk, aclr => areset );

    -- Threshold1(CONSTANT,30)
    Threshold1_q <= "010001001011";

    -- CmpGE1(COMPARE,22)@3 + 1
    CmpGE1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2_q(11)) & redist15_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_2_q));
    CmpGE1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => Threshold1_q(11)) & Threshold1_q));
    CmpGE1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            CmpGE1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CmpGE1_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE1_a) - SIGNED(CmpGE1_b));
        END IF;
    END PROCESS;
    CmpGE1_n(0) <= not (CmpGE1_o(13));

    -- redist12_ChannelIn_in_2_dc_3(DELAY,288)
    redist12_ChannelIn_in_2_dc_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_2_dc, xout => redist12_ChannelIn_in_2_dc_3_q, clk => clk, aclr => areset );

    -- redist11_ChannelIn_in_1_dv_3(DELAY,287)
    redist11_ChannelIn_in_1_dv_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_1_dv, xout => redist11_ChannelIn_in_1_dv_3_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,20)@4 + 1
    out_2_qv <= redist11_ChannelIn_in_1_dv_3_q;
    out_3_qc <= redist12_ChannelIn_in_2_dc_3_q;
    out_1_bits <= CmpGE1_n;
    out_4_phase <= redist0_CORDIC_PostCast_cordicWireAngle_rnd_sel_b_1_q;
    out_5_trigger <= redist18_mp_txrx_Symbol_Recovery_SRlatch_And_x_q_4_q;
    out_6_sym_pwr <= redist16_mp_txrx_Symbol_Recovery_latch_0L_Mux_x_q_3_q;

END normal;
