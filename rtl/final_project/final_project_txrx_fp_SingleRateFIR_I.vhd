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

-- VHDL created from final_project_txrx_fp_SingleRateFIR_I
-- VHDL created on Wed May 29 10:21:56 2019


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

entity final_project_txrx_fp_SingleRateFIR_I is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(11 downto 0);  -- sfix12
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(27 downto 0);  -- sfix28
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_SingleRateFIR_I;

architecture normal of final_project_txrx_fp_SingleRateFIR_I is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    signal u0_m0_wo0_cma0_b0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_b0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    signal u0_m0_wo0_cma0_d : u0_m0_wo0_cma0_a0type(0 to 30);
    attribute preserve of u0_m0_wo0_cma0_d : signal is true;
    type u0_m0_wo0_cma0_ltype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_ltype(0 to 31);
    type u0_m0_wo0_cma0_rtype is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_rtype(0 to 31);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 31);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-1,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-3,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-5,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k4 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k5 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-6,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k6 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-3,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k7 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k8 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(4,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k9 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(7,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k10 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(9,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k11 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(9,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k12 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k13 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k14 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k15 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-18,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k16 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k17 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-32,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k18 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-32,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k19 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-25,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k20 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-9,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k21 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(17,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k22 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(52,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k23 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(96,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k24 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(146,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k25 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(199,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k26 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(249,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k27 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(294,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k28 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(330,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k29 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(352,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k30 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(360,11),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k31 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        others => (others => '0'));
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- u0_m0_wo0_wi0_r0_delayr32(DELAY,51)@10
    u0_m0_wo0_wi0_r0_delayr32 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,154)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma0(CHAINMULTADD,146)@10 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= xIn_v(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma0_l(0) <= RESIZE(u0_m0_wo0_cma0_a0(0),13) + RESIZE(u0_m0_wo0_cma0_b0(0),13);
    u0_m0_wo0_cma0_l(1) <= RESIZE(u0_m0_wo0_cma0_a0(1),13) + RESIZE(u0_m0_wo0_cma0_b0(1),13);
    u0_m0_wo0_cma0_l(2) <= RESIZE(u0_m0_wo0_cma0_a0(2),13) + RESIZE(u0_m0_wo0_cma0_b0(2),13);
    u0_m0_wo0_cma0_l(3) <= RESIZE(u0_m0_wo0_cma0_a0(3),13) + RESIZE(u0_m0_wo0_cma0_b0(3),13);
    u0_m0_wo0_cma0_l(4) <= RESIZE(u0_m0_wo0_cma0_a0(4),13) + RESIZE(u0_m0_wo0_cma0_b0(4),13);
    u0_m0_wo0_cma0_l(5) <= RESIZE(u0_m0_wo0_cma0_a0(5),13) + RESIZE(u0_m0_wo0_cma0_b0(5),13);
    u0_m0_wo0_cma0_l(6) <= RESIZE(u0_m0_wo0_cma0_a0(6),13) + RESIZE(u0_m0_wo0_cma0_b0(6),13);
    u0_m0_wo0_cma0_l(7) <= RESIZE(u0_m0_wo0_cma0_a0(7),13) + RESIZE(u0_m0_wo0_cma0_b0(7),13);
    u0_m0_wo0_cma0_l(8) <= RESIZE(u0_m0_wo0_cma0_a0(8),13) + RESIZE(u0_m0_wo0_cma0_b0(8),13);
    u0_m0_wo0_cma0_l(9) <= RESIZE(u0_m0_wo0_cma0_a0(9),13) + RESIZE(u0_m0_wo0_cma0_b0(9),13);
    u0_m0_wo0_cma0_l(10) <= RESIZE(u0_m0_wo0_cma0_a0(10),13) + RESIZE(u0_m0_wo0_cma0_b0(10),13);
    u0_m0_wo0_cma0_l(11) <= RESIZE(u0_m0_wo0_cma0_a0(11),13) + RESIZE(u0_m0_wo0_cma0_b0(11),13);
    u0_m0_wo0_cma0_l(12) <= RESIZE(u0_m0_wo0_cma0_a0(12),13) + RESIZE(u0_m0_wo0_cma0_b0(12),13);
    u0_m0_wo0_cma0_l(13) <= RESIZE(u0_m0_wo0_cma0_a0(13),13) + RESIZE(u0_m0_wo0_cma0_b0(13),13);
    u0_m0_wo0_cma0_l(14) <= RESIZE(u0_m0_wo0_cma0_a0(14),13) + RESIZE(u0_m0_wo0_cma0_b0(14),13);
    u0_m0_wo0_cma0_l(15) <= RESIZE(u0_m0_wo0_cma0_a0(15),13) + RESIZE(u0_m0_wo0_cma0_b0(15),13);
    u0_m0_wo0_cma0_l(16) <= RESIZE(u0_m0_wo0_cma0_a0(16),13) + RESIZE(u0_m0_wo0_cma0_b0(16),13);
    u0_m0_wo0_cma0_l(17) <= RESIZE(u0_m0_wo0_cma0_a0(17),13) + RESIZE(u0_m0_wo0_cma0_b0(17),13);
    u0_m0_wo0_cma0_l(18) <= RESIZE(u0_m0_wo0_cma0_a0(18),13) + RESIZE(u0_m0_wo0_cma0_b0(18),13);
    u0_m0_wo0_cma0_l(19) <= RESIZE(u0_m0_wo0_cma0_a0(19),13) + RESIZE(u0_m0_wo0_cma0_b0(19),13);
    u0_m0_wo0_cma0_l(20) <= RESIZE(u0_m0_wo0_cma0_a0(20),13) + RESIZE(u0_m0_wo0_cma0_b0(20),13);
    u0_m0_wo0_cma0_l(21) <= RESIZE(u0_m0_wo0_cma0_a0(21),13) + RESIZE(u0_m0_wo0_cma0_b0(21),13);
    u0_m0_wo0_cma0_l(22) <= RESIZE(u0_m0_wo0_cma0_a0(22),13) + RESIZE(u0_m0_wo0_cma0_b0(22),13);
    u0_m0_wo0_cma0_l(23) <= RESIZE(u0_m0_wo0_cma0_a0(23),13) + RESIZE(u0_m0_wo0_cma0_b0(23),13);
    u0_m0_wo0_cma0_l(24) <= RESIZE(u0_m0_wo0_cma0_a0(24),13) + RESIZE(u0_m0_wo0_cma0_b0(24),13);
    u0_m0_wo0_cma0_l(25) <= RESIZE(u0_m0_wo0_cma0_a0(25),13) + RESIZE(u0_m0_wo0_cma0_b0(25),13);
    u0_m0_wo0_cma0_l(26) <= RESIZE(u0_m0_wo0_cma0_a0(26),13) + RESIZE(u0_m0_wo0_cma0_b0(26),13);
    u0_m0_wo0_cma0_l(27) <= RESIZE(u0_m0_wo0_cma0_a0(27),13) + RESIZE(u0_m0_wo0_cma0_b0(27),13);
    u0_m0_wo0_cma0_l(28) <= RESIZE(u0_m0_wo0_cma0_a0(28),13) + RESIZE(u0_m0_wo0_cma0_b0(28),13);
    u0_m0_wo0_cma0_l(29) <= RESIZE(u0_m0_wo0_cma0_a0(29),13) + RESIZE(u0_m0_wo0_cma0_b0(29),13);
    u0_m0_wo0_cma0_l(30) <= RESIZE(u0_m0_wo0_cma0_a0(30),13) + RESIZE(u0_m0_wo0_cma0_b0(30),13);
    u0_m0_wo0_cma0_l(31) <= RESIZE(u0_m0_wo0_cma0_a0(31),13) + RESIZE(u0_m0_wo0_cma0_b0(31),13);
    -- altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(-1,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(-3,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(-5,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k4 <= (
        0 => TO_SIGNED(-7,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k5 <= (
        0 => TO_SIGNED(-6,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k6 <= (
        0 => TO_SIGNED(-3,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k7 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k8 <= (
        0 => TO_SIGNED(4,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k9 <= (
        0 => TO_SIGNED(7,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k10 <= (
        0 => TO_SIGNED(9,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k11 <= (
        0 => TO_SIGNED(9,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k12 <= (
        0 => TO_SIGNED(6,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k13 <= (
        0 => TO_SIGNED(0,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k14 <= (
        0 => TO_SIGNED(-8,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k15 <= (
        0 => TO_SIGNED(-18,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k16 <= (
        0 => TO_SIGNED(-26,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k17 <= (
        0 => TO_SIGNED(-32,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k18 <= (
        0 => TO_SIGNED(-32,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k19 <= (
        0 => TO_SIGNED(-25,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k20 <= (
        0 => TO_SIGNED(-9,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k21 <= (
        0 => TO_SIGNED(17,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k22 <= (
        0 => TO_SIGNED(52,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k23 <= (
        0 => TO_SIGNED(96,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k24 <= (
        0 => TO_SIGNED(146,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k25 <= (
        0 => TO_SIGNED(199,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k26 <= (
        0 => TO_SIGNED(249,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k27 <= (
        0 => TO_SIGNED(294,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k28 <= (
        0 => TO_SIGNED(330,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k29 <= (
        0 => TO_SIGNED(352,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k30 <= (
        0 => TO_SIGNED(360,11),
        others => (others => '0'));
    u0_m0_wo0_cma0_k31 <= (
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c0(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c0(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c0(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c0(3)));
    u0_m0_wo0_cma0_r(4) <= u0_m0_wo0_cma0_k4(TO_INTEGER(u0_m0_wo0_cma0_c0(4)));
    u0_m0_wo0_cma0_r(5) <= u0_m0_wo0_cma0_k5(TO_INTEGER(u0_m0_wo0_cma0_c0(5)));
    u0_m0_wo0_cma0_r(6) <= u0_m0_wo0_cma0_k6(TO_INTEGER(u0_m0_wo0_cma0_c0(6)));
    u0_m0_wo0_cma0_r(7) <= u0_m0_wo0_cma0_k7(TO_INTEGER(u0_m0_wo0_cma0_c0(7)));
    u0_m0_wo0_cma0_r(8) <= u0_m0_wo0_cma0_k8(TO_INTEGER(u0_m0_wo0_cma0_c0(8)));
    u0_m0_wo0_cma0_r(9) <= u0_m0_wo0_cma0_k9(TO_INTEGER(u0_m0_wo0_cma0_c0(9)));
    u0_m0_wo0_cma0_r(10) <= u0_m0_wo0_cma0_k10(TO_INTEGER(u0_m0_wo0_cma0_c0(10)));
    u0_m0_wo0_cma0_r(11) <= u0_m0_wo0_cma0_k11(TO_INTEGER(u0_m0_wo0_cma0_c0(11)));
    u0_m0_wo0_cma0_r(12) <= u0_m0_wo0_cma0_k12(TO_INTEGER(u0_m0_wo0_cma0_c0(12)));
    u0_m0_wo0_cma0_r(13) <= u0_m0_wo0_cma0_k13(TO_INTEGER(u0_m0_wo0_cma0_c0(13)));
    u0_m0_wo0_cma0_r(14) <= u0_m0_wo0_cma0_k14(TO_INTEGER(u0_m0_wo0_cma0_c0(14)));
    u0_m0_wo0_cma0_r(15) <= u0_m0_wo0_cma0_k15(TO_INTEGER(u0_m0_wo0_cma0_c0(15)));
    u0_m0_wo0_cma0_r(16) <= u0_m0_wo0_cma0_k16(TO_INTEGER(u0_m0_wo0_cma0_c0(16)));
    u0_m0_wo0_cma0_r(17) <= u0_m0_wo0_cma0_k17(TO_INTEGER(u0_m0_wo0_cma0_c0(17)));
    u0_m0_wo0_cma0_r(18) <= u0_m0_wo0_cma0_k18(TO_INTEGER(u0_m0_wo0_cma0_c0(18)));
    u0_m0_wo0_cma0_r(19) <= u0_m0_wo0_cma0_k19(TO_INTEGER(u0_m0_wo0_cma0_c0(19)));
    u0_m0_wo0_cma0_r(20) <= u0_m0_wo0_cma0_k20(TO_INTEGER(u0_m0_wo0_cma0_c0(20)));
    u0_m0_wo0_cma0_r(21) <= u0_m0_wo0_cma0_k21(TO_INTEGER(u0_m0_wo0_cma0_c0(21)));
    u0_m0_wo0_cma0_r(22) <= u0_m0_wo0_cma0_k22(TO_INTEGER(u0_m0_wo0_cma0_c0(22)));
    u0_m0_wo0_cma0_r(23) <= u0_m0_wo0_cma0_k23(TO_INTEGER(u0_m0_wo0_cma0_c0(23)));
    u0_m0_wo0_cma0_r(24) <= u0_m0_wo0_cma0_k24(TO_INTEGER(u0_m0_wo0_cma0_c0(24)));
    u0_m0_wo0_cma0_r(25) <= u0_m0_wo0_cma0_k25(TO_INTEGER(u0_m0_wo0_cma0_c0(25)));
    u0_m0_wo0_cma0_r(26) <= u0_m0_wo0_cma0_k26(TO_INTEGER(u0_m0_wo0_cma0_c0(26)));
    u0_m0_wo0_cma0_r(27) <= u0_m0_wo0_cma0_k27(TO_INTEGER(u0_m0_wo0_cma0_c0(27)));
    u0_m0_wo0_cma0_r(28) <= u0_m0_wo0_cma0_k28(TO_INTEGER(u0_m0_wo0_cma0_c0(28)));
    u0_m0_wo0_cma0_r(29) <= u0_m0_wo0_cma0_k29(TO_INTEGER(u0_m0_wo0_cma0_c0(29)));
    u0_m0_wo0_cma0_r(30) <= u0_m0_wo0_cma0_k30(TO_INTEGER(u0_m0_wo0_cma0_c0(30)));
    u0_m0_wo0_cma0_r(31) <= u0_m0_wo0_cma0_k31(TO_INTEGER(u0_m0_wo0_cma0_c0(31)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_l(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_l(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_l(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_l(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_l(4) * u0_m0_wo0_cma0_r(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_l(5) * u0_m0_wo0_cma0_r(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_l(6) * u0_m0_wo0_cma0_r(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_l(7) * u0_m0_wo0_cma0_r(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_l(8) * u0_m0_wo0_cma0_r(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_l(9) * u0_m0_wo0_cma0_r(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_l(10) * u0_m0_wo0_cma0_r(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_l(11) * u0_m0_wo0_cma0_r(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_l(12) * u0_m0_wo0_cma0_r(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_l(13) * u0_m0_wo0_cma0_r(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_l(14) * u0_m0_wo0_cma0_r(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_l(15) * u0_m0_wo0_cma0_r(15);
    u0_m0_wo0_cma0_p(16) <= u0_m0_wo0_cma0_l(16) * u0_m0_wo0_cma0_r(16);
    u0_m0_wo0_cma0_p(17) <= u0_m0_wo0_cma0_l(17) * u0_m0_wo0_cma0_r(17);
    u0_m0_wo0_cma0_p(18) <= u0_m0_wo0_cma0_l(18) * u0_m0_wo0_cma0_r(18);
    u0_m0_wo0_cma0_p(19) <= u0_m0_wo0_cma0_l(19) * u0_m0_wo0_cma0_r(19);
    u0_m0_wo0_cma0_p(20) <= u0_m0_wo0_cma0_l(20) * u0_m0_wo0_cma0_r(20);
    u0_m0_wo0_cma0_p(21) <= u0_m0_wo0_cma0_l(21) * u0_m0_wo0_cma0_r(21);
    u0_m0_wo0_cma0_p(22) <= u0_m0_wo0_cma0_l(22) * u0_m0_wo0_cma0_r(22);
    u0_m0_wo0_cma0_p(23) <= u0_m0_wo0_cma0_l(23) * u0_m0_wo0_cma0_r(23);
    u0_m0_wo0_cma0_p(24) <= u0_m0_wo0_cma0_l(24) * u0_m0_wo0_cma0_r(24);
    u0_m0_wo0_cma0_p(25) <= u0_m0_wo0_cma0_l(25) * u0_m0_wo0_cma0_r(25);
    u0_m0_wo0_cma0_p(26) <= u0_m0_wo0_cma0_l(26) * u0_m0_wo0_cma0_r(26);
    u0_m0_wo0_cma0_p(27) <= u0_m0_wo0_cma0_l(27) * u0_m0_wo0_cma0_r(27);
    u0_m0_wo0_cma0_p(28) <= u0_m0_wo0_cma0_l(28) * u0_m0_wo0_cma0_r(28);
    u0_m0_wo0_cma0_p(29) <= u0_m0_wo0_cma0_l(29) * u0_m0_wo0_cma0_r(29);
    u0_m0_wo0_cma0_p(30) <= u0_m0_wo0_cma0_l(30) * u0_m0_wo0_cma0_r(30);
    u0_m0_wo0_cma0_p(31) <= u0_m0_wo0_cma0_l(31) * u0_m0_wo0_cma0_r(31);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),29);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),29);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),29);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),29);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),29);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),29);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),29);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),29);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),29);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),29);
    u0_m0_wo0_cma0_u(10) <= RESIZE(u0_m0_wo0_cma0_p(10),29);
    u0_m0_wo0_cma0_u(11) <= RESIZE(u0_m0_wo0_cma0_p(11),29);
    u0_m0_wo0_cma0_u(12) <= RESIZE(u0_m0_wo0_cma0_p(12),29);
    u0_m0_wo0_cma0_u(13) <= RESIZE(u0_m0_wo0_cma0_p(13),29);
    u0_m0_wo0_cma0_u(14) <= RESIZE(u0_m0_wo0_cma0_p(14),29);
    u0_m0_wo0_cma0_u(15) <= RESIZE(u0_m0_wo0_cma0_p(15),29);
    u0_m0_wo0_cma0_u(16) <= RESIZE(u0_m0_wo0_cma0_p(16),29);
    u0_m0_wo0_cma0_u(17) <= RESIZE(u0_m0_wo0_cma0_p(17),29);
    u0_m0_wo0_cma0_u(18) <= RESIZE(u0_m0_wo0_cma0_p(18),29);
    u0_m0_wo0_cma0_u(19) <= RESIZE(u0_m0_wo0_cma0_p(19),29);
    u0_m0_wo0_cma0_u(20) <= RESIZE(u0_m0_wo0_cma0_p(20),29);
    u0_m0_wo0_cma0_u(21) <= RESIZE(u0_m0_wo0_cma0_p(21),29);
    u0_m0_wo0_cma0_u(22) <= RESIZE(u0_m0_wo0_cma0_p(22),29);
    u0_m0_wo0_cma0_u(23) <= RESIZE(u0_m0_wo0_cma0_p(23),29);
    u0_m0_wo0_cma0_u(24) <= RESIZE(u0_m0_wo0_cma0_p(24),29);
    u0_m0_wo0_cma0_u(25) <= RESIZE(u0_m0_wo0_cma0_p(25),29);
    u0_m0_wo0_cma0_u(26) <= RESIZE(u0_m0_wo0_cma0_p(26),29);
    u0_m0_wo0_cma0_u(27) <= RESIZE(u0_m0_wo0_cma0_p(27),29);
    u0_m0_wo0_cma0_u(28) <= RESIZE(u0_m0_wo0_cma0_p(28),29);
    u0_m0_wo0_cma0_u(29) <= RESIZE(u0_m0_wo0_cma0_p(29),29);
    u0_m0_wo0_cma0_u(30) <= RESIZE(u0_m0_wo0_cma0_p(30),29);
    u0_m0_wo0_cma0_u(31) <= RESIZE(u0_m0_wo0_cma0_p(31),29);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_w(6) <= u0_m0_wo0_cma0_u(6);
    u0_m0_wo0_cma0_w(7) <= u0_m0_wo0_cma0_u(7);
    u0_m0_wo0_cma0_w(8) <= u0_m0_wo0_cma0_u(8);
    u0_m0_wo0_cma0_w(9) <= u0_m0_wo0_cma0_u(9);
    u0_m0_wo0_cma0_w(10) <= u0_m0_wo0_cma0_u(10);
    u0_m0_wo0_cma0_w(11) <= u0_m0_wo0_cma0_u(11);
    u0_m0_wo0_cma0_w(12) <= u0_m0_wo0_cma0_u(12);
    u0_m0_wo0_cma0_w(13) <= u0_m0_wo0_cma0_u(13);
    u0_m0_wo0_cma0_w(14) <= u0_m0_wo0_cma0_u(14);
    u0_m0_wo0_cma0_w(15) <= u0_m0_wo0_cma0_u(15);
    u0_m0_wo0_cma0_w(16) <= u0_m0_wo0_cma0_u(16);
    u0_m0_wo0_cma0_w(17) <= u0_m0_wo0_cma0_u(17);
    u0_m0_wo0_cma0_w(18) <= u0_m0_wo0_cma0_u(18);
    u0_m0_wo0_cma0_w(19) <= u0_m0_wo0_cma0_u(19);
    u0_m0_wo0_cma0_w(20) <= u0_m0_wo0_cma0_u(20);
    u0_m0_wo0_cma0_w(21) <= u0_m0_wo0_cma0_u(21);
    u0_m0_wo0_cma0_w(22) <= u0_m0_wo0_cma0_u(22);
    u0_m0_wo0_cma0_w(23) <= u0_m0_wo0_cma0_u(23);
    u0_m0_wo0_cma0_w(24) <= u0_m0_wo0_cma0_u(24);
    u0_m0_wo0_cma0_w(25) <= u0_m0_wo0_cma0_u(25);
    u0_m0_wo0_cma0_w(26) <= u0_m0_wo0_cma0_u(26);
    u0_m0_wo0_cma0_w(27) <= u0_m0_wo0_cma0_u(27);
    u0_m0_wo0_cma0_w(28) <= u0_m0_wo0_cma0_u(28);
    u0_m0_wo0_cma0_w(29) <= u0_m0_wo0_cma0_u(29);
    u0_m0_wo0_cma0_w(30) <= u0_m0_wo0_cma0_u(30);
    u0_m0_wo0_cma0_w(31) <= u0_m0_wo0_cma0_u(31);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_x(6) <= u0_m0_wo0_cma0_w(6);
    u0_m0_wo0_cma0_x(7) <= u0_m0_wo0_cma0_w(7);
    u0_m0_wo0_cma0_x(8) <= u0_m0_wo0_cma0_w(8);
    u0_m0_wo0_cma0_x(9) <= u0_m0_wo0_cma0_w(9);
    u0_m0_wo0_cma0_x(10) <= u0_m0_wo0_cma0_w(10);
    u0_m0_wo0_cma0_x(11) <= u0_m0_wo0_cma0_w(11);
    u0_m0_wo0_cma0_x(12) <= u0_m0_wo0_cma0_w(12);
    u0_m0_wo0_cma0_x(13) <= u0_m0_wo0_cma0_w(13);
    u0_m0_wo0_cma0_x(14) <= u0_m0_wo0_cma0_w(14);
    u0_m0_wo0_cma0_x(15) <= u0_m0_wo0_cma0_w(15);
    u0_m0_wo0_cma0_x(16) <= u0_m0_wo0_cma0_w(16);
    u0_m0_wo0_cma0_x(17) <= u0_m0_wo0_cma0_w(17);
    u0_m0_wo0_cma0_x(18) <= u0_m0_wo0_cma0_w(18);
    u0_m0_wo0_cma0_x(19) <= u0_m0_wo0_cma0_w(19);
    u0_m0_wo0_cma0_x(20) <= u0_m0_wo0_cma0_w(20);
    u0_m0_wo0_cma0_x(21) <= u0_m0_wo0_cma0_w(21);
    u0_m0_wo0_cma0_x(22) <= u0_m0_wo0_cma0_w(22);
    u0_m0_wo0_cma0_x(23) <= u0_m0_wo0_cma0_w(23);
    u0_m0_wo0_cma0_x(24) <= u0_m0_wo0_cma0_w(24);
    u0_m0_wo0_cma0_x(25) <= u0_m0_wo0_cma0_w(25);
    u0_m0_wo0_cma0_x(26) <= u0_m0_wo0_cma0_w(26);
    u0_m0_wo0_cma0_x(27) <= u0_m0_wo0_cma0_w(27);
    u0_m0_wo0_cma0_x(28) <= u0_m0_wo0_cma0_w(28);
    u0_m0_wo0_cma0_x(29) <= u0_m0_wo0_cma0_w(29);
    u0_m0_wo0_cma0_x(30) <= u0_m0_wo0_cma0_w(30);
    u0_m0_wo0_cma0_x(31) <= u0_m0_wo0_cma0_w(31);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_s(6) + u0_m0_wo0_cma0_x(5);
    u0_m0_wo0_cma0_y(6) <= u0_m0_wo0_cma0_s(7) + u0_m0_wo0_cma0_x(6);
    u0_m0_wo0_cma0_y(7) <= u0_m0_wo0_cma0_s(8) + u0_m0_wo0_cma0_x(7);
    u0_m0_wo0_cma0_y(8) <= u0_m0_wo0_cma0_s(9) + u0_m0_wo0_cma0_x(8);
    u0_m0_wo0_cma0_y(9) <= u0_m0_wo0_cma0_s(10) + u0_m0_wo0_cma0_x(9);
    u0_m0_wo0_cma0_y(10) <= u0_m0_wo0_cma0_s(11) + u0_m0_wo0_cma0_x(10);
    u0_m0_wo0_cma0_y(11) <= u0_m0_wo0_cma0_s(12) + u0_m0_wo0_cma0_x(11);
    u0_m0_wo0_cma0_y(12) <= u0_m0_wo0_cma0_s(13) + u0_m0_wo0_cma0_x(12);
    u0_m0_wo0_cma0_y(13) <= u0_m0_wo0_cma0_s(14) + u0_m0_wo0_cma0_x(13);
    u0_m0_wo0_cma0_y(14) <= u0_m0_wo0_cma0_s(15) + u0_m0_wo0_cma0_x(14);
    u0_m0_wo0_cma0_y(15) <= u0_m0_wo0_cma0_s(16) + u0_m0_wo0_cma0_x(15);
    u0_m0_wo0_cma0_y(16) <= u0_m0_wo0_cma0_s(17) + u0_m0_wo0_cma0_x(16);
    u0_m0_wo0_cma0_y(17) <= u0_m0_wo0_cma0_s(18) + u0_m0_wo0_cma0_x(17);
    u0_m0_wo0_cma0_y(18) <= u0_m0_wo0_cma0_s(19) + u0_m0_wo0_cma0_x(18);
    u0_m0_wo0_cma0_y(19) <= u0_m0_wo0_cma0_s(20) + u0_m0_wo0_cma0_x(19);
    u0_m0_wo0_cma0_y(20) <= u0_m0_wo0_cma0_s(21) + u0_m0_wo0_cma0_x(20);
    u0_m0_wo0_cma0_y(21) <= u0_m0_wo0_cma0_s(22) + u0_m0_wo0_cma0_x(21);
    u0_m0_wo0_cma0_y(22) <= u0_m0_wo0_cma0_s(23) + u0_m0_wo0_cma0_x(22);
    u0_m0_wo0_cma0_y(23) <= u0_m0_wo0_cma0_s(24) + u0_m0_wo0_cma0_x(23);
    u0_m0_wo0_cma0_y(24) <= u0_m0_wo0_cma0_s(25) + u0_m0_wo0_cma0_x(24);
    u0_m0_wo0_cma0_y(25) <= u0_m0_wo0_cma0_s(26) + u0_m0_wo0_cma0_x(25);
    u0_m0_wo0_cma0_y(26) <= u0_m0_wo0_cma0_s(27) + u0_m0_wo0_cma0_x(26);
    u0_m0_wo0_cma0_y(27) <= u0_m0_wo0_cma0_s(28) + u0_m0_wo0_cma0_x(27);
    u0_m0_wo0_cma0_y(28) <= u0_m0_wo0_cma0_s(29) + u0_m0_wo0_cma0_x(28);
    u0_m0_wo0_cma0_y(29) <= u0_m0_wo0_cma0_s(30) + u0_m0_wo0_cma0_x(29);
    u0_m0_wo0_cma0_y(30) <= u0_m0_wo0_cma0_s(31) + u0_m0_wo0_cma0_x(30);
    u0_m0_wo0_cma0_y(31) <= u0_m0_wo0_cma0_x(31);
    u0_m0_wo0_cma0_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_b0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_d <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena0 = '1') THEN
                u0_m0_wo0_cma0_a0(0) <= u0_m0_wo0_cma0_d(1);
                u0_m0_wo0_cma0_a0(1) <= u0_m0_wo0_cma0_d(2);
                u0_m0_wo0_cma0_a0(2) <= u0_m0_wo0_cma0_d(3);
                u0_m0_wo0_cma0_a0(3) <= u0_m0_wo0_cma0_d(4);
                u0_m0_wo0_cma0_a0(4) <= u0_m0_wo0_cma0_d(5);
                u0_m0_wo0_cma0_a0(5) <= u0_m0_wo0_cma0_d(6);
                u0_m0_wo0_cma0_a0(6) <= u0_m0_wo0_cma0_d(7);
                u0_m0_wo0_cma0_a0(7) <= u0_m0_wo0_cma0_d(8);
                u0_m0_wo0_cma0_a0(8) <= u0_m0_wo0_cma0_d(9);
                u0_m0_wo0_cma0_a0(9) <= u0_m0_wo0_cma0_d(10);
                u0_m0_wo0_cma0_a0(10) <= u0_m0_wo0_cma0_d(11);
                u0_m0_wo0_cma0_a0(11) <= u0_m0_wo0_cma0_d(12);
                u0_m0_wo0_cma0_a0(12) <= u0_m0_wo0_cma0_d(13);
                u0_m0_wo0_cma0_a0(13) <= u0_m0_wo0_cma0_d(14);
                u0_m0_wo0_cma0_a0(14) <= u0_m0_wo0_cma0_d(15);
                u0_m0_wo0_cma0_a0(15) <= u0_m0_wo0_cma0_d(16);
                u0_m0_wo0_cma0_a0(16) <= u0_m0_wo0_cma0_d(17);
                u0_m0_wo0_cma0_a0(17) <= u0_m0_wo0_cma0_d(18);
                u0_m0_wo0_cma0_a0(18) <= u0_m0_wo0_cma0_d(19);
                u0_m0_wo0_cma0_a0(19) <= u0_m0_wo0_cma0_d(20);
                u0_m0_wo0_cma0_a0(20) <= u0_m0_wo0_cma0_d(21);
                u0_m0_wo0_cma0_a0(21) <= u0_m0_wo0_cma0_d(22);
                u0_m0_wo0_cma0_a0(22) <= u0_m0_wo0_cma0_d(23);
                u0_m0_wo0_cma0_a0(23) <= u0_m0_wo0_cma0_d(24);
                u0_m0_wo0_cma0_a0(24) <= u0_m0_wo0_cma0_d(25);
                u0_m0_wo0_cma0_a0(25) <= u0_m0_wo0_cma0_d(26);
                u0_m0_wo0_cma0_a0(26) <= u0_m0_wo0_cma0_d(27);
                u0_m0_wo0_cma0_a0(27) <= u0_m0_wo0_cma0_d(28);
                u0_m0_wo0_cma0_a0(28) <= u0_m0_wo0_cma0_d(29);
                u0_m0_wo0_cma0_a0(29) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr32_q),12);
                u0_m0_wo0_cma0_a0(30) <= SIGNED(RESIZE(UNSIGNED(GND_q),12));
                u0_m0_wo0_cma0_a0(31) <= (others => '0');
                u0_m0_wo0_cma0_b0(0) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(1) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(2) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(3) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(4) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(5) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(6) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(7) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(8) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(9) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(10) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(11) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(12) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(13) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(14) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(15) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(16) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(17) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(18) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(19) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(20) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(21) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(22) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(23) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(24) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(25) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(26) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(27) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(28) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(29) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(30) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(31) <= (others => '0');
                u0_m0_wo0_cma0_c0(0) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(16) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(17) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(18) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(19) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(20) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(21) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(22) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(23) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(24) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(25) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(26) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(27) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(28) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(29) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(30) <= RESIZE(UNSIGNED(GND_q),3);
                u0_m0_wo0_cma0_c0(31) <= (others => '0');
                u0_m0_wo0_cma0_d(0) <= u0_m0_wo0_cma0_a0(0);
                u0_m0_wo0_cma0_d(1) <= u0_m0_wo0_cma0_a0(1);
                u0_m0_wo0_cma0_d(2) <= u0_m0_wo0_cma0_a0(2);
                u0_m0_wo0_cma0_d(3) <= u0_m0_wo0_cma0_a0(3);
                u0_m0_wo0_cma0_d(4) <= u0_m0_wo0_cma0_a0(4);
                u0_m0_wo0_cma0_d(5) <= u0_m0_wo0_cma0_a0(5);
                u0_m0_wo0_cma0_d(6) <= u0_m0_wo0_cma0_a0(6);
                u0_m0_wo0_cma0_d(7) <= u0_m0_wo0_cma0_a0(7);
                u0_m0_wo0_cma0_d(8) <= u0_m0_wo0_cma0_a0(8);
                u0_m0_wo0_cma0_d(9) <= u0_m0_wo0_cma0_a0(9);
                u0_m0_wo0_cma0_d(10) <= u0_m0_wo0_cma0_a0(10);
                u0_m0_wo0_cma0_d(11) <= u0_m0_wo0_cma0_a0(11);
                u0_m0_wo0_cma0_d(12) <= u0_m0_wo0_cma0_a0(12);
                u0_m0_wo0_cma0_d(13) <= u0_m0_wo0_cma0_a0(13);
                u0_m0_wo0_cma0_d(14) <= u0_m0_wo0_cma0_a0(14);
                u0_m0_wo0_cma0_d(15) <= u0_m0_wo0_cma0_a0(15);
                u0_m0_wo0_cma0_d(16) <= u0_m0_wo0_cma0_a0(16);
                u0_m0_wo0_cma0_d(17) <= u0_m0_wo0_cma0_a0(17);
                u0_m0_wo0_cma0_d(18) <= u0_m0_wo0_cma0_a0(18);
                u0_m0_wo0_cma0_d(19) <= u0_m0_wo0_cma0_a0(19);
                u0_m0_wo0_cma0_d(20) <= u0_m0_wo0_cma0_a0(20);
                u0_m0_wo0_cma0_d(21) <= u0_m0_wo0_cma0_a0(21);
                u0_m0_wo0_cma0_d(22) <= u0_m0_wo0_cma0_a0(22);
                u0_m0_wo0_cma0_d(23) <= u0_m0_wo0_cma0_a0(23);
                u0_m0_wo0_cma0_d(24) <= u0_m0_wo0_cma0_a0(24);
                u0_m0_wo0_cma0_d(25) <= u0_m0_wo0_cma0_a0(25);
                u0_m0_wo0_cma0_d(26) <= u0_m0_wo0_cma0_a0(26);
                u0_m0_wo0_cma0_d(27) <= u0_m0_wo0_cma0_a0(27);
                u0_m0_wo0_cma0_d(28) <= u0_m0_wo0_cma0_a0(28);
                u0_m0_wo0_cma0_d(29) <= u0_m0_wo0_cma0_a0(29);
                u0_m0_wo0_cma0_d(30) <= u0_m0_wo0_cma0_a0(30);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena1 = '1') THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
                u0_m0_wo0_cma0_s(4) <= u0_m0_wo0_cma0_y(4);
                u0_m0_wo0_cma0_s(5) <= u0_m0_wo0_cma0_y(5);
                u0_m0_wo0_cma0_s(6) <= u0_m0_wo0_cma0_y(6);
                u0_m0_wo0_cma0_s(7) <= u0_m0_wo0_cma0_y(7);
                u0_m0_wo0_cma0_s(8) <= u0_m0_wo0_cma0_y(8);
                u0_m0_wo0_cma0_s(9) <= u0_m0_wo0_cma0_y(9);
                u0_m0_wo0_cma0_s(10) <= u0_m0_wo0_cma0_y(10);
                u0_m0_wo0_cma0_s(11) <= u0_m0_wo0_cma0_y(11);
                u0_m0_wo0_cma0_s(12) <= u0_m0_wo0_cma0_y(12);
                u0_m0_wo0_cma0_s(13) <= u0_m0_wo0_cma0_y(13);
                u0_m0_wo0_cma0_s(14) <= u0_m0_wo0_cma0_y(14);
                u0_m0_wo0_cma0_s(15) <= u0_m0_wo0_cma0_y(15);
                u0_m0_wo0_cma0_s(16) <= u0_m0_wo0_cma0_y(16);
                u0_m0_wo0_cma0_s(17) <= u0_m0_wo0_cma0_y(17);
                u0_m0_wo0_cma0_s(18) <= u0_m0_wo0_cma0_y(18);
                u0_m0_wo0_cma0_s(19) <= u0_m0_wo0_cma0_y(19);
                u0_m0_wo0_cma0_s(20) <= u0_m0_wo0_cma0_y(20);
                u0_m0_wo0_cma0_s(21) <= u0_m0_wo0_cma0_y(21);
                u0_m0_wo0_cma0_s(22) <= u0_m0_wo0_cma0_y(22);
                u0_m0_wo0_cma0_s(23) <= u0_m0_wo0_cma0_y(23);
                u0_m0_wo0_cma0_s(24) <= u0_m0_wo0_cma0_y(24);
                u0_m0_wo0_cma0_s(25) <= u0_m0_wo0_cma0_y(25);
                u0_m0_wo0_cma0_s(26) <= u0_m0_wo0_cma0_y(26);
                u0_m0_wo0_cma0_s(27) <= u0_m0_wo0_cma0_y(27);
                u0_m0_wo0_cma0_s(28) <= u0_m0_wo0_cma0_y(28);
                u0_m0_wo0_cma0_s(29) <= u0_m0_wo0_cma0_y(29);
                u0_m0_wo0_cma0_s(30) <= u0_m0_wo0_cma0_y(30);
                u0_m0_wo0_cma0_s(31) <= u0_m0_wo0_cma0_y(31);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(28 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(28 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_oseq_gated_reg(REG,147)@11 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_11_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,149)@12
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,151)@12
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,152)@12 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_cma0_q(27 downto 0);

END normal;
