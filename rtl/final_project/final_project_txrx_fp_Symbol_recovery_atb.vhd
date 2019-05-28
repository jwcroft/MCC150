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
-- VHDL created on Tue May 28 19:39:06 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_Symbol_recovery_atb is
end;

architecture normal of final_project_txrx_fp_Symbol_recovery_atb is

component final_project_txrx_fp_Symbol_recovery is
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
        out_10_instant_power : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_Symbol_recovery_stm is
    port (
        in_3_v_stm : out std_logic_vector(0 downto 0);
        in_5_c_stm : out std_logic_vector(7 downto 0);
        in_1_in_I_stm : out std_logic_vector(11 downto 0);
        in_2_in_Q_stm : out std_logic_vector(11 downto 0);
        in_4_sample_crement_stm : out std_logic_vector(1 downto 0);
        in_6_v_sample_update_stm : out std_logic_vector(0 downto 0);
        out_3_qv_stm : out std_logic_vector(0 downto 0);
        out_8_qc_stm : out std_logic_vector(7 downto 0);
        out_1_left_I_stm : out std_logic_vector(11 downto 0);
        out_2_left_Q_stm : out std_logic_vector(11 downto 0);
        out_4_main_I_stm : out std_logic_vector(11 downto 0);
        out_5_main_Q_stm : out std_logic_vector(11 downto 0);
        out_6_right_I_stm : out std_logic_vector(11 downto 0);
        out_7_right_Q_stm : out std_logic_vector(11 downto 0);
        out_9_packet_trigger_stm : out std_logic_vector(0 downto 0);
        out_10_instant_power_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_3_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_in_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_in_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_4_sample_crement_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_6_v_sample_update_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_8_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_left_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_left_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_4_main_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_5_main_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_6_right_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_7_right_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_9_packet_trigger_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_10_instant_power_stm : STD_LOGIC_VECTOR (24 downto 0);
signal in_3_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_in_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_in_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_4_sample_crement_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_6_v_sample_update_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_8_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_left_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_left_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_4_main_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_5_main_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_6_right_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_7_right_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_9_packet_trigger_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_10_instant_power_dut : STD_LOGIC_VECTOR (24 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset, in_1_in_I_dut, in_1_in_I_stm, in_2_in_Q_dut, in_2_in_Q_stm, in_4_sample_crement_dut, in_4_sample_crement_stm, in_6_v_sample_update_dut, in_6_v_sample_update_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_1_left_I_dut, out_1_left_I_stm, out_2_left_Q_dut, out_2_left_Q_stm, out_4_main_I_dut, out_4_main_I_stm, out_5_main_Q_dut, out_5_main_Q_stm, out_6_right_I_dut, out_6_right_I_stm, out_7_right_Q_dut, out_7_right_Q_stm, out_9_packet_trigger_dut, out_9_packet_trigger_stm, out_10_instant_power_dut, out_10_instant_power_stm)
variable mismatch_out_3_qv : BOOLEAN := FALSE;
variable mismatch_out_8_qc : BOOLEAN := FALSE;
variable mismatch_out_1_left_I : BOOLEAN := FALSE;
variable mismatch_out_2_left_Q : BOOLEAN := FALSE;
variable mismatch_out_4_main_I : BOOLEAN := FALSE;
variable mismatch_out_5_main_Q : BOOLEAN := FALSE;
variable mismatch_out_6_right_I : BOOLEAN := FALSE;
variable mismatch_out_7_right_Q : BOOLEAN := FALSE;
variable mismatch_out_9_packet_trigger : BOOLEAN := FALSE;
variable mismatch_out_10_instant_power : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_3_qv := FALSE;
        mismatch_out_8_qc := FALSE;
        mismatch_out_1_left_I := FALSE;
        mismatch_out_2_left_Q := FALSE;
        mismatch_out_4_main_I := FALSE;
        mismatch_out_5_main_Q := FALSE;
        mismatch_out_6_right_I := FALSE;
        mismatch_out_7_right_Q := FALSE;
        mismatch_out_9_packet_trigger := FALSE;
        mismatch_out_10_instant_power := FALSE;
        IF ( (out_3_qv_dut /= out_3_qv_stm)) THEN
            mismatch_out_3_qv := TRUE;
            report "mismatch in out_3_qv signal" severity Failure;
        END IF;
        IF (out_3_qv_dut = "1") THEN
            IF ( (out_8_qc_dut /= out_8_qc_stm)) THEN
                mismatch_out_8_qc := TRUE;
                report "mismatch in out_8_qc signal" severity Warning;
            END IF;
            IF ( (out_1_left_I_dut /= out_1_left_I_stm)) THEN
                mismatch_out_1_left_I := TRUE;
                report "mismatch in out_1_left_I signal" severity Warning;
            END IF;
            IF ( (out_2_left_Q_dut /= out_2_left_Q_stm)) THEN
                mismatch_out_2_left_Q := TRUE;
                report "mismatch in out_2_left_Q signal" severity Warning;
            END IF;
            IF ( (out_4_main_I_dut /= out_4_main_I_stm)) THEN
                mismatch_out_4_main_I := TRUE;
                report "mismatch in out_4_main_I signal" severity Warning;
            END IF;
            IF ( (out_5_main_Q_dut /= out_5_main_Q_stm)) THEN
                mismatch_out_5_main_Q := TRUE;
                report "mismatch in out_5_main_Q signal" severity Warning;
            END IF;
            IF ( (out_6_right_I_dut /= out_6_right_I_stm)) THEN
                mismatch_out_6_right_I := TRUE;
                report "mismatch in out_6_right_I signal" severity Warning;
            END IF;
            IF ( (out_7_right_Q_dut /= out_7_right_Q_stm)) THEN
                mismatch_out_7_right_Q := TRUE;
                report "mismatch in out_7_right_Q signal" severity Warning;
            END IF;
            IF ( (out_9_packet_trigger_dut /= out_9_packet_trigger_stm)) THEN
                mismatch_out_9_packet_trigger := TRUE;
                report "mismatch in out_9_packet_trigger signal" severity Warning;
            END IF;
            IF ( (out_10_instant_power_dut /= out_10_instant_power_stm)) THEN
                mismatch_out_10_instant_power := TRUE;
                report "mismatch in out_10_instant_power signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_3_qv = TRUE or mismatch_out_8_qc = TRUE or mismatch_out_1_left_I = TRUE or mismatch_out_2_left_Q = TRUE or mismatch_out_4_main_I = TRUE or mismatch_out_5_main_Q = TRUE or mismatch_out_6_right_I = TRUE or mismatch_out_7_right_Q = TRUE or mismatch_out_9_packet_trigger = TRUE or mismatch_out_10_instant_power = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : final_project_txrx_fp_Symbol_recovery port map (
    in_3_v_stm,
    in_5_c_stm,
    in_1_in_I_stm,
    in_2_in_Q_stm,
    in_4_sample_crement_stm,
    in_6_v_sample_update_stm,
    out_3_qv_dut,
    out_8_qc_dut,
    out_1_left_I_dut,
    out_2_left_Q_dut,
    out_4_main_I_dut,
    out_5_main_Q_dut,
    out_6_right_I_dut,
    out_7_right_Q_dut,
    out_9_packet_trigger_dut,
    out_10_instant_power_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_Symbol_recovery_stm port map (
    in_3_v_stm,
    in_5_c_stm,
    in_1_in_I_stm,
    in_2_in_Q_stm,
    in_4_sample_crement_stm,
    in_6_v_sample_update_stm,
    out_3_qv_stm,
    out_8_qc_stm,
    out_1_left_I_stm,
    out_2_left_Q_stm,
    out_4_main_I_stm,
    out_5_main_Q_stm,
    out_6_right_I_stm,
    out_7_right_Q_stm,
    out_9_packet_trigger_stm,
    out_10_instant_power_stm,
        clk,
        areset
);

end normal;
