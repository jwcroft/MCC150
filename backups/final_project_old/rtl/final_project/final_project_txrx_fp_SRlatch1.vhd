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

-- VHDL created from final_project_txrx_fp_SRlatch1
-- VHDL created on Thu May 23 18:12:00 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity final_project_txrx_fp_SRlatch1 is
    port (
        in_1_s : in std_logic_vector(1 downto 0);  -- ufix2
        in_2_r : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_q : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_SRlatch1;

architecture normal of final_project_txrx_fp_SRlatch1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal SampleDelay1_PostCast_primWireOut_sel_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal And_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Or_rsrvd_fix_a : STD_LOGIC_VECTOR (1 downto 0);
    signal Or_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal SampleDelay1_q : STD_LOGIC_VECTOR (1 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- Not_rsrvd_fix(LOGICAL,4)
    Not_rsrvd_fix_q <= not (in_2_r);

    -- Or_rsrvd_fix(LOGICAL,5)
    Or_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & SampleDelay1_PostCast_primWireOut_sel_x_b);
    Or_rsrvd_fix_q <= Or_rsrvd_fix_a or in_1_s;

    -- And_rsrvd_fix(LOGICAL,3)
    And_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & Not_rsrvd_fix_q);
    And_rsrvd_fix_q <= Or_rsrvd_fix_q and And_rsrvd_fix_b;

    -- SampleDelay1(DELAY,6)
    SampleDelay1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => And_rsrvd_fix_q, xout => SampleDelay1_q, clk => clk, aclr => areset );

    -- SampleDelay1_PostCast_primWireOut_sel_x(BITSELECT,2)
    SampleDelay1_PostCast_primWireOut_sel_x_b <= SampleDelay1_q(0 downto 0);

    -- out_1_q(GPOUT,10)
    out_1_q <= SampleDelay1_PostCast_primWireOut_sel_x_b;

END normal;