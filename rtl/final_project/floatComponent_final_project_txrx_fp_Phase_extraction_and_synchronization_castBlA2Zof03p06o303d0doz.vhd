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

-- VHDL created from floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz
-- VHDL created on Wed May 29 10:21:56 2019


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

entity floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz is
    port (
        in_0 : in std_logic_vector(63 downto 0);  -- float64_m52
        out_primWireOut : out std_logic_vector(17 downto 0);  -- sfix18_en14
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz;

architecture normal of floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_castBlA2Zcp06of03p06o303d0doz is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_x_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_x_uid10_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid23_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal signX_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpVal_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal ovfExpRange_uid27_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal ovfExpRange_uid27_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal ovfExpRange_uid27_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal ovfExpRange_uid27_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal udfExpVal_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal udf_uid29_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal udf_uid29_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal udf_uid29_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal udf_uid29_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpVal_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValE_uid31_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftValE_uid31_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftValE_uid31_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftValE_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftValRaw_uid32_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftValRaw_uid32_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal maxShiftCst_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftOutOfRange_uid34_block_rsrvd_fix_a : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftOutOfRange_uid34_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftOutOfRange_uid34_block_rsrvd_fix_o : STD_LOGIC_VECTOR (14 downto 0);
    signal shiftOutOfRange_uid34_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid35_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid35_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shifterIn_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (17 downto 0);
    signal maxPosValueS_uid38_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal maxNegValueS_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal zRightShiferNoStickyOut_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xXorSignE_uid41_block_rsrvd_fix_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xXorSignE_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (18 downto 0);
    signal d0_uid42_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal sPostRndFull_uid43_block_rsrvd_fix_a : STD_LOGIC_VECTOR (19 downto 0);
    signal sPostRndFull_uid43_block_rsrvd_fix_b : STD_LOGIC_VECTOR (19 downto 0);
    signal sPostRndFull_uid43_block_rsrvd_fix_o : STD_LOGIC_VECTOR (19 downto 0);
    signal sPostRndFull_uid43_block_rsrvd_fix_q : STD_LOGIC_VECTOR (19 downto 0);
    signal sPostRnd_uid44_block_rsrvd_fix_in : STD_LOGIC_VECTOR (18 downto 0);
    signal sPostRnd_uid44_block_rsrvd_fix_b : STD_LOGIC_VECTOR (17 downto 0);
    signal sPostRnd_uid45_block_rsrvd_fix_in : STD_LOGIC_VECTOR (20 downto 0);
    signal sPostRnd_uid45_block_rsrvd_fix_b : STD_LOGIC_VECTOR (19 downto 0);
    signal rndOvfPos_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (21 downto 0);
    signal rndOvfPos_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rndOvfPos_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (21 downto 0);
    signal rndOvfPos_uid46_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfPostRnd_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSelConc_uid48_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal muxSel_uid49_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal maxNegValueU_uid50_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal finalOut_uid51_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal finalOut_uid51_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx1Rng8_uid55_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1Pad8_uid56_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1_uid57_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx2Rng16_uid58_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2Pad16_uid59_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid60_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx1Rng2_uid64_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage1Idx1Pad2_uid65_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1Idx1_uid66_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx2Rng4_uid67_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal rightShiftStage1Idx2Pad4_uid68_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx2_uid69_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1Idx3Rng6_uid70_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx3Pad6_uid71_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid72_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage2Idx1Rng1_uid75_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage2Idx1_uid77_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxNegValueU_uid50_block_rsrvd_fix(CONSTANT,49)
    maxNegValueU_uid50_block_rsrvd_fix_q <= "000000000000000000";

    -- maxNegValueS_uid39_block_rsrvd_fix(CONSTANT,38)
    maxNegValueS_uid39_block_rsrvd_fix_q <= "100000000000000000";

    -- maxPosValueS_uid38_block_rsrvd_fix(CONSTANT,37)
    maxPosValueS_uid38_block_rsrvd_fix_q <= "011111111111111111";

    -- d0_uid42_block_rsrvd_fix(CONSTANT,41)
    d0_uid42_block_rsrvd_fix_q <= "001";

    -- signX_uid25_block_rsrvd_fix(BITSELECT,24)@0
    signX_uid25_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(63 downto 63));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage2Idx1Rng1_uid75_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,74)@0
    rightShiftStage2Idx1Rng1_uid75_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q(17 downto 1);

    -- rightShiftStage2Idx1_uid77_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,76)@0
    rightShiftStage2Idx1_uid77_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= GND_q & rightShiftStage2Idx1Rng1_uid75_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- rightShiftStage1Idx3Pad6_uid71_rightShiferNoStickyOut_uid37_block_rsrvd_fix(CONSTANT,70)
    rightShiftStage1Idx3Pad6_uid71_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid70_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,69)@0
    rightShiftStage1Idx3Rng6_uid70_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q(17 downto 6);

    -- rightShiftStage1Idx3_uid72_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,71)@0
    rightShiftStage1Idx3_uid72_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx3Pad6_uid71_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q & rightShiftStage1Idx3Rng6_uid70_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- rightShiftStage1Idx2Pad4_uid68_rightShiferNoStickyOut_uid37_block_rsrvd_fix(CONSTANT,67)
    rightShiftStage1Idx2Pad4_uid68_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid67_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,66)@0
    rightShiftStage1Idx2Rng4_uid67_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q(17 downto 4);

    -- rightShiftStage1Idx2_uid69_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,68)@0
    rightShiftStage1Idx2_uid69_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx2Pad4_uid68_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q & rightShiftStage1Idx2Rng4_uid67_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- rightShiftStage1Idx1Pad2_uid65_rightShiferNoStickyOut_uid37_block_rsrvd_fix(CONSTANT,64)
    rightShiftStage1Idx1Pad2_uid65_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid64_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,63)@0
    rightShiftStage1Idx1Rng2_uid64_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q(17 downto 2);

    -- rightShiftStage1Idx1_uid66_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,65)@0
    rightShiftStage1Idx1_uid66_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx1Pad2_uid65_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q & rightShiftStage1Idx1Rng2_uid64_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- rightShiftStage0Idx2Pad16_uid59_rightShiferNoStickyOut_uid37_block_rsrvd_fix(CONSTANT,58)
    rightShiftStage0Idx2Pad16_uid59_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= "0000000000000000";

    -- rightShiftStage0Idx2Rng16_uid58_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,57)@0
    rightShiftStage0Idx2Rng16_uid58_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= shifterIn_uid36_block_rsrvd_fix_b(17 downto 16);

    -- rightShiftStage0Idx2_uid60_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,59)@0
    rightShiftStage0Idx2_uid60_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage0Idx2Pad16_uid59_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q & rightShiftStage0Idx2Rng16_uid58_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- rightShiftStage0Idx1Pad8_uid56_rightShiferNoStickyOut_uid37_block_rsrvd_fix(CONSTANT,55)
    rightShiftStage0Idx1Pad8_uid56_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= "00000000";

    -- rightShiftStage0Idx1Rng8_uid55_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITSELECT,54)@0
    rightShiftStage0Idx1Rng8_uid55_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b <= shifterIn_uid36_block_rsrvd_fix_b(17 downto 8);

    -- rightShiftStage0Idx1_uid57_rightShiferNoStickyOut_uid37_block_rsrvd_fix(BITJOIN,56)@0
    rightShiftStage0Idx1_uid57_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage0Idx1Pad8_uid56_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q & rightShiftStage0Idx1Rng8_uid55_rightShiferNoStickyOut_uid37_block_rsrvd_fix_b;

    -- cstAllZWE_uid8_block_rsrvd_fix(CONSTANT,7)
    cstAllZWE_uid8_block_rsrvd_fix_q <= "00000000000";

    -- exp_x_uid9_block_rsrvd_fix(BITSELECT,8)@0
    exp_x_uid9_block_rsrvd_fix_b <= in_0(62 downto 52);

    -- excZ_x_uid11_block_rsrvd_fix(LOGICAL,10)@0
    excZ_x_uid11_block_rsrvd_fix_q <= "1" WHEN exp_x_uid9_block_rsrvd_fix_b = cstAllZWE_uid8_block_rsrvd_fix_q ELSE "0";

    -- invExcXZ_uid22_block_rsrvd_fix(LOGICAL,21)@0
    invExcXZ_uid22_block_rsrvd_fix_q <= not (excZ_x_uid11_block_rsrvd_fix_q);

    -- frac_x_uid10_block_rsrvd_fix(BITSELECT,9)@0
    frac_x_uid10_block_rsrvd_fix_b <= in_0(51 downto 0);

    -- oFracX_uid23_block_rsrvd_fix(BITJOIN,22)@0
    oFracX_uid23_block_rsrvd_fix_q <= invExcXZ_uid22_block_rsrvd_fix_q & frac_x_uid10_block_rsrvd_fix_b;

    -- shifterIn_uid36_block_rsrvd_fix(BITSELECT,35)@0
    shifterIn_uid36_block_rsrvd_fix_b <= oFracX_uid23_block_rsrvd_fix_q(52 downto 35);

    -- rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix(MUX,62)@0
    rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s <= rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_b;
    rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s, shifterIn_uid36_block_rsrvd_fix_b, rightShiftStage0Idx1_uid57_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, rightShiftStage0Idx2_uid60_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, maxNegValueU_uid50_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= shifterIn_uid36_block_rsrvd_fix_b;
            WHEN "01" => rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid57_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid60_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= maxNegValueU_uid50_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix(MUX,73)@0
    rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s <= rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_c;
    rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s, rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, rightShiftStage1Idx1_uid66_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, rightShiftStage1Idx2_uid69_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, rightShiftStage1Idx3_uid72_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage0_uid63_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid66_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid69_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid72_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- maxShiftCst_uid33_block_rsrvd_fix(CONSTANT,32)
    maxShiftCst_uid33_block_rsrvd_fix_q <= "10010";

    -- ovfExpVal_uid30_block_rsrvd_fix(CONSTANT,29)
    ovfExpVal_uid30_block_rsrvd_fix_q <= "010000000001";

    -- shiftValE_uid31_block_rsrvd_fix(SUB,30)@0
    shiftValE_uid31_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => ovfExpVal_uid30_block_rsrvd_fix_q(11)) & ovfExpVal_uid30_block_rsrvd_fix_q));
    shiftValE_uid31_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_block_rsrvd_fix_b));
    shiftValE_uid31_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(shiftValE_uid31_block_rsrvd_fix_a) - SIGNED(shiftValE_uid31_block_rsrvd_fix_b));
    shiftValE_uid31_block_rsrvd_fix_q <= shiftValE_uid31_block_rsrvd_fix_o(12 downto 0);

    -- shiftValRaw_uid32_block_rsrvd_fix(BITSELECT,31)@0
    shiftValRaw_uid32_block_rsrvd_fix_in <= shiftValE_uid31_block_rsrvd_fix_q(4 downto 0);
    shiftValRaw_uid32_block_rsrvd_fix_b <= shiftValRaw_uid32_block_rsrvd_fix_in(4 downto 0);

    -- shiftOutOfRange_uid34_block_rsrvd_fix(COMPARE,33)@0
    shiftOutOfRange_uid34_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => shiftValE_uid31_block_rsrvd_fix_q(12)) & shiftValE_uid31_block_rsrvd_fix_q));
    shiftOutOfRange_uid34_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000" & maxShiftCst_uid33_block_rsrvd_fix_q));
    shiftOutOfRange_uid34_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(shiftOutOfRange_uid34_block_rsrvd_fix_a) - SIGNED(shiftOutOfRange_uid34_block_rsrvd_fix_b));
    shiftOutOfRange_uid34_block_rsrvd_fix_n(0) <= not (shiftOutOfRange_uid34_block_rsrvd_fix_o(14));

    -- shiftVal_uid35_block_rsrvd_fix(MUX,34)@0
    shiftVal_uid35_block_rsrvd_fix_s <= shiftOutOfRange_uid34_block_rsrvd_fix_n;
    shiftVal_uid35_block_rsrvd_fix_combproc: PROCESS (shiftVal_uid35_block_rsrvd_fix_s, shiftValRaw_uid32_block_rsrvd_fix_b, maxShiftCst_uid33_block_rsrvd_fix_q)
    BEGIN
        CASE (shiftVal_uid35_block_rsrvd_fix_s) IS
            WHEN "0" => shiftVal_uid35_block_rsrvd_fix_q <= shiftValRaw_uid32_block_rsrvd_fix_b;
            WHEN "1" => shiftVal_uid35_block_rsrvd_fix_q <= maxShiftCst_uid33_block_rsrvd_fix_q;
            WHEN OTHERS => shiftVal_uid35_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select(BITSELECT,80)@0
    rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_b <= shiftVal_uid35_block_rsrvd_fix_q(4 downto 3);
    rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_c <= shiftVal_uid35_block_rsrvd_fix_q(2 downto 1);
    rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_d <= shiftVal_uid35_block_rsrvd_fix_q(0 downto 0);

    -- rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix(MUX,78)@0
    rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s <= rightShiftStageSel4Dto3_uid62_rightShiferNoStickyOut_uid37_block_rsrvd_fix_merged_bit_select_d;
    rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_combproc: PROCESS (rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s, rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q, rightShiftStage2Idx1_uid77_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_s) IS
            WHEN "0" => rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage1_uid74_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN "1" => rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid77_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- zRightShiferNoStickyOut_uid40_block_rsrvd_fix(BITJOIN,39)@0
    zRightShiferNoStickyOut_uid40_block_rsrvd_fix_q <= GND_q & rightShiftStage2_uid79_rightShiferNoStickyOut_uid37_block_rsrvd_fix_q;

    -- xXorSignE_uid41_block_rsrvd_fix(LOGICAL,40)@0
    xXorSignE_uid41_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 1 => signX_uid25_block_rsrvd_fix_b(0)) & signX_uid25_block_rsrvd_fix_b));
    xXorSignE_uid41_block_rsrvd_fix_q <= zRightShiferNoStickyOut_uid40_block_rsrvd_fix_q xor xXorSignE_uid41_block_rsrvd_fix_b;

    -- sPostRndFull_uid43_block_rsrvd_fix(ADD,42)@0
    sPostRndFull_uid43_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => xXorSignE_uid41_block_rsrvd_fix_q(18)) & xXorSignE_uid41_block_rsrvd_fix_q));
    sPostRndFull_uid43_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 3 => d0_uid42_block_rsrvd_fix_q(2)) & d0_uid42_block_rsrvd_fix_q));
    sPostRndFull_uid43_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(sPostRndFull_uid43_block_rsrvd_fix_a) + SIGNED(sPostRndFull_uid43_block_rsrvd_fix_b));
    sPostRndFull_uid43_block_rsrvd_fix_q <= sPostRndFull_uid43_block_rsrvd_fix_o(19 downto 0);

    -- sPostRnd_uid44_block_rsrvd_fix(BITSELECT,43)@0
    sPostRnd_uid44_block_rsrvd_fix_in <= sPostRndFull_uid43_block_rsrvd_fix_q(18 downto 0);
    sPostRnd_uid44_block_rsrvd_fix_b <= sPostRnd_uid44_block_rsrvd_fix_in(18 downto 1);

    -- udfExpVal_uid28_block_rsrvd_fix(CONSTANT,27)
    udfExpVal_uid28_block_rsrvd_fix_q <= "01111101111";

    -- udf_uid29_block_rsrvd_fix(COMPARE,28)@0
    udf_uid29_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => udfExpVal_uid28_block_rsrvd_fix_q(10)) & udfExpVal_uid28_block_rsrvd_fix_q));
    udf_uid29_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_block_rsrvd_fix_b));
    udf_uid29_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid29_block_rsrvd_fix_a) - SIGNED(udf_uid29_block_rsrvd_fix_b));
    udf_uid29_block_rsrvd_fix_n(0) <= not (udf_uid29_block_rsrvd_fix_o(13));

    -- sPostRnd_uid45_block_rsrvd_fix(BITSELECT,44)@0
    sPostRnd_uid45_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => sPostRndFull_uid43_block_rsrvd_fix_q(19)) & sPostRndFull_uid43_block_rsrvd_fix_q));
    sPostRnd_uid45_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(sPostRnd_uid45_block_rsrvd_fix_in(20 downto 1));

    -- rndOvfPos_uid46_block_rsrvd_fix(COMPARE,45)@0
    rndOvfPos_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000" & maxPosValueS_uid38_block_rsrvd_fix_q));
    rndOvfPos_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => sPostRnd_uid45_block_rsrvd_fix_b(19)) & sPostRnd_uid45_block_rsrvd_fix_b));
    rndOvfPos_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(rndOvfPos_uid46_block_rsrvd_fix_a) - SIGNED(rndOvfPos_uid46_block_rsrvd_fix_b));
    rndOvfPos_uid46_block_rsrvd_fix_c(0) <= rndOvfPos_uid46_block_rsrvd_fix_o(21);

    -- ovfExpVal_uid26_block_rsrvd_fix(CONSTANT,25)
    ovfExpVal_uid26_block_rsrvd_fix_q <= "010000000010";

    -- ovfExpRange_uid27_block_rsrvd_fix(COMPARE,26)@0
    ovfExpRange_uid27_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & exp_x_uid9_block_rsrvd_fix_b));
    ovfExpRange_uid27_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => ovfExpVal_uid26_block_rsrvd_fix_q(11)) & ovfExpVal_uid26_block_rsrvd_fix_q));
    ovfExpRange_uid27_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(ovfExpRange_uid27_block_rsrvd_fix_a) - SIGNED(ovfExpRange_uid27_block_rsrvd_fix_b));
    ovfExpRange_uid27_block_rsrvd_fix_n(0) <= not (ovfExpRange_uid27_block_rsrvd_fix_o(13));

    -- cstZeroWF_uid7_block_rsrvd_fix(CONSTANT,6)
    cstZeroWF_uid7_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000";

    -- fracXIsZero_uid13_block_rsrvd_fix(LOGICAL,12)@0
    fracXIsZero_uid13_block_rsrvd_fix_q <= "1" WHEN cstZeroWF_uid7_block_rsrvd_fix_q = frac_x_uid10_block_rsrvd_fix_b ELSE "0";

    -- cstAllOWE_uid6_block_rsrvd_fix(CONSTANT,5)
    cstAllOWE_uid6_block_rsrvd_fix_q <= "11111111111";

    -- expXIsMax_uid12_block_rsrvd_fix(LOGICAL,11)@0
    expXIsMax_uid12_block_rsrvd_fix_q <= "1" WHEN exp_x_uid9_block_rsrvd_fix_b = cstAllOWE_uid6_block_rsrvd_fix_q ELSE "0";

    -- excI_x_uid15_block_rsrvd_fix(LOGICAL,14)@0
    excI_x_uid15_block_rsrvd_fix_q <= expXIsMax_uid12_block_rsrvd_fix_q and fracXIsZero_uid13_block_rsrvd_fix_q;

    -- fracXIsNotZero_uid14_block_rsrvd_fix(LOGICAL,13)@0
    fracXIsNotZero_uid14_block_rsrvd_fix_q <= not (fracXIsZero_uid13_block_rsrvd_fix_q);

    -- excN_x_uid16_block_rsrvd_fix(LOGICAL,15)@0
    excN_x_uid16_block_rsrvd_fix_q <= expXIsMax_uid12_block_rsrvd_fix_q and fracXIsNotZero_uid14_block_rsrvd_fix_q;

    -- ovfPostRnd_uid47_block_rsrvd_fix(LOGICAL,46)@0
    ovfPostRnd_uid47_block_rsrvd_fix_q <= excN_x_uid16_block_rsrvd_fix_q or excI_x_uid15_block_rsrvd_fix_q or ovfExpRange_uid27_block_rsrvd_fix_n or rndOvfPos_uid46_block_rsrvd_fix_c;

    -- muxSelConc_uid48_block_rsrvd_fix(BITJOIN,47)@0
    muxSelConc_uid48_block_rsrvd_fix_q <= signX_uid25_block_rsrvd_fix_b & udf_uid29_block_rsrvd_fix_n & ovfPostRnd_uid47_block_rsrvd_fix_q;

    -- muxSel_uid49_block_rsrvd_fix(LOOKUP,48)@0
    muxSel_uid49_block_rsrvd_fix_combproc: PROCESS (muxSelConc_uid48_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (muxSelConc_uid48_block_rsrvd_fix_q) IS
            WHEN "000" => muxSel_uid49_block_rsrvd_fix_q <= "00";
            WHEN "001" => muxSel_uid49_block_rsrvd_fix_q <= "01";
            WHEN "010" => muxSel_uid49_block_rsrvd_fix_q <= "11";
            WHEN "011" => muxSel_uid49_block_rsrvd_fix_q <= "11";
            WHEN "100" => muxSel_uid49_block_rsrvd_fix_q <= "00";
            WHEN "101" => muxSel_uid49_block_rsrvd_fix_q <= "10";
            WHEN "110" => muxSel_uid49_block_rsrvd_fix_q <= "11";
            WHEN "111" => muxSel_uid49_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => -- unreachable
                           muxSel_uid49_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- finalOut_uid51_block_rsrvd_fix(MUX,50)@0
    finalOut_uid51_block_rsrvd_fix_s <= muxSel_uid49_block_rsrvd_fix_q;
    finalOut_uid51_block_rsrvd_fix_combproc: PROCESS (finalOut_uid51_block_rsrvd_fix_s, sPostRnd_uid44_block_rsrvd_fix_b, maxPosValueS_uid38_block_rsrvd_fix_q, maxNegValueS_uid39_block_rsrvd_fix_q, maxNegValueU_uid50_block_rsrvd_fix_q)
    BEGIN
        CASE (finalOut_uid51_block_rsrvd_fix_s) IS
            WHEN "00" => finalOut_uid51_block_rsrvd_fix_q <= sPostRnd_uid44_block_rsrvd_fix_b;
            WHEN "01" => finalOut_uid51_block_rsrvd_fix_q <= maxPosValueS_uid38_block_rsrvd_fix_q;
            WHEN "10" => finalOut_uid51_block_rsrvd_fix_q <= maxNegValueS_uid39_block_rsrvd_fix_q;
            WHEN "11" => finalOut_uid51_block_rsrvd_fix_q <= maxNegValueU_uid50_block_rsrvd_fix_q;
            WHEN OTHERS => finalOut_uid51_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_primWireOut(GPOUT,4)@0
    out_primWireOut <= finalOut_uid51_block_rsrvd_fix_q;

END normal;
