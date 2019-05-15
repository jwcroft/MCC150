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

-- VHDL created from mp_txrx_ChanView6
-- VHDL created on Wed May 15 10:15:08 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity mp_txrx_ChanView6_atb is
end;

architecture normal of mp_txrx_ChanView6_atb is

component mp_txrx_ChanView6 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(24 downto 0);  -- sfix25
        c0_o : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component mp_txrx_ChanView6_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(24 downto 0);
        c0_o_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal xIn_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_stm : STD_LOGIC_VECTOR (24 downto 0);
signal c0_o_stm : STD_LOGIC_VECTOR (24 downto 0);
signal xIn_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_dut : STD_LOGIC_VECTOR (24 downto 0);
signal c0_o_dut : STD_LOGIC_VECTOR (24 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkxIn : process (clk, areset, xIn_0_dut, xIn_0_stm)
begin
END PROCESS;


-- General Purpose data out check
checkc0 : process (clk, areset)
variable mismatch_c0_o : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF (areset = '1') THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_c0_o := FALSE;
        IF ( (c0_o_dut /= c0_o_stm)) THEN
            mismatch_c0_o := TRUE;
            report "Mismatch on device output pin c0_o" severity Warning;
        END IF;
        IF (mismatch_c0_o) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


dut : mp_txrx_ChanView6 port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    c0_o_dut,
        clk,
        areset
);

sim : mp_txrx_ChanView6_stm port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    c0_o_stm,
        clk,
        areset
);

end normal;
