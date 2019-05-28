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

-- VHDL created from final_project_1_txrx_fp
-- VHDL created on Fri May 24 15:19:49 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_1_txrx_fp_atb is
end;

architecture normal of final_project_1_txrx_fp_atb is

component final_project_1_txrx_fp is
    port (
        busIn_writedata : in std_logic_vector(15 downto 0);  -- ufix16
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- ufix16
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        ADC_I : in std_logic_vector(11 downto 0);  -- sfix12
        ADC_Q : in std_logic_vector(11 downto 0);  -- sfix12
        Reset : in std_logic_vector(63 downto 0);  -- float64_m52
        DAC_I : out std_logic_vector(11 downto 0);  -- sfix12
        DAC_Q : out std_logic_vector(11 downto 0);  -- sfix12
        mem_o : out std_logic_vector(0 downto 0);  -- ufix1
        BBI : out std_logic_vector(27 downto 0);  -- sfix28_en10
        BBQ : out std_logic_vector(27 downto 0);  -- sfix28_en10
        ma_0 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_1 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_2 : out std_logic_vector(11 downto 0);  -- sfix12
        ma_3 : out std_logic_vector(24 downto 0);  -- sfix25
        ma_4 : out std_logic_vector(24 downto 0);  -- sfix25
        ma_5 : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end component;

component final_project_1_txrx_fp_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        ADC_I_stm : out std_logic_vector(11 downto 0);
        ADC_Q_stm : out std_logic_vector(11 downto 0);
        Reset_stm : out std_logic_vector(63 downto 0);
        DAC_I_stm : out std_logic_vector(11 downto 0);
        DAC_Q_stm : out std_logic_vector(11 downto 0);
        mem_o_stm : out std_logic_vector(0 downto 0);
        BBI_stm : out std_logic_vector(27 downto 0);
        BBQ_stm : out std_logic_vector(27 downto 0);
        ma_0_stm : out std_logic_vector(11 downto 0);
        ma_1_stm : out std_logic_vector(11 downto 0);
        ma_2_stm : out std_logic_vector(11 downto 0);
        ma_3_stm : out std_logic_vector(24 downto 0);
        ma_4_stm : out std_logic_vector(24 downto 0);
        ma_5_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busOut_waitrequest_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ADC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal Reset_stm : STD_LOGIC_VECTOR (63 downto 0);
signal DAC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal DAC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal mem_o_stm : STD_LOGIC_VECTOR (0 downto 0);
signal BBI_stm : STD_LOGIC_VECTOR (27 downto 0);
signal BBQ_stm : STD_LOGIC_VECTOR (27 downto 0);
signal ma_0_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ma_1_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ma_2_stm : STD_LOGIC_VECTOR (11 downto 0);
signal ma_3_stm : STD_LOGIC_VECTOR (24 downto 0);
signal ma_4_stm : STD_LOGIC_VECTOR (24 downto 0);
signal ma_5_stm : STD_LOGIC_VECTOR (24 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ADC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal Reset_dut : STD_LOGIC_VECTOR (63 downto 0);
signal DAC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal DAC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal mem_o_dut : STD_LOGIC_VECTOR (0 downto 0);
signal BBI_dut : STD_LOGIC_VECTOR (27 downto 0);
signal BBQ_dut : STD_LOGIC_VECTOR (27 downto 0);
signal ma_0_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ma_1_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ma_2_dut : STD_LOGIC_VECTOR (11 downto 0);
signal ma_3_dut : STD_LOGIC_VECTOR (24 downto 0);
signal ma_4_dut : STD_LOGIC_VECTOR (24 downto 0);
signal ma_5_dut : STD_LOGIC_VECTOR (24 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal h_areset : std_logic;

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
checkma_0 : process (clk, areset)
variable mismatch_ma_0 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_0 := FALSE;
        IF ( (abs(signed(ma_0_dut) - signed(ma_0_stm)) > 3)) THEN
            mismatch_ma_0 := TRUE;
            report "Mismatch on device output pin ma_0" severity Warning;
        END IF;
        IF (mismatch_ma_0) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkma_1 : process (clk, areset)
variable mismatch_ma_1 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_1 := FALSE;
        IF ( (abs(signed(ma_1_dut) - signed(ma_1_stm)) > 3)) THEN
            mismatch_ma_1 := TRUE;
            report "Mismatch on device output pin ma_1" severity Warning;
        END IF;
        IF (mismatch_ma_1) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkma_2 : process (clk, areset)
variable mismatch_ma_2 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_2 := FALSE;
        IF ( (abs(signed(ma_2_dut) - signed(ma_2_stm)) > 3)) THEN
            mismatch_ma_2 := TRUE;
            report "Mismatch on device output pin ma_2" severity Warning;
        END IF;
        IF (mismatch_ma_2) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkma_3 : process (clk, areset)
variable mismatch_ma_3 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_3 := FALSE;
        IF ( (abs(signed(ma_3_dut) - signed(ma_3_stm)) > 3)) THEN
            mismatch_ma_3 := TRUE;
            report "Mismatch on device output pin ma_3" severity Warning;
        END IF;
        IF (mismatch_ma_3) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkma_4 : process (clk, areset)
variable mismatch_ma_4 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_4 := FALSE;
        IF ( (abs(signed(ma_4_dut) - signed(ma_4_stm)) > 3)) THEN
            mismatch_ma_4 := TRUE;
            report "Mismatch on device output pin ma_4" severity Warning;
        END IF;
        IF (mismatch_ma_4) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checkma_5 : process (clk, areset)
variable mismatch_ma_5 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ma_5 := FALSE;
        IF ( (abs(signed(ma_5_dut) - signed(ma_5_stm)) > 3)) THEN
            mismatch_ma_5 := TRUE;
            report "Mismatch on device output pin ma_5" severity Warning;
        END IF;
        IF (mismatch_ma_5) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


dut : final_project_1_txrx_fp port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    ADC_I_stm,
    ADC_Q_stm,
    Reset_stm,
    DAC_I_dut,
    DAC_Q_dut,
    mem_o_dut,
    BBI_dut,
    BBQ_dut,
    ma_0_dut,
    ma_1_dut,
    ma_2_dut,
    ma_3_dut,
    ma_4_dut,
    ma_5_dut,
        clk,
        areset,
        h_areset
);

sim : final_project_1_txrx_fp_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    ADC_I_stm,
    ADC_Q_stm,
    Reset_stm,
    DAC_I_stm,
    DAC_Q_stm,
    mem_o_stm,
    BBI_stm,
    BBQ_stm,
    ma_0_stm,
    ma_1_stm,
    ma_2_stm,
    ma_3_stm,
    ma_4_stm,
    ma_5_stm,
        clk,
        areset,
        h_areset
);

end normal;
