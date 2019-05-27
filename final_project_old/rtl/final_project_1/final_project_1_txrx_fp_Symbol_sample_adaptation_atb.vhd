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
use work.dspba_sim_library_package.all;
entity final_project_1_txrx_fp_Symbol_sample_adaptation_atb is
end;

architecture normal of final_project_1_txrx_fp_Symbol_sample_adaptation_atb is

component final_project_1_txrx_fp_Symbol_sample_adaptation is
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
end component;

component final_project_1_txrx_fp_Symbol_sample_adaptation_stm is
    port (
        in_4_v_stm : out std_logic_vector(0 downto 0);
        in_5_c_stm : out std_logic_vector(7 downto 0);
        in_1_left_power_stm : out std_logic_vector(11 downto 0);
        in_2_main_power_stm : out std_logic_vector(11 downto 0);
        in_3_right_power_stm : out std_logic_vector(11 downto 0);
        out_1_v_sample_update_stm : out std_logic_vector(0 downto 0);
        out_2_qc_stm : out std_logic_vector(7 downto 0);
        out_3_sample_crement_stm : out std_logic_vector(1 downto 0);
        out_4_sym_sample_stm : out std_logic_vector(1 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_4_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_left_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_main_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_3_right_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_v_sample_update_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_sample_crement_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_4_sym_sample_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_4_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_left_power_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_main_power_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_3_right_power_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_v_sample_update_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_sample_crement_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_4_sym_sample_dut : STD_LOGIC_VECTOR (1 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset, in_1_left_power_dut, in_1_left_power_stm, in_2_main_power_dut, in_2_main_power_stm, in_3_right_power_dut, in_3_right_power_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_3_sample_crement_dut, out_3_sample_crement_stm, out_4_sym_sample_dut, out_4_sym_sample_stm)
variable mismatch_out_1_v_sample_update : BOOLEAN := FALSE;
variable mismatch_out_2_qc : BOOLEAN := FALSE;
variable mismatch_out_3_sample_crement : BOOLEAN := FALSE;
variable mismatch_out_4_sym_sample : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_v_sample_update := FALSE;
        mismatch_out_2_qc := FALSE;
        mismatch_out_3_sample_crement := FALSE;
        mismatch_out_4_sym_sample := FALSE;
        IF ( (out_1_v_sample_update_dut /= out_1_v_sample_update_stm)) THEN
            mismatch_out_1_v_sample_update := TRUE;
            report "mismatch in out_1_v_sample_update signal" severity Failure;
        END IF;
        IF (out_1_v_sample_update_dut = "1") THEN
            IF ( (out_2_qc_dut /= out_2_qc_stm)) THEN
                mismatch_out_2_qc := TRUE;
                report "mismatch in out_2_qc signal" severity Warning;
            END IF;
            IF ( (out_3_sample_crement_dut /= out_3_sample_crement_stm)) THEN
                mismatch_out_3_sample_crement := TRUE;
                report "mismatch in out_3_sample_crement signal" severity Warning;
            END IF;
            IF ( (out_4_sym_sample_dut /= out_4_sym_sample_stm)) THEN
                mismatch_out_4_sym_sample := TRUE;
                report "mismatch in out_4_sym_sample signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_v_sample_update = TRUE or mismatch_out_2_qc = TRUE or mismatch_out_3_sample_crement = TRUE or mismatch_out_4_sym_sample = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : final_project_1_txrx_fp_Symbol_sample_adaptation port map (
    in_4_v_stm,
    in_5_c_stm,
    in_1_left_power_stm,
    in_2_main_power_stm,
    in_3_right_power_stm,
    out_1_v_sample_update_dut,
    out_2_qc_dut,
    out_3_sample_crement_dut,
    out_4_sym_sample_dut,
        clk,
        areset
);

sim : final_project_1_txrx_fp_Symbol_sample_adaptation_stm port map (
    in_4_v_stm,
    in_5_c_stm,
    in_1_left_power_stm,
    in_2_main_power_stm,
    in_3_right_power_stm,
    out_1_v_sample_update_stm,
    out_2_qc_stm,
    out_3_sample_crement_stm,
    out_4_sym_sample_stm,
        clk,
        areset
);

end normal;
