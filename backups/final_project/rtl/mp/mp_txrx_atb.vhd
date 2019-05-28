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

-- VHDL created from mp_txrx
-- VHDL created on Wed May 22 14:10:30 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity mp_txrx_atb is
end;

architecture normal of mp_txrx_atb is

component mp_txrx is
    port (
        busIn_writedata : in std_logic_vector(15 downto 0);  -- ufix16
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- ufix16
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        fromADC_I : in std_logic_vector(11 downto 0);  -- sfix12
        fromADC_Q : in std_logic_vector(11 downto 0);  -- sfix12
        toDAC_I : out std_logic_vector(11 downto 0);  -- sfix12
        toDAC_Q : out std_logic_vector(11 downto 0);  -- sfix12
        BBI : out std_logic_vector(29 downto 0);  -- sfix30_en11
        BBQ : out std_logic_vector(29 downto 0);  -- sfix30_en11
        mem_o : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end component;

component mp_txrx_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        fromADC_I_stm : out std_logic_vector(11 downto 0);
        fromADC_Q_stm : out std_logic_vector(11 downto 0);
        toDAC_I_stm : out std_logic_vector(11 downto 0);
        toDAC_Q_stm : out std_logic_vector(11 downto 0);
        BBI_stm : out std_logic_vector(29 downto 0);
        BBQ_stm : out std_logic_vector(29 downto 0);
        mem_o_stm : out std_logic_vector(11 downto 0);
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
signal fromADC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal fromADC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal toDAC_I_stm : STD_LOGIC_VECTOR (11 downto 0);
signal toDAC_Q_stm : STD_LOGIC_VECTOR (11 downto 0);
signal BBI_stm : STD_LOGIC_VECTOR (29 downto 0);
signal BBQ_stm : STD_LOGIC_VECTOR (29 downto 0);
signal mem_o_stm : STD_LOGIC_VECTOR (11 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (9 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (15 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal fromADC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal fromADC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal toDAC_I_dut : STD_LOGIC_VECTOR (11 downto 0);
signal toDAC_Q_dut : STD_LOGIC_VECTOR (11 downto 0);
signal BBI_dut : STD_LOGIC_VECTOR (29 downto 0);
signal BBQ_dut : STD_LOGIC_VECTOR (29 downto 0);
signal mem_o_dut : STD_LOGIC_VECTOR (11 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal h_areset : std_logic;

begin

-- General Purpose data in real output
checkfromADC_I : process (clk, areset, fromADC_I_dut, fromADC_I_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkfromADC_Q : process (clk, areset, fromADC_Q_dut, fromADC_Q_stm)
begin
END PROCESS;


-- General Purpose data out check
checktoDAC_I : process (clk, areset)
variable mismatch_toDAC_I : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_toDAC_I := FALSE;
        IF ( (toDAC_I_dut /= toDAC_I_stm)) THEN
            mismatch_toDAC_I := TRUE;
            report "Mismatch on device output pin toDAC_I" severity Warning;
        END IF;
        IF (mismatch_toDAC_I) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checktoDAC_Q : process (clk, areset)
variable mismatch_toDAC_Q : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_toDAC_Q := FALSE;
        IF ( (toDAC_Q_dut /= toDAC_Q_stm)) THEN
            mismatch_toDAC_Q := TRUE;
            report "Mismatch on device output pin toDAC_Q" severity Warning;
        END IF;
        IF (mismatch_toDAC_Q) THEN
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
        IF ( (BBI_dut /= BBI_stm)) THEN
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
        IF ( (BBQ_dut /= BBQ_stm)) THEN
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


dut : mp_txrx port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    fromADC_I_stm,
    fromADC_Q_stm,
    toDAC_I_dut,
    toDAC_Q_dut,
    BBI_dut,
    BBQ_dut,
    mem_o_dut,
        clk,
        areset,
        h_areset
);

sim : mp_txrx_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    fromADC_I_stm,
    fromADC_Q_stm,
    toDAC_I_stm,
    toDAC_Q_stm,
    BBI_stm,
    BBQ_stm,
    mem_o_stm,
        clk,
        areset,
        h_areset
);

end normal;
