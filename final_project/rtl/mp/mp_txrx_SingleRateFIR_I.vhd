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

-- VHDL created from mp_txrx_SingleRateFIR_I
-- VHDL created on Wed May 22 14:10:30 2019


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

entity mp_txrx_SingleRateFIR_I is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(11 downto 0);  -- sfix12
        busIn_writedata : in std_logic_vector(15 downto 0);  -- sfix16
        busIn_address : in std_logic_vector(9 downto 0);  -- sfix10
        busIn_write : in std_logic_vector(0 downto 0);  -- sfix1
        busIn_read : in std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(29 downto 0);  -- sfix30
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end mp_txrx_SingleRateFIR_I;

architecture normal of mp_txrx_SingleRateFIR_I is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_read_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_writedata_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rblookup_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rblookup_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_c : STD_LOGIC_VECTOR (0 downto 0);
    signal d_rblookup_h_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rm_reset0 : std_logic;
    signal rm_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal rm_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal rm_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal rm_iq : STD_LOGIC_VECTOR (9 downto 0);
    signal rm_q : STD_LOGIC_VECTOR (9 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_split32_c_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr65_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr66_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr67_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr68_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr69_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr70_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr71_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr72_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr73_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr74_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr75_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr76_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr77_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr78_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr79_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr80_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr82_q : STD_LOGIC_VECTOR (11 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr82_q_11_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr99_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr100_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr101_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr102_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr103_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr104_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr105_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr106_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr107_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr108_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr109_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr110_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr111_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr112_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr113_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr114_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_dec0_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec0_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec1_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec2_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec3_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec4_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec5_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec6_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec7_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec7_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec8_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec9_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec9_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec10_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec10_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec11_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec11_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec12_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec12_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec13_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec13_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm13_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec14_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec14_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec15_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec15_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec16_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec16_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec17_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec17_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec18_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec18_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec19_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec19_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec20_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec20_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec21_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec21_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm21_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec22_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec22_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm22_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec23_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec23_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm23_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec24_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec24_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm24_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec25_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec25_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm25_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec26_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec26_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm26_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec27_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec27_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm27_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec28_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec28_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm28_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec29_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec29_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm29_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec30_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec30_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm30_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec31_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec31_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm31_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec32_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec32_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm32_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec33_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec33_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm33_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec34_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec34_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm34_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec35_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec35_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm35_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec36_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec36_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm36_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec37_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec37_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm37_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec38_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec38_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm38_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec39_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec39_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm39_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec40_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec40_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm40_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec41_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec41_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm41_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec42_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec42_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm42_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec43_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec43_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm43_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec44_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec44_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm44_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec45_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec45_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm45_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec46_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec46_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm46_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec47_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec47_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm47_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec48_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec48_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm48_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec49_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec49_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm49_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec50_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec50_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm50_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec51_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec51_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm51_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec52_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec52_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm52_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec53_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec53_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm53_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec54_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec54_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm54_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec55_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec55_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm55_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec56_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec56_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm56_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec57_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec57_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm57_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec58_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec58_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm58_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec59_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec59_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm59_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec60_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec60_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm60_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec61_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec61_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm61_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec62_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec62_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm62_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec63_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec63_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm63_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec64_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec64_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm64_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec65_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec65_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm65_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec66_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec66_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm66_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec67_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec67_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm67_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec68_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec68_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm68_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec69_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec69_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm69_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec70_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec70_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm70_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec71_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec71_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm71_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec72_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec72_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm72_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec73_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec73_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm73_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec74_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec74_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm74_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec75_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec75_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm75_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec76_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec76_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm76_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec77_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec77_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm77_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec78_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec78_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm78_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec79_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec79_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm79_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec80_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec80_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm80_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    signal u0_m0_wo0_cma0_b0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_b0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    signal u0_m0_wo0_cma0_d : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_d : signal is true;
    type u0_m0_wo0_cma0_ltype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_ltype(0 to 31);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 31);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_cma1_reset : std_logic;
    signal u0_m0_wo0_cma1_a0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma1_a0 : signal is true;
    signal u0_m0_wo0_cma1_b0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma1_b0 : signal is true;
    signal u0_m0_wo0_cma1_c0 : u0_m0_wo0_cma0_c0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma1_c0 : signal is true;
    signal u0_m0_wo0_cma1_d : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma1_d : signal is true;
    signal u0_m0_wo0_cma1_l : u0_m0_wo0_cma0_ltype(0 to 31);
    signal u0_m0_wo0_cma1_p : u0_m0_wo0_cma0_ptype(0 to 31);
    signal u0_m0_wo0_cma1_u : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma1_w : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma1_x : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma1_y : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma1_s : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma1_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma1_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma1_ena0 : std_logic;
    signal u0_m0_wo0_cma1_ena1 : std_logic;
    signal u0_m0_wo0_cma2_reset : std_logic;
    signal u0_m0_wo0_cma2_a0 : u0_m0_wo0_cma0_a0type(0 to 17);
    attribute preserve of u0_m0_wo0_cma2_a0 : signal is true;
    signal u0_m0_wo0_cma2_b0 : u0_m0_wo0_cma0_a0type(0 to 17);
    attribute preserve of u0_m0_wo0_cma2_b0 : signal is true;
    signal u0_m0_wo0_cma2_c0 : u0_m0_wo0_cma0_c0type(0 to 17);
    attribute preserve of u0_m0_wo0_cma2_c0 : signal is true;
    signal u0_m0_wo0_cma2_d : u0_m0_wo0_cma0_a0type(0 to 16);
    attribute preserve of u0_m0_wo0_cma2_d : signal is true;
    signal u0_m0_wo0_cma2_l : u0_m0_wo0_cma0_ltype(0 to 17);
    signal u0_m0_wo0_cma2_p : u0_m0_wo0_cma0_ptype(0 to 17);
    signal u0_m0_wo0_cma2_u : u0_m0_wo0_cma0_utype(0 to 17);
    signal u0_m0_wo0_cma2_w : u0_m0_wo0_cma0_utype(0 to 17);
    signal u0_m0_wo0_cma2_x : u0_m0_wo0_cma0_utype(0 to 17);
    signal u0_m0_wo0_cma2_y : u0_m0_wo0_cma0_utype(0 to 17);
    signal u0_m0_wo0_cma2_s : u0_m0_wo0_cma0_utype(0 to 17);
    signal u0_m0_wo0_cma2_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma2_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma2_ena0 : std_logic;
    signal u0_m0_wo0_cma2_ena1 : std_logic;
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr32_mem_ia : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_iq : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr32_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr32_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_mem_last_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q : signal is true;
    signal rblookup_read_hit_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_rdmux_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr98_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr130_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rmPad_sel_b : STD_LOGIC_VECTOR (15 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_split32_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_split32_c : STD_LOGIC_VECTOR (11 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_join32_q : STD_LOGIC_VECTOR (23 downto 0);

begin


    -- d_busIn_writedata_11(DELAY,529)@10 + 1
    d_busIn_writedata_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_writedata, xout => d_busIn_writedata_11_q, clk => clk, aclr => h_areset );

    -- rblookup(LOOKUP,4)@10 + 1
    rblookup_c <= STD_LOGIC_VECTOR(busIn_write);
    rblookup_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_q <= "0000000";
            rblookup_h <= "0";
            rblookup_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => rblookup_q <= (others => '-');
                               rblookup_h <= "0";
                               rblookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- rm(DUALMEM,7)@11 + 2
    rm_ia <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
    rm_aa <= rblookup_q;
    rm_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "SINGLE_PORT",
        width_a => 10,
        widthad_a => 7,
        numwords_a => 81,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "NONE",
        clock_enable_input_a => "NORMAL",
        read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/mp/mp_txrx_SingleRateFIR_I_rm.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => rm_aa,
        data_a => rm_ia,
        wren_a => rblookup_e(0),
        q_a => rm_iq
    );
    rm_q <= rm_iq(9 downto 0);

    -- rmPad_sel(BITSELECT,527)@13
    rmPad_sel_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(rm_q(9 downto 0)), 16)));

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_busIn_read_12(DELAY,530)@10 + 2
    d_busIn_read_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_read, xout => d_busIn_read_12_q, clk => clk, aclr => h_areset );

    -- d_rblookup_h_12(DELAY,531)@11 + 1
    d_rblookup_h_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rblookup_h, xout => d_rblookup_h_12_q, clk => clk, aclr => h_areset );

    -- rblookup_read_hit(LOGICAL,5)@12
    rblookup_read_hit_q <= d_rblookup_h_12_q and d_busIn_read_12_q;

    -- rblookup_valid(REG,6)@12 + 1
    rblookup_valid_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_valid_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            rblookup_valid_q <= STD_LOGIC_VECTOR(rblookup_read_hit_q);
        END IF;
    END PROCESS;

    -- busOut(BUSOUT,9)@13
    busOut_readdatavalid <= rblookup_valid_q;
    busOut_readdata <= rmPad_sel_b;

    -- u0_m0_wo0_dec80(LOOKUP,432)@10 + 1
    u0_m0_wo0_dec80_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec80_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec80_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec80_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm80(REG,433)@11 + 1
    u0_m0_wo0_cm80_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm80_q <= "0110001011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec80_e = "1") THEN
                u0_m0_wo0_cm80_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_notEnable(LOGICAL,561)@10
    u0_m0_wo0_wi0_r0_delayr32_notEnable_q <= STD_LOGIC_VECTOR(not (xIn_v));

    -- u0_m0_wo0_wi0_r0_delayr32_nor(LOGICAL,562)@10
    u0_m0_wo0_wi0_r0_delayr32_nor_q <= not (u0_m0_wo0_wi0_r0_delayr32_notEnable_q or u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr32_mem_last(CONSTANT,558)
    u0_m0_wo0_wi0_r0_delayr32_mem_last_q <= "011101";

    -- u0_m0_wo0_wi0_r0_delayr32_cmp(LOGICAL,559)@10
    u0_m0_wo0_wi0_r0_delayr32_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr32_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr32_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr32_mem_last_q = u0_m0_wo0_wi0_r0_delayr32_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr32_cmpReg(REG,560)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_r0_delayr32_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_sticky_ena(REG,563)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr32_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_enaAnd(LOGICAL,564)@10
    u0_m0_wo0_wi0_r0_delayr32_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr32_sticky_ena_q and xIn_v;

    -- u0_m0_wo0_wi0_r0_delayr32_rdcnt(COUNTER,555)@10 + 1
    -- low=0, high=30, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr32_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= TO_UNSIGNED(0, 5);
            u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                IF (u0_m0_wo0_wi0_r0_delayr32_rdcnt_i = TO_UNSIGNED(29, 5)) THEN
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_delayr32_rdcnt_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_delayr32_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr32_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr32_rdcnt_i, 5)));

    -- u0_m0_wo0_wi0_r0_delayr32_rdmux(MUX,556)@10
    u0_m0_wo0_wi0_r0_delayr32_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_r0_delayr32_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr32_rdmux_s, u0_m0_wo0_wi0_r0_delayr32_wraddr_q, u0_m0_wo0_wi0_r0_delayr32_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr32_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= u0_m0_wo0_wi0_r0_delayr32_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= u0_m0_wo0_wi0_r0_delayr32_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr32_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join32(BITJOIN,58)@10
    u0_m0_wo0_wi0_r0_join32_q <= u0_m0_wo0_wi0_r0_split32_b & xIn_0;

    -- u0_m0_wo0_wi0_r0_delayr32_wraddr(REG,557)@10 + 1
    u0_m0_wo0_wi0_r0_delayr32_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_wraddr_q <= "11110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr32_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32_mem(DUALMEM,554)@10 + 2
    u0_m0_wo0_wi0_r0_delayr32_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join32_q);
    u0_m0_wo0_wi0_r0_delayr32_mem_aa <= u0_m0_wo0_wi0_r0_delayr32_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr32_mem_ab <= u0_m0_wo0_wi0_r0_delayr32_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr32_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr32_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 24,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 24,
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
        clocken1 => u0_m0_wo0_wi0_r0_delayr32_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr32_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr32_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr32_mem_ia,
        wren_a => xIn_v(0),
        address_b => u0_m0_wo0_wi0_r0_delayr32_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr32_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr32_mem_q <= u0_m0_wo0_wi0_r0_delayr32_mem_iq(23 downto 0);

    -- u0_m0_wo0_wi0_r0_split32(BITSELECT,59)@10
    u0_m0_wo0_wi0_r0_split32_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_mem_q(11 downto 0));
    u0_m0_wo0_wi0_r0_split32_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr32_mem_q(23 downto 12));

    -- d_u0_m0_wo0_wi0_r0_delayr80_q_11(DELAY,552)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr80_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr80_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec79(LOOKUP,429)@10 + 1
    u0_m0_wo0_dec79_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec79_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec79_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec79_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm79(REG,430)@11 + 1
    u0_m0_wo0_cm79_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm79_q <= "0110001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec79_e = "1") THEN
                u0_m0_wo0_cm79_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr79_q_11(DELAY,551)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr79_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr79_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr82(DELAY,109)@10
    u0_m0_wo0_wi0_r0_delayr82 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => u0_m0_wo0_wi0_r0_delayr82_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr82_q_11(DELAY,553)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr82_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr82_q, xout => d_u0_m0_wo0_wi0_r0_delayr82_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec78(LOOKUP,426)@10 + 1
    u0_m0_wo0_dec78_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec78_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec78_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec78_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm78(REG,427)@11 + 1
    u0_m0_wo0_cm78_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm78_q <= "0110001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec78_e = "1") THEN
                u0_m0_wo0_cm78_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr78_q_11(DELAY,550)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr78_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr78_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec77(LOOKUP,423)@10 + 1
    u0_m0_wo0_dec77_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec77_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec77_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec77_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm77(REG,424)@11 + 1
    u0_m0_wo0_cm77_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm77_q <= "0110000100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec77_e = "1") THEN
                u0_m0_wo0_cm77_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr77_q_11(DELAY,549)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr77_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr77_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec76(LOOKUP,420)@10 + 1
    u0_m0_wo0_dec76_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec76_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec76_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec76_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm76(REG,421)@11 + 1
    u0_m0_wo0_cm76_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm76_q <= "0101111110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec76_e = "1") THEN
                u0_m0_wo0_cm76_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr76_q_11(DELAY,548)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr76_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr76_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec75(LOOKUP,417)@10 + 1
    u0_m0_wo0_dec75_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec75_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec75_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec75_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm75(REG,418)@11 + 1
    u0_m0_wo0_cm75_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm75_q <= "0101111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec75_e = "1") THEN
                u0_m0_wo0_cm75_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr75_q_11(DELAY,547)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr75_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr75_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec74(LOOKUP,414)@10 + 1
    u0_m0_wo0_dec74_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec74_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec74_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec74_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm74(REG,415)@11 + 1
    u0_m0_wo0_cm74_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm74_q <= "0101110000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec74_e = "1") THEN
                u0_m0_wo0_cm74_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr74_q_11(DELAY,546)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr74_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr74_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec73(LOOKUP,411)@10 + 1
    u0_m0_wo0_dec73_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec73_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec73_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec73_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm73(REG,412)@11 + 1
    u0_m0_wo0_cm73_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm73_q <= "0101100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec73_e = "1") THEN
                u0_m0_wo0_cm73_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr73_q_11(DELAY,545)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr73_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr73_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec72(LOOKUP,408)@10 + 1
    u0_m0_wo0_dec72_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec72_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec72_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec72_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm72(REG,409)@11 + 1
    u0_m0_wo0_cm72_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm72_q <= "0101011011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec72_e = "1") THEN
                u0_m0_wo0_cm72_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr72_q_11(DELAY,544)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr72_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr72_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec71(LOOKUP,405)@10 + 1
    u0_m0_wo0_dec71_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec71_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec71_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec71_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm71(REG,406)@11 + 1
    u0_m0_wo0_cm71_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm71_q <= "0101001111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec71_e = "1") THEN
                u0_m0_wo0_cm71_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr71_q_11(DELAY,543)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr71_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr71_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec70(LOOKUP,402)@10 + 1
    u0_m0_wo0_dec70_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec70_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec70_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec70_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm70(REG,403)@11 + 1
    u0_m0_wo0_cm70_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm70_q <= "0101000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec70_e = "1") THEN
                u0_m0_wo0_cm70_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr70_q_11(DELAY,542)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr70_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr70_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec69(LOOKUP,399)@10 + 1
    u0_m0_wo0_dec69_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec69_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec69_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec69_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm69(REG,400)@11 + 1
    u0_m0_wo0_cm69_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm69_q <= "0100110101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec69_e = "1") THEN
                u0_m0_wo0_cm69_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr69_q_11(DELAY,541)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr69_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr69_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec68(LOOKUP,396)@10 + 1
    u0_m0_wo0_dec68_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec68_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec68_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec68_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm68(REG,397)@11 + 1
    u0_m0_wo0_cm68_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm68_q <= "0100100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec68_e = "1") THEN
                u0_m0_wo0_cm68_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr68_q_11(DELAY,540)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr68_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr68_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec67(LOOKUP,393)@10 + 1
    u0_m0_wo0_dec67_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec67_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec67_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec67_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm67(REG,394)@11 + 1
    u0_m0_wo0_cm67_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm67_q <= "0100010111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec67_e = "1") THEN
                u0_m0_wo0_cm67_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr67_q_11(DELAY,539)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr67_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr67_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec66(LOOKUP,390)@10 + 1
    u0_m0_wo0_dec66_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec66_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec66_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec66_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm66(REG,391)@11 + 1
    u0_m0_wo0_cm66_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm66_q <= "0100000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec66_e = "1") THEN
                u0_m0_wo0_cm66_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr66_q_11(DELAY,538)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr66_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr66_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec65(LOOKUP,387)@10 + 1
    u0_m0_wo0_dec65_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec65_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec65_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec65_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm65(REG,388)@11 + 1
    u0_m0_wo0_cm65_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm65_q <= "0011110110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec65_e = "1") THEN
                u0_m0_wo0_cm65_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_delayr65_q_11(DELAY,537)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr65_q_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_delayr65_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_dec64(LOOKUP,384)@10 + 1
    u0_m0_wo0_dec64_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec64_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec64_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec64_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm64(REG,385)@11 + 1
    u0_m0_wo0_cm64_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm64_q <= "0011100101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec64_e = "1") THEN
                u0_m0_wo0_cm64_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_wi0_r0_split32_c_11(DELAY,536)@10 + 1
    d_u0_m0_wo0_wi0_r0_split32_c_11 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_split32_c, xout => d_u0_m0_wo0_wi0_r0_split32_c_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,534)@11 + 1
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,533)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma2(CHAINMULTADD,518)@11 + 2
    u0_m0_wo0_cma2_reset <= areset;
    u0_m0_wo0_cma2_ena0 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma2_ena1 <= d_u0_m0_wo0_compute_q_12_q(0);
    u0_m0_wo0_cma2_l(0) <= RESIZE(u0_m0_wo0_cma2_a0(0),13) + RESIZE(u0_m0_wo0_cma2_b0(0),13);
    u0_m0_wo0_cma2_l(1) <= RESIZE(u0_m0_wo0_cma2_a0(1),13) + RESIZE(u0_m0_wo0_cma2_b0(1),13);
    u0_m0_wo0_cma2_l(2) <= RESIZE(u0_m0_wo0_cma2_a0(2),13) + RESIZE(u0_m0_wo0_cma2_b0(2),13);
    u0_m0_wo0_cma2_l(3) <= RESIZE(u0_m0_wo0_cma2_a0(3),13) + RESIZE(u0_m0_wo0_cma2_b0(3),13);
    u0_m0_wo0_cma2_l(4) <= RESIZE(u0_m0_wo0_cma2_a0(4),13) + RESIZE(u0_m0_wo0_cma2_b0(4),13);
    u0_m0_wo0_cma2_l(5) <= RESIZE(u0_m0_wo0_cma2_a0(5),13) + RESIZE(u0_m0_wo0_cma2_b0(5),13);
    u0_m0_wo0_cma2_l(6) <= RESIZE(u0_m0_wo0_cma2_a0(6),13) + RESIZE(u0_m0_wo0_cma2_b0(6),13);
    u0_m0_wo0_cma2_l(7) <= RESIZE(u0_m0_wo0_cma2_a0(7),13) + RESIZE(u0_m0_wo0_cma2_b0(7),13);
    u0_m0_wo0_cma2_l(8) <= RESIZE(u0_m0_wo0_cma2_a0(8),13) + RESIZE(u0_m0_wo0_cma2_b0(8),13);
    u0_m0_wo0_cma2_l(9) <= RESIZE(u0_m0_wo0_cma2_a0(9),13) + RESIZE(u0_m0_wo0_cma2_b0(9),13);
    u0_m0_wo0_cma2_l(10) <= RESIZE(u0_m0_wo0_cma2_a0(10),13) + RESIZE(u0_m0_wo0_cma2_b0(10),13);
    u0_m0_wo0_cma2_l(11) <= RESIZE(u0_m0_wo0_cma2_a0(11),13) + RESIZE(u0_m0_wo0_cma2_b0(11),13);
    u0_m0_wo0_cma2_l(12) <= RESIZE(u0_m0_wo0_cma2_a0(12),13) + RESIZE(u0_m0_wo0_cma2_b0(12),13);
    u0_m0_wo0_cma2_l(13) <= RESIZE(u0_m0_wo0_cma2_a0(13),13) + RESIZE(u0_m0_wo0_cma2_b0(13),13);
    u0_m0_wo0_cma2_l(14) <= RESIZE(u0_m0_wo0_cma2_a0(14),13) + RESIZE(u0_m0_wo0_cma2_b0(14),13);
    u0_m0_wo0_cma2_l(15) <= RESIZE(u0_m0_wo0_cma2_a0(15),13) + RESIZE(u0_m0_wo0_cma2_b0(15),13);
    u0_m0_wo0_cma2_l(16) <= RESIZE(u0_m0_wo0_cma2_a0(16),13) + RESIZE(u0_m0_wo0_cma2_b0(16),13);
    u0_m0_wo0_cma2_l(17) <= RESIZE(u0_m0_wo0_cma2_a0(17),13) + RESIZE(u0_m0_wo0_cma2_b0(17),13);
    u0_m0_wo0_cma2_p(0) <= u0_m0_wo0_cma2_l(0) * u0_m0_wo0_cma2_c0(0);
    u0_m0_wo0_cma2_p(1) <= u0_m0_wo0_cma2_l(1) * u0_m0_wo0_cma2_c0(1);
    u0_m0_wo0_cma2_p(2) <= u0_m0_wo0_cma2_l(2) * u0_m0_wo0_cma2_c0(2);
    u0_m0_wo0_cma2_p(3) <= u0_m0_wo0_cma2_l(3) * u0_m0_wo0_cma2_c0(3);
    u0_m0_wo0_cma2_p(4) <= u0_m0_wo0_cma2_l(4) * u0_m0_wo0_cma2_c0(4);
    u0_m0_wo0_cma2_p(5) <= u0_m0_wo0_cma2_l(5) * u0_m0_wo0_cma2_c0(5);
    u0_m0_wo0_cma2_p(6) <= u0_m0_wo0_cma2_l(6) * u0_m0_wo0_cma2_c0(6);
    u0_m0_wo0_cma2_p(7) <= u0_m0_wo0_cma2_l(7) * u0_m0_wo0_cma2_c0(7);
    u0_m0_wo0_cma2_p(8) <= u0_m0_wo0_cma2_l(8) * u0_m0_wo0_cma2_c0(8);
    u0_m0_wo0_cma2_p(9) <= u0_m0_wo0_cma2_l(9) * u0_m0_wo0_cma2_c0(9);
    u0_m0_wo0_cma2_p(10) <= u0_m0_wo0_cma2_l(10) * u0_m0_wo0_cma2_c0(10);
    u0_m0_wo0_cma2_p(11) <= u0_m0_wo0_cma2_l(11) * u0_m0_wo0_cma2_c0(11);
    u0_m0_wo0_cma2_p(12) <= u0_m0_wo0_cma2_l(12) * u0_m0_wo0_cma2_c0(12);
    u0_m0_wo0_cma2_p(13) <= u0_m0_wo0_cma2_l(13) * u0_m0_wo0_cma2_c0(13);
    u0_m0_wo0_cma2_p(14) <= u0_m0_wo0_cma2_l(14) * u0_m0_wo0_cma2_c0(14);
    u0_m0_wo0_cma2_p(15) <= u0_m0_wo0_cma2_l(15) * u0_m0_wo0_cma2_c0(15);
    u0_m0_wo0_cma2_p(16) <= u0_m0_wo0_cma2_l(16) * u0_m0_wo0_cma2_c0(16);
    u0_m0_wo0_cma2_p(17) <= u0_m0_wo0_cma2_l(17) * u0_m0_wo0_cma2_c0(17);
    u0_m0_wo0_cma2_u(0) <= RESIZE(u0_m0_wo0_cma2_p(0),29);
    u0_m0_wo0_cma2_u(1) <= RESIZE(u0_m0_wo0_cma2_p(1),29);
    u0_m0_wo0_cma2_u(2) <= RESIZE(u0_m0_wo0_cma2_p(2),29);
    u0_m0_wo0_cma2_u(3) <= RESIZE(u0_m0_wo0_cma2_p(3),29);
    u0_m0_wo0_cma2_u(4) <= RESIZE(u0_m0_wo0_cma2_p(4),29);
    u0_m0_wo0_cma2_u(5) <= RESIZE(u0_m0_wo0_cma2_p(5),29);
    u0_m0_wo0_cma2_u(6) <= RESIZE(u0_m0_wo0_cma2_p(6),29);
    u0_m0_wo0_cma2_u(7) <= RESIZE(u0_m0_wo0_cma2_p(7),29);
    u0_m0_wo0_cma2_u(8) <= RESIZE(u0_m0_wo0_cma2_p(8),29);
    u0_m0_wo0_cma2_u(9) <= RESIZE(u0_m0_wo0_cma2_p(9),29);
    u0_m0_wo0_cma2_u(10) <= RESIZE(u0_m0_wo0_cma2_p(10),29);
    u0_m0_wo0_cma2_u(11) <= RESIZE(u0_m0_wo0_cma2_p(11),29);
    u0_m0_wo0_cma2_u(12) <= RESIZE(u0_m0_wo0_cma2_p(12),29);
    u0_m0_wo0_cma2_u(13) <= RESIZE(u0_m0_wo0_cma2_p(13),29);
    u0_m0_wo0_cma2_u(14) <= RESIZE(u0_m0_wo0_cma2_p(14),29);
    u0_m0_wo0_cma2_u(15) <= RESIZE(u0_m0_wo0_cma2_p(15),29);
    u0_m0_wo0_cma2_u(16) <= RESIZE(u0_m0_wo0_cma2_p(16),29);
    u0_m0_wo0_cma2_u(17) <= RESIZE(u0_m0_wo0_cma2_p(17),29);
    u0_m0_wo0_cma2_w(0) <= u0_m0_wo0_cma2_u(0);
    u0_m0_wo0_cma2_w(1) <= u0_m0_wo0_cma2_u(1);
    u0_m0_wo0_cma2_w(2) <= u0_m0_wo0_cma2_u(2);
    u0_m0_wo0_cma2_w(3) <= u0_m0_wo0_cma2_u(3);
    u0_m0_wo0_cma2_w(4) <= u0_m0_wo0_cma2_u(4);
    u0_m0_wo0_cma2_w(5) <= u0_m0_wo0_cma2_u(5);
    u0_m0_wo0_cma2_w(6) <= u0_m0_wo0_cma2_u(6);
    u0_m0_wo0_cma2_w(7) <= u0_m0_wo0_cma2_u(7);
    u0_m0_wo0_cma2_w(8) <= u0_m0_wo0_cma2_u(8);
    u0_m0_wo0_cma2_w(9) <= u0_m0_wo0_cma2_u(9);
    u0_m0_wo0_cma2_w(10) <= u0_m0_wo0_cma2_u(10);
    u0_m0_wo0_cma2_w(11) <= u0_m0_wo0_cma2_u(11);
    u0_m0_wo0_cma2_w(12) <= u0_m0_wo0_cma2_u(12);
    u0_m0_wo0_cma2_w(13) <= u0_m0_wo0_cma2_u(13);
    u0_m0_wo0_cma2_w(14) <= u0_m0_wo0_cma2_u(14);
    u0_m0_wo0_cma2_w(15) <= u0_m0_wo0_cma2_u(15);
    u0_m0_wo0_cma2_w(16) <= u0_m0_wo0_cma2_u(16);
    u0_m0_wo0_cma2_w(17) <= u0_m0_wo0_cma2_u(17);
    u0_m0_wo0_cma2_x(0) <= u0_m0_wo0_cma2_w(0);
    u0_m0_wo0_cma2_x(1) <= u0_m0_wo0_cma2_w(1);
    u0_m0_wo0_cma2_x(2) <= u0_m0_wo0_cma2_w(2);
    u0_m0_wo0_cma2_x(3) <= u0_m0_wo0_cma2_w(3);
    u0_m0_wo0_cma2_x(4) <= u0_m0_wo0_cma2_w(4);
    u0_m0_wo0_cma2_x(5) <= u0_m0_wo0_cma2_w(5);
    u0_m0_wo0_cma2_x(6) <= u0_m0_wo0_cma2_w(6);
    u0_m0_wo0_cma2_x(7) <= u0_m0_wo0_cma2_w(7);
    u0_m0_wo0_cma2_x(8) <= u0_m0_wo0_cma2_w(8);
    u0_m0_wo0_cma2_x(9) <= u0_m0_wo0_cma2_w(9);
    u0_m0_wo0_cma2_x(10) <= u0_m0_wo0_cma2_w(10);
    u0_m0_wo0_cma2_x(11) <= u0_m0_wo0_cma2_w(11);
    u0_m0_wo0_cma2_x(12) <= u0_m0_wo0_cma2_w(12);
    u0_m0_wo0_cma2_x(13) <= u0_m0_wo0_cma2_w(13);
    u0_m0_wo0_cma2_x(14) <= u0_m0_wo0_cma2_w(14);
    u0_m0_wo0_cma2_x(15) <= u0_m0_wo0_cma2_w(15);
    u0_m0_wo0_cma2_x(16) <= u0_m0_wo0_cma2_w(16);
    u0_m0_wo0_cma2_x(17) <= u0_m0_wo0_cma2_w(17);
    u0_m0_wo0_cma2_y(0) <= u0_m0_wo0_cma2_s(1) + u0_m0_wo0_cma2_x(0);
    u0_m0_wo0_cma2_y(1) <= u0_m0_wo0_cma2_s(2) + u0_m0_wo0_cma2_x(1);
    u0_m0_wo0_cma2_y(2) <= u0_m0_wo0_cma2_s(3) + u0_m0_wo0_cma2_x(2);
    u0_m0_wo0_cma2_y(3) <= u0_m0_wo0_cma2_s(4) + u0_m0_wo0_cma2_x(3);
    u0_m0_wo0_cma2_y(4) <= u0_m0_wo0_cma2_s(5) + u0_m0_wo0_cma2_x(4);
    u0_m0_wo0_cma2_y(5) <= u0_m0_wo0_cma2_s(6) + u0_m0_wo0_cma2_x(5);
    u0_m0_wo0_cma2_y(6) <= u0_m0_wo0_cma2_s(7) + u0_m0_wo0_cma2_x(6);
    u0_m0_wo0_cma2_y(7) <= u0_m0_wo0_cma2_s(8) + u0_m0_wo0_cma2_x(7);
    u0_m0_wo0_cma2_y(8) <= u0_m0_wo0_cma2_s(9) + u0_m0_wo0_cma2_x(8);
    u0_m0_wo0_cma2_y(9) <= u0_m0_wo0_cma2_s(10) + u0_m0_wo0_cma2_x(9);
    u0_m0_wo0_cma2_y(10) <= u0_m0_wo0_cma2_s(11) + u0_m0_wo0_cma2_x(10);
    u0_m0_wo0_cma2_y(11) <= u0_m0_wo0_cma2_s(12) + u0_m0_wo0_cma2_x(11);
    u0_m0_wo0_cma2_y(12) <= u0_m0_wo0_cma2_s(13) + u0_m0_wo0_cma2_x(12);
    u0_m0_wo0_cma2_y(13) <= u0_m0_wo0_cma2_s(14) + u0_m0_wo0_cma2_x(13);
    u0_m0_wo0_cma2_y(14) <= u0_m0_wo0_cma2_s(15) + u0_m0_wo0_cma2_x(14);
    u0_m0_wo0_cma2_y(15) <= u0_m0_wo0_cma2_s(16) + u0_m0_wo0_cma2_x(15);
    u0_m0_wo0_cma2_y(16) <= u0_m0_wo0_cma2_s(17) + u0_m0_wo0_cma2_x(16);
    u0_m0_wo0_cma2_y(17) <= u0_m0_wo0_cma2_x(17);
    u0_m0_wo0_cma2_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma2_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma2_b0 <= (others => (others => '0'));
            u0_m0_wo0_cma2_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma2_d <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma2_ena0 = '1') THEN
                u0_m0_wo0_cma2_a0(0) <= u0_m0_wo0_cma2_d(1);
                u0_m0_wo0_cma2_a0(1) <= u0_m0_wo0_cma2_d(2);
                u0_m0_wo0_cma2_a0(2) <= u0_m0_wo0_cma2_d(3);
                u0_m0_wo0_cma2_a0(3) <= u0_m0_wo0_cma2_d(4);
                u0_m0_wo0_cma2_a0(4) <= u0_m0_wo0_cma2_d(5);
                u0_m0_wo0_cma2_a0(5) <= u0_m0_wo0_cma2_d(6);
                u0_m0_wo0_cma2_a0(6) <= u0_m0_wo0_cma2_d(7);
                u0_m0_wo0_cma2_a0(7) <= u0_m0_wo0_cma2_d(8);
                u0_m0_wo0_cma2_a0(8) <= u0_m0_wo0_cma2_d(9);
                u0_m0_wo0_cma2_a0(9) <= u0_m0_wo0_cma2_d(10);
                u0_m0_wo0_cma2_a0(10) <= u0_m0_wo0_cma2_d(11);
                u0_m0_wo0_cma2_a0(11) <= u0_m0_wo0_cma2_d(12);
                u0_m0_wo0_cma2_a0(12) <= u0_m0_wo0_cma2_d(13);
                u0_m0_wo0_cma2_a0(13) <= u0_m0_wo0_cma2_d(14);
                u0_m0_wo0_cma2_a0(14) <= u0_m0_wo0_cma2_d(15);
                u0_m0_wo0_cma2_a0(15) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr82_q_11_q),12);
                u0_m0_wo0_cma2_a0(16) <= SIGNED(RESIZE(UNSIGNED(GND_q),12));
                u0_m0_wo0_cma2_a0(17) <= (others => '0');
                u0_m0_wo0_cma2_b0(0) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_split32_c_11_q),12);
                u0_m0_wo0_cma2_b0(1) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr65_q_11_q),12);
                u0_m0_wo0_cma2_b0(2) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr66_q_11_q),12);
                u0_m0_wo0_cma2_b0(3) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr67_q_11_q),12);
                u0_m0_wo0_cma2_b0(4) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr68_q_11_q),12);
                u0_m0_wo0_cma2_b0(5) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr69_q_11_q),12);
                u0_m0_wo0_cma2_b0(6) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr70_q_11_q),12);
                u0_m0_wo0_cma2_b0(7) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr71_q_11_q),12);
                u0_m0_wo0_cma2_b0(8) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr72_q_11_q),12);
                u0_m0_wo0_cma2_b0(9) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr73_q_11_q),12);
                u0_m0_wo0_cma2_b0(10) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr74_q_11_q),12);
                u0_m0_wo0_cma2_b0(11) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr75_q_11_q),12);
                u0_m0_wo0_cma2_b0(12) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr76_q_11_q),12);
                u0_m0_wo0_cma2_b0(13) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr77_q_11_q),12);
                u0_m0_wo0_cma2_b0(14) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr78_q_11_q),12);
                u0_m0_wo0_cma2_b0(15) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr79_q_11_q),12);
                u0_m0_wo0_cma2_b0(16) <= RESIZE(SIGNED(d_u0_m0_wo0_wi0_r0_delayr80_q_11_q),12);
                u0_m0_wo0_cma2_b0(17) <= (others => '0');
                u0_m0_wo0_cma2_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm64_q),11);
                u0_m0_wo0_cma2_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm65_q),11);
                u0_m0_wo0_cma2_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm66_q),11);
                u0_m0_wo0_cma2_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm67_q),11);
                u0_m0_wo0_cma2_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm68_q),11);
                u0_m0_wo0_cma2_c0(5) <= RESIZE(SIGNED(u0_m0_wo0_cm69_q),11);
                u0_m0_wo0_cma2_c0(6) <= RESIZE(SIGNED(u0_m0_wo0_cm70_q),11);
                u0_m0_wo0_cma2_c0(7) <= RESIZE(SIGNED(u0_m0_wo0_cm71_q),11);
                u0_m0_wo0_cma2_c0(8) <= RESIZE(SIGNED(u0_m0_wo0_cm72_q),11);
                u0_m0_wo0_cma2_c0(9) <= RESIZE(SIGNED(u0_m0_wo0_cm73_q),11);
                u0_m0_wo0_cma2_c0(10) <= RESIZE(SIGNED(u0_m0_wo0_cm74_q),11);
                u0_m0_wo0_cma2_c0(11) <= RESIZE(SIGNED(u0_m0_wo0_cm75_q),11);
                u0_m0_wo0_cma2_c0(12) <= RESIZE(SIGNED(u0_m0_wo0_cm76_q),11);
                u0_m0_wo0_cma2_c0(13) <= RESIZE(SIGNED(u0_m0_wo0_cm77_q),11);
                u0_m0_wo0_cma2_c0(14) <= RESIZE(SIGNED(u0_m0_wo0_cm78_q),11);
                u0_m0_wo0_cma2_c0(15) <= RESIZE(SIGNED(u0_m0_wo0_cm79_q),11);
                u0_m0_wo0_cma2_c0(16) <= RESIZE(SIGNED(u0_m0_wo0_cm80_q),11);
                u0_m0_wo0_cma2_c0(17) <= (others => '0');
                u0_m0_wo0_cma2_d(0) <= u0_m0_wo0_cma2_a0(0);
                u0_m0_wo0_cma2_d(1) <= u0_m0_wo0_cma2_a0(1);
                u0_m0_wo0_cma2_d(2) <= u0_m0_wo0_cma2_a0(2);
                u0_m0_wo0_cma2_d(3) <= u0_m0_wo0_cma2_a0(3);
                u0_m0_wo0_cma2_d(4) <= u0_m0_wo0_cma2_a0(4);
                u0_m0_wo0_cma2_d(5) <= u0_m0_wo0_cma2_a0(5);
                u0_m0_wo0_cma2_d(6) <= u0_m0_wo0_cma2_a0(6);
                u0_m0_wo0_cma2_d(7) <= u0_m0_wo0_cma2_a0(7);
                u0_m0_wo0_cma2_d(8) <= u0_m0_wo0_cma2_a0(8);
                u0_m0_wo0_cma2_d(9) <= u0_m0_wo0_cma2_a0(9);
                u0_m0_wo0_cma2_d(10) <= u0_m0_wo0_cma2_a0(10);
                u0_m0_wo0_cma2_d(11) <= u0_m0_wo0_cma2_a0(11);
                u0_m0_wo0_cma2_d(12) <= u0_m0_wo0_cma2_a0(12);
                u0_m0_wo0_cma2_d(13) <= u0_m0_wo0_cma2_a0(13);
                u0_m0_wo0_cma2_d(14) <= u0_m0_wo0_cma2_a0(14);
                u0_m0_wo0_cma2_d(15) <= u0_m0_wo0_cma2_a0(15);
                u0_m0_wo0_cma2_d(16) <= u0_m0_wo0_cma2_a0(16);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma2_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma2_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma2_ena1 = '1') THEN
                u0_m0_wo0_cma2_s(0) <= u0_m0_wo0_cma2_y(0);
                u0_m0_wo0_cma2_s(1) <= u0_m0_wo0_cma2_y(1);
                u0_m0_wo0_cma2_s(2) <= u0_m0_wo0_cma2_y(2);
                u0_m0_wo0_cma2_s(3) <= u0_m0_wo0_cma2_y(3);
                u0_m0_wo0_cma2_s(4) <= u0_m0_wo0_cma2_y(4);
                u0_m0_wo0_cma2_s(5) <= u0_m0_wo0_cma2_y(5);
                u0_m0_wo0_cma2_s(6) <= u0_m0_wo0_cma2_y(6);
                u0_m0_wo0_cma2_s(7) <= u0_m0_wo0_cma2_y(7);
                u0_m0_wo0_cma2_s(8) <= u0_m0_wo0_cma2_y(8);
                u0_m0_wo0_cma2_s(9) <= u0_m0_wo0_cma2_y(9);
                u0_m0_wo0_cma2_s(10) <= u0_m0_wo0_cma2_y(10);
                u0_m0_wo0_cma2_s(11) <= u0_m0_wo0_cma2_y(11);
                u0_m0_wo0_cma2_s(12) <= u0_m0_wo0_cma2_y(12);
                u0_m0_wo0_cma2_s(13) <= u0_m0_wo0_cma2_y(13);
                u0_m0_wo0_cma2_s(14) <= u0_m0_wo0_cma2_y(14);
                u0_m0_wo0_cma2_s(15) <= u0_m0_wo0_cma2_y(15);
                u0_m0_wo0_cma2_s(16) <= u0_m0_wo0_cma2_y(16);
                u0_m0_wo0_cma2_s(17) <= u0_m0_wo0_cma2_y(17);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma2_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma2_s(0)(28 downto 0)), xout => u0_m0_wo0_cma2_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma2_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma2_qq(28 downto 0));

    -- u0_m0_wo0_dec63(LOOKUP,381)@10 + 1
    u0_m0_wo0_dec63_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec63_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec63_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec63_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm63(REG,382)@11 + 1
    u0_m0_wo0_cm63_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm63_q <= "0011010100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec63_e = "1") THEN
                u0_m0_wo0_cm63_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr98(DELAY,125)@10
    u0_m0_wo0_wi0_r0_delayr98_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr82_q);

    -- u0_m0_wo0_dec62(LOOKUP,378)@10 + 1
    u0_m0_wo0_dec62_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec62_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec62_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec62_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm62(REG,379)@11 + 1
    u0_m0_wo0_cm62_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm62_q <= "0011000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec62_e = "1") THEN
                u0_m0_wo0_cm62_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec61(LOOKUP,375)@10 + 1
    u0_m0_wo0_dec61_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec61_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec61_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec61_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm61(REG,376)@11 + 1
    u0_m0_wo0_cm61_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm61_q <= "0010110001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec61_e = "1") THEN
                u0_m0_wo0_cm61_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec60(LOOKUP,372)@10 + 1
    u0_m0_wo0_dec60_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec60_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec60_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec60_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm60(REG,373)@11 + 1
    u0_m0_wo0_cm60_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm60_q <= "0010100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec60_e = "1") THEN
                u0_m0_wo0_cm60_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec59(LOOKUP,369)@10 + 1
    u0_m0_wo0_dec59_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec59_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec59_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec59_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm59(REG,370)@11 + 1
    u0_m0_wo0_cm59_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm59_q <= "0010001111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec59_e = "1") THEN
                u0_m0_wo0_cm59_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec58(LOOKUP,366)@10 + 1
    u0_m0_wo0_dec58_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec58_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec58_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec58_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm58(REG,367)@11 + 1
    u0_m0_wo0_cm58_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm58_q <= "0001111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec58_e = "1") THEN
                u0_m0_wo0_cm58_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec57(LOOKUP,363)@10 + 1
    u0_m0_wo0_dec57_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec57_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec57_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec57_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm57(REG,364)@11 + 1
    u0_m0_wo0_cm57_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm57_q <= "0001101111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec57_e = "1") THEN
                u0_m0_wo0_cm57_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec56(LOOKUP,360)@10 + 1
    u0_m0_wo0_dec56_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec56_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec56_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec56_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm56(REG,361)@11 + 1
    u0_m0_wo0_cm56_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm56_q <= "0001011111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec56_e = "1") THEN
                u0_m0_wo0_cm56_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec55(LOOKUP,357)@10 + 1
    u0_m0_wo0_dec55_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec55_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec55_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec55_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm55(REG,358)@11 + 1
    u0_m0_wo0_cm55_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm55_q <= "0001010001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec55_e = "1") THEN
                u0_m0_wo0_cm55_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec54(LOOKUP,354)@10 + 1
    u0_m0_wo0_dec54_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec54_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec54_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec54_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm54(REG,355)@11 + 1
    u0_m0_wo0_cm54_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm54_q <= "0001000010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec54_e = "1") THEN
                u0_m0_wo0_cm54_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec53(LOOKUP,351)@10 + 1
    u0_m0_wo0_dec53_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec53_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec53_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec53_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm53(REG,352)@11 + 1
    u0_m0_wo0_cm53_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm53_q <= "0000110101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec53_e = "1") THEN
                u0_m0_wo0_cm53_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec52(LOOKUP,348)@10 + 1
    u0_m0_wo0_dec52_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec52_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec52_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec52_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm52(REG,349)@11 + 1
    u0_m0_wo0_cm52_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm52_q <= "0000101001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec52_e = "1") THEN
                u0_m0_wo0_cm52_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec51(LOOKUP,345)@10 + 1
    u0_m0_wo0_dec51_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec51_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec51_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec51_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm51(REG,346)@11 + 1
    u0_m0_wo0_cm51_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm51_q <= "0000011101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec51_e = "1") THEN
                u0_m0_wo0_cm51_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec50(LOOKUP,342)@10 + 1
    u0_m0_wo0_dec50_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec50_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec50_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec50_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm50(REG,343)@11 + 1
    u0_m0_wo0_cm50_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm50_q <= "0000010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec50_e = "1") THEN
                u0_m0_wo0_cm50_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec49(LOOKUP,339)@10 + 1
    u0_m0_wo0_dec49_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec49_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec49_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec49_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm49(REG,340)@11 + 1
    u0_m0_wo0_cm49_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm49_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec49_e = "1") THEN
                u0_m0_wo0_cm49_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec48(LOOKUP,336)@10 + 1
    u0_m0_wo0_dec48_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec48_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec48_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec48_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm48(REG,337)@11 + 1
    u0_m0_wo0_cm48_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm48_q <= "0000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec48_e = "1") THEN
                u0_m0_wo0_cm48_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec47(LOOKUP,333)@10 + 1
    u0_m0_wo0_dec47_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec47_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec47_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec47_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm47(REG,334)@11 + 1
    u0_m0_wo0_cm47_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm47_q <= "1111111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec47_e = "1") THEN
                u0_m0_wo0_cm47_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec46(LOOKUP,330)@10 + 1
    u0_m0_wo0_dec46_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec46_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec46_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec46_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm46(REG,331)@11 + 1
    u0_m0_wo0_cm46_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm46_q <= "1111110001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec46_e = "1") THEN
                u0_m0_wo0_cm46_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec45(LOOKUP,327)@10 + 1
    u0_m0_wo0_dec45_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec45_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec45_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec45_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm45(REG,328)@11 + 1
    u0_m0_wo0_cm45_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm45_q <= "1111101100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec45_e = "1") THEN
                u0_m0_wo0_cm45_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec44(LOOKUP,324)@10 + 1
    u0_m0_wo0_dec44_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec44_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec44_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec44_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm44(REG,325)@11 + 1
    u0_m0_wo0_cm44_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm44_q <= "1111100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec44_e = "1") THEN
                u0_m0_wo0_cm44_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec43(LOOKUP,321)@10 + 1
    u0_m0_wo0_dec43_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec43_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec43_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec43_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm43(REG,322)@11 + 1
    u0_m0_wo0_cm43_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm43_q <= "1111100011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec43_e = "1") THEN
                u0_m0_wo0_cm43_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec42(LOOKUP,318)@10 + 1
    u0_m0_wo0_dec42_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec42_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec42_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec42_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm42(REG,319)@11 + 1
    u0_m0_wo0_cm42_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm42_q <= "1111100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec42_e = "1") THEN
                u0_m0_wo0_cm42_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec41(LOOKUP,315)@10 + 1
    u0_m0_wo0_dec41_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec41_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec41_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec41_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm41(REG,316)@11 + 1
    u0_m0_wo0_cm41_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm41_q <= "1111011110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec41_e = "1") THEN
                u0_m0_wo0_cm41_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec40(LOOKUP,312)@10 + 1
    u0_m0_wo0_dec40_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec40_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec40_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec40_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm40(REG,313)@11 + 1
    u0_m0_wo0_cm40_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm40_q <= "1111011101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec40_e = "1") THEN
                u0_m0_wo0_cm40_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec39(LOOKUP,309)@10 + 1
    u0_m0_wo0_dec39_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec39_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec39_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec39_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm39(REG,310)@11 + 1
    u0_m0_wo0_cm39_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm39_q <= "1111011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec39_e = "1") THEN
                u0_m0_wo0_cm39_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec38(LOOKUP,306)@10 + 1
    u0_m0_wo0_dec38_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec38_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec38_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec38_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm38(REG,307)@11 + 1
    u0_m0_wo0_cm38_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm38_q <= "1111011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec38_e = "1") THEN
                u0_m0_wo0_cm38_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec37(LOOKUP,303)@10 + 1
    u0_m0_wo0_dec37_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec37_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec37_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec37_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm37(REG,304)@11 + 1
    u0_m0_wo0_cm37_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm37_q <= "1111011101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec37_e = "1") THEN
                u0_m0_wo0_cm37_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec36(LOOKUP,300)@10 + 1
    u0_m0_wo0_dec36_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec36_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec36_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec36_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm36(REG,301)@11 + 1
    u0_m0_wo0_cm36_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm36_q <= "1111011110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec36_e = "1") THEN
                u0_m0_wo0_cm36_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec35(LOOKUP,297)@10 + 1
    u0_m0_wo0_dec35_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec35_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec35_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec35_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm35(REG,298)@11 + 1
    u0_m0_wo0_cm35_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm35_q <= "1111100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec35_e = "1") THEN
                u0_m0_wo0_cm35_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec34(LOOKUP,294)@10 + 1
    u0_m0_wo0_dec34_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec34_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec34_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec34_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm34(REG,295)@11 + 1
    u0_m0_wo0_cm34_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm34_q <= "1111100010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec34_e = "1") THEN
                u0_m0_wo0_cm34_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec33(LOOKUP,291)@10 + 1
    u0_m0_wo0_dec33_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec33_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec33_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec33_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm33(REG,292)@11 + 1
    u0_m0_wo0_cm33_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm33_q <= "1111100100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec33_e = "1") THEN
                u0_m0_wo0_cm33_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec32(LOOKUP,288)@10 + 1
    u0_m0_wo0_dec32_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec32_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec32_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec32_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm32(REG,289)@11 + 1
    u0_m0_wo0_cm32_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm32_q <= "1111100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec32_e = "1") THEN
                u0_m0_wo0_cm32_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cma1(CHAINMULTADD,517)@10 + 2
    u0_m0_wo0_cma1_reset <= areset;
    u0_m0_wo0_cma1_ena0 <= xIn_v(0);
    u0_m0_wo0_cma1_ena1 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma1_l(0) <= RESIZE(u0_m0_wo0_cma1_a0(0),13) + RESIZE(u0_m0_wo0_cma1_b0(0),13);
    u0_m0_wo0_cma1_l(1) <= RESIZE(u0_m0_wo0_cma1_a0(1),13) + RESIZE(u0_m0_wo0_cma1_b0(1),13);
    u0_m0_wo0_cma1_l(2) <= RESIZE(u0_m0_wo0_cma1_a0(2),13) + RESIZE(u0_m0_wo0_cma1_b0(2),13);
    u0_m0_wo0_cma1_l(3) <= RESIZE(u0_m0_wo0_cma1_a0(3),13) + RESIZE(u0_m0_wo0_cma1_b0(3),13);
    u0_m0_wo0_cma1_l(4) <= RESIZE(u0_m0_wo0_cma1_a0(4),13) + RESIZE(u0_m0_wo0_cma1_b0(4),13);
    u0_m0_wo0_cma1_l(5) <= RESIZE(u0_m0_wo0_cma1_a0(5),13) + RESIZE(u0_m0_wo0_cma1_b0(5),13);
    u0_m0_wo0_cma1_l(6) <= RESIZE(u0_m0_wo0_cma1_a0(6),13) + RESIZE(u0_m0_wo0_cma1_b0(6),13);
    u0_m0_wo0_cma1_l(7) <= RESIZE(u0_m0_wo0_cma1_a0(7),13) + RESIZE(u0_m0_wo0_cma1_b0(7),13);
    u0_m0_wo0_cma1_l(8) <= RESIZE(u0_m0_wo0_cma1_a0(8),13) + RESIZE(u0_m0_wo0_cma1_b0(8),13);
    u0_m0_wo0_cma1_l(9) <= RESIZE(u0_m0_wo0_cma1_a0(9),13) + RESIZE(u0_m0_wo0_cma1_b0(9),13);
    u0_m0_wo0_cma1_l(10) <= RESIZE(u0_m0_wo0_cma1_a0(10),13) + RESIZE(u0_m0_wo0_cma1_b0(10),13);
    u0_m0_wo0_cma1_l(11) <= RESIZE(u0_m0_wo0_cma1_a0(11),13) + RESIZE(u0_m0_wo0_cma1_b0(11),13);
    u0_m0_wo0_cma1_l(12) <= RESIZE(u0_m0_wo0_cma1_a0(12),13) + RESIZE(u0_m0_wo0_cma1_b0(12),13);
    u0_m0_wo0_cma1_l(13) <= RESIZE(u0_m0_wo0_cma1_a0(13),13) + RESIZE(u0_m0_wo0_cma1_b0(13),13);
    u0_m0_wo0_cma1_l(14) <= RESIZE(u0_m0_wo0_cma1_a0(14),13) + RESIZE(u0_m0_wo0_cma1_b0(14),13);
    u0_m0_wo0_cma1_l(15) <= RESIZE(u0_m0_wo0_cma1_a0(15),13) + RESIZE(u0_m0_wo0_cma1_b0(15),13);
    u0_m0_wo0_cma1_l(16) <= RESIZE(u0_m0_wo0_cma1_a0(16),13) + RESIZE(u0_m0_wo0_cma1_b0(16),13);
    u0_m0_wo0_cma1_l(17) <= RESIZE(u0_m0_wo0_cma1_a0(17),13) + RESIZE(u0_m0_wo0_cma1_b0(17),13);
    u0_m0_wo0_cma1_l(18) <= RESIZE(u0_m0_wo0_cma1_a0(18),13) + RESIZE(u0_m0_wo0_cma1_b0(18),13);
    u0_m0_wo0_cma1_l(19) <= RESIZE(u0_m0_wo0_cma1_a0(19),13) + RESIZE(u0_m0_wo0_cma1_b0(19),13);
    u0_m0_wo0_cma1_l(20) <= RESIZE(u0_m0_wo0_cma1_a0(20),13) + RESIZE(u0_m0_wo0_cma1_b0(20),13);
    u0_m0_wo0_cma1_l(21) <= RESIZE(u0_m0_wo0_cma1_a0(21),13) + RESIZE(u0_m0_wo0_cma1_b0(21),13);
    u0_m0_wo0_cma1_l(22) <= RESIZE(u0_m0_wo0_cma1_a0(22),13) + RESIZE(u0_m0_wo0_cma1_b0(22),13);
    u0_m0_wo0_cma1_l(23) <= RESIZE(u0_m0_wo0_cma1_a0(23),13) + RESIZE(u0_m0_wo0_cma1_b0(23),13);
    u0_m0_wo0_cma1_l(24) <= RESIZE(u0_m0_wo0_cma1_a0(24),13) + RESIZE(u0_m0_wo0_cma1_b0(24),13);
    u0_m0_wo0_cma1_l(25) <= RESIZE(u0_m0_wo0_cma1_a0(25),13) + RESIZE(u0_m0_wo0_cma1_b0(25),13);
    u0_m0_wo0_cma1_l(26) <= RESIZE(u0_m0_wo0_cma1_a0(26),13) + RESIZE(u0_m0_wo0_cma1_b0(26),13);
    u0_m0_wo0_cma1_l(27) <= RESIZE(u0_m0_wo0_cma1_a0(27),13) + RESIZE(u0_m0_wo0_cma1_b0(27),13);
    u0_m0_wo0_cma1_l(28) <= RESIZE(u0_m0_wo0_cma1_a0(28),13) + RESIZE(u0_m0_wo0_cma1_b0(28),13);
    u0_m0_wo0_cma1_l(29) <= RESIZE(u0_m0_wo0_cma1_a0(29),13) + RESIZE(u0_m0_wo0_cma1_b0(29),13);
    u0_m0_wo0_cma1_l(30) <= RESIZE(u0_m0_wo0_cma1_a0(30),13) + RESIZE(u0_m0_wo0_cma1_b0(30),13);
    u0_m0_wo0_cma1_l(31) <= RESIZE(u0_m0_wo0_cma1_a0(31),13) + RESIZE(u0_m0_wo0_cma1_b0(31),13);
    u0_m0_wo0_cma1_p(0) <= u0_m0_wo0_cma1_l(0) * u0_m0_wo0_cma1_c0(0);
    u0_m0_wo0_cma1_p(1) <= u0_m0_wo0_cma1_l(1) * u0_m0_wo0_cma1_c0(1);
    u0_m0_wo0_cma1_p(2) <= u0_m0_wo0_cma1_l(2) * u0_m0_wo0_cma1_c0(2);
    u0_m0_wo0_cma1_p(3) <= u0_m0_wo0_cma1_l(3) * u0_m0_wo0_cma1_c0(3);
    u0_m0_wo0_cma1_p(4) <= u0_m0_wo0_cma1_l(4) * u0_m0_wo0_cma1_c0(4);
    u0_m0_wo0_cma1_p(5) <= u0_m0_wo0_cma1_l(5) * u0_m0_wo0_cma1_c0(5);
    u0_m0_wo0_cma1_p(6) <= u0_m0_wo0_cma1_l(6) * u0_m0_wo0_cma1_c0(6);
    u0_m0_wo0_cma1_p(7) <= u0_m0_wo0_cma1_l(7) * u0_m0_wo0_cma1_c0(7);
    u0_m0_wo0_cma1_p(8) <= u0_m0_wo0_cma1_l(8) * u0_m0_wo0_cma1_c0(8);
    u0_m0_wo0_cma1_p(9) <= u0_m0_wo0_cma1_l(9) * u0_m0_wo0_cma1_c0(9);
    u0_m0_wo0_cma1_p(10) <= u0_m0_wo0_cma1_l(10) * u0_m0_wo0_cma1_c0(10);
    u0_m0_wo0_cma1_p(11) <= u0_m0_wo0_cma1_l(11) * u0_m0_wo0_cma1_c0(11);
    u0_m0_wo0_cma1_p(12) <= u0_m0_wo0_cma1_l(12) * u0_m0_wo0_cma1_c0(12);
    u0_m0_wo0_cma1_p(13) <= u0_m0_wo0_cma1_l(13) * u0_m0_wo0_cma1_c0(13);
    u0_m0_wo0_cma1_p(14) <= u0_m0_wo0_cma1_l(14) * u0_m0_wo0_cma1_c0(14);
    u0_m0_wo0_cma1_p(15) <= u0_m0_wo0_cma1_l(15) * u0_m0_wo0_cma1_c0(15);
    u0_m0_wo0_cma1_p(16) <= u0_m0_wo0_cma1_l(16) * u0_m0_wo0_cma1_c0(16);
    u0_m0_wo0_cma1_p(17) <= u0_m0_wo0_cma1_l(17) * u0_m0_wo0_cma1_c0(17);
    u0_m0_wo0_cma1_p(18) <= u0_m0_wo0_cma1_l(18) * u0_m0_wo0_cma1_c0(18);
    u0_m0_wo0_cma1_p(19) <= u0_m0_wo0_cma1_l(19) * u0_m0_wo0_cma1_c0(19);
    u0_m0_wo0_cma1_p(20) <= u0_m0_wo0_cma1_l(20) * u0_m0_wo0_cma1_c0(20);
    u0_m0_wo0_cma1_p(21) <= u0_m0_wo0_cma1_l(21) * u0_m0_wo0_cma1_c0(21);
    u0_m0_wo0_cma1_p(22) <= u0_m0_wo0_cma1_l(22) * u0_m0_wo0_cma1_c0(22);
    u0_m0_wo0_cma1_p(23) <= u0_m0_wo0_cma1_l(23) * u0_m0_wo0_cma1_c0(23);
    u0_m0_wo0_cma1_p(24) <= u0_m0_wo0_cma1_l(24) * u0_m0_wo0_cma1_c0(24);
    u0_m0_wo0_cma1_p(25) <= u0_m0_wo0_cma1_l(25) * u0_m0_wo0_cma1_c0(25);
    u0_m0_wo0_cma1_p(26) <= u0_m0_wo0_cma1_l(26) * u0_m0_wo0_cma1_c0(26);
    u0_m0_wo0_cma1_p(27) <= u0_m0_wo0_cma1_l(27) * u0_m0_wo0_cma1_c0(27);
    u0_m0_wo0_cma1_p(28) <= u0_m0_wo0_cma1_l(28) * u0_m0_wo0_cma1_c0(28);
    u0_m0_wo0_cma1_p(29) <= u0_m0_wo0_cma1_l(29) * u0_m0_wo0_cma1_c0(29);
    u0_m0_wo0_cma1_p(30) <= u0_m0_wo0_cma1_l(30) * u0_m0_wo0_cma1_c0(30);
    u0_m0_wo0_cma1_p(31) <= u0_m0_wo0_cma1_l(31) * u0_m0_wo0_cma1_c0(31);
    u0_m0_wo0_cma1_u(0) <= RESIZE(u0_m0_wo0_cma1_p(0),29);
    u0_m0_wo0_cma1_u(1) <= RESIZE(u0_m0_wo0_cma1_p(1),29);
    u0_m0_wo0_cma1_u(2) <= RESIZE(u0_m0_wo0_cma1_p(2),29);
    u0_m0_wo0_cma1_u(3) <= RESIZE(u0_m0_wo0_cma1_p(3),29);
    u0_m0_wo0_cma1_u(4) <= RESIZE(u0_m0_wo0_cma1_p(4),29);
    u0_m0_wo0_cma1_u(5) <= RESIZE(u0_m0_wo0_cma1_p(5),29);
    u0_m0_wo0_cma1_u(6) <= RESIZE(u0_m0_wo0_cma1_p(6),29);
    u0_m0_wo0_cma1_u(7) <= RESIZE(u0_m0_wo0_cma1_p(7),29);
    u0_m0_wo0_cma1_u(8) <= RESIZE(u0_m0_wo0_cma1_p(8),29);
    u0_m0_wo0_cma1_u(9) <= RESIZE(u0_m0_wo0_cma1_p(9),29);
    u0_m0_wo0_cma1_u(10) <= RESIZE(u0_m0_wo0_cma1_p(10),29);
    u0_m0_wo0_cma1_u(11) <= RESIZE(u0_m0_wo0_cma1_p(11),29);
    u0_m0_wo0_cma1_u(12) <= RESIZE(u0_m0_wo0_cma1_p(12),29);
    u0_m0_wo0_cma1_u(13) <= RESIZE(u0_m0_wo0_cma1_p(13),29);
    u0_m0_wo0_cma1_u(14) <= RESIZE(u0_m0_wo0_cma1_p(14),29);
    u0_m0_wo0_cma1_u(15) <= RESIZE(u0_m0_wo0_cma1_p(15),29);
    u0_m0_wo0_cma1_u(16) <= RESIZE(u0_m0_wo0_cma1_p(16),29);
    u0_m0_wo0_cma1_u(17) <= RESIZE(u0_m0_wo0_cma1_p(17),29);
    u0_m0_wo0_cma1_u(18) <= RESIZE(u0_m0_wo0_cma1_p(18),29);
    u0_m0_wo0_cma1_u(19) <= RESIZE(u0_m0_wo0_cma1_p(19),29);
    u0_m0_wo0_cma1_u(20) <= RESIZE(u0_m0_wo0_cma1_p(20),29);
    u0_m0_wo0_cma1_u(21) <= RESIZE(u0_m0_wo0_cma1_p(21),29);
    u0_m0_wo0_cma1_u(22) <= RESIZE(u0_m0_wo0_cma1_p(22),29);
    u0_m0_wo0_cma1_u(23) <= RESIZE(u0_m0_wo0_cma1_p(23),29);
    u0_m0_wo0_cma1_u(24) <= RESIZE(u0_m0_wo0_cma1_p(24),29);
    u0_m0_wo0_cma1_u(25) <= RESIZE(u0_m0_wo0_cma1_p(25),29);
    u0_m0_wo0_cma1_u(26) <= RESIZE(u0_m0_wo0_cma1_p(26),29);
    u0_m0_wo0_cma1_u(27) <= RESIZE(u0_m0_wo0_cma1_p(27),29);
    u0_m0_wo0_cma1_u(28) <= RESIZE(u0_m0_wo0_cma1_p(28),29);
    u0_m0_wo0_cma1_u(29) <= RESIZE(u0_m0_wo0_cma1_p(29),29);
    u0_m0_wo0_cma1_u(30) <= RESIZE(u0_m0_wo0_cma1_p(30),29);
    u0_m0_wo0_cma1_u(31) <= RESIZE(u0_m0_wo0_cma1_p(31),29);
    u0_m0_wo0_cma1_w(0) <= u0_m0_wo0_cma1_u(0);
    u0_m0_wo0_cma1_w(1) <= u0_m0_wo0_cma1_u(1);
    u0_m0_wo0_cma1_w(2) <= u0_m0_wo0_cma1_u(2);
    u0_m0_wo0_cma1_w(3) <= u0_m0_wo0_cma1_u(3);
    u0_m0_wo0_cma1_w(4) <= u0_m0_wo0_cma1_u(4);
    u0_m0_wo0_cma1_w(5) <= u0_m0_wo0_cma1_u(5);
    u0_m0_wo0_cma1_w(6) <= u0_m0_wo0_cma1_u(6);
    u0_m0_wo0_cma1_w(7) <= u0_m0_wo0_cma1_u(7);
    u0_m0_wo0_cma1_w(8) <= u0_m0_wo0_cma1_u(8);
    u0_m0_wo0_cma1_w(9) <= u0_m0_wo0_cma1_u(9);
    u0_m0_wo0_cma1_w(10) <= u0_m0_wo0_cma1_u(10);
    u0_m0_wo0_cma1_w(11) <= u0_m0_wo0_cma1_u(11);
    u0_m0_wo0_cma1_w(12) <= u0_m0_wo0_cma1_u(12);
    u0_m0_wo0_cma1_w(13) <= u0_m0_wo0_cma1_u(13);
    u0_m0_wo0_cma1_w(14) <= u0_m0_wo0_cma1_u(14);
    u0_m0_wo0_cma1_w(15) <= u0_m0_wo0_cma1_u(15);
    u0_m0_wo0_cma1_w(16) <= u0_m0_wo0_cma1_u(16);
    u0_m0_wo0_cma1_w(17) <= u0_m0_wo0_cma1_u(17);
    u0_m0_wo0_cma1_w(18) <= u0_m0_wo0_cma1_u(18);
    u0_m0_wo0_cma1_w(19) <= u0_m0_wo0_cma1_u(19);
    u0_m0_wo0_cma1_w(20) <= u0_m0_wo0_cma1_u(20);
    u0_m0_wo0_cma1_w(21) <= u0_m0_wo0_cma1_u(21);
    u0_m0_wo0_cma1_w(22) <= u0_m0_wo0_cma1_u(22);
    u0_m0_wo0_cma1_w(23) <= u0_m0_wo0_cma1_u(23);
    u0_m0_wo0_cma1_w(24) <= u0_m0_wo0_cma1_u(24);
    u0_m0_wo0_cma1_w(25) <= u0_m0_wo0_cma1_u(25);
    u0_m0_wo0_cma1_w(26) <= u0_m0_wo0_cma1_u(26);
    u0_m0_wo0_cma1_w(27) <= u0_m0_wo0_cma1_u(27);
    u0_m0_wo0_cma1_w(28) <= u0_m0_wo0_cma1_u(28);
    u0_m0_wo0_cma1_w(29) <= u0_m0_wo0_cma1_u(29);
    u0_m0_wo0_cma1_w(30) <= u0_m0_wo0_cma1_u(30);
    u0_m0_wo0_cma1_w(31) <= u0_m0_wo0_cma1_u(31);
    u0_m0_wo0_cma1_x(0) <= u0_m0_wo0_cma1_w(0);
    u0_m0_wo0_cma1_x(1) <= u0_m0_wo0_cma1_w(1);
    u0_m0_wo0_cma1_x(2) <= u0_m0_wo0_cma1_w(2);
    u0_m0_wo0_cma1_x(3) <= u0_m0_wo0_cma1_w(3);
    u0_m0_wo0_cma1_x(4) <= u0_m0_wo0_cma1_w(4);
    u0_m0_wo0_cma1_x(5) <= u0_m0_wo0_cma1_w(5);
    u0_m0_wo0_cma1_x(6) <= u0_m0_wo0_cma1_w(6);
    u0_m0_wo0_cma1_x(7) <= u0_m0_wo0_cma1_w(7);
    u0_m0_wo0_cma1_x(8) <= u0_m0_wo0_cma1_w(8);
    u0_m0_wo0_cma1_x(9) <= u0_m0_wo0_cma1_w(9);
    u0_m0_wo0_cma1_x(10) <= u0_m0_wo0_cma1_w(10);
    u0_m0_wo0_cma1_x(11) <= u0_m0_wo0_cma1_w(11);
    u0_m0_wo0_cma1_x(12) <= u0_m0_wo0_cma1_w(12);
    u0_m0_wo0_cma1_x(13) <= u0_m0_wo0_cma1_w(13);
    u0_m0_wo0_cma1_x(14) <= u0_m0_wo0_cma1_w(14);
    u0_m0_wo0_cma1_x(15) <= u0_m0_wo0_cma1_w(15);
    u0_m0_wo0_cma1_x(16) <= u0_m0_wo0_cma1_w(16);
    u0_m0_wo0_cma1_x(17) <= u0_m0_wo0_cma1_w(17);
    u0_m0_wo0_cma1_x(18) <= u0_m0_wo0_cma1_w(18);
    u0_m0_wo0_cma1_x(19) <= u0_m0_wo0_cma1_w(19);
    u0_m0_wo0_cma1_x(20) <= u0_m0_wo0_cma1_w(20);
    u0_m0_wo0_cma1_x(21) <= u0_m0_wo0_cma1_w(21);
    u0_m0_wo0_cma1_x(22) <= u0_m0_wo0_cma1_w(22);
    u0_m0_wo0_cma1_x(23) <= u0_m0_wo0_cma1_w(23);
    u0_m0_wo0_cma1_x(24) <= u0_m0_wo0_cma1_w(24);
    u0_m0_wo0_cma1_x(25) <= u0_m0_wo0_cma1_w(25);
    u0_m0_wo0_cma1_x(26) <= u0_m0_wo0_cma1_w(26);
    u0_m0_wo0_cma1_x(27) <= u0_m0_wo0_cma1_w(27);
    u0_m0_wo0_cma1_x(28) <= u0_m0_wo0_cma1_w(28);
    u0_m0_wo0_cma1_x(29) <= u0_m0_wo0_cma1_w(29);
    u0_m0_wo0_cma1_x(30) <= u0_m0_wo0_cma1_w(30);
    u0_m0_wo0_cma1_x(31) <= u0_m0_wo0_cma1_w(31);
    u0_m0_wo0_cma1_y(0) <= u0_m0_wo0_cma1_s(1) + u0_m0_wo0_cma1_x(0);
    u0_m0_wo0_cma1_y(1) <= u0_m0_wo0_cma1_s(2) + u0_m0_wo0_cma1_x(1);
    u0_m0_wo0_cma1_y(2) <= u0_m0_wo0_cma1_s(3) + u0_m0_wo0_cma1_x(2);
    u0_m0_wo0_cma1_y(3) <= u0_m0_wo0_cma1_s(4) + u0_m0_wo0_cma1_x(3);
    u0_m0_wo0_cma1_y(4) <= u0_m0_wo0_cma1_s(5) + u0_m0_wo0_cma1_x(4);
    u0_m0_wo0_cma1_y(5) <= u0_m0_wo0_cma1_s(6) + u0_m0_wo0_cma1_x(5);
    u0_m0_wo0_cma1_y(6) <= u0_m0_wo0_cma1_s(7) + u0_m0_wo0_cma1_x(6);
    u0_m0_wo0_cma1_y(7) <= u0_m0_wo0_cma1_s(8) + u0_m0_wo0_cma1_x(7);
    u0_m0_wo0_cma1_y(8) <= u0_m0_wo0_cma1_s(9) + u0_m0_wo0_cma1_x(8);
    u0_m0_wo0_cma1_y(9) <= u0_m0_wo0_cma1_s(10) + u0_m0_wo0_cma1_x(9);
    u0_m0_wo0_cma1_y(10) <= u0_m0_wo0_cma1_s(11) + u0_m0_wo0_cma1_x(10);
    u0_m0_wo0_cma1_y(11) <= u0_m0_wo0_cma1_s(12) + u0_m0_wo0_cma1_x(11);
    u0_m0_wo0_cma1_y(12) <= u0_m0_wo0_cma1_s(13) + u0_m0_wo0_cma1_x(12);
    u0_m0_wo0_cma1_y(13) <= u0_m0_wo0_cma1_s(14) + u0_m0_wo0_cma1_x(13);
    u0_m0_wo0_cma1_y(14) <= u0_m0_wo0_cma1_s(15) + u0_m0_wo0_cma1_x(14);
    u0_m0_wo0_cma1_y(15) <= u0_m0_wo0_cma1_s(16) + u0_m0_wo0_cma1_x(15);
    u0_m0_wo0_cma1_y(16) <= u0_m0_wo0_cma1_s(17) + u0_m0_wo0_cma1_x(16);
    u0_m0_wo0_cma1_y(17) <= u0_m0_wo0_cma1_s(18) + u0_m0_wo0_cma1_x(17);
    u0_m0_wo0_cma1_y(18) <= u0_m0_wo0_cma1_s(19) + u0_m0_wo0_cma1_x(18);
    u0_m0_wo0_cma1_y(19) <= u0_m0_wo0_cma1_s(20) + u0_m0_wo0_cma1_x(19);
    u0_m0_wo0_cma1_y(20) <= u0_m0_wo0_cma1_s(21) + u0_m0_wo0_cma1_x(20);
    u0_m0_wo0_cma1_y(21) <= u0_m0_wo0_cma1_s(22) + u0_m0_wo0_cma1_x(21);
    u0_m0_wo0_cma1_y(22) <= u0_m0_wo0_cma1_s(23) + u0_m0_wo0_cma1_x(22);
    u0_m0_wo0_cma1_y(23) <= u0_m0_wo0_cma1_s(24) + u0_m0_wo0_cma1_x(23);
    u0_m0_wo0_cma1_y(24) <= u0_m0_wo0_cma1_s(25) + u0_m0_wo0_cma1_x(24);
    u0_m0_wo0_cma1_y(25) <= u0_m0_wo0_cma1_s(26) + u0_m0_wo0_cma1_x(25);
    u0_m0_wo0_cma1_y(26) <= u0_m0_wo0_cma1_s(27) + u0_m0_wo0_cma1_x(26);
    u0_m0_wo0_cma1_y(27) <= u0_m0_wo0_cma1_s(28) + u0_m0_wo0_cma1_x(27);
    u0_m0_wo0_cma1_y(28) <= u0_m0_wo0_cma1_s(29) + u0_m0_wo0_cma1_x(28);
    u0_m0_wo0_cma1_y(29) <= u0_m0_wo0_cma1_s(30) + u0_m0_wo0_cma1_x(29);
    u0_m0_wo0_cma1_y(30) <= u0_m0_wo0_cma1_s(31) + u0_m0_wo0_cma1_x(30);
    u0_m0_wo0_cma1_y(31) <= u0_m0_wo0_cma1_x(31);
    u0_m0_wo0_cma1_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma1_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_b0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma1_d <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma1_ena0 = '1') THEN
                u0_m0_wo0_cma1_a0(0) <= u0_m0_wo0_cma1_d(1);
                u0_m0_wo0_cma1_a0(1) <= u0_m0_wo0_cma1_d(2);
                u0_m0_wo0_cma1_a0(2) <= u0_m0_wo0_cma1_d(3);
                u0_m0_wo0_cma1_a0(3) <= u0_m0_wo0_cma1_d(4);
                u0_m0_wo0_cma1_a0(4) <= u0_m0_wo0_cma1_d(5);
                u0_m0_wo0_cma1_a0(5) <= u0_m0_wo0_cma1_d(6);
                u0_m0_wo0_cma1_a0(6) <= u0_m0_wo0_cma1_d(7);
                u0_m0_wo0_cma1_a0(7) <= u0_m0_wo0_cma1_d(8);
                u0_m0_wo0_cma1_a0(8) <= u0_m0_wo0_cma1_d(9);
                u0_m0_wo0_cma1_a0(9) <= u0_m0_wo0_cma1_d(10);
                u0_m0_wo0_cma1_a0(10) <= u0_m0_wo0_cma1_d(11);
                u0_m0_wo0_cma1_a0(11) <= u0_m0_wo0_cma1_d(12);
                u0_m0_wo0_cma1_a0(12) <= u0_m0_wo0_cma1_d(13);
                u0_m0_wo0_cma1_a0(13) <= u0_m0_wo0_cma1_d(14);
                u0_m0_wo0_cma1_a0(14) <= u0_m0_wo0_cma1_d(15);
                u0_m0_wo0_cma1_a0(15) <= u0_m0_wo0_cma1_d(16);
                u0_m0_wo0_cma1_a0(16) <= u0_m0_wo0_cma1_d(17);
                u0_m0_wo0_cma1_a0(17) <= u0_m0_wo0_cma1_d(18);
                u0_m0_wo0_cma1_a0(18) <= u0_m0_wo0_cma1_d(19);
                u0_m0_wo0_cma1_a0(19) <= u0_m0_wo0_cma1_d(20);
                u0_m0_wo0_cma1_a0(20) <= u0_m0_wo0_cma1_d(21);
                u0_m0_wo0_cma1_a0(21) <= u0_m0_wo0_cma1_d(22);
                u0_m0_wo0_cma1_a0(22) <= u0_m0_wo0_cma1_d(23);
                u0_m0_wo0_cma1_a0(23) <= u0_m0_wo0_cma1_d(24);
                u0_m0_wo0_cma1_a0(24) <= u0_m0_wo0_cma1_d(25);
                u0_m0_wo0_cma1_a0(25) <= u0_m0_wo0_cma1_d(26);
                u0_m0_wo0_cma1_a0(26) <= u0_m0_wo0_cma1_d(27);
                u0_m0_wo0_cma1_a0(27) <= u0_m0_wo0_cma1_d(28);
                u0_m0_wo0_cma1_a0(28) <= u0_m0_wo0_cma1_d(29);
                u0_m0_wo0_cma1_a0(29) <= u0_m0_wo0_cma1_d(30);
                u0_m0_wo0_cma1_a0(30) <= u0_m0_wo0_cma1_d(31);
                u0_m0_wo0_cma1_a0(31) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr98_q),12);
                u0_m0_wo0_cma1_b0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(5) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(6) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(7) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(8) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(9) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(10) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(11) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(12) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(13) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(14) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(15) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(16) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(17) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(18) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(19) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(20) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(21) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(22) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(23) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(24) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(25) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(26) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(27) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(28) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(29) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(30) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_b0(31) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split32_b),12);
                u0_m0_wo0_cma1_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm32_q),11);
                u0_m0_wo0_cma1_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm33_q),11);
                u0_m0_wo0_cma1_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm34_q),11);
                u0_m0_wo0_cma1_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm35_q),11);
                u0_m0_wo0_cma1_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm36_q),11);
                u0_m0_wo0_cma1_c0(5) <= RESIZE(SIGNED(u0_m0_wo0_cm37_q),11);
                u0_m0_wo0_cma1_c0(6) <= RESIZE(SIGNED(u0_m0_wo0_cm38_q),11);
                u0_m0_wo0_cma1_c0(7) <= RESIZE(SIGNED(u0_m0_wo0_cm39_q),11);
                u0_m0_wo0_cma1_c0(8) <= RESIZE(SIGNED(u0_m0_wo0_cm40_q),11);
                u0_m0_wo0_cma1_c0(9) <= RESIZE(SIGNED(u0_m0_wo0_cm41_q),11);
                u0_m0_wo0_cma1_c0(10) <= RESIZE(SIGNED(u0_m0_wo0_cm42_q),11);
                u0_m0_wo0_cma1_c0(11) <= RESIZE(SIGNED(u0_m0_wo0_cm43_q),11);
                u0_m0_wo0_cma1_c0(12) <= RESIZE(SIGNED(u0_m0_wo0_cm44_q),11);
                u0_m0_wo0_cma1_c0(13) <= RESIZE(SIGNED(u0_m0_wo0_cm45_q),11);
                u0_m0_wo0_cma1_c0(14) <= RESIZE(SIGNED(u0_m0_wo0_cm46_q),11);
                u0_m0_wo0_cma1_c0(15) <= RESIZE(SIGNED(u0_m0_wo0_cm47_q),11);
                u0_m0_wo0_cma1_c0(16) <= RESIZE(SIGNED(u0_m0_wo0_cm48_q),11);
                u0_m0_wo0_cma1_c0(17) <= RESIZE(SIGNED(u0_m0_wo0_cm49_q),11);
                u0_m0_wo0_cma1_c0(18) <= RESIZE(SIGNED(u0_m0_wo0_cm50_q),11);
                u0_m0_wo0_cma1_c0(19) <= RESIZE(SIGNED(u0_m0_wo0_cm51_q),11);
                u0_m0_wo0_cma1_c0(20) <= RESIZE(SIGNED(u0_m0_wo0_cm52_q),11);
                u0_m0_wo0_cma1_c0(21) <= RESIZE(SIGNED(u0_m0_wo0_cm53_q),11);
                u0_m0_wo0_cma1_c0(22) <= RESIZE(SIGNED(u0_m0_wo0_cm54_q),11);
                u0_m0_wo0_cma1_c0(23) <= RESIZE(SIGNED(u0_m0_wo0_cm55_q),11);
                u0_m0_wo0_cma1_c0(24) <= RESIZE(SIGNED(u0_m0_wo0_cm56_q),11);
                u0_m0_wo0_cma1_c0(25) <= RESIZE(SIGNED(u0_m0_wo0_cm57_q),11);
                u0_m0_wo0_cma1_c0(26) <= RESIZE(SIGNED(u0_m0_wo0_cm58_q),11);
                u0_m0_wo0_cma1_c0(27) <= RESIZE(SIGNED(u0_m0_wo0_cm59_q),11);
                u0_m0_wo0_cma1_c0(28) <= RESIZE(SIGNED(u0_m0_wo0_cm60_q),11);
                u0_m0_wo0_cma1_c0(29) <= RESIZE(SIGNED(u0_m0_wo0_cm61_q),11);
                u0_m0_wo0_cma1_c0(30) <= RESIZE(SIGNED(u0_m0_wo0_cm62_q),11);
                u0_m0_wo0_cma1_c0(31) <= RESIZE(SIGNED(u0_m0_wo0_cm63_q),11);
                u0_m0_wo0_cma1_d(0) <= u0_m0_wo0_cma1_a0(0);
                u0_m0_wo0_cma1_d(1) <= u0_m0_wo0_cma1_a0(1);
                u0_m0_wo0_cma1_d(2) <= u0_m0_wo0_cma1_a0(2);
                u0_m0_wo0_cma1_d(3) <= u0_m0_wo0_cma1_a0(3);
                u0_m0_wo0_cma1_d(4) <= u0_m0_wo0_cma1_a0(4);
                u0_m0_wo0_cma1_d(5) <= u0_m0_wo0_cma1_a0(5);
                u0_m0_wo0_cma1_d(6) <= u0_m0_wo0_cma1_a0(6);
                u0_m0_wo0_cma1_d(7) <= u0_m0_wo0_cma1_a0(7);
                u0_m0_wo0_cma1_d(8) <= u0_m0_wo0_cma1_a0(8);
                u0_m0_wo0_cma1_d(9) <= u0_m0_wo0_cma1_a0(9);
                u0_m0_wo0_cma1_d(10) <= u0_m0_wo0_cma1_a0(10);
                u0_m0_wo0_cma1_d(11) <= u0_m0_wo0_cma1_a0(11);
                u0_m0_wo0_cma1_d(12) <= u0_m0_wo0_cma1_a0(12);
                u0_m0_wo0_cma1_d(13) <= u0_m0_wo0_cma1_a0(13);
                u0_m0_wo0_cma1_d(14) <= u0_m0_wo0_cma1_a0(14);
                u0_m0_wo0_cma1_d(15) <= u0_m0_wo0_cma1_a0(15);
                u0_m0_wo0_cma1_d(16) <= u0_m0_wo0_cma1_a0(16);
                u0_m0_wo0_cma1_d(17) <= u0_m0_wo0_cma1_a0(17);
                u0_m0_wo0_cma1_d(18) <= u0_m0_wo0_cma1_a0(18);
                u0_m0_wo0_cma1_d(19) <= u0_m0_wo0_cma1_a0(19);
                u0_m0_wo0_cma1_d(20) <= u0_m0_wo0_cma1_a0(20);
                u0_m0_wo0_cma1_d(21) <= u0_m0_wo0_cma1_a0(21);
                u0_m0_wo0_cma1_d(22) <= u0_m0_wo0_cma1_a0(22);
                u0_m0_wo0_cma1_d(23) <= u0_m0_wo0_cma1_a0(23);
                u0_m0_wo0_cma1_d(24) <= u0_m0_wo0_cma1_a0(24);
                u0_m0_wo0_cma1_d(25) <= u0_m0_wo0_cma1_a0(25);
                u0_m0_wo0_cma1_d(26) <= u0_m0_wo0_cma1_a0(26);
                u0_m0_wo0_cma1_d(27) <= u0_m0_wo0_cma1_a0(27);
                u0_m0_wo0_cma1_d(28) <= u0_m0_wo0_cma1_a0(28);
                u0_m0_wo0_cma1_d(29) <= u0_m0_wo0_cma1_a0(29);
                u0_m0_wo0_cma1_d(30) <= u0_m0_wo0_cma1_a0(30);
                u0_m0_wo0_cma1_d(31) <= u0_m0_wo0_cma1_a0(31);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma1_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma1_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma1_ena1 = '1') THEN
                u0_m0_wo0_cma1_s(0) <= u0_m0_wo0_cma1_y(0);
                u0_m0_wo0_cma1_s(1) <= u0_m0_wo0_cma1_y(1);
                u0_m0_wo0_cma1_s(2) <= u0_m0_wo0_cma1_y(2);
                u0_m0_wo0_cma1_s(3) <= u0_m0_wo0_cma1_y(3);
                u0_m0_wo0_cma1_s(4) <= u0_m0_wo0_cma1_y(4);
                u0_m0_wo0_cma1_s(5) <= u0_m0_wo0_cma1_y(5);
                u0_m0_wo0_cma1_s(6) <= u0_m0_wo0_cma1_y(6);
                u0_m0_wo0_cma1_s(7) <= u0_m0_wo0_cma1_y(7);
                u0_m0_wo0_cma1_s(8) <= u0_m0_wo0_cma1_y(8);
                u0_m0_wo0_cma1_s(9) <= u0_m0_wo0_cma1_y(9);
                u0_m0_wo0_cma1_s(10) <= u0_m0_wo0_cma1_y(10);
                u0_m0_wo0_cma1_s(11) <= u0_m0_wo0_cma1_y(11);
                u0_m0_wo0_cma1_s(12) <= u0_m0_wo0_cma1_y(12);
                u0_m0_wo0_cma1_s(13) <= u0_m0_wo0_cma1_y(13);
                u0_m0_wo0_cma1_s(14) <= u0_m0_wo0_cma1_y(14);
                u0_m0_wo0_cma1_s(15) <= u0_m0_wo0_cma1_y(15);
                u0_m0_wo0_cma1_s(16) <= u0_m0_wo0_cma1_y(16);
                u0_m0_wo0_cma1_s(17) <= u0_m0_wo0_cma1_y(17);
                u0_m0_wo0_cma1_s(18) <= u0_m0_wo0_cma1_y(18);
                u0_m0_wo0_cma1_s(19) <= u0_m0_wo0_cma1_y(19);
                u0_m0_wo0_cma1_s(20) <= u0_m0_wo0_cma1_y(20);
                u0_m0_wo0_cma1_s(21) <= u0_m0_wo0_cma1_y(21);
                u0_m0_wo0_cma1_s(22) <= u0_m0_wo0_cma1_y(22);
                u0_m0_wo0_cma1_s(23) <= u0_m0_wo0_cma1_y(23);
                u0_m0_wo0_cma1_s(24) <= u0_m0_wo0_cma1_y(24);
                u0_m0_wo0_cma1_s(25) <= u0_m0_wo0_cma1_y(25);
                u0_m0_wo0_cma1_s(26) <= u0_m0_wo0_cma1_y(26);
                u0_m0_wo0_cma1_s(27) <= u0_m0_wo0_cma1_y(27);
                u0_m0_wo0_cma1_s(28) <= u0_m0_wo0_cma1_y(28);
                u0_m0_wo0_cma1_s(29) <= u0_m0_wo0_cma1_y(29);
                u0_m0_wo0_cma1_s(30) <= u0_m0_wo0_cma1_y(30);
                u0_m0_wo0_cma1_s(31) <= u0_m0_wo0_cma1_y(31);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma1_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma1_s(0)(28 downto 0)), xout => u0_m0_wo0_cma1_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma1_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma1_qq(28 downto 0));

    -- u0_m0_wo0_dec31(LOOKUP,285)@10 + 1
    u0_m0_wo0_dec31_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec31_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec31_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec31_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm31(REG,286)@11 + 1
    u0_m0_wo0_cm31_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm31_q <= "1111101010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec31_e = "1") THEN
                u0_m0_wo0_cm31_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr99(DELAY,126)@10
    u0_m0_wo0_wi0_r0_delayr99 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr98_q, xout => u0_m0_wo0_wi0_r0_delayr99_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr100(DELAY,127)@10
    u0_m0_wo0_wi0_r0_delayr100 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr99_q, xout => u0_m0_wo0_wi0_r0_delayr100_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr101(DELAY,128)@10
    u0_m0_wo0_wi0_r0_delayr101 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr100_q, xout => u0_m0_wo0_wi0_r0_delayr101_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr102(DELAY,129)@10
    u0_m0_wo0_wi0_r0_delayr102 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr101_q, xout => u0_m0_wo0_wi0_r0_delayr102_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr103(DELAY,130)@10
    u0_m0_wo0_wi0_r0_delayr103 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr102_q, xout => u0_m0_wo0_wi0_r0_delayr103_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr104(DELAY,131)@10
    u0_m0_wo0_wi0_r0_delayr104 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr103_q, xout => u0_m0_wo0_wi0_r0_delayr104_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr105(DELAY,132)@10
    u0_m0_wo0_wi0_r0_delayr105 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr104_q, xout => u0_m0_wo0_wi0_r0_delayr105_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr106(DELAY,133)@10
    u0_m0_wo0_wi0_r0_delayr106 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr105_q, xout => u0_m0_wo0_wi0_r0_delayr106_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr107(DELAY,134)@10
    u0_m0_wo0_wi0_r0_delayr107 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr106_q, xout => u0_m0_wo0_wi0_r0_delayr107_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr108(DELAY,135)@10
    u0_m0_wo0_wi0_r0_delayr108 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr107_q, xout => u0_m0_wo0_wi0_r0_delayr108_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr109(DELAY,136)@10
    u0_m0_wo0_wi0_r0_delayr109 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr108_q, xout => u0_m0_wo0_wi0_r0_delayr109_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr110(DELAY,137)@10
    u0_m0_wo0_wi0_r0_delayr110 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr109_q, xout => u0_m0_wo0_wi0_r0_delayr110_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr111(DELAY,138)@10
    u0_m0_wo0_wi0_r0_delayr111 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr110_q, xout => u0_m0_wo0_wi0_r0_delayr111_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr112(DELAY,139)@10
    u0_m0_wo0_wi0_r0_delayr112 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr111_q, xout => u0_m0_wo0_wi0_r0_delayr112_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr113(DELAY,140)@10
    u0_m0_wo0_wi0_r0_delayr113 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr112_q, xout => u0_m0_wo0_wi0_r0_delayr113_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr114(DELAY,141)@10
    u0_m0_wo0_wi0_r0_delayr114 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr113_q, xout => u0_m0_wo0_wi0_r0_delayr114_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr130(DELAY,157)@10
    u0_m0_wo0_wi0_r0_delayr130_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr114_q);

    -- u0_m0_wo0_dec30(LOOKUP,282)@10 + 1
    u0_m0_wo0_dec30_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec30_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec30_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec30_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm30(REG,283)@11 + 1
    u0_m0_wo0_cm30_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm30_q <= "1111101101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec30_e = "1") THEN
                u0_m0_wo0_cm30_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec29(LOOKUP,279)@10 + 1
    u0_m0_wo0_dec29_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec29_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec29_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec29_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm29(REG,280)@11 + 1
    u0_m0_wo0_cm29_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm29_q <= "1111110000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec29_e = "1") THEN
                u0_m0_wo0_cm29_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec28(LOOKUP,276)@10 + 1
    u0_m0_wo0_dec28_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec28_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec28_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec28_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm28(REG,277)@11 + 1
    u0_m0_wo0_cm28_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm28_q <= "1111110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec28_e = "1") THEN
                u0_m0_wo0_cm28_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec27(LOOKUP,273)@10 + 1
    u0_m0_wo0_dec27_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec27_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec27_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec27_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm27(REG,274)@11 + 1
    u0_m0_wo0_cm27_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm27_q <= "1111110110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec27_e = "1") THEN
                u0_m0_wo0_cm27_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec26(LOOKUP,270)@10 + 1
    u0_m0_wo0_dec26_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec26_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec26_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec26_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm26(REG,271)@11 + 1
    u0_m0_wo0_cm26_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm26_q <= "1111111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec26_e = "1") THEN
                u0_m0_wo0_cm26_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec25(LOOKUP,267)@10 + 1
    u0_m0_wo0_dec25_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec25_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec25_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec25_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm25(REG,268)@11 + 1
    u0_m0_wo0_cm25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm25_q <= "1111111011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec25_e = "1") THEN
                u0_m0_wo0_cm25_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec24(LOOKUP,264)@10 + 1
    u0_m0_wo0_dec24_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec24_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec24_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec24_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm24(REG,265)@11 + 1
    u0_m0_wo0_cm24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm24_q <= "1111111110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec24_e = "1") THEN
                u0_m0_wo0_cm24_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec23(LOOKUP,261)@10 + 1
    u0_m0_wo0_dec23_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec23_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec23_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec23_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm23(REG,262)@11 + 1
    u0_m0_wo0_cm23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm23_q <= "0000000001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec23_e = "1") THEN
                u0_m0_wo0_cm23_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec22(LOOKUP,258)@10 + 1
    u0_m0_wo0_dec22_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec22_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec22_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec22_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm22(REG,259)@11 + 1
    u0_m0_wo0_cm22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm22_q <= "0000000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec22_e = "1") THEN
                u0_m0_wo0_cm22_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec21(LOOKUP,255)@10 + 1
    u0_m0_wo0_dec21_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec21_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec21_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec21_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm21(REG,256)@11 + 1
    u0_m0_wo0_cm21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm21_q <= "0000000101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec21_e = "1") THEN
                u0_m0_wo0_cm21_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec20(LOOKUP,252)@10 + 1
    u0_m0_wo0_dec20_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec20_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec20_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec20_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm20(REG,253)@11 + 1
    u0_m0_wo0_cm20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm20_q <= "0000000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec20_e = "1") THEN
                u0_m0_wo0_cm20_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec19(LOOKUP,249)@10 + 1
    u0_m0_wo0_dec19_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec19_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec19_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec19_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm19(REG,250)@11 + 1
    u0_m0_wo0_cm19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm19_q <= "0000001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec19_e = "1") THEN
                u0_m0_wo0_cm19_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec18(LOOKUP,246)@10 + 1
    u0_m0_wo0_dec18_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec18_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec18_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec18_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm18(REG,247)@11 + 1
    u0_m0_wo0_cm18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm18_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec18_e = "1") THEN
                u0_m0_wo0_cm18_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec17(LOOKUP,243)@10 + 1
    u0_m0_wo0_dec17_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec17_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec17_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec17_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm17(REG,244)@11 + 1
    u0_m0_wo0_cm17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm17_q <= "0000001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec17_e = "1") THEN
                u0_m0_wo0_cm17_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec16(LOOKUP,240)@10 + 1
    u0_m0_wo0_dec16_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec16_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec16_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec16_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm16(REG,241)@11 + 1
    u0_m0_wo0_cm16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm16_q <= "0000001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec16_e = "1") THEN
                u0_m0_wo0_cm16_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec15(LOOKUP,237)@10 + 1
    u0_m0_wo0_dec15_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec15_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec15_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec15_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm15(REG,238)@11 + 1
    u0_m0_wo0_cm15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm15_q <= "0000001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec15_e = "1") THEN
                u0_m0_wo0_cm15_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec14(LOOKUP,234)@10 + 1
    u0_m0_wo0_dec14_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec14_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec14_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec14_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm14(REG,235)@11 + 1
    u0_m0_wo0_cm14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm14_q <= "0000001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec14_e = "1") THEN
                u0_m0_wo0_cm14_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec13(LOOKUP,231)@10 + 1
    u0_m0_wo0_dec13_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec13_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec13_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec13_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm13(REG,232)@11 + 1
    u0_m0_wo0_cm13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm13_q <= "0000001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec13_e = "1") THEN
                u0_m0_wo0_cm13_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec12(LOOKUP,228)@10 + 1
    u0_m0_wo0_dec12_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec12_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec12_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec12_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm12(REG,229)@11 + 1
    u0_m0_wo0_cm12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm12_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec12_e = "1") THEN
                u0_m0_wo0_cm12_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec11(LOOKUP,225)@10 + 1
    u0_m0_wo0_dec11_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec11_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec11_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec11_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm11(REG,226)@11 + 1
    u0_m0_wo0_cm11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm11_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec11_e = "1") THEN
                u0_m0_wo0_cm11_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec10(LOOKUP,222)@10 + 1
    u0_m0_wo0_dec10_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec10_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec10_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec10_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm10(REG,223)@11 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "0000001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec10_e = "1") THEN
                u0_m0_wo0_cm10_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec9(LOOKUP,219)@10 + 1
    u0_m0_wo0_dec9_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec9_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec9_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec9_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm9(REG,220)@11 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "0000000111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec9_e = "1") THEN
                u0_m0_wo0_cm9_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec8(LOOKUP,216)@10 + 1
    u0_m0_wo0_dec8_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec8_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec8_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec8_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm8(REG,217)@11 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "0000000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec8_e = "1") THEN
                u0_m0_wo0_cm8_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec7(LOOKUP,213)@10 + 1
    u0_m0_wo0_dec7_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec7_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec7_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec7_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm7(REG,214)@11 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "0000000101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec7_e = "1") THEN
                u0_m0_wo0_cm7_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec6(LOOKUP,210)@10 + 1
    u0_m0_wo0_dec6_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec6_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec6_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec6_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm6(REG,211)@11 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "0000000011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec6_e = "1") THEN
                u0_m0_wo0_cm6_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec5(LOOKUP,207)@10 + 1
    u0_m0_wo0_dec5_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec5_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec5_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec5_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm5(REG,208)@11 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "0000000010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec5_e = "1") THEN
                u0_m0_wo0_cm5_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec4(LOOKUP,204)@10 + 1
    u0_m0_wo0_dec4_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec4_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec4_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec4_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm4(REG,205)@11 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "0000000001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec4_e = "1") THEN
                u0_m0_wo0_cm4_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec3(LOOKUP,201)@10 + 1
    u0_m0_wo0_dec3_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec3_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec3_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec3_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm3(REG,202)@11 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "0000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec3_e = "1") THEN
                u0_m0_wo0_cm3_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec2(LOOKUP,198)@10 + 1
    u0_m0_wo0_dec2_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec2_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec2_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec2_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm2(REG,199)@11 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "1111111110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec2_e = "1") THEN
                u0_m0_wo0_cm2_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec1(LOOKUP,195)@10 + 1
    u0_m0_wo0_dec1_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec1_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec1_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec1_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm1(REG,196)@11 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "1111111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec1_e = "1") THEN
                u0_m0_wo0_cm1_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec0(LOOKUP,192)@10 + 1
    u0_m0_wo0_dec0_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec0_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec0_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm0(REG,193)@11 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "1111111100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec0_e = "1") THEN
                u0_m0_wo0_cm0_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cma0(CHAINMULTADD,516)@10 + 2
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
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_l(0) * u0_m0_wo0_cma0_c0(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_l(1) * u0_m0_wo0_cma0_c0(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_l(2) * u0_m0_wo0_cma0_c0(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_l(3) * u0_m0_wo0_cma0_c0(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_l(4) * u0_m0_wo0_cma0_c0(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_l(5) * u0_m0_wo0_cma0_c0(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_l(6) * u0_m0_wo0_cma0_c0(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_l(7) * u0_m0_wo0_cma0_c0(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_l(8) * u0_m0_wo0_cma0_c0(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_l(9) * u0_m0_wo0_cma0_c0(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_l(10) * u0_m0_wo0_cma0_c0(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_l(11) * u0_m0_wo0_cma0_c0(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_l(12) * u0_m0_wo0_cma0_c0(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_l(13) * u0_m0_wo0_cma0_c0(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_l(14) * u0_m0_wo0_cma0_c0(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_l(15) * u0_m0_wo0_cma0_c0(15);
    u0_m0_wo0_cma0_p(16) <= u0_m0_wo0_cma0_l(16) * u0_m0_wo0_cma0_c0(16);
    u0_m0_wo0_cma0_p(17) <= u0_m0_wo0_cma0_l(17) * u0_m0_wo0_cma0_c0(17);
    u0_m0_wo0_cma0_p(18) <= u0_m0_wo0_cma0_l(18) * u0_m0_wo0_cma0_c0(18);
    u0_m0_wo0_cma0_p(19) <= u0_m0_wo0_cma0_l(19) * u0_m0_wo0_cma0_c0(19);
    u0_m0_wo0_cma0_p(20) <= u0_m0_wo0_cma0_l(20) * u0_m0_wo0_cma0_c0(20);
    u0_m0_wo0_cma0_p(21) <= u0_m0_wo0_cma0_l(21) * u0_m0_wo0_cma0_c0(21);
    u0_m0_wo0_cma0_p(22) <= u0_m0_wo0_cma0_l(22) * u0_m0_wo0_cma0_c0(22);
    u0_m0_wo0_cma0_p(23) <= u0_m0_wo0_cma0_l(23) * u0_m0_wo0_cma0_c0(23);
    u0_m0_wo0_cma0_p(24) <= u0_m0_wo0_cma0_l(24) * u0_m0_wo0_cma0_c0(24);
    u0_m0_wo0_cma0_p(25) <= u0_m0_wo0_cma0_l(25) * u0_m0_wo0_cma0_c0(25);
    u0_m0_wo0_cma0_p(26) <= u0_m0_wo0_cma0_l(26) * u0_m0_wo0_cma0_c0(26);
    u0_m0_wo0_cma0_p(27) <= u0_m0_wo0_cma0_l(27) * u0_m0_wo0_cma0_c0(27);
    u0_m0_wo0_cma0_p(28) <= u0_m0_wo0_cma0_l(28) * u0_m0_wo0_cma0_c0(28);
    u0_m0_wo0_cma0_p(29) <= u0_m0_wo0_cma0_l(29) * u0_m0_wo0_cma0_c0(29);
    u0_m0_wo0_cma0_p(30) <= u0_m0_wo0_cma0_l(30) * u0_m0_wo0_cma0_c0(30);
    u0_m0_wo0_cma0_p(31) <= u0_m0_wo0_cma0_l(31) * u0_m0_wo0_cma0_c0(31);
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
                u0_m0_wo0_cma0_a0(29) <= u0_m0_wo0_cma0_d(30);
                u0_m0_wo0_cma0_a0(30) <= u0_m0_wo0_cma0_d(31);
                u0_m0_wo0_cma0_a0(31) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr130_q),12);
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
                u0_m0_wo0_cma0_b0(31) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm0_q),11);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm1_q),11);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm2_q),11);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm3_q),11);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm4_q),11);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(SIGNED(u0_m0_wo0_cm5_q),11);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(SIGNED(u0_m0_wo0_cm6_q),11);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(SIGNED(u0_m0_wo0_cm7_q),11);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(SIGNED(u0_m0_wo0_cm8_q),11);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(SIGNED(u0_m0_wo0_cm9_q),11);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(SIGNED(u0_m0_wo0_cm10_q),11);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(SIGNED(u0_m0_wo0_cm11_q),11);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(SIGNED(u0_m0_wo0_cm12_q),11);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(SIGNED(u0_m0_wo0_cm13_q),11);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(SIGNED(u0_m0_wo0_cm14_q),11);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(SIGNED(u0_m0_wo0_cm15_q),11);
                u0_m0_wo0_cma0_c0(16) <= RESIZE(SIGNED(u0_m0_wo0_cm16_q),11);
                u0_m0_wo0_cma0_c0(17) <= RESIZE(SIGNED(u0_m0_wo0_cm17_q),11);
                u0_m0_wo0_cma0_c0(18) <= RESIZE(SIGNED(u0_m0_wo0_cm18_q),11);
                u0_m0_wo0_cma0_c0(19) <= RESIZE(SIGNED(u0_m0_wo0_cm19_q),11);
                u0_m0_wo0_cma0_c0(20) <= RESIZE(SIGNED(u0_m0_wo0_cm20_q),11);
                u0_m0_wo0_cma0_c0(21) <= RESIZE(SIGNED(u0_m0_wo0_cm21_q),11);
                u0_m0_wo0_cma0_c0(22) <= RESIZE(SIGNED(u0_m0_wo0_cm22_q),11);
                u0_m0_wo0_cma0_c0(23) <= RESIZE(SIGNED(u0_m0_wo0_cm23_q),11);
                u0_m0_wo0_cma0_c0(24) <= RESIZE(SIGNED(u0_m0_wo0_cm24_q),11);
                u0_m0_wo0_cma0_c0(25) <= RESIZE(SIGNED(u0_m0_wo0_cm25_q),11);
                u0_m0_wo0_cma0_c0(26) <= RESIZE(SIGNED(u0_m0_wo0_cm26_q),11);
                u0_m0_wo0_cma0_c0(27) <= RESIZE(SIGNED(u0_m0_wo0_cm27_q),11);
                u0_m0_wo0_cma0_c0(28) <= RESIZE(SIGNED(u0_m0_wo0_cm28_q),11);
                u0_m0_wo0_cma0_c0(29) <= RESIZE(SIGNED(u0_m0_wo0_cm29_q),11);
                u0_m0_wo0_cma0_c0(30) <= RESIZE(SIGNED(u0_m0_wo0_cm30_q),11);
                u0_m0_wo0_cma0_c0(31) <= RESIZE(SIGNED(u0_m0_wo0_cm31_q),11);
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
                u0_m0_wo0_cma0_d(31) <= u0_m0_wo0_cma0_a0(31);
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

    -- u0_m0_wo0_mtree_add0_0(ADD,519)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_q);
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cma1_q);
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(28 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,520)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add0_0_q(28)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_cma2_q(28)) & u0_m0_wo0_cma2_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(29 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_13(DELAY,535)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,521)@13 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_13_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,523)@14
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,525)@14
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,526)@14 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add1_0_q;

END normal;
