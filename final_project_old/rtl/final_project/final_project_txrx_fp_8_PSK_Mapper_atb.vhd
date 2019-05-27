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

-- VHDL created from final_project_txrx_fp_8_PSK_Mapper
-- VHDL created on Fri May 24 15:27:35 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_8_PSK_Mapper_atb is
end;

architecture normal of final_project_txrx_fp_8_PSK_Mapper_atb is

component final_project_txrx_fp_8_PSK_Mapper is
    port (
        in_2_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_bit_stream : in std_logic_vector(0 downto 0);  -- ufix1
        out_3_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_symbol_I : out std_logic_vector(11 downto 0);  -- sfix12
        out_2_symbol_Q : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_8_PSK_Mapper_stm is
    port (
        in_2_dv_stm : out std_logic_vector(0 downto 0);
        in_3_dc_stm : out std_logic_vector(7 downto 0);
        in_1_bit_stream_stm : out std_logic_vector(0 downto 0);
        out_3_qv_stm : out std_logic_vector(0 downto 0);
        out_4_qc_stm : out std_logic_vector(7 downto 0);
        out_1_symbol_I_stm : out std_logic_vector(11 downto 0);
        out_2_symbol_Q_stm : out std_logic_vector(11 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_2_dv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_dc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_bit_stream_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_symbol_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_symbol_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_2_dv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_dc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_bit_stream_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_symbol_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_symbol_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset, in_1_bit_stream_dut, in_1_bit_stream_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_1_symbol_I_dut, out_1_symbol_I_stm, out_2_symbol_Q_dut, out_2_symbol_Q_stm)
variable mismatch_out_3_qv : BOOLEAN := FALSE;
variable mismatch_out_4_qc : BOOLEAN := FALSE;
variable mismatch_out_1_symbol_I : BOOLEAN := FALSE;
variable mismatch_out_2_symbol_Q : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_3_qv := FALSE;
        mismatch_out_4_qc := FALSE;
        mismatch_out_1_symbol_I := FALSE;
        mismatch_out_2_symbol_Q := FALSE;
        IF ( (out_3_qv_dut /= out_3_qv_stm)) THEN
            mismatch_out_3_qv := TRUE;
            report "mismatch in out_3_qv signal" severity Failure;
        END IF;
        IF (out_3_qv_dut = "1") THEN
            IF ( (out_4_qc_dut /= out_4_qc_stm)) THEN
                mismatch_out_4_qc := TRUE;
                report "mismatch in out_4_qc signal" severity Warning;
            END IF;
            IF ( (out_1_symbol_I_dut /= out_1_symbol_I_stm)) THEN
                mismatch_out_1_symbol_I := TRUE;
                report "mismatch in out_1_symbol_I signal" severity Warning;
            END IF;
            IF ( (out_2_symbol_Q_dut /= out_2_symbol_Q_stm)) THEN
                mismatch_out_2_symbol_Q := TRUE;
                report "mismatch in out_2_symbol_Q signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_3_qv = TRUE or mismatch_out_4_qc = TRUE or mismatch_out_1_symbol_I = TRUE or mismatch_out_2_symbol_Q = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : final_project_txrx_fp_8_PSK_Mapper port map (
    in_2_dv_stm,
    in_3_dc_stm,
    in_1_bit_stream_stm,
    out_3_qv_dut,
    out_4_qc_dut,
    out_1_symbol_I_dut,
    out_2_symbol_Q_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_8_PSK_Mapper_stm port map (
    in_2_dv_stm,
    in_3_dc_stm,
    in_1_bit_stream_stm,
    out_3_qv_stm,
    out_4_qc_stm,
    out_1_symbol_I_stm,
    out_2_symbol_Q_stm,
        clk,
        areset
);

end normal;
