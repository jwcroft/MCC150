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

-- VHDL created from final_project_1_txrx_fp_Symbol_sample_adaptation
-- VHDL created on Fri May 24 15:19:49 2019


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

entity final_project_1_txrx_fp_Symbol_sample_adaptation is
    port (
        in_4_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_left_power : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_main_power : in std_logic_vector(11 downto 0);  -- sfix12
        in_3_right_power : in std_logic_vector(11 downto 0);  -- sfix12
        out_1_v_sample_update : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_sample_crement : out std_logic_vector(1 downto 0);  -- ufix2
        out_4_sym_sample : out std_logic_vector(1 downto 0);  -- ufix2
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_1_txrx_fp_Symbol_sample_adaptation;

architecture normal of final_project_1_txrx_fp_Symbol_sample_adaptation is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_b : STD_LOGIC_VECTOR (1 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_a : STD_LOGIC_VECTOR (1 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpEQ_b : STD_LOGIC_VECTOR (5 downto 0);
    signal CmpEQ_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE_a : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE_b : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE_o : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE1_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE2_a : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE2_o : STD_LOGIC_VECTOR (13 downto 0);
    signal CmpGE2_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE3_a : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE3_b : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE3_o : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE3_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE4_a : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE4_b : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE4_o : STD_LOGIC_VECTOR (29 downto 0);
    signal CmpGE4_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Const_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Const1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Const2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Const3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (5 downto 0);
    signal Counter_i : UNSIGNED (5 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter_eq : std_logic;
    attribute preserve of Counter_eq : signal is true;
    signal Deadlock_overwrite_mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Deadlock_overwrite_mux_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Mux_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Mux_inc_dec_stay_x_s : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_inc_dec_stay_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Mux1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Mux2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Mux2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_1_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Mux_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_new_left_s : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_new_left_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Mux_new_right_s : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_new_right_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Not1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Not1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Or1_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal Or1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Xor_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal CmpGE3_PreShift_0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpGE3_PreShift_0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpGE4_PreShift_0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal CmpGE4_PreShift_0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal Mult_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal Mult_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult_shift2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal Mult_shift2_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal Mult1_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal Mult1_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal Mult1_add_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult1_add_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult1_add_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult1_add_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal Mult1_shift2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal Mult1_shift2_qint : STD_LOGIC_VECTOR (16 downto 0);
    signal redist0_Mux2_q_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_Mux2_q_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_ChannelIn_in_5_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- CmpGE(COMPARE,23)@0
    CmpGE_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => in_1_left_power(11)) & in_1_left_power));
    CmpGE_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => in_2_main_power(11)) & in_2_main_power));
    CmpGE_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE_a) - SIGNED(CmpGE_b));
    CmpGE_n(0) <= not (CmpGE_o(13));

    -- Mux1(MUX,47)@0
    Mux1_s <= CmpGE_n;
    Mux1_combproc: PROCESS (Mux1_s, VCC_q, GND_q)
    BEGIN
        CASE (Mux1_s) IS
            WHEN "0" => Mux1_q <= VCC_q;
            WHEN "1" => Mux1_q <= GND_q;
            WHEN OTHERS => Mux1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Const3(CONSTANT,36)
    Const3_q <= "10";

    -- Mux(MUX,45)@0
    Mux_s <= CmpGE_n;
    Mux_combproc: PROCESS (Mux_s, in_2_main_power, in_1_left_power)
    BEGIN
        CASE (Mux_s) IS
            WHEN "0" => Mux_q <= in_2_main_power;
            WHEN "1" => Mux_q <= in_1_left_power;
            WHEN OTHERS => Mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- CmpGE1(COMPARE,24)@0
    CmpGE1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => Mux_q(11)) & Mux_q));
    CmpGE1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => in_3_right_power(11)) & in_3_right_power));
    CmpGE1_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE1_a) - SIGNED(CmpGE1_b));
    CmpGE1_n(0) <= not (CmpGE1_o(13));

    -- Mux2(MUX,48)@0
    Mux2_s <= CmpGE1_n;
    Mux2_combproc: PROCESS (Mux2_s, Const3_q, Mux1_q)
    BEGIN
        CASE (Mux2_s) IS
            WHEN "0" => Mux2_q <= Const3_q;
            WHEN "1" => Mux2_q <= STD_LOGIC_VECTOR("0" & Mux1_q);
            WHEN OTHERS => Mux2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist0_Mux2_q_1(DELAY,73)
    redist0_Mux2_q_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Mux2_q, xout => redist0_Mux2_q_1_q, clk => clk, aclr => areset );

    -- redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1(DELAY,78)
    redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q, xout => redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x(MUX,13)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_s <= And1_q;
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_combproc: PROCESS (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_s, redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1_q, redist0_Mux2_q_1_q)
    BEGIN
        CASE (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_s) IS
            WHEN "0" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q <= redist5_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q_1_q;
            WHEN "1" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q <= redist0_Mux2_q_1_q;
            WHEN OTHERS => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Const_rsrvd_fix(CONSTANT,33)
    Const_rsrvd_fix_q <= "01";

    -- Const2(CONSTANT,35)
    Const2_q <= "00";

    -- Const1(CONSTANT,34)
    Const1_q <= "11";

    -- Mux_new_right(MUX,51)@0
    Mux_new_right_s <= Mux2_q;
    Mux_new_right_combproc: PROCESS (Mux_new_right_s, in_2_main_power, in_3_right_power, in_1_left_power)
    BEGIN
        CASE (Mux_new_right_s) IS
            WHEN "00" => Mux_new_right_q <= in_2_main_power;
            WHEN "01" => Mux_new_right_q <= in_3_right_power;
            WHEN "10" => Mux_new_right_q <= in_1_left_power;
            WHEN OTHERS => Mux_new_right_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mux_new_left(MUX,50)@0
    Mux_new_left_s <= Mux2_q;
    Mux_new_left_combproc: PROCESS (Mux_new_left_s, in_3_right_power, in_1_left_power, in_2_main_power)
    BEGIN
        CASE (Mux_new_left_s) IS
            WHEN "00" => Mux_new_left_q <= in_3_right_power;
            WHEN "01" => Mux_new_left_q <= in_1_left_power;
            WHEN "10" => Mux_new_left_q <= in_2_main_power;
            WHEN OTHERS => Mux_new_left_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- CmpGE2(COMPARE,26)@0 + 1
    CmpGE2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => Mux_new_left_q(11)) & Mux_new_left_q));
    CmpGE2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => Mux_new_right_q(11)) & Mux_new_right_q));
    CmpGE2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            CmpGE2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CmpGE2_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE2_a) - SIGNED(CmpGE2_b));
        END IF;
    END PROCESS;
    CmpGE2_n(0) <= not (CmpGE2_o(13));

    -- redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1(DELAY,77)
    redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q, xout => redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x(MUX,15)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_s <= And1_q;
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_combproc: PROCESS (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_s, redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1_q, CmpGE2_n)
    BEGIN
        CASE (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_s) IS
            WHEN "0" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q <= redist4_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q_1_q;
            WHEN "1" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q <= CmpGE2_n;
            WHEN OTHERS => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mult1_shift0(BITSHIFT,70)@0
    Mult1_shift0_qint <= Mux_new_left_q & "000";
    Mult1_shift0_q <= Mult1_shift0_qint(14 downto 0);

    -- Mult1_add_1(ADD,71)@0
    Mult1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => Mux_new_left_q(11)) & Mux_new_left_q));
    Mult1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => Mult1_shift0_q(14)) & Mult1_shift0_q));
    Mult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(Mult1_add_1_a) + SIGNED(Mult1_add_1_b));
    Mult1_add_1_q <= Mult1_add_1_o(15 downto 0);

    -- Mult1_shift2(BITSHIFT,72)@0
    Mult1_shift2_qint <= Mult1_add_1_q & "0";
    Mult1_shift2_q <= Mult1_shift2_qint(16 downto 0);

    -- CmpGE4_PreShift_0(BITSHIFT,61)@0
    CmpGE4_PreShift_0_qint <= Mux_new_right_q & "0000";
    CmpGE4_PreShift_0_q <= CmpGE4_PreShift_0_qint(15 downto 0);

    -- CmpGE4(COMPARE,30)@0
    CmpGE4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 16 => CmpGE4_PreShift_0_q(15)) & CmpGE4_PreShift_0_q));
    CmpGE4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 17 => Mult1_shift2_q(16)) & Mult1_shift2_q));
    CmpGE4_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE4_a) - SIGNED(CmpGE4_b));
    CmpGE4_n(0) <= not (CmpGE4_o(29));

    -- Mult_shift0(BITSHIFT,67)@0
    Mult_shift0_qint <= Mux_new_right_q & "000";
    Mult_shift0_q <= Mult_shift0_qint(14 downto 0);

    -- Mult_add_1(ADD,68)@0
    Mult_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => Mux_new_right_q(11)) & Mux_new_right_q));
    Mult_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => Mult_shift0_q(14)) & Mult_shift0_q));
    Mult_add_1_o <= STD_LOGIC_VECTOR(SIGNED(Mult_add_1_a) + SIGNED(Mult_add_1_b));
    Mult_add_1_q <= Mult_add_1_o(15 downto 0);

    -- Mult_shift2(BITSHIFT,69)@0
    Mult_shift2_qint <= Mult_add_1_q & "0";
    Mult_shift2_q <= Mult_shift2_qint(16 downto 0);

    -- CmpGE3_PreShift_0(BITSHIFT,60)@0
    CmpGE3_PreShift_0_qint <= Mux_new_left_q & "0000";
    CmpGE3_PreShift_0_q <= CmpGE3_PreShift_0_qint(15 downto 0);

    -- CmpGE3(COMPARE,28)@0
    CmpGE3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 16 => CmpGE3_PreShift_0_q(15)) & CmpGE3_PreShift_0_q));
    CmpGE3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 17 => Mult_shift2_q(16)) & Mult_shift2_q));
    CmpGE3_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE3_a) - SIGNED(CmpGE3_b));
    CmpGE3_n(0) <= not (CmpGE3_o(29));

    -- Or1(LOGICAL,53)@0 + 1
    Or1_qi <= CmpGE3_n or CmpGE4_n;
    Or1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Or1_qi, xout => Or1_q, clk => clk, aclr => areset );

    -- redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1(DELAY,76)
    redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q, xout => redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x(MUX,17)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_s <= And1_q;
    final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_combproc: PROCESS (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_s, redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1_q, Or1_q)
    BEGIN
        CASE (final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_s) IS
            WHEN "0" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q <= redist3_final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q_1_q;
            WHEN "1" => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q <= Or1_q;
            WHEN OTHERS => final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mux_1(MUX,49)@1
    Mux_1_s <= final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L6_Mux_x_q;
    Mux_1_combproc: PROCESS (Mux_1_s, Const3_q, final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q)
    BEGIN
        CASE (Mux_1_s) IS
            WHEN "0" => Mux_1_q <= Const3_q;
            WHEN "1" => Mux_1_q <= STD_LOGIC_VECTOR("0" & final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L2_Mux_x_q);
            WHEN OTHERS => Mux_1_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- Mux_inc_dec_stay_x(MUX,46)@1
    Mux_inc_dec_stay_x_s <= Mux_1_q;
    Mux_inc_dec_stay_x_combproc: PROCESS (Mux_inc_dec_stay_x_s, Const_rsrvd_fix_q, Const1_q, Const2_q)
    BEGIN
        CASE (Mux_inc_dec_stay_x_s) IS
            WHEN "00" => Mux_inc_dec_stay_x_q <= Const_rsrvd_fix_q;
            WHEN "01" => Mux_inc_dec_stay_x_q <= Const1_q;
            WHEN "10" => Mux_inc_dec_stay_x_q <= Const2_q;
            WHEN OTHERS => Mux_inc_dec_stay_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Not_x(LOGICAL,9)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Not_x_q <= not (And1_q);

    -- redist1_Mux2_q_2(DELAY,74)
    redist1_Mux2_q_2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_Mux2_q_1_q, xout => redist1_Mux2_q_2_q, clk => clk, aclr => areset );

    -- Xor_rsrvd_fix(LOGICAL,56)@1
    Xor_rsrvd_fix_q <= redist0_Mux2_q_1_q xor redist1_Mux2_q_2_q;

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x(LOGICAL,10)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_a <= STD_LOGIC_VECTOR("0" & redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1_q);
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_q <= final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_a or Xor_rsrvd_fix_q;

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x(LOGICAL,8)@1
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_b <= STD_LOGIC_VECTOR("0" & final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Not_x_q);
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_q <= final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_Or_x_q and final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_b;

    -- final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x(BITSELECT,2)@0
    final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b <= final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_And_x_q(0 downto 0);

    -- redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1(DELAY,79)
    redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b, xout => redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1_q, clk => clk, aclr => areset );

    -- Deadlock_overwrite_mux_x(MUX,42)@1
    Deadlock_overwrite_mux_x_s <= redist6_final_project_1_txrx_fp_Symbol_sample_adaptation_SRlatch_SampleDelay1_PostCast_primWireOut_sel_x_b_1_q;
    Deadlock_overwrite_mux_x_combproc: PROCESS (Deadlock_overwrite_mux_x_s, Mux_inc_dec_stay_x_q, Const_rsrvd_fix_q)
    BEGIN
        CASE (Deadlock_overwrite_mux_x_s) IS
            WHEN "0" => Deadlock_overwrite_mux_x_q <= Mux_inc_dec_stay_x_q;
            WHEN "1" => Deadlock_overwrite_mux_x_q <= Const_rsrvd_fix_q;
            WHEN OTHERS => Deadlock_overwrite_mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_ChannelIn_in_5_c_1(DELAY,75)
    redist2_ChannelIn_in_5_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_5_c, xout => redist2_ChannelIn_in_5_c_1_q, clk => clk, aclr => areset );

    -- Not1(LOGICAL,52)@0 + 1
    Not1_qi <= not (CmpEQ_q);
    Not1_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not1_qi, xout => Not1_q, clk => clk, aclr => areset );

    -- Counter(COUNTER,41)@0 + 1
    -- low=0, high=49, step=1, init=0
    Counter_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter_i <= TO_UNSIGNED(0, 6);
            Counter_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (in_4_v = "1") THEN
                IF (Counter_i = TO_UNSIGNED(48, 6)) THEN
                    Counter_eq <= '1';
                ELSE
                    Counter_eq <= '0';
                END IF;
                IF (Counter_eq = '1') THEN
                    Counter_i <= Counter_i + 15;
                ELSE
                    Counter_i <= Counter_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    Counter_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter_i, 6)));

    -- CmpEQ(LOGICAL,22)@1
    CmpEQ_b <= STD_LOGIC_VECTOR("0000" & Const1_q);
    CmpEQ_q <= "1" WHEN Counter_q = CmpEQ_b ELSE "0";

    -- And1(LOGICAL,19)@1
    And1_q <= CmpEQ_q and Not1_q;

    -- ChannelOut(PORTOUT,21)@1 + 1
    out_1_v_sample_update <= And1_q;
    out_2_qc <= redist2_ChannelIn_in_5_c_1_q;
    out_3_sample_crement <= Deadlock_overwrite_mux_x_q;
    out_4_sym_sample <= final_project_1_txrx_fp_Symbol_sample_adaptation_latch_0L_Mux_x_q;

END normal;
