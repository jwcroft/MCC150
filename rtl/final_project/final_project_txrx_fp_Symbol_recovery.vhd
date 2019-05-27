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

-- VHDL created from final_project_txrx_fp_Symbol_recovery
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

entity final_project_txrx_fp_Symbol_recovery is
    port (
        in_3_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_in_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_in_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_4_sample_crement : in std_logic_vector(1 downto 0);  -- ufix2
        in_6_v_sample_update : in std_logic_vector(0 downto 0);  -- ufix1
        out_3_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_8_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_left_I : out std_logic_vector(11 downto 0);  -- sfix12
        out_2_left_Q : out std_logic_vector(11 downto 0);  -- sfix12
        out_4_main_I : out std_logic_vector(11 downto 0);  -- sfix12
        out_5_main_Q : out std_logic_vector(11 downto 0);  -- sfix12
        out_6_right_I : out std_logic_vector(11 downto 0);  -- sfix12
        out_7_right_Q : out std_logic_vector(11 downto 0);  -- sfix12
        out_9_packet_trigger : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_Symbol_recovery;

architecture normal of final_project_txrx_fp_Symbol_recovery is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Convert_sel_x_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Demux_0_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_0_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_0_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Demux_1_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_1_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_1_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Demux_2_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_2_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux_2_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Demux1_0_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_0_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_0_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Demux1_1_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_1_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_1_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Demux1_2_decoder_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_2_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Demux1_2_mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_SRlatch_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_s : STD_LOGIC_VECTOR (3 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_s : STD_LOGIC_VECTOR (3 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal Add_a : STD_LOGIC_VECTOR (4 downto 0);
    signal Add_b : STD_LOGIC_VECTOR (4 downto 0);
    signal Add_o : STD_LOGIC_VECTOR (4 downto 0);
    signal Add_q : STD_LOGIC_VECTOR (4 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And2_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal And2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ChooseBits_a : STD_LOGIC_VECTOR (4 downto 0);
    signal ChooseBits_q : STD_LOGIC_VECTOR (1 downto 0);
    signal CmpEQ_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpEQ_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE_a : STD_LOGIC_VECTOR (26 downto 0);
    signal CmpGE_b : STD_LOGIC_VECTOR (26 downto 0);
    signal CmpGE_o : STD_LOGIC_VECTOR (26 downto 0);
    signal CmpGE_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Const3_q : STD_LOGIC_VECTOR (18 downto 0);
    signal Const5_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Counter_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter_eq : std_logic;
    attribute preserve of Counter_eq : signal is true;
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Not1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Not2_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Not2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal Mult3_Add1_Mult4_merged_cma_reset : std_logic;
    type Mult3_Add1_Mult4_merged_cma_a0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_a0 : Mult3_Add1_Mult4_merged_cma_a0type(0 to 1);
    attribute preserve of Mult3_Add1_Mult4_merged_cma_a0 : signal is true;
    signal Mult3_Add1_Mult4_merged_cma_c0 : Mult3_Add1_Mult4_merged_cma_a0type(0 to 1);
    attribute preserve of Mult3_Add1_Mult4_merged_cma_c0 : signal is true;
    type Mult3_Add1_Mult4_merged_cma_ptype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_p : Mult3_Add1_Mult4_merged_cma_ptype(0 to 1);
    type Mult3_Add1_Mult4_merged_cma_utype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_u : Mult3_Add1_Mult4_merged_cma_utype(0 to 1);
    signal Mult3_Add1_Mult4_merged_cma_w : Mult3_Add1_Mult4_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_x : Mult3_Add1_Mult4_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_y : Mult3_Add1_Mult4_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_s : Mult3_Add1_Mult4_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_ena0 : std_logic;
    signal Mult3_Add1_Mult4_merged_cma_ena1 : std_logic;
    signal redist0_CmpEQ_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ChannelIn_in_5_c_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_And_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_Demux1_2_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist12_Demux1_1_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist13_Demux1_0_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist14_Demux_2_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist15_Demux_1_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist16_Demux_0_mux_x_q_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist17_Convert_sel_x_b_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_ChannelIn_in_5_c_5_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q : STD_LOGIC_VECTOR (11 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- final_project_txrx_fp_Symbol_recovery_SRlatch_Not_x(LOGICAL,23)@2
    final_project_txrx_fp_Symbol_recovery_SRlatch_Not_x_q <= not (GND_q);

    -- Const3(CONSTANT,103)
    Const3_q <= "1111010000100100000";

    -- redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1(DELAY,125)
    redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q, xout => redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x(MUX,29)@0
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_combproc: PROCESS (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_s, redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1_q, in_1_in_I)
    BEGIN
        CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q <= redist5_final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q <= in_1_in_I;
            WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x(MUX,31)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x(MUX,37)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x(MUX,39)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x(MUX,41)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x(MUX,43)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x(MUX,45)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x(MUX,47)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x(MUX,49)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x(MUX,51)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x(MUX,33)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x(MUX,35)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist17_Convert_sel_x_b_1(DELAY,137)
    redist17_Convert_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Convert_sel_x_b, xout => redist17_Convert_sel_x_b_1_q, clk => clk, aclr => areset );

    -- redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1(DELAY,123)
    redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q, xout => redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x(MUX,89)@0
    final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_s <= in_6_v_sample_update;
    final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_combproc: PROCESS (final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_s, redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1_q, redist17_Convert_sel_x_b_1_q)
    BEGIN
        CASE (final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q <= redist3_final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q <= redist17_Convert_sel_x_b_1_q;
            WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Add(ADD,91)@0
    Add_a <= STD_LOGIC_VECTOR("0" & final_project_txrx_fp_Symbol_recovery_latch_0L_Mux_x_q);
    Add_b <= STD_LOGIC_VECTOR("000" & in_4_sample_crement);
    Add_o <= STD_LOGIC_VECTOR(UNSIGNED(Add_a) + UNSIGNED(Add_b));
    Add_q <= Add_o(4 downto 0);

    -- ChooseBits(CHOOSEBITS,98)@0
    ChooseBits_a <= Add_q;
    ChooseBits_q <= ChooseBits_a(1 downto 1) & ChooseBits_a(0 downto 0);

    -- Convert_sel_x(BITSELECT,3)@0
    Convert_sel_x_b <= std_logic_vector(resize(unsigned(ChooseBits_q(1 downto 0)), 4));

    -- final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x(MUX,27)@0
    final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_s <= Convert_sel_x_b;
    final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_combproc: PROCESS (final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_s, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q)
    BEGIN
        CASE (final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_s) IS
            WHEN "0000" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap11_Mux_x_q;
            WHEN "0001" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap10_Mux_x_q;
            WHEN "0010" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap9_Mux_x_q;
            WHEN "0011" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap8_Mux_x_q;
            WHEN "0100" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap7_Mux_x_q;
            WHEN "0101" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap6_Mux_x_q;
            WHEN "0110" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap5_Mux_x_q;
            WHEN "0111" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap4_Mux_x_q;
            WHEN "1000" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap3_Mux_x_q;
            WHEN "1001" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap2_Mux_x_q;
            WHEN "1010" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap1_Mux_x_q;
            WHEN "1011" => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_I_tap0_Mux_x_q;
            WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1(DELAY,124)
    redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q, xout => redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x(MUX,53)@0
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_combproc: PROCESS (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_s, redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1_q, in_2_in_Q)
    BEGIN
        CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q <= redist4_final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q <= in_2_in_Q;
            WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x(MUX,55)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x(MUX,61)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x(MUX,63)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x(MUX,65)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x(MUX,67)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x(MUX,69)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x(MUX,71)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x(MUX,73)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x(MUX,75)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x(MUX,57)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x(MUX,59)@0 + 1
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_s <= in_3_v;
    final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x(MUX,28)@0
    final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_s <= Convert_sel_x_b;
    final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_combproc: PROCESS (final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_s, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q, final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q)
    BEGIN
        CASE (final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_s) IS
            WHEN "0000" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap11_Mux_x_q;
            WHEN "0001" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap10_Mux_x_q;
            WHEN "0010" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap9_Mux_x_q;
            WHEN "0011" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap8_Mux_x_q;
            WHEN "0100" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap7_Mux_x_q;
            WHEN "0101" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap6_Mux_x_q;
            WHEN "0110" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap5_Mux_x_q;
            WHEN "0111" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap4_Mux_x_q;
            WHEN "1000" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap3_Mux_x_q;
            WHEN "1001" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap2_Mux_x_q;
            WHEN "1010" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap1_Mux_x_q;
            WHEN "1011" => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_Signal_buffer_Q_tap0_Mux_x_q;
            WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mult3_Add1_Mult4_merged_cma(CHAINMULTADD,119)@0 + 2
    Mult3_Add1_Mult4_merged_cma_reset <= areset;
    Mult3_Add1_Mult4_merged_cma_ena0 <= '1';
    Mult3_Add1_Mult4_merged_cma_ena1 <= Mult3_Add1_Mult4_merged_cma_ena0;
    Mult3_Add1_Mult4_merged_cma_p(0) <= Mult3_Add1_Mult4_merged_cma_a0(0) * Mult3_Add1_Mult4_merged_cma_c0(0);
    Mult3_Add1_Mult4_merged_cma_p(1) <= Mult3_Add1_Mult4_merged_cma_a0(1) * Mult3_Add1_Mult4_merged_cma_c0(1);
    Mult3_Add1_Mult4_merged_cma_u(0) <= RESIZE(Mult3_Add1_Mult4_merged_cma_p(0),25);
    Mult3_Add1_Mult4_merged_cma_u(1) <= RESIZE(Mult3_Add1_Mult4_merged_cma_p(1),25);
    Mult3_Add1_Mult4_merged_cma_w(0) <= Mult3_Add1_Mult4_merged_cma_u(0) + Mult3_Add1_Mult4_merged_cma_u(1);
    Mult3_Add1_Mult4_merged_cma_x(0) <= Mult3_Add1_Mult4_merged_cma_w(0);
    Mult3_Add1_Mult4_merged_cma_y(0) <= Mult3_Add1_Mult4_merged_cma_x(0);
    Mult3_Add1_Mult4_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult3_Add1_Mult4_merged_cma_a0 <= (others => (others => '0'));
            Mult3_Add1_Mult4_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult3_Add1_Mult4_merged_cma_ena0 = '1') THEN
                Mult3_Add1_Mult4_merged_cma_a0(0) <= RESIZE(SIGNED(final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q),12);
                Mult3_Add1_Mult4_merged_cma_a0(1) <= RESIZE(SIGNED(final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q),12);
                Mult3_Add1_Mult4_merged_cma_c0(0) <= RESIZE(SIGNED(final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q),12);
                Mult3_Add1_Mult4_merged_cma_c0(1) <= RESIZE(SIGNED(final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q),12);
            END IF;
        END IF;
    END PROCESS;
    Mult3_Add1_Mult4_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult3_Add1_Mult4_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult3_Add1_Mult4_merged_cma_ena1 = '1') THEN
                Mult3_Add1_Mult4_merged_cma_s(0) <= Mult3_Add1_Mult4_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    Mult3_Add1_Mult4_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(Mult3_Add1_Mult4_merged_cma_s(0)(24 downto 0)), xout => Mult3_Add1_Mult4_merged_cma_qq, clk => clk, aclr => areset );
    Mult3_Add1_Mult4_merged_cma_q <= STD_LOGIC_VECTOR(Mult3_Add1_Mult4_merged_cma_qq(24 downto 0));

    -- CmpGE(COMPARE,100)@2
    CmpGE_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => Mult3_Add1_Mult4_merged_cma_q(24)) & Mult3_Add1_Mult4_merged_cma_q));
    CmpGE_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000" & Const3_q));
    CmpGE_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE_a) - SIGNED(CmpGE_b));
    CmpGE_n(0) <= not (CmpGE_o(26));

    -- final_project_txrx_fp_Symbol_recovery_SRlatch_Or_x(LOGICAL,24)@2
    final_project_txrx_fp_Symbol_recovery_SRlatch_Or_x_q <= redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1_q or CmpGE_n;

    -- final_project_txrx_fp_Symbol_recovery_SRlatch_And_x(LOGICAL,22)@2
    final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q <= final_project_txrx_fp_Symbol_recovery_SRlatch_Or_x_q and final_project_txrx_fp_Symbol_recovery_SRlatch_Not_x_q;

    -- redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1(DELAY,128)
    redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q, xout => redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1_q, clk => clk, aclr => areset );

    -- redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3(DELAY,129)
    redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_1_q, xout => redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3_q, clk => clk, aclr => areset );

    -- redist10_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_4(DELAY,130)
    redist10_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3_q, xout => redist10_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_4_q, clk => clk, aclr => areset );

    -- redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4(DELAY,126)
    redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4 : dspba_delay
    GENERIC MAP ( width => 12, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q, xout => redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_q, clk => clk, aclr => areset );

    -- redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg(DELAY,139)
    redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_q, xout => redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q, clk => clk, aclr => areset );

    -- redist11_Demux1_2_mux_x_q_1(DELAY,131)
    redist11_Demux1_2_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux1_2_mux_x_q, xout => redist11_Demux1_2_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Not2(LOGICAL,111)@1 + 1
    Not2_qi <= not (Not_rsrvd_fix_q);
    Not2_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not2_qi, xout => Not2_q, clk => clk, aclr => areset );

    -- Sequence_rsrvd_fix(SEQUENCE,115)@1 + 1
    Sequence_rsrvd_fix_clkproc: PROCESS (clk, areset)
        variable Sequence_rsrvd_fix_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence_rsrvd_fix_c := "00000";
            Sequence_rsrvd_fix_q <= "0";
            Sequence_rsrvd_fix_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q = "1") THEN
                IF (Sequence_rsrvd_fix_c = "11110") THEN
                    Sequence_rsrvd_fix_eq <= '1';
                ELSE
                    Sequence_rsrvd_fix_eq <= '0';
                END IF;
                IF (Sequence_rsrvd_fix_eq = '1') THEN
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c + 3;
                ELSE
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c - 1;
                END IF;
                Sequence_rsrvd_fix_q <= STD_LOGIC_VECTOR(Sequence_rsrvd_fix_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- Not_rsrvd_fix(LOGICAL,109)@2
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- And_rsrvd_fix(LOGICAL,93)@2
    And_rsrvd_fix_q <= Not_rsrvd_fix_q and Not2_q;

    -- redist2_And_rsrvd_fix_q_1(DELAY,122)
    redist2_And_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => And_rsrvd_fix_q, xout => redist2_And_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- Counter(COUNTER,106)@2 + 1
    -- low=0, high=2, step=1, init=0
    Counter_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter_i <= TO_UNSIGNED(0, 2);
            Counter_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (And_rsrvd_fix_q = "1") THEN
                IF (Counter_i = TO_UNSIGNED(1, 2)) THEN
                    Counter_eq <= '1';
                ELSE
                    Counter_eq <= '0';
                END IF;
                IF (Counter_eq = '1') THEN
                    Counter_i <= Counter_i + 2;
                ELSE
                    Counter_i <= Counter_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    Counter_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter_i, 2)));

    -- Demux1_2_decoder_x(DECODE,19)@3 + 1
    Demux1_2_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux1_2_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "10") THEN
                Demux1_2_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux1_2_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux1_2_mux_x(MUX,21)@4
    Demux1_2_mux_x_s <= Demux1_2_decoder_x_q;
    Demux1_2_mux_x_combproc: PROCESS (Demux1_2_mux_x_s, redist11_Demux1_2_mux_x_q_1_q, redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux1_2_mux_x_s) IS
            WHEN "0" => Demux1_2_mux_x_q <= redist11_Demux1_2_mux_x_q_1_q;
            WHEN "1" => Demux1_2_mux_x_q <= redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux1_2_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist0_CmpEQ_q_2(DELAY,120)
    redist0_CmpEQ_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CmpEQ_q, xout => redist0_CmpEQ_q_2_q, clk => clk, aclr => areset );

    -- Not1(LOGICAL,110)@4
    Not1_q <= not (redist0_CmpEQ_q_2_q);

    -- Const5(CONSTANT,104)
    Const5_q <= "01";

    -- CmpEQ(LOGICAL,99)@3 + 1
    CmpEQ_qi <= "1" WHEN Counter_q = Const5_q ELSE "0";
    CmpEQ_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => CmpEQ_qi, xout => CmpEQ_q, clk => clk, aclr => areset );

    -- And1(LOGICAL,94)@4
    And1_q <= CmpEQ_q and Not1_q;

    -- final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x(MUX,87)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q <= Demux1_2_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4(DELAY,127)
    redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4 : dspba_delay
    GENERIC MAP ( width => 12, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q, xout => redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_q, clk => clk, aclr => areset );

    -- redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg(DELAY,140)
    redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_q, xout => redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q, clk => clk, aclr => areset );

    -- redist14_Demux_2_mux_x_q_1(DELAY,134)
    redist14_Demux_2_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_2_mux_x_q, xout => redist14_Demux_2_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_2_decoder_x(DECODE,10)@3 + 1
    Demux_2_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_2_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "10") THEN
                Demux_2_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux_2_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_2_mux_x(MUX,12)@4
    Demux_2_mux_x_s <= Demux_2_decoder_x_q;
    Demux_2_mux_x_combproc: PROCESS (Demux_2_mux_x_s, redist14_Demux_2_mux_x_q_1_q, redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux_2_mux_x_s) IS
            WHEN "0" => Demux_2_mux_x_q <= redist14_Demux_2_mux_x_q_1_q;
            WHEN "1" => Demux_2_mux_x_q <= redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux_2_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x(MUX,85)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q <= Demux_2_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist12_Demux1_1_mux_x_q_1(DELAY,132)
    redist12_Demux1_1_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux1_1_mux_x_q, xout => redist12_Demux1_1_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux1_1_decoder_x(DECODE,16)@3 + 1
    Demux1_1_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux1_1_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "01") THEN
                Demux1_1_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux1_1_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux1_1_mux_x(MUX,18)@4
    Demux1_1_mux_x_s <= Demux1_1_decoder_x_q;
    Demux1_1_mux_x_combproc: PROCESS (Demux1_1_mux_x_s, redist12_Demux1_1_mux_x_q_1_q, redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux1_1_mux_x_s) IS
            WHEN "0" => Demux1_1_mux_x_q <= redist12_Demux1_1_mux_x_q_1_q;
            WHEN "1" => Demux1_1_mux_x_q <= redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux1_1_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x(MUX,83)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q <= Demux1_1_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist15_Demux_1_mux_x_q_1(DELAY,135)
    redist15_Demux_1_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_1_mux_x_q, xout => redist15_Demux_1_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_1_decoder_x(DECODE,7)@3 + 1
    Demux_1_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_1_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "01") THEN
                Demux_1_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux_1_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_1_mux_x(MUX,9)@4
    Demux_1_mux_x_s <= Demux_1_decoder_x_q;
    Demux_1_mux_x_combproc: PROCESS (Demux_1_mux_x_s, redist15_Demux_1_mux_x_q_1_q, redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux_1_mux_x_s) IS
            WHEN "0" => Demux_1_mux_x_q <= redist15_Demux_1_mux_x_q_1_q;
            WHEN "1" => Demux_1_mux_x_q <= redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux_1_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x(MUX,81)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q <= Demux_1_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist13_Demux1_0_mux_x_q_1(DELAY,133)
    redist13_Demux1_0_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux1_0_mux_x_q, xout => redist13_Demux1_0_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux1_0_decoder_x(DECODE,13)@3 + 1
    Demux1_0_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux1_0_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "00") THEN
                Demux1_0_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux1_0_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux1_0_mux_x(MUX,15)@4
    Demux1_0_mux_x_s <= Demux1_0_decoder_x_q;
    Demux1_0_mux_x_combproc: PROCESS (Demux1_0_mux_x_s, redist13_Demux1_0_mux_x_q_1_q, redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux1_0_mux_x_s) IS
            WHEN "0" => Demux1_0_mux_x_q <= redist13_Demux1_0_mux_x_q_1_q;
            WHEN "1" => Demux1_0_mux_x_q <= redist6_final_project_txrx_fp_Symbol_recovery_Sampler_Q_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux1_0_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x(MUX,79)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q <= Demux1_0_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist16_Demux_0_mux_x_q_1(DELAY,136)
    redist16_Demux_0_mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Demux_0_mux_x_q, xout => redist16_Demux_0_mux_x_q_1_q, clk => clk, aclr => areset );

    -- Demux_0_decoder_x(DECODE,4)@3 + 1
    Demux_0_decoder_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Demux_0_decoder_x_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Counter_q(1 downto 0) = "00") THEN
                Demux_0_decoder_x_q <= redist2_And_rsrvd_fix_q_1_q;
            ELSE
                Demux_0_decoder_x_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- Demux_0_mux_x(MUX,6)@4
    Demux_0_mux_x_s <= Demux_0_decoder_x_q;
    Demux_0_mux_x_combproc: PROCESS (Demux_0_mux_x_s, redist16_Demux_0_mux_x_q_1_q, redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q)
    BEGIN
        CASE (Demux_0_mux_x_s) IS
            WHEN "0" => Demux_0_mux_x_q <= redist16_Demux_0_mux_x_q_1_q;
            WHEN "1" => Demux_0_mux_x_q <= redist7_final_project_txrx_fp_Symbol_recovery_Sampler_I_Mux_x_q_4_outputreg_q;
            WHEN OTHERS => Demux_0_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x(MUX,77)@4 + 1
    final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_s <= And1_q;
    final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q <= final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q <= Demux_0_mux_x_q;
                WHEN OTHERS => final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist1_ChannelIn_in_5_c_5(DELAY,121)
    redist1_ChannelIn_in_5_c_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_5_c, xout => redist1_ChannelIn_in_5_c_5_q, clk => clk, aclr => areset );

    -- redist1_ChannelIn_in_5_c_5_outputreg(DELAY,138)
    redist1_ChannelIn_in_5_c_5_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist1_ChannelIn_in_5_c_5_q, xout => redist1_ChannelIn_in_5_c_5_outputreg_q, clk => clk, aclr => areset );

    -- And2(LOGICAL,95)@4 + 1
    And2_qi <= And1_q and redist9_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_3_q;
    And2_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => And2_qi, xout => And2_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,97)@5 + 1
    out_3_qv <= And2_q;
    out_8_qc <= redist1_ChannelIn_in_5_c_5_outputreg_q;
    out_1_left_I <= final_project_txrx_fp_Symbol_recovery_c0_I_Mux_x_q;
    out_2_left_Q <= final_project_txrx_fp_Symbol_recovery_c0_Q_Mux_x_q;
    out_4_main_I <= final_project_txrx_fp_Symbol_recovery_c1_I_Mux_x_q;
    out_5_main_Q <= final_project_txrx_fp_Symbol_recovery_c1_Q_Mux_x_q;
    out_6_right_I <= final_project_txrx_fp_Symbol_recovery_c2_I_Mux_x_q;
    out_7_right_Q <= final_project_txrx_fp_Symbol_recovery_c2_Q_Mux_x_q;
    out_9_packet_trigger <= redist10_final_project_txrx_fp_Symbol_recovery_SRlatch_And_x_q_4_q;

END normal;
