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

-- VHDL created from mp_txrx_Memory
-- VHDL created on Wed May 22 14:10:30 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity mp_txrx_Memory_atb is
end;

architecture normal of mp_txrx_Memory_atb is

component mp_txrx_Memory is
    port (
        in_1_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_4_dc1 : in std_logic_vector(7 downto 0);  -- ufix8
        out_2_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_m2 : out std_logic_vector(1 downto 0);  -- sfix2
        out_5_qv1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_qc1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_m1 : out std_logic_vector(11 downto 0);  -- ufix12
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component mp_txrx_Memory_stm is
    port (
        in_1_dv_stm : out std_logic_vector(0 downto 0);
        in_2_dc_stm : out std_logic_vector(7 downto 0);
        in_3_trigger_stm : out std_logic_vector(0 downto 0);
        in_4_dc1_stm : out std_logic_vector(7 downto 0);
        out_2_qv_stm : out std_logic_vector(0 downto 0);
        out_3_qc_stm : out std_logic_vector(7 downto 0);
        out_1_m2_stm : out std_logic_vector(1 downto 0);
        out_5_qv1_stm : out std_logic_vector(0 downto 0);
        out_6_qc1_stm : out std_logic_vector(7 downto 0);
        out_4_m1_stm : out std_logic_vector(11 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_dv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_dc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_trigger_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_dc1_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_2_qv_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_m2_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_5_qv1_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_qc1_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_m1_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_1_dv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_dc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_trigger_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_dc1_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_2_qv_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_m2_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_5_qv1_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_qc1_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_m1_dut : STD_LOGIC_VECTOR (11 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset)
begin
END PROCESS;


-- Channelized data in real output
checkChannelIn1 : process (clk, areset)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_1_m2_dut, out_1_m2_stm)
variable mismatch_out_2_qv : BOOLEAN := FALSE;
variable mismatch_out_3_qc : BOOLEAN := FALSE;
variable mismatch_out_1_m2 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_2_qv := FALSE;
        mismatch_out_3_qc := FALSE;
        mismatch_out_1_m2 := FALSE;
        IF ( (out_2_qv_dut /= out_2_qv_stm)) THEN
            mismatch_out_2_qv := TRUE;
            report "mismatch in out_2_qv signal" severity Failure;
        END IF;
        IF (out_2_qv_dut = "1") THEN
            IF ( (out_3_qc_dut /= out_3_qc_stm)) THEN
                mismatch_out_3_qc := TRUE;
                report "mismatch in out_3_qc signal" severity Warning;
            END IF;
            IF ( (out_1_m2_dut /= out_1_m2_stm)) THEN
                mismatch_out_1_m2 := TRUE;
                report "mismatch in out_1_m2 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_2_qv = TRUE or mismatch_out_3_qc = TRUE or mismatch_out_1_m2 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


-- Channelized data out check
checkChannelOut1 : process (clk, areset, out_4_m1_dut, out_4_m1_stm)
variable mismatch_out_5_qv1 : BOOLEAN := FALSE;
variable mismatch_out_6_qc1 : BOOLEAN := FALSE;
variable mismatch_out_4_m1 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_5_qv1 := FALSE;
        mismatch_out_6_qc1 := FALSE;
        mismatch_out_4_m1 := FALSE;
        IF ( (out_5_qv1_dut /= out_5_qv1_stm)) THEN
            mismatch_out_5_qv1 := TRUE;
            report "mismatch in out_5_qv1 signal" severity Failure;
        END IF;
        IF (out_5_qv1_dut = "1") THEN
            IF ( (out_6_qc1_dut /= out_6_qc1_stm)) THEN
                mismatch_out_6_qc1 := TRUE;
                report "mismatch in out_6_qc1 signal" severity Warning;
            END IF;
            IF ( (out_4_m1_dut /= out_4_m1_stm)) THEN
                mismatch_out_4_m1 := TRUE;
                report "mismatch in out_4_m1 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_5_qv1 = TRUE or mismatch_out_6_qc1 = TRUE or mismatch_out_4_m1 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : mp_txrx_Memory port map (
    in_1_dv_stm,
    in_2_dc_stm,
    in_3_trigger_stm,
    in_4_dc1_stm,
    out_2_qv_dut,
    out_3_qc_dut,
    out_1_m2_dut,
    out_5_qv1_dut,
    out_6_qc1_dut,
    out_4_m1_dut,
        clk,
        areset
);

sim : mp_txrx_Memory_stm port map (
    in_1_dv_stm,
    in_2_dc_stm,
    in_3_trigger_stm,
    in_4_dc1_stm,
    out_2_qv_stm,
    out_3_qc_stm,
    out_1_m2_stm,
    out_5_qv1_stm,
    out_6_qc1_stm,
    out_4_m1_stm,
        clk,
        areset
);

end normal;
