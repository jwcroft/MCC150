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

-- VHDL created from mp_txrx_BER_Extraction
-- VHDL created on Mon May 20 17:18:09 2019


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

entity mp_txrx_BER_Extraction is
    port (
        in_4_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_bits : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_memory : in std_logic_vector(11 downto 0);  -- ufix12
        out_3_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_BER : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_bit_error : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end mp_txrx_BER_Extraction;

architecture normal of mp_txrx_BER_Extraction is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpNE_a : STD_LOGIC_VECTOR (11 downto 0);
    signal CmpNE_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_ChannelIn_in_1_bits_5_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist0_ChannelIn_in_1_bits_5(DELAY,8)
    redist0_ChannelIn_in_1_bits_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_1_bits, xout => redist0_ChannelIn_in_1_bits_5_q, clk => clk, aclr => areset );

    -- CmpNE(LOGICAL,5)@0
    CmpNE_a <= STD_LOGIC_VECTOR("00000000000" & redist0_ChannelIn_in_1_bits_5_q);
    CmpNE_q <= "1" WHEN CmpNE_a /= in_5_memory ELSE "0";

    -- And_rsrvd_fix(LOGICAL,2)@0
    And_rsrvd_fix_q <= CmpNE_q and in_2_trigger;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- ChannelOut(PORTOUT,4)@0 + 1
    out_3_qv <= in_4_dv;
    out_2_qc <= in_3_dc;
    out_1_BER <= GND_q;
    out_4_bit_error <= And_rsrvd_fix_q;

END normal;
