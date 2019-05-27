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

-- VHDL created from final_project_txrx_fp_SRlatch
-- VHDL created on Thu May 23 18:12:01 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity final_project_txrx_fp_SRlatch_atb is
end;

architecture normal of final_project_txrx_fp_SRlatch_atb is

component final_project_txrx_fp_SRlatch is
    port (
        in_1_s : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_r : in std_logic_vector(1 downto 0);  -- ufix2
        out_1_q : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component final_project_txrx_fp_SRlatch_stm is
    port (
        in_1_s_stm : out std_logic_vector(0 downto 0);
        in_2_r_stm : out std_logic_vector(1 downto 0);
        out_1_q_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_r_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_1_q_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_r_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_1_q_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_s : process (clk, areset, in_1_s_dut, in_1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_r : process (clk, areset, in_2_r_dut, in_2_r_stm)
begin
END PROCESS;


dut : final_project_txrx_fp_SRlatch port map (
    in_1_s_stm,
    in_2_r_stm,
    out_1_q_dut,
        clk,
        areset
);

sim : final_project_txrx_fp_SRlatch_stm port map (
    in_1_s_stm,
    in_2_r_stm,
    out_1_q_stm,
        clk,
        areset
);

end normal;
