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

-- VHDL created from mp_txrx_InterpolatingFIR
-- VHDL created on Mon May 20 17:18:09 2019


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

entity mp_txrx_InterpolatingFIR is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(1 downto 0);  -- sfix2
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(14 downto 0);  -- sfix15
        clk : in std_logic;
        areset : in std_logic
    );
end mp_txrx_InterpolatingFIR;

architecture normal of mp_txrx_InterpolatingFIR is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_inner_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_inner_i : SIGNED (6 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra3_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra7_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we2_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we2_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_we7_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we7_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_we3_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_wa2_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa2_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_wa7_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa7_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa3_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr6_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_iq : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_ca3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_ca3_i : UNSIGNED (5 downto 0);
    attribute preserve of u0_m0_wo0_ca3_i : signal is true;
    signal u0_m0_wo0_ca3_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca3_eq : signal is true;
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_symSuppress_0_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_symSuppress_0_seq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_reset : std_logic;
    type u0_m0_wo0_mtree_madd4_0_cma_a0type is array(NATURAL range <>) of SIGNED(1 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_a0 : u0_m0_wo0_mtree_madd4_0_cma_a0type(0 to 3);
    attribute preserve of u0_m0_wo0_mtree_madd4_0_cma_a0 : signal is true;
    signal u0_m0_wo0_mtree_madd4_0_cma_b0 : u0_m0_wo0_mtree_madd4_0_cma_a0type(0 to 3);
    attribute preserve of u0_m0_wo0_mtree_madd4_0_cma_b0 : signal is true;
    type u0_m0_wo0_mtree_madd4_0_cma_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_c0 : u0_m0_wo0_mtree_madd4_0_cma_c0type(0 to 3);
    attribute preserve of u0_m0_wo0_mtree_madd4_0_cma_c0 : signal is true;
    type u0_m0_wo0_mtree_madd4_0_cma_ltype is array(NATURAL range <>) of SIGNED(2 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_l : u0_m0_wo0_mtree_madd4_0_cma_ltype(0 to 3);
    type u0_m0_wo0_mtree_madd4_0_cma_ptype is array(NATURAL range <>) of SIGNED(13 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_p : u0_m0_wo0_mtree_madd4_0_cma_ptype(0 to 3);
    type u0_m0_wo0_mtree_madd4_0_cma_utype is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_u : u0_m0_wo0_mtree_madd4_0_cma_utype(0 to 3);
    signal u0_m0_wo0_mtree_madd4_0_cma_w : u0_m0_wo0_mtree_madd4_0_cma_utype(0 to 1);
    signal u0_m0_wo0_mtree_madd4_0_cma_x : u0_m0_wo0_mtree_madd4_0_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_y : u0_m0_wo0_mtree_madd4_0_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_s : u0_m0_wo0_mtree_madd4_0_cma_utype(0 to 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_qq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_ena0 : std_logic;
    signal u0_m0_wo0_mtree_madd4_0_cma_ena1 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra2_count0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_split6_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_split6_c : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_mux_2_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_mux_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_mux_3_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_madd4_0_cma_mux_3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal u0_m0_wo0_wi0_r0_join6_q : STD_LOGIC_VECTOR (3 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_enableQ <= u0_m0_wo0_run_out;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(0 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(-1, 1);
            u0_m0_wo0_run_count <= "00000000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00000000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11011000";
                WHEN "100" => u0_m0_wo0_run_inc := "00000001";
                WHEN "101" => u0_m0_wo0_run_inc := "00000001";
                WHEN "110" => u0_m0_wo0_run_inc := "11011001";
                WHEN "111" => u0_m0_wo0_run_inc := "11011001";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(7 downto 7);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca3(COUNTER,60)@12
    -- low=0, high=39, step=1, init=0
    u0_m0_wo0_ca3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca3_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_ca3_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca3_i = TO_UNSIGNED(38, 6)) THEN
                    u0_m0_wo0_ca3_eq <= '1';
                ELSE
                    u0_m0_wo0_ca3_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca3_eq = '1') THEN
                    u0_m0_wo0_ca3_i <= u0_m0_wo0_ca3_i + 25;
                ELSE
                    u0_m0_wo0_ca3_i <= u0_m0_wo0_ca3_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca3_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca3_i, 6)));

    -- u0_m0_wo0_cm0(LOOKUP,64)@12 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "1111111100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca3_q) IS
                WHEN "000000" => u0_m0_wo0_cm0_q <= "1111111100";
                WHEN "000001" => u0_m0_wo0_cm0_q <= "1111111101";
                WHEN "000010" => u0_m0_wo0_cm0_q <= "1111111110";
                WHEN "000011" => u0_m0_wo0_cm0_q <= "0000000000";
                WHEN "000100" => u0_m0_wo0_cm0_q <= "0000000001";
                WHEN "000101" => u0_m0_wo0_cm0_q <= "0000000010";
                WHEN "000110" => u0_m0_wo0_cm0_q <= "0000000011";
                WHEN "000111" => u0_m0_wo0_cm0_q <= "0000000101";
                WHEN "001000" => u0_m0_wo0_cm0_q <= "0000000110";
                WHEN "001001" => u0_m0_wo0_cm0_q <= "0000000111";
                WHEN "001010" => u0_m0_wo0_cm0_q <= "0000001000";
                WHEN "001011" => u0_m0_wo0_cm0_q <= "0000001001";
                WHEN "001100" => u0_m0_wo0_cm0_q <= "0000001001";
                WHEN "001101" => u0_m0_wo0_cm0_q <= "0000001010";
                WHEN "001110" => u0_m0_wo0_cm0_q <= "0000001010";
                WHEN "001111" => u0_m0_wo0_cm0_q <= "0000001010";
                WHEN "010000" => u0_m0_wo0_cm0_q <= "0000001010";
                WHEN "010001" => u0_m0_wo0_cm0_q <= "0000001010";
                WHEN "010010" => u0_m0_wo0_cm0_q <= "0000001001";
                WHEN "010011" => u0_m0_wo0_cm0_q <= "0000001000";
                WHEN "010100" => u0_m0_wo0_cm0_q <= "0000000110";
                WHEN "010101" => u0_m0_wo0_cm0_q <= "0000000101";
                WHEN "010110" => u0_m0_wo0_cm0_q <= "0000000011";
                WHEN "010111" => u0_m0_wo0_cm0_q <= "0000000001";
                WHEN "011000" => u0_m0_wo0_cm0_q <= "1111111110";
                WHEN "011001" => u0_m0_wo0_cm0_q <= "1111111011";
                WHEN "011010" => u0_m0_wo0_cm0_q <= "1111111001";
                WHEN "011011" => u0_m0_wo0_cm0_q <= "1111110110";
                WHEN "011100" => u0_m0_wo0_cm0_q <= "1111110011";
                WHEN "011101" => u0_m0_wo0_cm0_q <= "1111110000";
                WHEN "011110" => u0_m0_wo0_cm0_q <= "1111101101";
                WHEN "011111" => u0_m0_wo0_cm0_q <= "1111101010";
                WHEN "100000" => u0_m0_wo0_cm0_q <= "1111100111";
                WHEN "100001" => u0_m0_wo0_cm0_q <= "1111100100";
                WHEN "100010" => u0_m0_wo0_cm0_q <= "1111100010";
                WHEN "100011" => u0_m0_wo0_cm0_q <= "1111100000";
                WHEN "100100" => u0_m0_wo0_cm0_q <= "1111011110";
                WHEN "100101" => u0_m0_wo0_cm0_q <= "1111011101";
                WHEN "100110" => u0_m0_wo0_cm0_q <= "1111011100";
                WHEN "100111" => u0_m0_wo0_cm0_q <= "1111011100";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra2_count0_inner(COUNTER,19)@13
    -- low=-1, high=38, step=-1, init=38
    u0_m0_wo0_wi0_r0_ra2_count0_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= TO_SIGNED(38, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra2_count0_inner_i(6 downto 6) = "1") THEN
                    u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= u0_m0_wo0_wi0_r0_ra2_count0_inner_i - 89;
                ELSE
                    u0_m0_wo0_wi0_r0_ra2_count0_inner_i <= u0_m0_wo0_wi0_r0_ra2_count0_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_count0_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra2_count0_inner_i, 7)));

    -- u0_m0_wo0_wi0_r0_ra2_count0_run(LOGICAL,20)@13
    u0_m0_wo0_wi0_r0_ra2_count0_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra2_count0_inner_q(6 downto 6));

    -- d_u0_m0_wo0_memread_q_13(DELAY,88)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,21)@13
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_ra2_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count0_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1" and u0_m0_wo0_wi0_r0_ra2_count0_run_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra2_count0_i <= u0_m0_wo0_wi0_r0_ra2_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra2_count0_i, 1)));

    -- d_xIn_0_13(DELAY,86)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 2, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,87)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,46)@13
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 1)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,50)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra2_count0_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 2,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(1 downto 0);

    -- u0_m0_wo0_wi0_r0_ra3_1(REG,22)@13
    u0_m0_wo0_wi0_r0_ra3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra3_1_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra3_1_q <= u0_m0_wo0_wi0_r0_ra2_count0_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_1(REG,23)@13
    u0_m0_wo0_wi0_r0_ra7_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_1_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_1_q <= u0_m0_wo0_wi0_r0_ra3_1_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_2(REG,24)@13
    u0_m0_wo0_wi0_r0_ra7_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_2_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_2_q <= u0_m0_wo0_wi0_r0_ra7_1_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_3(REG,25)@13
    u0_m0_wo0_wi0_r0_ra7_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_3_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_3_q <= u0_m0_wo0_wi0_r0_ra7_2_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_4(REG,26)@13
    u0_m0_wo0_wi0_r0_ra7_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_4_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_4_q <= u0_m0_wo0_wi0_r0_ra7_3_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_5(REG,27)@13
    u0_m0_wo0_wi0_r0_ra7_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_5_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_5_q <= u0_m0_wo0_wi0_r0_ra7_4_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_6(REG,28)@13
    u0_m0_wo0_wi0_r0_ra7_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_6_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_6_q <= u0_m0_wo0_wi0_r0_ra7_5_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_7(REG,29)@13
    u0_m0_wo0_wi0_r0_ra7_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_7_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_7_q <= u0_m0_wo0_wi0_r0_ra7_6_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_8(REG,30)@13
    u0_m0_wo0_wi0_r0_ra7_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_8_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_8_q <= u0_m0_wo0_wi0_r0_ra7_7_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_9(REG,31)@13
    u0_m0_wo0_wi0_r0_ra7_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_9_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_9_q <= u0_m0_wo0_wi0_r0_ra7_8_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_10(REG,32)@13
    u0_m0_wo0_wi0_r0_ra7_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_10_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_10_q <= u0_m0_wo0_wi0_r0_ra7_9_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_11(REG,33)@13
    u0_m0_wo0_wi0_r0_ra7_11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_11_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_11_q <= u0_m0_wo0_wi0_r0_ra7_10_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_12(REG,34)@13
    u0_m0_wo0_wi0_r0_ra7_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_12_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_12_q <= u0_m0_wo0_wi0_r0_ra7_11_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_13(REG,35)@13
    u0_m0_wo0_wi0_r0_ra7_13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_13_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_13_q <= u0_m0_wo0_wi0_r0_ra7_12_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_14(REG,36)@13
    u0_m0_wo0_wi0_r0_ra7_14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_14_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_14_q <= u0_m0_wo0_wi0_r0_ra7_13_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_15(REG,37)@13
    u0_m0_wo0_wi0_r0_ra7_15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_15_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_15_q <= u0_m0_wo0_wi0_r0_ra7_14_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_16(REG,38)@13
    u0_m0_wo0_wi0_r0_ra7_16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_16_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_16_q <= u0_m0_wo0_wi0_r0_ra7_15_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_17(REG,39)@13
    u0_m0_wo0_wi0_r0_ra7_17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_17_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_17_q <= u0_m0_wo0_wi0_r0_ra7_16_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_18(REG,40)@13
    u0_m0_wo0_wi0_r0_ra7_18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_18_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_18_q <= u0_m0_wo0_wi0_r0_ra7_17_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra7_19(REG,41)@13
    u0_m0_wo0_wi0_r0_ra7_19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra7_19_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra7_19_q <= u0_m0_wo0_wi0_r0_ra7_18_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join6(BITJOIN,55)@13
    u0_m0_wo0_wi0_r0_join6_q <= u0_m0_wo0_wi0_r0_split6_b & u0_m0_wo0_wi0_r0_split1_c;

    -- u0_m0_wo0_wi0_r0_we7_seq(SEQUENCE,43)@12 + 1
    u0_m0_wo0_wi0_r0_we7_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we7_seq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we7_seq_c := "00010001";
            u0_m0_wo0_wi0_r0_we7_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we7_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we7_seq_c = "00000000") THEN
                    u0_m0_wo0_wi0_r0_we7_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we7_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we7_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we7_seq_c := u0_m0_wo0_wi0_r0_we7_seq_c + 39;
                ELSE
                    u0_m0_wo0_wi0_r0_we7_seq_c := u0_m0_wo0_wi0_r0_we7_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we7_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we7_seq_c(7 downto 7));
            ELSE
                u0_m0_wo0_wi0_r0_we7_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa7(COUNTER,48)@13
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_wa7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa7_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we7_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa7_i <= u0_m0_wo0_wi0_r0_wa7_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa7_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa7_i, 1)));

    -- u0_m0_wo0_wi0_r0_memr6(DUALMEM,57)@13
    u0_m0_wo0_wi0_r0_memr6_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join6_q);
    u0_m0_wo0_wi0_r0_memr6_aa <= u0_m0_wo0_wi0_r0_wa7_q;
    u0_m0_wo0_wi0_r0_memr6_ab <= u0_m0_wo0_wi0_r0_ra7_19_q;
    u0_m0_wo0_wi0_r0_memr6_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 4,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 4,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr6_aa,
        data_a => u0_m0_wo0_wi0_r0_memr6_ia,
        wren_a => u0_m0_wo0_wi0_r0_we7_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr6_ab,
        q_b => u0_m0_wo0_wi0_r0_memr6_iq
    );
    u0_m0_wo0_wi0_r0_memr6_q <= u0_m0_wo0_wi0_r0_memr6_iq(3 downto 0);

    -- u0_m0_wo0_wi0_r0_split6(BITSELECT,56)@13
    u0_m0_wo0_wi0_r0_split6_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr6_q(1 downto 0));
    u0_m0_wo0_wi0_r0_split6_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr6_q(3 downto 2));

    -- u0_m0_wo0_symSuppress_0_seq(SEQUENCE,68)@12 + 1
    u0_m0_wo0_symSuppress_0_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_symSuppress_0_seq_c : SIGNED(6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_symSuppress_0_seq_c := "1101101";
            u0_m0_wo0_symSuppress_0_seq_q <= "0";
            u0_m0_wo0_symSuppress_0_seq_eq <= '1';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_symSuppress_0_seq_c = "1101110") THEN
                    u0_m0_wo0_symSuppress_0_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_symSuppress_0_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_symSuppress_0_seq_eq = '1') THEN
                    u0_m0_wo0_symSuppress_0_seq_c := u0_m0_wo0_symSuppress_0_seq_c + 19;
                ELSE
                    u0_m0_wo0_symSuppress_0_seq_c := u0_m0_wo0_symSuppress_0_seq_c - 1;
                END IF;
                u0_m0_wo0_symSuppress_0_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_symSuppress_0_seq_c(6 downto 6));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_madd4_0_cma_mux_3(MUX,85)@13
    u0_m0_wo0_mtree_madd4_0_cma_mux_3_s <= u0_m0_wo0_symSuppress_0_seq_q;
    u0_m0_wo0_mtree_madd4_0_cma_mux_3_combproc: PROCESS (u0_m0_wo0_mtree_madd4_0_cma_mux_3_s, u0_m0_wo0_wi0_r0_split6_c, GND_q)
    BEGIN
        CASE (u0_m0_wo0_mtree_madd4_0_cma_mux_3_s) IS
            WHEN "0" => u0_m0_wo0_mtree_madd4_0_cma_mux_3_q <= u0_m0_wo0_wi0_r0_split6_c;
            WHEN "1" => u0_m0_wo0_mtree_madd4_0_cma_mux_3_q <= STD_LOGIC_VECTOR((1 downto 1 => GND_q(0)) & GND_q);
            WHEN OTHERS => u0_m0_wo0_mtree_madd4_0_cma_mux_3_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_cm1(LOOKUP,65)@12 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "1111011101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca3_q) IS
                WHEN "000000" => u0_m0_wo0_cm1_q <= "1111011101";
                WHEN "000001" => u0_m0_wo0_cm1_q <= "1111011110";
                WHEN "000010" => u0_m0_wo0_cm1_q <= "1111100000";
                WHEN "000011" => u0_m0_wo0_cm1_q <= "1111100011";
                WHEN "000100" => u0_m0_wo0_cm1_q <= "1111100111";
                WHEN "000101" => u0_m0_wo0_cm1_q <= "1111101100";
                WHEN "000110" => u0_m0_wo0_cm1_q <= "1111110001";
                WHEN "000111" => u0_m0_wo0_cm1_q <= "1111111000";
                WHEN "001000" => u0_m0_wo0_cm1_q <= "0000000000";
                WHEN "001001" => u0_m0_wo0_cm1_q <= "0000001001";
                WHEN "001010" => u0_m0_wo0_cm1_q <= "0000010010";
                WHEN "001011" => u0_m0_wo0_cm1_q <= "0000011101";
                WHEN "001100" => u0_m0_wo0_cm1_q <= "0000101001";
                WHEN "001101" => u0_m0_wo0_cm1_q <= "0000110101";
                WHEN "001110" => u0_m0_wo0_cm1_q <= "0001000010";
                WHEN "001111" => u0_m0_wo0_cm1_q <= "0001010001";
                WHEN "010000" => u0_m0_wo0_cm1_q <= "0001011111";
                WHEN "010001" => u0_m0_wo0_cm1_q <= "0001101111";
                WHEN "010010" => u0_m0_wo0_cm1_q <= "0001111111";
                WHEN "010011" => u0_m0_wo0_cm1_q <= "0010001111";
                WHEN "010100" => u0_m0_wo0_cm1_q <= "0010100000";
                WHEN "010101" => u0_m0_wo0_cm1_q <= "0010110001";
                WHEN "010110" => u0_m0_wo0_cm1_q <= "0011000011";
                WHEN "010111" => u0_m0_wo0_cm1_q <= "0011010100";
                WHEN "011000" => u0_m0_wo0_cm1_q <= "0011100101";
                WHEN "011001" => u0_m0_wo0_cm1_q <= "0011110110";
                WHEN "011010" => u0_m0_wo0_cm1_q <= "0100000110";
                WHEN "011011" => u0_m0_wo0_cm1_q <= "0100010111";
                WHEN "011100" => u0_m0_wo0_cm1_q <= "0100100110";
                WHEN "011101" => u0_m0_wo0_cm1_q <= "0100110101";
                WHEN "011110" => u0_m0_wo0_cm1_q <= "0101000011";
                WHEN "011111" => u0_m0_wo0_cm1_q <= "0101001111";
                WHEN "100000" => u0_m0_wo0_cm1_q <= "0101011011";
                WHEN "100001" => u0_m0_wo0_cm1_q <= "0101100110";
                WHEN "100010" => u0_m0_wo0_cm1_q <= "0101110000";
                WHEN "100011" => u0_m0_wo0_cm1_q <= "0101111000";
                WHEN "100100" => u0_m0_wo0_cm1_q <= "0101111110";
                WHEN "100101" => u0_m0_wo0_cm1_q <= "0110000100";
                WHEN "100110" => u0_m0_wo0_cm1_q <= "0110001000";
                WHEN "100111" => u0_m0_wo0_cm1_q <= "0110001010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_madd4_0_cma_mux_2(MUX,84)@13
    u0_m0_wo0_mtree_madd4_0_cma_mux_2_s <= u0_m0_wo0_symSuppress_0_seq_q;
    u0_m0_wo0_mtree_madd4_0_cma_mux_2_combproc: PROCESS (u0_m0_wo0_mtree_madd4_0_cma_mux_2_s, u0_m0_wo0_wi0_r0_split6_b, GND_q)
    BEGIN
        CASE (u0_m0_wo0_mtree_madd4_0_cma_mux_2_s) IS
            WHEN "0" => u0_m0_wo0_mtree_madd4_0_cma_mux_2_q <= u0_m0_wo0_wi0_r0_split6_b;
            WHEN "1" => u0_m0_wo0_mtree_madd4_0_cma_mux_2_q <= STD_LOGIC_VECTOR((1 downto 1 => GND_q(0)) & GND_q);
            WHEN OTHERS => u0_m0_wo0_mtree_madd4_0_cma_mux_2_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_cm2(LOOKUP,66)@12 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "0110001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca3_q) IS
                WHEN "000000" => u0_m0_wo0_cm2_q <= "0110001011";
                WHEN "000001" => u0_m0_wo0_cm2_q <= "0110001010";
                WHEN "000010" => u0_m0_wo0_cm2_q <= "0110001000";
                WHEN "000011" => u0_m0_wo0_cm2_q <= "0110000100";
                WHEN "000100" => u0_m0_wo0_cm2_q <= "0101111110";
                WHEN "000101" => u0_m0_wo0_cm2_q <= "0101111000";
                WHEN "000110" => u0_m0_wo0_cm2_q <= "0101110000";
                WHEN "000111" => u0_m0_wo0_cm2_q <= "0101100110";
                WHEN "001000" => u0_m0_wo0_cm2_q <= "0101011011";
                WHEN "001001" => u0_m0_wo0_cm2_q <= "0101001111";
                WHEN "001010" => u0_m0_wo0_cm2_q <= "0101000011";
                WHEN "001011" => u0_m0_wo0_cm2_q <= "0100110101";
                WHEN "001100" => u0_m0_wo0_cm2_q <= "0100100110";
                WHEN "001101" => u0_m0_wo0_cm2_q <= "0100010111";
                WHEN "001110" => u0_m0_wo0_cm2_q <= "0100000110";
                WHEN "001111" => u0_m0_wo0_cm2_q <= "0011110110";
                WHEN "010000" => u0_m0_wo0_cm2_q <= "0011100101";
                WHEN "010001" => u0_m0_wo0_cm2_q <= "0011010100";
                WHEN "010010" => u0_m0_wo0_cm2_q <= "0011000011";
                WHEN "010011" => u0_m0_wo0_cm2_q <= "0010110001";
                WHEN "010100" => u0_m0_wo0_cm2_q <= "0000000000";
                WHEN "010101" => u0_m0_wo0_cm2_q <= "0010001111";
                WHEN "010110" => u0_m0_wo0_cm2_q <= "0001111111";
                WHEN "010111" => u0_m0_wo0_cm2_q <= "0001101111";
                WHEN "011000" => u0_m0_wo0_cm2_q <= "0001011111";
                WHEN "011001" => u0_m0_wo0_cm2_q <= "0001010001";
                WHEN "011010" => u0_m0_wo0_cm2_q <= "0001000010";
                WHEN "011011" => u0_m0_wo0_cm2_q <= "0000110101";
                WHEN "011100" => u0_m0_wo0_cm2_q <= "0000101001";
                WHEN "011101" => u0_m0_wo0_cm2_q <= "0000011101";
                WHEN "011110" => u0_m0_wo0_cm2_q <= "0000010010";
                WHEN "011111" => u0_m0_wo0_cm2_q <= "0000001001";
                WHEN "100000" => u0_m0_wo0_cm2_q <= "0000000000";
                WHEN "100001" => u0_m0_wo0_cm2_q <= "1111111000";
                WHEN "100010" => u0_m0_wo0_cm2_q <= "1111110001";
                WHEN "100011" => u0_m0_wo0_cm2_q <= "1111101100";
                WHEN "100100" => u0_m0_wo0_cm2_q <= "1111100111";
                WHEN "100101" => u0_m0_wo0_cm2_q <= "1111100011";
                WHEN "100110" => u0_m0_wo0_cm2_q <= "1111100000";
                WHEN "100111" => u0_m0_wo0_cm2_q <= "1111011110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,51)@13
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_we2_seq(SEQUENCE,42)@12 + 1
    u0_m0_wo0_wi0_r0_we2_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we2_seq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we2_seq_c := "00100101";
            u0_m0_wo0_wi0_r0_we2_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we2_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we2_seq_c = "00000000") THEN
                    u0_m0_wo0_wi0_r0_we2_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we2_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we2_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we2_seq_c := u0_m0_wo0_wi0_r0_we2_seq_c + 39;
                ELSE
                    u0_m0_wo0_wi0_r0_we2_seq_c := u0_m0_wo0_wi0_r0_we2_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we2_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we2_seq_c(7 downto 7));
            ELSE
                u0_m0_wo0_wi0_r0_we2_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa2(COUNTER,47)@13
    -- low=0, high=1, step=1, init=1
    u0_m0_wo0_wi0_r0_wa2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa2_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we2_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa2_i <= u0_m0_wo0_wi0_r0_wa2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa2_i, 1)));

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,53)@13
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa2_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra2_count0_q;
    u0_m0_wo0_wi0_r0_memr1_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 4,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 4,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr1_aa,
        data_a => u0_m0_wo0_wi0_r0_memr1_ia,
        wren_a => u0_m0_wo0_wi0_r0_we2_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(3 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,52)@13
    u0_m0_wo0_wi0_r0_split1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(1 downto 0));
    u0_m0_wo0_wi0_r0_split1_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(3 downto 2));

    -- u0_m0_wo0_cm3(LOOKUP,67)@12 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "0000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca3_q) IS
                WHEN "000000" => u0_m0_wo0_cm3_q <= "0000000000";
                WHEN "000001" => u0_m0_wo0_cm3_q <= "1111011100";
                WHEN "000010" => u0_m0_wo0_cm3_q <= "1111011100";
                WHEN "000011" => u0_m0_wo0_cm3_q <= "1111011101";
                WHEN "000100" => u0_m0_wo0_cm3_q <= "1111011110";
                WHEN "000101" => u0_m0_wo0_cm3_q <= "1111100000";
                WHEN "000110" => u0_m0_wo0_cm3_q <= "1111100010";
                WHEN "000111" => u0_m0_wo0_cm3_q <= "1111100100";
                WHEN "001000" => u0_m0_wo0_cm3_q <= "1111100111";
                WHEN "001001" => u0_m0_wo0_cm3_q <= "1111101010";
                WHEN "001010" => u0_m0_wo0_cm3_q <= "1111101101";
                WHEN "001011" => u0_m0_wo0_cm3_q <= "1111110000";
                WHEN "001100" => u0_m0_wo0_cm3_q <= "1111110011";
                WHEN "001101" => u0_m0_wo0_cm3_q <= "1111110110";
                WHEN "001110" => u0_m0_wo0_cm3_q <= "1111111001";
                WHEN "001111" => u0_m0_wo0_cm3_q <= "1111111011";
                WHEN "010000" => u0_m0_wo0_cm3_q <= "1111111110";
                WHEN "010001" => u0_m0_wo0_cm3_q <= "0000000001";
                WHEN "010010" => u0_m0_wo0_cm3_q <= "0000000011";
                WHEN "010011" => u0_m0_wo0_cm3_q <= "0000000101";
                WHEN "010100" => u0_m0_wo0_cm3_q <= "0000000000";
                WHEN "010101" => u0_m0_wo0_cm3_q <= "0000001000";
                WHEN "010110" => u0_m0_wo0_cm3_q <= "0000001001";
                WHEN "010111" => u0_m0_wo0_cm3_q <= "0000001010";
                WHEN "011000" => u0_m0_wo0_cm3_q <= "0000001010";
                WHEN "011001" => u0_m0_wo0_cm3_q <= "0000001010";
                WHEN "011010" => u0_m0_wo0_cm3_q <= "0000001010";
                WHEN "011011" => u0_m0_wo0_cm3_q <= "0000001010";
                WHEN "011100" => u0_m0_wo0_cm3_q <= "0000001001";
                WHEN "011101" => u0_m0_wo0_cm3_q <= "0000001001";
                WHEN "011110" => u0_m0_wo0_cm3_q <= "0000001000";
                WHEN "011111" => u0_m0_wo0_cm3_q <= "0000000111";
                WHEN "100000" => u0_m0_wo0_cm3_q <= "0000000110";
                WHEN "100001" => u0_m0_wo0_cm3_q <= "0000000101";
                WHEN "100010" => u0_m0_wo0_cm3_q <= "0000000011";
                WHEN "100011" => u0_m0_wo0_cm3_q <= "0000000010";
                WHEN "100100" => u0_m0_wo0_cm3_q <= "0000000001";
                WHEN "100101" => u0_m0_wo0_cm3_q <= "0000000000";
                WHEN "100110" => u0_m0_wo0_cm3_q <= "1111111110";
                WHEN "100111" => u0_m0_wo0_cm3_q <= "1111111101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_13(DELAY,89)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_we3_1(REG,44)@13
    u0_m0_wo0_wi0_r0_we3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we3_1_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_we3_1_q <= u0_m0_wo0_wi0_r0_we2_seq_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_we3(LOGICAL,45)@13
    u0_m0_wo0_wi0_r0_we3_q <= u0_m0_wo0_wi0_r0_we3_1_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_wa3_1(REG,49)@13
    u0_m0_wo0_wi0_r0_wa3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa3_1_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa3_1_q <= u0_m0_wo0_wi0_r0_wa2_q;
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_memr3(DUALMEM,54)@13
    u0_m0_wo0_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_c);
    u0_m0_wo0_wi0_r0_memr3_aa <= u0_m0_wo0_wi0_r0_wa3_1_q;
    u0_m0_wo0_wi0_r0_memr3_ab <= u0_m0_wo0_wi0_r0_ra3_1_q;
    u0_m0_wo0_wi0_r0_memr3_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 2,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr3_aa,
        data_a => u0_m0_wo0_wi0_r0_memr3_ia,
        wren_a => u0_m0_wo0_wi0_r0_we3_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr3_ab,
        q_b => u0_m0_wo0_wi0_r0_memr3_iq
    );
    u0_m0_wo0_wi0_r0_memr3_q <= u0_m0_wo0_wi0_r0_memr3_iq(1 downto 0);

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_mtree_madd4_0_cma(CHAINMULTADD,83)@13 + 2
    u0_m0_wo0_mtree_madd4_0_cma_reset <= areset;
    u0_m0_wo0_mtree_madd4_0_cma_ena0 <= '1';
    u0_m0_wo0_mtree_madd4_0_cma_ena1 <= u0_m0_wo0_mtree_madd4_0_cma_ena0;
    u0_m0_wo0_mtree_madd4_0_cma_l(0) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_a0(0),3) + RESIZE(u0_m0_wo0_mtree_madd4_0_cma_b0(0),3);
    u0_m0_wo0_mtree_madd4_0_cma_l(1) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_a0(1),3) + RESIZE(u0_m0_wo0_mtree_madd4_0_cma_b0(1),3);
    u0_m0_wo0_mtree_madd4_0_cma_l(2) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_a0(2),3) + RESIZE(u0_m0_wo0_mtree_madd4_0_cma_b0(2),3);
    u0_m0_wo0_mtree_madd4_0_cma_l(3) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_a0(3),3) + RESIZE(u0_m0_wo0_mtree_madd4_0_cma_b0(3),3);
    u0_m0_wo0_mtree_madd4_0_cma_p(0) <= u0_m0_wo0_mtree_madd4_0_cma_l(0) * u0_m0_wo0_mtree_madd4_0_cma_c0(0);
    u0_m0_wo0_mtree_madd4_0_cma_p(1) <= u0_m0_wo0_mtree_madd4_0_cma_l(1) * u0_m0_wo0_mtree_madd4_0_cma_c0(1);
    u0_m0_wo0_mtree_madd4_0_cma_p(2) <= u0_m0_wo0_mtree_madd4_0_cma_l(2) * u0_m0_wo0_mtree_madd4_0_cma_c0(2);
    u0_m0_wo0_mtree_madd4_0_cma_p(3) <= u0_m0_wo0_mtree_madd4_0_cma_l(3) * u0_m0_wo0_mtree_madd4_0_cma_c0(3);
    u0_m0_wo0_mtree_madd4_0_cma_u(0) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_p(0),16);
    u0_m0_wo0_mtree_madd4_0_cma_u(1) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_p(1),16);
    u0_m0_wo0_mtree_madd4_0_cma_u(2) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_p(2),16);
    u0_m0_wo0_mtree_madd4_0_cma_u(3) <= RESIZE(u0_m0_wo0_mtree_madd4_0_cma_p(3),16);
    u0_m0_wo0_mtree_madd4_0_cma_w(0) <= u0_m0_wo0_mtree_madd4_0_cma_u(0) + u0_m0_wo0_mtree_madd4_0_cma_u(1);
    u0_m0_wo0_mtree_madd4_0_cma_w(1) <= u0_m0_wo0_mtree_madd4_0_cma_u(2) + u0_m0_wo0_mtree_madd4_0_cma_u(3);
    u0_m0_wo0_mtree_madd4_0_cma_x(0) <= u0_m0_wo0_mtree_madd4_0_cma_w(0) + u0_m0_wo0_mtree_madd4_0_cma_w(1);
    u0_m0_wo0_mtree_madd4_0_cma_y(0) <= u0_m0_wo0_mtree_madd4_0_cma_x(0);
    u0_m0_wo0_mtree_madd4_0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd4_0_cma_a0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_madd4_0_cma_b0 <= (others => (others => '0'));
            u0_m0_wo0_mtree_madd4_0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_madd4_0_cma_ena0 = '1') THEN
                u0_m0_wo0_mtree_madd4_0_cma_a0(0) <= SIGNED(RESIZE(UNSIGNED(GND_q),2));
                u0_m0_wo0_mtree_madd4_0_cma_a0(1) <= SIGNED(RESIZE(UNSIGNED(GND_q),2));
                u0_m0_wo0_mtree_madd4_0_cma_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_mtree_madd4_0_cma_mux_2_q),2);
                u0_m0_wo0_mtree_madd4_0_cma_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_mtree_madd4_0_cma_mux_3_q),2);
                u0_m0_wo0_mtree_madd4_0_cma_b0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_memr3_q),2);
                u0_m0_wo0_mtree_madd4_0_cma_b0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_c),2);
                u0_m0_wo0_mtree_madd4_0_cma_b0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_b),2);
                u0_m0_wo0_mtree_madd4_0_cma_b0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_memr0_q),2);
                u0_m0_wo0_mtree_madd4_0_cma_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm3_q),11);
                u0_m0_wo0_mtree_madd4_0_cma_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm2_q),11);
                u0_m0_wo0_mtree_madd4_0_cma_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm1_q),11);
                u0_m0_wo0_mtree_madd4_0_cma_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm0_q),11);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd4_0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd4_0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_mtree_madd4_0_cma_ena1 = '1') THEN
                u0_m0_wo0_mtree_madd4_0_cma_s(0) <= u0_m0_wo0_mtree_madd4_0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd4_0_cma_delay : dspba_delay
    GENERIC MAP ( width => 16, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_mtree_madd4_0_cma_s(0)(15 downto 0)), xout => u0_m0_wo0_mtree_madd4_0_cma_qq, clk => clk, aclr => areset );
    u0_m0_wo0_mtree_madd4_0_cma_q <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_madd4_0_cma_qq(15 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_14(DELAY,90)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,75)@14 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_14_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,77)@15
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,79)@15
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,80)@15 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_madd4_0_cma_q(14 downto 0);

END normal;
