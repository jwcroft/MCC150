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

-- VHDL created from final_project_txrx_fp_Decode_symbols_into_bitstream
-- VHDL created on Mon May 27 19:21:13 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_Decode_symbols_into_bitstream_atb is
end;

architecture normal of final_project_txrx_fp_Decode_symbols_into_bitstream_atb is

component final_project_txrx_fp_Decode_symbols_into_bitstream is
    port (
        in_1_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_symbols_x : in std_logic_vector(62 downto 0);  -- sfix63_en47
        in_4_packet_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_memory_bitstream : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_v_bits : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_bits : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_out4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_out5 : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_Decode_symbols_into_bitstream_stm is
    port (
        in_1_v_stm : out std_logic_vector(0 downto 0);
        in_2_c_stm : out std_logic_vector(7 downto 0);
        in_3_symbols_x_stm : out std_logic_vector(62 downto 0);
        in_4_packet_trigger_stm : out std_logic_vector(0 downto 0);
        in_5_memory_bitstream_stm : out std_logic_vector(0 downto 0);
        out_1_v_bits_stm : out std_logic_vector(0 downto 0);
        out_2_qc_stm : out std_logic_vector(7 downto 0);
        out_3_bits_stm : out std_logic_vector(0 downto 0);
        out_4_out4_stm : out std_logic_vector(0 downto 0);
        out_5_out5_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_symbols_x_stm : STD_LOGIC_VECTOR (62 downto 0);
signal in_4_packet_trigger_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_memory_bitstream_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_v_bits_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_bits_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_out4_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_out5_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_symbols_x_dut : STD_LOGIC_VECTOR (62 downto 0);
signal in_4_packet_trigger_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_memory_bitstream_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_v_bits_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_bits_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_out4_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_out5_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn : process (clk, areset, in_3_symbols_x_dut, in_3_symbols_x_stm, in_4_packet_trigger_dut, in_4_packet_trigger_stm, in_5_memory_bitstream_dut, in_5_memory_bitstream_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut : process (clk, areset, out_3_bits_dut, out_3_bits_stm, out_4_out4_dut, out_4_out4_stm, out_5_out5_dut, out_5_out5_stm)
variable mismatch_out_1_v_bits : BOOLEAN := FALSE;
variable mismatch_out_2_qc : BOOLEAN := FALSE;
variable mismatch_out_3_bits : BOOLEAN := FALSE;
variable mismatch_out_4_out4 : BOOLEAN := FALSE;
variable mismatch_out_5_out5 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_v_bits := FALSE;
        mismatch_out_2_qc := FALSE;
        mismatch_out_3_bits := FALSE;
        mismatch_out_4_out4 := FALSE;
        mismatch_out_5_out5 := FALSE;
        IF ( (out_1_v_bits_dut /= out_1_v_bits_stm)) THEN
            mismatch_out_1_v_bits := TRUE;
            report "mismatch in out_1_v_bits signal" severity Failure;
        END IF;
        IF (out_1_v_bits_dut = "1") THEN
            IF ( (out_2_qc_dut /= out_2_qc_stm)) THEN
                mismatch_out_2_qc := TRUE;
                report "mismatch in out_2_qc signal" severity Warning;
            END IF;
            IF ( (out_3_bits_dut /= out_3_bits_stm)) THEN
                mismatch_out_3_bits := TRUE;
                report "mismatch in out_3_bits signal" severity Warning;
            END IF;
            IF ( (out_4_out4_dut /= out_4_out4_stm)) THEN
                mismatch_out_4_out4 := TRUE;
                report "mismatch in out_4_out4 signal" severity Warning;
            END IF;
            IF ( (out_5_out5_dut /= out_5_out5_stm)) THEN
                mismatch_out_5_out5 := TRUE;
                report "mismatch in out_5_out5 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_v_bits = TRUE or mismatch_out_2_qc = TRUE or mismatch_out_3_bits = TRUE or mismatch_out_4_out4 = TRUE or mismatch_out_5_out5 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : final_project_txrx_fp_Decode_symbols_into_bitstream port map (
    in_1_v_stm,
    in_2_c_stm,
    in_3_symbols_x_stm,
    in_4_packet_trigger_stm,
    in_5_memory_bitstream_stm,
    out_1_v_bits_dut,
    out_2_qc_dut,
    out_3_bits_dut,
    out_4_out4_dut,
    out_5_out5_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_Decode_symbols_into_bitstream_stm port map (
    in_1_v_stm,
    in_2_c_stm,
    in_3_symbols_x_stm,
    in_4_packet_trigger_stm,
    in_5_memory_bitstream_stm,
    out_1_v_bits_stm,
    out_2_qc_stm,
    out_3_bits_stm,
    out_4_out4_stm,
    out_5_out5_stm,
        clk,
        areset
);

end normal;
