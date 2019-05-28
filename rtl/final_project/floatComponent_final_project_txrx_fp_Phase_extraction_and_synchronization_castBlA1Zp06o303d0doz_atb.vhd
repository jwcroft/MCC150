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

-- VHDL created from floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz
-- VHDL created on Tue May 28 19:39:05 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz_atb is
end;

architecture normal of floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz_atb is

component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz is
    port (
        in_0 : in std_logic_vector(11 downto 0);  -- sfix12
        out_primWireOut : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz_stm is
    port (
        in_0_stm : out std_logic_vector(11 downto 0);
        out_primWireOut_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_0_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_primWireOut_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_0_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_primWireOut_dut : STD_LOGIC_VECTOR (63 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_0 : process (clk, areset, in_0_dut, in_0_stm)
begin
END PROCESS;


dut : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz port map (
    in_0_stm,
    out_primWireOut_dut,
        clk,
        areset
);

sim : floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA1Zcp06of03p06o303d0doz_stm port map (
    in_0_stm,
    out_primWireOut_stm,
        clk,
        areset
);

end normal;
