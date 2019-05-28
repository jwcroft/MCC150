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

-- VHDL created from final_project_txrx_fp_Power_extraction
-- VHDL created on Tue May 28 19:39:05 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_Power_extraction_atb is
end;

architecture normal of final_project_txrx_fp_Power_extraction_atb is

component final_project_txrx_fp_Power_extraction is
    port (
        in_7_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_8_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_left_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_left_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_3_main_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_4_main_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_5_right_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_6_right_Q : in std_logic_vector(11 downto 0);  -- sfix12
        out_1_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_left_power : out std_logic_vector(24 downto 0);  -- sfix25
        out_4_main_power : out std_logic_vector(24 downto 0);  -- sfix25
        out_5_right_power : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_Power_extraction_stm is
    port (
        in_7_v_stm : out std_logic_vector(0 downto 0);
        in_8_c_stm : out std_logic_vector(7 downto 0);
        in_1_left_I_stm : out std_logic_vector(11 downto 0);
        in_2_left_Q_stm : out std_logic_vector(11 downto 0);
        in_3_main_I_stm : out std_logic_vector(11 downto 0);
        in_4_main_Q_stm : out std_logic_vector(11 downto 0);
        in_5_right_I_stm : out std_logic_vector(11 downto 0);
        in_6_right_Q_stm : out std_logic_vector(11 downto 0);
        out_1_qv_stm : out std_logic_vector(0 downto 0);
        out_2_qc_stm : out std_logic_vector(7 downto 0);
        out_3_left_power_stm : out std_logic_vector(24 downto 0);
        out_4_main_power_stm : out std_logic_vector(24 downto 0);
        out_5_right_power_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_7_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_left_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_left_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_3_main_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_4_main_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_right_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_6_right_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_qv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_left_power_stm : STD_LOGIC_VECTOR (24 downto 0);
signal out_4_main_power_stm : STD_LOGIC_VECTOR (24 downto 0);
signal out_5_right_power_stm : STD_LOGIC_VECTOR (24 downto 0);
signal in_7_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_left_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_left_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_3_main_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_4_main_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_right_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_6_right_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_qv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_left_power_dut : STD_LOGIC_VECTOR (24 downto 0);
signal out_4_main_power_dut : STD_LOGIC_VECTOR (24 downto 0);
signal out_5_right_power_dut : STD_LOGIC_VECTOR (24 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset, in_1_left_I_dut, in_1_left_I_stm, in_2_left_Q_dut, in_2_left_Q_stm, in_3_main_I_dut, in_3_main_I_stm, in_4_main_Q_dut, in_4_main_Q_stm, in_5_right_I_dut, in_5_right_I_stm, in_6_right_Q_dut, in_6_right_Q_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_3_left_power_dut, out_3_left_power_stm, out_4_main_power_dut, out_4_main_power_stm, out_5_right_power_dut, out_5_right_power_stm)
variable mismatch_out_1_qv : BOOLEAN := FALSE;
variable mismatch_out_2_qc : BOOLEAN := FALSE;
variable mismatch_out_3_left_power : BOOLEAN := FALSE;
variable mismatch_out_4_main_power : BOOLEAN := FALSE;
variable mismatch_out_5_right_power : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_qv := FALSE;
        mismatch_out_2_qc := FALSE;
        mismatch_out_3_left_power := FALSE;
        mismatch_out_4_main_power := FALSE;
        mismatch_out_5_right_power := FALSE;
        IF ( (out_1_qv_dut /= out_1_qv_stm)) THEN
            mismatch_out_1_qv := TRUE;
            report "mismatch in out_1_qv signal" severity Failure;
        END IF;
        IF (out_1_qv_dut = "1") THEN
            IF ( (out_2_qc_dut /= out_2_qc_stm)) THEN
                mismatch_out_2_qc := TRUE;
                report "mismatch in out_2_qc signal" severity Warning;
            END IF;
            IF ( (out_3_left_power_dut /= out_3_left_power_stm)) THEN
                mismatch_out_3_left_power := TRUE;
                report "mismatch in out_3_left_power signal" severity Warning;
            END IF;
            IF ( (out_4_main_power_dut /= out_4_main_power_stm)) THEN
                mismatch_out_4_main_power := TRUE;
                report "mismatch in out_4_main_power signal" severity Warning;
            END IF;
            IF ( (out_5_right_power_dut /= out_5_right_power_stm)) THEN
                mismatch_out_5_right_power := TRUE;
                report "mismatch in out_5_right_power signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_qv = TRUE or mismatch_out_2_qc = TRUE or mismatch_out_3_left_power = TRUE or mismatch_out_4_main_power = TRUE or mismatch_out_5_right_power = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : final_project_txrx_fp_Power_extraction port map (
    in_7_v_stm,
    in_8_c_stm,
    in_1_left_I_stm,
    in_2_left_Q_stm,
    in_3_main_I_stm,
    in_4_main_Q_stm,
    in_5_right_I_stm,
    in_6_right_Q_stm,
    out_1_qv_dut,
    out_2_qc_dut,
    out_3_left_power_dut,
    out_4_main_power_dut,
    out_5_right_power_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_Power_extraction_stm port map (
    in_7_v_stm,
    in_8_c_stm,
    in_1_left_I_stm,
    in_2_left_Q_stm,
    in_3_main_I_stm,
    in_4_main_Q_stm,
    in_5_right_I_stm,
    in_6_right_Q_stm,
    out_1_qv_stm,
    out_2_qc_stm,
    out_3_left_power_stm,
    out_4_main_power_stm,
    out_5_right_power_stm,
        clk,
        areset
);

end normal;
