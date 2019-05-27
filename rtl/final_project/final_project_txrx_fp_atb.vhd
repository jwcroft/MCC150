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

-- VHDL created from final_project_txrx_fp
-- VHDL created on Mon May 27 20:44:42 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_atb is
end;

architecture normal of final_project_txrx_fp_atb is

component final_project_txrx_fp is
    port (
        ADC_I : in std_logic_vector(11 downto 0);  -- sfix12
        ADC_Q : in std_logic_vector(11 downto 0);  -- sfix12
        Reset : in std_logic_vector(63 downto 0);  -- float64_m52
        DAC_I : out std_logic_vector(11 downto 0);  -- sfix12
        DAC_Q : out std_logic_vector(11 downto 0);  -- sfix12
        mem_o : out std_logic_vector(0 downto 0);  -- ufix1
        BBI : out std_logic_vector(27 downto 0);  -- sfix28_en10
        BBQ : out std_logic_vector(27 downto 0);  -- sfix28_en10
        rx_bits : out std_logic_vector(0 downto 0);  -- ufix1
        mem_read_bits : out std_logic_vector(0 downto 0);  -- ufix1
        sym_phase : out std_logic_vector(29 downto 0);  -- sfix30_en14
        left_power : out std_logic_vector(11 downto 0);  -- sfix12
        main_power : out std_logic_vector(11 downto 0);  -- sfix12
        right_power : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_stm is
    port (
        ADC_I_stm : out std_logic_vector(11 downto 0);
        ADC_Q_stm : out std_logic_vector(11 downto 0);
        Reset_stm : out std_logic_vector(63 downto 0);
        DAC_I_stm : out std_logic_vector(11 downto 0);
        DAC_Q_stm : out std_logic_vector(11 downto 0);
        mem_o_stm : out std_logic_vector(0 downto 0);
        BBI_stm : out std_logic_vector(27 downto 0);
        BBQ_stm : out std_logic_vector(27 downto 0);
        rx_bits_stm : out std_logic_vector(0 downto 0);
        mem_read_bits_stm : out std_logic_vector(0 downto 0);
        sym_phase_stm : out std_logic_vector(29 downto 0);
        left_power_stm : out std_logic_vector(11 downto 0);
        main_power_stm : out std_logic_vector(11 downto 0);
        right_power_stm : out std_logic_vector(11 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal ADC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal Reset_stm : STD_LOGIC_VECTOR (63 downto 0);
signal DAC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal DAC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal mem_o_stm : STD_LOGIC_VECTOR (0 downto 0);
signal BBI_stm : STD_LOGIC_VECTOR (27 downto 0);
signal BBQ_stm : STD_LOGIC_VECTOR (27 downto 0);
signal rx_bits_stm : STD_LOGIC_VECTOR (0 downto 0);
signal mem_read_bits_stm : STD_LOGIC_VECTOR (0 downto 0);
signal sym_phase_stm : STD_LOGIC_VECTOR (29 downto 0);
signal left_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal main_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal right_power_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal Reset_dut : STD_LOGIC_VECTOR (63 downto 0);
signal DAC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal DAC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal mem_o_dut : STD_LOGIC_VECTOR (0 downto 0);
signal BBI_dut : STD_LOGIC_VECTOR (27 downto 0);
signal BBQ_dut : STD_LOGIC_VECTOR (27 downto 0);
signal rx_bits_dut : STD_LOGIC_VECTOR (0 downto 0);
signal mem_read_bits_dut : STD_LOGIC_VECTOR (0 downto 0);
signal sym_phase_dut : STD_LOGIC_VECTOR (29 downto 0);
signal left_power_dut : STD_LOGIC_VECTOR (11 downto 0);
signal main_power_dut : STD_LOGIC_VECTOR (11 downto 0);
signal right_power_dut : STD_LOGIC_VECTOR (11 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkADC_I : process (clk, areset, ADC_I_dut, ADC_I_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkADC_Q : process (clk, areset, ADC_Q_dut, ADC_Q_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkReset : process (clk, areset, Reset_dut, Reset_stm)
variable Reset_real : REAL := 0.0;
variable Reset_stm_real : REAL := 0.0;
begin
 Reset_real := vIEEE_2_real(Reset_dut, 11, 52, false);
 Reset_stm_real := vIEEE_2_real(Reset_stm, 11, 52, false);
END PROCESS;


-- General Purpose data out check
checkDAC_I : process (clk, areset)
variable mismatch_DAC_I : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DAC_I := FALSE;
        IF ( (abs(signed(DAC_I_dut) - signed(DAC_I_stm)) > 3)) THEN
            mismatch_DAC_I := TRUE;
            report "Mismatch on device output pin DAC_I" severity Warning;
        END IF;
        IF (mismatch_DAC_I) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkDAC_Q : process (clk, areset)
variable mismatch_DAC_Q : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_DAC_Q := FALSE;
        IF ( (abs(signed(DAC_Q_dut) - signed(DAC_Q_stm)) > 3)) THEN
            mismatch_DAC_Q := TRUE;
            report "Mismatch on device output pin DAC_Q" severity Warning;
        END IF;
        IF (mismatch_DAC_Q) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkmem_o : process (clk, areset)
variable mismatch_mem_o : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_mem_o := FALSE;
        IF ( (mem_o_dut /= mem_o_stm)) THEN
            mismatch_mem_o := TRUE;
            report "Mismatch on device output pin mem_o" severity Warning;
        END IF;
        IF (mismatch_mem_o) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkBBI : process (clk, areset)
variable mismatch_BBI : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_BBI := FALSE;
        IF ( (abs(signed(BBI_dut) - signed(BBI_stm)) > 3)) THEN
            mismatch_BBI := TRUE;
            report "Mismatch on device output pin BBI" severity Warning;
        END IF;
        IF (mismatch_BBI) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkBBQ : process (clk, areset)
variable mismatch_BBQ : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_BBQ := FALSE;
        IF ( (abs(signed(BBQ_dut) - signed(BBQ_stm)) > 3)) THEN
            mismatch_BBQ := TRUE;
            report "Mismatch on device output pin BBQ" severity Warning;
        END IF;
        IF (mismatch_BBQ) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkrx_bits : process (clk, areset)
variable mismatch_rx_bits : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_rx_bits := FALSE;
        IF ( (rx_bits_dut /= rx_bits_stm)) THEN
            mismatch_rx_bits := TRUE;
            report "Mismatch on device output pin rx_bits" severity Warning;
        END IF;
        IF (mismatch_rx_bits) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkmem_read_bits : process (clk, areset)
variable mismatch_mem_read_bits : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_mem_read_bits := FALSE;
        IF ( (mem_read_bits_dut /= mem_read_bits_stm)) THEN
            mismatch_mem_read_bits := TRUE;
            report "Mismatch on device output pin mem_read_bits" severity Warning;
        END IF;
        IF (mismatch_mem_read_bits) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksym_phase : process (clk, areset)
variable mismatch_sym_phase : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_sym_phase := FALSE;
        IF ( (abs(signed(sym_phase_dut) - signed(sym_phase_stm)) > 3)) THEN
            mismatch_sym_phase := TRUE;
            report "Mismatch on device output pin sym_phase" severity Warning;
        END IF;
        IF (mismatch_sym_phase) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkleft_power : process (clk, areset)
variable mismatch_left_power : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_left_power := FALSE;
        IF ( (abs(signed(left_power_dut) - signed(left_power_stm)) > 3)) THEN
            mismatch_left_power := TRUE;
            report "Mismatch on device output pin left_power" severity Warning;
        END IF;
        IF (mismatch_left_power) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkmain_power : process (clk, areset)
variable mismatch_main_power : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_main_power := FALSE;
        IF ( (abs(signed(main_power_dut) - signed(main_power_stm)) > 3)) THEN
            mismatch_main_power := TRUE;
            report "Mismatch on device output pin main_power" severity Warning;
        END IF;
        IF (mismatch_main_power) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkright_power : process (clk, areset)
variable mismatch_right_power : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_right_power := FALSE;
        IF ( (abs(signed(right_power_dut) - signed(right_power_stm)) > 3)) THEN
            mismatch_right_power := TRUE;
            report "Mismatch on device output pin right_power" severity Warning;
        END IF;
        IF (mismatch_right_power) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


dut : final_project_txrx_fp port map (
    ADC_I_stm,
    ADC_Q_stm,
    Reset_stm,
    DAC_I_dut,
    DAC_Q_dut,
    mem_o_dut,
    BBI_dut,
    BBQ_dut,
    rx_bits_dut,
    mem_read_bits_dut,
    sym_phase_dut,
    left_power_dut,
    main_power_dut,
    right_power_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_stm port map (
    ADC_I_stm,
    ADC_Q_stm,
    Reset_stm,
    DAC_I_stm,
    DAC_Q_stm,
    mem_o_stm,
    BBI_stm,
    BBQ_stm,
    rx_bits_stm,
    mem_read_bits_stm,
    sym_phase_stm,
    left_power_stm,
    main_power_stm,
    right_power_stm,
        clk,
        areset
);

end normal;
