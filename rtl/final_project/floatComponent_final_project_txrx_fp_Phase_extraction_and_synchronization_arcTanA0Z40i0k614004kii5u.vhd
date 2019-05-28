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

-- VHDL created from floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u
-- VHDL created on Tue May 28 19:39:05 2019


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

entity floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u is
    port (
        in_0 : in std_logic_vector(63 downto 0);  -- float64_m52
        in_1 : in std_logic_vector(63 downto 0);  -- float64_m52
        out_primWireOut : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u;

architecture normal of floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Z0m6140i0k614004kii5u is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal exp_xIn_uid10_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_xIn_uid11_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid15_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_xIn_uid16_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_xIn_uid17_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_yIn_uid24_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_yIn_uid25_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expXIsMax_uid27_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid27_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid28_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_yIn_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_yIn_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal yInSign_uid35_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xInSign_uid36_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zwEwF_uid37_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal yInExpFrac_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal yInZero_uid41_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZero_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xInExpFrac_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal xInZero_uid45_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInZero_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid47_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracX_uid48_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal singX_uid49_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstNaNWF_uid52_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid53_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBias_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBiasM1_uid55_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBiasMWF_uid56_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBiasP1_uid57_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstWFP1_uid58_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstWFP2_uid59_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_div_uid460_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid67_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid68_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_div_uid70_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal updatedY_uid76_block_rsrvd_fix_q : STD_LOGIC_VECTOR (103 downto 0);
    signal fracXIsZero_uid75_block_rsrvd_fix_a : STD_LOGIC_VECTOR (103 downto 0);
    signal fracXIsZero_uid75_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsBias_uid78_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsOne_uid79_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal piO2_uid80_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal piO4_uid81_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal cstPiO2_uid82_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal cstPiO2_uid82_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fpPiO2C_uid83_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cstPiO4_uid85_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal cstPiO4_uid85_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fpPiO4C_uid86_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal constOut_uid88_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal constOut_uid88_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal xyInInf_uid89_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xyInInf_uid89_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal arctanIsConst_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal path2_uid91_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal path2_uid91_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal path2_uid91_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal path2_uid91_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid93_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u_uid93_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal oFracU_uid96_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal biasMwShift_uid97_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal atanUIsU_uid98_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal atanUIsU_uid98_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal atanUIsU_uid98_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal atanUIsU_uid98_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftBias_uid99_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftValue_uid100_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValue_uid100_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValue_uid100_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValue_uid100_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid101_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zS_uid103_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValuePostNeg_uid104_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePostNeg_uid104_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cst01pWShift_uid105_block_rsrvd_fix_q : STD_LOGIC_VECTOR (27 downto 0);
    signal oFracUExt_uid106_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal fxpShifterBits_uid107_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal fxpShifterBits_uid107_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal y_uid109_block_rsrvd_fix_in : STD_LOGIC_VECTOR (79 downto 0);
    signal y_uid109_block_rsrvd_fix_b : STD_LOGIC_VECTOR (78 downto 0);
    signal fxpAtanXOXRes_uid114_block_rsrvd_fix_in : STD_LOGIC_VECTOR (60 downto 0);
    signal fxpAtanXOXRes_uid114_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal normBit_uid116_block_rsrvd_fix_in : STD_LOGIC_VECTOR (107 downto 0);
    signal normBit_uid116_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3High_uid117_block_rsrvd_fix_in : STD_LOGIC_VECTOR (106 downto 0);
    signal fracRPath3High_uid117_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPath3Low_uid118_block_rsrvd_fix_in : STD_LOGIC_VECTOR (105 downto 0);
    signal fracRPath3Low_uid118_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPath3Pre_uid119_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath3Pre_uid119_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal invNormBit_uid120_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath3Ext_uid121_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPath3Ext_uid121_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPath3Ext_uid121_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPath3Ext_uid121_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expRPath3PreRnd_uid122_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPath3PreRnd_uid122_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracRPath3PreRnd_uid123_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal fracRPath3PostRnd_uid126_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal fracRPath3PostRnd_uid126_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal fracRPath3PostRnd_uid126_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal fracRPath3PostRnd_uid126_block_rsrvd_fix_q : STD_LOGIC_VECTOR (64 downto 0);
    signal shiftOut_uid130_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftOut_uid130_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftOut_uid130_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal shiftOut_uid130_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracRPath2_uid133_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sValPostSOutR_uid134_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal sValPostSOutR_uid134_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal bPostPad_uid137_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal path2Diff_uid138_block_rsrvd_fix_a : STD_LOGIC_VECTOR (55 downto 0);
    signal path2Diff_uid138_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal path2Diff_uid138_block_rsrvd_fix_o : STD_LOGIC_VECTOR (55 downto 0);
    signal path2Diff_uid138_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal normBitPath2Diff_uid139_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal normBitPath2Diff_uid139_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal path2DiffHigh_uid140_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal path2DiffHigh_uid140_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal path2DiffLow_uid141_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal path2DiffLow_uid141_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPath2_uid142_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPath2_uid142_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expRPath2_uid143_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPath2_uid143_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracConc_uid146_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal expFracRPath2PostRnd_uid147_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal expFracRPath2PostRnd_uid147_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal expFracRPath2PostRnd_uid147_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal expFracRPath2PostRnd_uid147_block_rsrvd_fix_q : STD_LOGIC_VECTOR (64 downto 0);
    signal pathSelBits_uid150_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal fracOutMuxSelEnc_uid151_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid153_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRCalc_uid153_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRCalc_uid155_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRCalc_uid155_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstPi_uid156_block_rsrvd_fix_q : STD_LOGIC_VECTOR (104 downto 0);
    signal sOutAlignRes_uid158_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal sOutAlignRes_uid158_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal sOutAlignRes_uid158_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal sOutAlignRes_uid158_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal yInZOrsOutAlignRes_uid159_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sValPostSOutRange_uid162_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal sValPostSOutRange_uid162_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal oFracRCalc_uid163_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal padConst_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal rightPaddedIn_uid165_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal padACst_uid168_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal aPostPad_uid169_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal subRes_uid170_block_rsrvd_fix_a : STD_LOGIC_VECTOR (107 downto 0);
    signal subRes_uid170_block_rsrvd_fix_b : STD_LOGIC_VECTOR (107 downto 0);
    signal subRes_uid170_block_rsrvd_fix_o : STD_LOGIC_VECTOR (107 downto 0);
    signal subRes_uid170_block_rsrvd_fix_q : STD_LOGIC_VECTOR (107 downto 0);
    signal subResNormBit_uid171_block_rsrvd_fix_in : STD_LOGIC_VECTOR (106 downto 0);
    signal subResNormBit_uid171_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal subResHigh_uid172_block_rsrvd_fix_in : STD_LOGIC_VECTOR (105 downto 0);
    signal subResHigh_uid172_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal subResLow_uid173_block_rsrvd_fix_in : STD_LOGIC_VECTOR (104 downto 0);
    signal subResLow_uid173_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRSub_uid174_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRSub_uid174_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRSub_uid175_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRSub_uid175_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xInIsLTEZero_uid176_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal xInIsLTEZero_uid176_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid177_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRFinal_uid177_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRFinal_uid178_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRFinal_uid178_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invYInSign_uid179_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invXInSign_uid180_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero2_uid181_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero1_uid182_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid183_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid183_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid184_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid184_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid185_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid186_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid188_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid188_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid189_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid189_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid190_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid191_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid192_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal updatedY_uid204_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracYZero_uid203_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (52 downto 0);
    signal fracYZero_uid203_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid211_div_uid46_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid211_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid217_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid218_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid219_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid225_div_uid46_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid225_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid231_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid232_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid233_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid234_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid235_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid235_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid235_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid235_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid236_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid236_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid236_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid236_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yAddr_uid239_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (9 downto 0);
    signal yPE_uid240_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (41 downto 0);
    signal fracYPostZ_uid244_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid246_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal invYLowBits_uid248_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal invYLowBits_uid248_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormT_uid254_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal oFracXSE_mergedSignalTM_uid257_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal divValPreNormS_uid259_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (54 downto 0);
    signal divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal norm_uid261_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal normFracRnd_uid264_div_uid46_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid264_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracRnd_uid265_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (65 downto 0);
    signal rndOp_uid269_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (67 downto 0);
    signal expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal fracRPreExc_uid272_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excRPreExc_uid273_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (63 downto 0);
    signal excRPreExc_uid273_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expRExt_uid274_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid275_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid275_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid275_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid275_div_uid46_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid278_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid278_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid278_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid278_div_uid46_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid279_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid280_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid281_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid282_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid283_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid284_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid285_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid286_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid287_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid288_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid289_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid290_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid291_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid292_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid293_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid297_div_uid46_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid301_div_uid46_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid301_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid302_div_uid46_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid302_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid303_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid304_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cst2BiasM1_uid313_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cst2Bias_uid314_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fracXIsNotZero_uid324_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid326_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid327_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid328_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid329_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracX_uid330_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracXIsZero_uid331_z_uid92_block_rsrvd_fix_a : STD_LOGIC_VECTOR (52 downto 0);
    signal fracXIsZero_uid331_z_uid92_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal y_uid334_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal y_uid334_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRCompExt_uid339_z_uid92_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompExt_uid339_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompExt_uid339_z_uid92_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompExt_uid339_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expRComp_uid340_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRComp_uid340_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal udf_uid341_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (12 downto 0);
    signal udf_uid341_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (57 downto 0);
    signal fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRCalc_uid347_z_uid92_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRCalc_uid347_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRCalc_uid348_z_uid92_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRCalc_uid348_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xRegAndUdf_uid349_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xIOrXRUdf_uid350_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelBits_uid351_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid354_z_uid92_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid355_z_uid92_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid355_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid356_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid357_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid358_z_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid362_atan2Tables_q : STD_LOGIC_VECTOR (59 downto 0);
    signal os_uid366_atan2Tables_q : STD_LOGIC_VECTOR (49 downto 0);
    signal os_uid370_atan2Tables_q : STD_LOGIC_VECTOR (41 downto 0);
    signal yT1_uid387_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeB_uid389_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid389_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid390_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid391_invPolyEval_a : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid391_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid391_invPolyEval_o : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid391_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal s1_uid392_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal yT2_uid393_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal lowRangeB_uid395_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid395_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid396_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal s2sumAHighB_uid397_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid397_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid397_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid397_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal s2_uid398_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal yT3_uid399_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeB_uid401_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid401_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid402_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s3sumAHighB_uid403_invPolyEval_a : STD_LOGIC_VECTOR (42 downto 0);
    signal s3sumAHighB_uid403_invPolyEval_b : STD_LOGIC_VECTOR (42 downto 0);
    signal s3sumAHighB_uid403_invPolyEval_o : STD_LOGIC_VECTOR (42 downto 0);
    signal s3sumAHighB_uid403_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal s3_uid404_invPolyEval_q : STD_LOGIC_VECTOR (43 downto 0);
    signal yT4_uid405_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal lowRangeB_uid407_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid407_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid408_invPolyEval_b : STD_LOGIC_VECTOR (42 downto 0);
    signal s4sumAHighB_uid409_invPolyEval_a : STD_LOGIC_VECTOR (50 downto 0);
    signal s4sumAHighB_uid409_invPolyEval_b : STD_LOGIC_VECTOR (50 downto 0);
    signal s4sumAHighB_uid409_invPolyEval_o : STD_LOGIC_VECTOR (50 downto 0);
    signal s4sumAHighB_uid409_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal s4_uid410_invPolyEval_q : STD_LOGIC_VECTOR (51 downto 0);
    signal lowRangeB_uid413_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid413_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid414_invPolyEval_b : STD_LOGIC_VECTOR (50 downto 0);
    signal s5sumAHighB_uid415_invPolyEval_a : STD_LOGIC_VECTOR (60 downto 0);
    signal s5sumAHighB_uid415_invPolyEval_b : STD_LOGIC_VECTOR (60 downto 0);
    signal s5sumAHighB_uid415_invPolyEval_o : STD_LOGIC_VECTOR (60 downto 0);
    signal s5sumAHighB_uid415_invPolyEval_q : STD_LOGIC_VECTOR (60 downto 0);
    signal s5_uid416_invPolyEval_q : STD_LOGIC_VECTOR (62 downto 0);
    signal os_uid424_invTables_q : STD_LOGIC_VECTOR (59 downto 0);
    signal os_uid431_invTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal os_uid437_invTables_q : STD_LOGIC_VECTOR (38 downto 0);
    signal os_uid442_invTables_q : STD_LOGIC_VECTOR (29 downto 0);
    signal os_uid446_invTables_q : STD_LOGIC_VECTOR (18 downto 0);
    signal yT1_uid453_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lowRangeB_uid455_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid455_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid456_invPolyEval_b : STD_LOGIC_VECTOR (19 downto 0);
    signal s1sumAHighB_uid457_invPolyEval_a : STD_LOGIC_VECTOR (30 downto 0);
    signal s1sumAHighB_uid457_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal s1sumAHighB_uid457_invPolyEval_o : STD_LOGIC_VECTOR (30 downto 0);
    signal s1sumAHighB_uid457_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal s1_uid458_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal yT2_uid459_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal lowRangeB_uid461_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid461_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid462_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid463_invPolyEval_a : STD_LOGIC_VECTOR (39 downto 0);
    signal s2sumAHighB_uid463_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal s2sumAHighB_uid463_invPolyEval_o : STD_LOGIC_VECTOR (39 downto 0);
    signal s2sumAHighB_uid463_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal s2_uid464_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal yT3_uid465_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal lowRangeB_uid467_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid467_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid468_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal s3sumAHighB_uid469_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid469_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid469_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid469_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s3_uid470_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid473_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid473_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid474_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid475_invPolyEval_a : STD_LOGIC_VECTOR (60 downto 0);
    signal s4sumAHighB_uid475_invPolyEval_b : STD_LOGIC_VECTOR (60 downto 0);
    signal s4sumAHighB_uid475_invPolyEval_o : STD_LOGIC_VECTOR (60 downto 0);
    signal s4sumAHighB_uid475_invPolyEval_q : STD_LOGIC_VECTOR (60 downto 0);
    signal s4_uid476_invPolyEval_q : STD_LOGIC_VECTOR (62 downto 0);
    signal topRangeX_uid488_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid489_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_mergedSignalTM_uid493_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a0 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_s1 : STD_LOGIC_VECTOR (11 downto 0);
    signal sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_pr : UNSIGNED (11 downto 0);
    signal sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal sumAb_uid503_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (65 downto 0);
    signal lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a : STD_LOGIC_VECTOR (66 downto 0);
    signal lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (66 downto 0);
    signal lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_o : STD_LOGIC_VECTOR (66 downto 0);
    signal lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal lev1_a0_uid507_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in : STD_LOGIC_VECTOR (80 downto 0);
    signal os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal os_uid512_inverseTables_q : STD_LOGIC_VECTOR (57 downto 0);
    signal os_uid516_inverseTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal os_uid520_inverseTables_q : STD_LOGIC_VECTOR (40 downto 0);
    signal yT1_uid537_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal lowRangeB_uid539_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid539_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid540_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid541_invPolyEval_a : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid541_invPolyEval_b : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid541_invPolyEval_o : STD_LOGIC_VECTOR (25 downto 0);
    signal s1sumAHighB_uid541_invPolyEval_q : STD_LOGIC_VECTOR (25 downto 0);
    signal s1_uid542_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal yT2_uid543_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal lowRangeB_uid545_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid545_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid546_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal s2sumAHighB_uid547_invPolyEval_a : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid547_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid547_invPolyEval_o : STD_LOGIC_VECTOR (34 downto 0);
    signal s2sumAHighB_uid547_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal s2_uid548_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal yT3_uid549_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeB_uid551_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid551_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid552_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal s3sumAHighB_uid553_invPolyEval_a : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid553_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid553_invPolyEval_o : STD_LOGIC_VECTOR (41 downto 0);
    signal s3sumAHighB_uid553_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal s3_uid554_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal yT4_uid555_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal lowRangeB_uid557_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid557_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid558_invPolyEval_b : STD_LOGIC_VECTOR (41 downto 0);
    signal s4sumAHighB_uid559_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid559_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid559_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid559_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s4_uid560_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid563_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid563_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid564_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s5sumAHighB_uid565_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid565_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid565_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal s5sumAHighB_uid565_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal s5_uid566_invPolyEval_q : STD_LOGIC_VECTOR (60 downto 0);
    signal osig_uid569_pT1_uid388_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal osig_uid572_pT2_uid394_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal topRangeX_uid588_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid589_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid591_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid591_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_mergedSignalTM_uid594_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid597_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid597_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid598_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid598_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid602_pT3_uid400_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid602_pT3_uid400_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid602_pT3_uid400_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid602_pT3_uid400_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid602_pT3_uid400_invPolyEval_pr : signal is "logic";
    signal sm0_uid602_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid603_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeB_uid604_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid604_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal highBBits_uid605_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0_uid607_pT3_uid400_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid608_pT3_uid400_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid608_pT3_uid400_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal topRangeX_uid624_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid625_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid626_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftY_mergedSignalTM_uid629_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightBottomX_mergedSignalTM_uid633_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid635_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_uid636_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (24 downto 0);
    signal rightBottomX_uid636_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightBottomY_uid637_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomY_uid637_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftX_uid638_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aboveLeftX_uid638_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_uid639_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_uid639_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeB_uid645_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid645_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid646_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid648_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal lowRangeA_uid650_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeA_uid650_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal highABits_uid651_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal lev2_a0high_uid652_pT4_uid406_invPolyEval_a : STD_LOGIC_VECTOR (53 downto 0);
    signal lev2_a0high_uid652_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (53 downto 0);
    signal lev2_a0high_uid652_pT4_uid406_invPolyEval_o : STD_LOGIC_VECTOR (53 downto 0);
    signal lev2_a0high_uid652_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (52 downto 0);
    signal lev2_a0_uid653_pT4_uid406_invPolyEval_q : STD_LOGIC_VECTOR (64 downto 0);
    signal os_uid654_pT4_uid406_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid654_pT4_uid406_invPolyEval_b : STD_LOGIC_VECTOR (43 downto 0);
    signal nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (47 downto 0);
    signal topRangeX_uid670_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid671_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aboveLeftY_mergedSignalTM_uid675_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid677_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (20 downto 0);
    signal rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightBottomX_mergedSignalTM_uid679_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid682_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (20 downto 0);
    signal aboveLeftX_uid682_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_uid683_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aboveLeftY_uid683_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid687_pT5_uid412_invPolyEval_a0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid687_pT5_uid412_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid687_pT5_uid412_invPolyEval_s1 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid687_pT5_uid412_invPolyEval_pr : UNSIGNED (5 downto 0);
    attribute multstyle of sm0_uid687_pT5_uid412_invPolyEval_pr : signal is "logic";
    signal sm0_uid687_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal sumAb_uid688_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (59 downto 0);
    signal lowRangeB_uid689_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (20 downto 0);
    signal lowRangeB_uid689_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal highBBits_uid690_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_a : STD_LOGIC_VECTOR (60 downto 0);
    signal lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (60 downto 0);
    signal lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_o : STD_LOGIC_VECTOR (60 downto 0);
    signal lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (60 downto 0);
    signal lev1_a0_uid692_pT5_uid412_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid693_pT5_uid412_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid693_pT5_uid412_invPolyEval_b : STD_LOGIC_VECTOR (52 downto 0);
    signal osig_uid696_pT1_uid454_invPolyEval_b : STD_LOGIC_VECTOR (20 downto 0);
    signal nx_mergedSignalTM_uid710_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (30 downto 0);
    signal aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aboveLeftY_mergedSignalTM_uid717_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid719_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rightBottomX_mergedSignalTM_uid721_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid727_pT2_uid460_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid727_pT2_uid460_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal highBBits_uid728_pT2_uid460_invPolyEval_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (36 downto 0);
    signal lev1_a0_uid730_pT2_uid460_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid731_pT2_uid460_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid731_pT2_uid460_invPolyEval_b : STD_LOGIC_VECTOR (30 downto 0);
    signal nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal topRangeX_uid747_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid748_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid749_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aboveLeftY_mergedSignalTM_uid752_pT3_uid466_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rightBottomX_mergedSignalTM_uid756_pT3_uid466_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid758_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid762_pT3_uid466_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid762_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid763_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid765_pT3_uid466_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid766_pT3_uid466_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid766_pT3_uid466_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (42 downto 0);
    signal topRangeX_uid782_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid783_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid787_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightBottomX_mergedSignalTM_uid791_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid794_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aboveLeftX_uid794_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid795_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid795_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid799_pT4_uid472_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid799_pT4_uid472_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid799_pT4_uid472_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid799_pT4_uid472_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle of sm0_uid799_pT4_uid472_invPolyEval_pr : signal is "logic";
    signal sm0_uid799_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid800_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid801_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid801_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid802_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid804_pT4_uid472_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid805_pT4_uid472_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid805_pT4_uid472_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal osig_uid808_pT1_uid538_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal osig_uid811_pT2_uid544_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal topRangeX_uid827_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid828_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid830_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid830_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightBottomX_mergedSignalTM_uid833_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid836_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aboveLeftX_uid836_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid837_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_uid837_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid841_pT3_uid550_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid841_pT3_uid550_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid841_pT3_uid550_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid841_pT3_uid550_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle of sm0_uid841_pT3_uid550_invPolyEval_pr : signal is "logic";
    signal sm0_uid841_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid842_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeB_uid843_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid843_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal highBBits_uid844_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_a : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_o : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (40 downto 0);
    signal lev1_a0_uid846_pT3_uid550_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal os_uid847_pT3_uid550_invPolyEval_in : STD_LOGIC_VECTOR (52 downto 0);
    signal os_uid847_pT3_uid550_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal topRangeX_uid863_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid864_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid865_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aboveLeftY_mergedSignalTM_uid868_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_mergedSignalTM_uid872_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid874_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_uid875_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal rightBottomX_uid875_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomY_uid876_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (15 downto 0);
    signal rightBottomY_uid876_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftX_uid877_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftX_uid877_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid878_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aboveLeftY_uid878_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid884_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid884_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid885_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid887_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal lowRangeA_uid889_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeA_uid889_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal highABits_uid890_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal lev2_a0high_uid891_pT4_uid556_invPolyEval_a : STD_LOGIC_VECTOR (51 downto 0);
    signal lev2_a0high_uid891_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal lev2_a0high_uid891_pT4_uid556_invPolyEval_o : STD_LOGIC_VECTOR (51 downto 0);
    signal lev2_a0high_uid891_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lev2_a0_uid892_pT4_uid556_invPolyEval_q : STD_LOGIC_VECTOR (64 downto 0);
    signal os_uid893_pT4_uid556_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid893_pT4_uid556_invPolyEval_b : STD_LOGIC_VECTOR (42 downto 0);
    signal nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (44 downto 0);
    signal topRangeX_uid909_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid910_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid914_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid916_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_mergedSignalTM_uid918_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid921_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid921_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid922_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid922_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid926_pT5_uid562_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid926_pT5_uid562_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid926_pT5_uid562_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid926_pT5_uid562_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle of sm0_uid926_pT5_uid562_invPolyEval_pr : signal is "logic";
    signal sm0_uid926_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid927_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid928_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid928_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid929_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid931_pT5_uid562_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid932_pT5_uid562_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid932_pT5_uid562_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (72 downto 0);
    signal leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (72 downto 0);
    signal leftShiftStage0Idx1_uid941_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (64 downto 0);
    signal leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal leftShiftStage0Idx2_uid944_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage0Idx3Pad24_uid945_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3_uid947_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (78 downto 0);
    signal leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (78 downto 0);
    signal leftShiftStage1Idx1_uid952_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (76 downto 0);
    signal leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (76 downto 0);
    signal leftShiftStage1Idx2_uid955_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (74 downto 0);
    signal leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (74 downto 0);
    signal leftShiftStage1Idx3_uid958_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (79 downto 0);
    signal leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (79 downto 0);
    signal leftShiftStage2Idx1_uid963_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_q : STD_LOGIC_VECTOR (80 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_join_16_q : STD_LOGIC_VECTOR (107 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_q : STD_LOGIC_VECTOR (81 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_qint : STD_LOGIC_VECTOR (81 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_q : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_qint : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_a : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_b : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_o : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_q : STD_LOGIC_VECTOR (108 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_a : STD_LOGIC_VECTOR (109 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_b : STD_LOGIC_VECTOR (109 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_o : STD_LOGIC_VECTOR (109 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_q : STD_LOGIC_VECTOR (109 downto 0);
    signal shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_a : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_b : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_i : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_o : STD_LOGIC_VECTOR (11 downto 0);
    signal shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx1Rng16_uid993_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (37 downto 0);
    signal rightShiftStage0Idx1_uid995_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage0Idx2Rng32_uid996_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage0Idx2Pad32_uid997_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx2_uid998_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage0Idx3Rng48_uid999_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx3Pad48_uid1000_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rightShiftStage0Idx3_uid1001_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage1Idx1Rng4_uid1004_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (49 downto 0);
    signal rightShiftStage1Idx1_uid1006_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage1Idx2Rng8_uid1007_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (45 downto 0);
    signal rightShiftStage1Idx2_uid1009_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage1Idx3Rng12_uid1010_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStage1Idx3_uid1012_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2Idx1Rng1_uid1015_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal rightShiftStage2Idx1_uid1017_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2Idx2Rng2_uid1018_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal rightShiftStage2Idx2_uid1020_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2Idx3Rng3_uid1021_fxpOp2Path2_uid135_block_rsrvd_fix_b : STD_LOGIC_VECTOR (50 downto 0);
    signal rightShiftStage2Idx3_uid1023_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_a : STD_LOGIC_VECTOR (11 downto 0);
    signal sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_i : STD_LOGIC_VECTOR (11 downto 0);
    signal sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_o : STD_LOGIC_VECTOR (11 downto 0);
    signal sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx1Rng16_uid1030_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (89 downto 0);
    signal rightShiftStage0Idx1_uid1032_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage0Idx2Rng32_uid1033_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (73 downto 0);
    signal rightShiftStage0Idx2_uid1035_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage0Idx3Rng48_uid1036_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (57 downto 0);
    signal rightShiftStage0Idx3_uid1038_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage1Idx1Rng4_uid1041_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (101 downto 0);
    signal rightShiftStage1Idx1_uid1043_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage1Idx2Rng8_uid1044_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (97 downto 0);
    signal rightShiftStage1Idx2_uid1046_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage1Idx3Rng12_uid1047_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (93 downto 0);
    signal rightShiftStage1Idx3_uid1049_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2Idx1Rng1_uid1052_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage2Idx1_uid1054_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2Idx2Rng2_uid1055_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (103 downto 0);
    signal rightShiftStage2Idx2_uid1057_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2Idx3Rng3_uid1058_fxpAlignedRes_uid164_block_rsrvd_fix_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage2Idx3_uid1060_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q : STD_LOGIC_VECTOR (105 downto 0);
    signal memoryC0_uid360_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC0_uid360_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid360_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid360_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid360_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid360_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid361_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC0_uid361_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid361_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid361_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid361_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC0_uid361_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (19 downto 0);
    signal memoryC1_uid364_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC1_uid364_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid364_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid364_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid364_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid364_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid365_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC1_uid365_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid365_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid365_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid365_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid365_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid368_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC2_uid368_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid368_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid368_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid368_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid368_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid369_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC2_uid369_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid369_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid369_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid369_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid369_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC3_uid372_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC3_uid372_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC3_uid372_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid372_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid372_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC3_uid372_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC4_uid375_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC4_uid375_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC4_uid375_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid375_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid375_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC4_uid375_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC5_uid378_atan2Tables_lutmem_reset0 : std_logic;
    signal memoryC5_uid378_atan2Tables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid378_atan2Tables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid378_atan2Tables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid378_atan2Tables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid378_atan2Tables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC0_uid418_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid418_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid418_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid418_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid418_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid418_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid419_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid419_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid419_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid419_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid419_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid419_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid420_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid420_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid420_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid420_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid420_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid420_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid421_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid421_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid421_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid421_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid421_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid421_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid422_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid422_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid422_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid422_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid422_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid422_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid423_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid423_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid423_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid423_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid423_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC0_uid423_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid426_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid426_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid426_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid426_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid426_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid426_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid427_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid427_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid427_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid427_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid427_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid427_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid428_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid428_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid428_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid428_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid428_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid428_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid429_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid429_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid429_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid429_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid429_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid429_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid430_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid430_invTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid430_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid430_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC1_uid430_invTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid430_invTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid433_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid433_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid433_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid433_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid433_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid433_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid434_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid434_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid434_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid434_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid434_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid434_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid435_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid435_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid435_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid435_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid435_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid435_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid436_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid436_invTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid436_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid436_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC2_uid436_invTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid436_invTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC3_uid439_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid439_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid439_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid439_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid439_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid439_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid440_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid440_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid440_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid440_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid440_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid440_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid441_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid441_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid441_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid441_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid441_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC3_uid441_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid444_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid444_invTables_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid444_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid444_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid444_invTables_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid444_invTables_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid445_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid445_invTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid445_invTables_lutmem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid445_invTables_lutmem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal memoryC4_uid445_invTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC4_uid445_invTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid510_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid510_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid510_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid510_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid510_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid510_inverseTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC0_uid511_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid511_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid511_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid511_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC0_uid511_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC0_uid511_inverseTables_lutmem_r : STD_LOGIC_VECTOR (17 downto 0);
    signal memoryC1_uid514_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid514_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid514_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid514_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid514_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid514_inverseTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC1_uid515_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid515_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid515_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid515_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC1_uid515_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid515_inverseTables_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid518_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid518_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid518_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid518_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC2_uid518_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC2_uid518_inverseTables_lutmem_r : STD_LOGIC_VECTOR (39 downto 0);
    signal memoryC3_uid522_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid522_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC3_uid522_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid522_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC3_uid522_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC3_uid522_inverseTables_lutmem_r : STD_LOGIC_VECTOR (33 downto 0);
    signal memoryC4_uid525_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid525_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC4_uid525_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid525_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC4_uid525_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC4_uid525_inverseTables_lutmem_r : STD_LOGIC_VECTOR (24 downto 0);
    signal memoryC5_uid528_inverseTables_lutmem_reset0 : std_logic;
    signal memoryC5_uid528_inverseTables_lutmem_ia : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid528_inverseTables_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid528_inverseTables_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal memoryC5_uid528_inverseTables_lutmem_ir : STD_LOGIC_VECTOR (16 downto 0);
    signal memoryC5_uid528_inverseTables_lutmem_r : STD_LOGIC_VECTOR (16 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_s1 : STD_LOGIC_VECTOR (9 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_pr : UNSIGNED (9 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_q : STD_LOGIC_VECTOR (9 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_q : STD_LOGIC_VECTOR (27 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_reset : std_logic;
    type sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 : signal is true;
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 : signal is true;
    type sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype is array(NATURAL range <>) of UNSIGNED(53 downto 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 : std_logic;
    signal sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 : std_logic;
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_reset : std_logic;
    type prodXY_uid568_pT1_uid388_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(16 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_a0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid568_pT1_uid388_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid568_pT1_uid388_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid568_pT1_uid388_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_l : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_p : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_u : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_w : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_x : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_y : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_s : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid568_pT1_uid388_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_reset : std_logic;
    type prodXY_uid571_pT2_uid394_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(24 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid571_pT2_uid394_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid571_pT2_uid394_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid571_pT2_uid394_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(25 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_l : prodXY_uid571_pT2_uid394_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(52 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_p : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_u : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_w : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_x : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_y : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_s : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid571_pT2_uid394_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_reset : std_logic;
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_a0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid599_pT3_uid400_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid599_pT3_uid400_invPolyEval_cma_c0 : signal is true;
    type sm0_uid599_pT3_uid400_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(35 downto 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_p : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_u : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_w : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_x : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_y : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_s : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid599_pT3_uid400_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_reset : std_logic;
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid640_pT4_uid406_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid640_pT4_uid406_invPolyEval_cma_c0 : signal is true;
    type sm0_uid640_pT4_uid406_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(53 downto 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid640_pT4_uid406_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_reset : std_logic;
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid684_pT5_uid412_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid684_pT5_uid412_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid684_pT5_uid412_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_reset : std_logic;
    type prodXY_uid695_pT1_uid454_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(18 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_a0 : prodXY_uid695_pT1_uid454_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid695_pT1_uid454_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_c0 : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid695_pT1_uid454_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid695_pT1_uid454_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(19 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(38 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_p : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_u : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_w : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_x : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_y : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_s : prodXY_uid695_pT1_uid454_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_qq : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_q : STD_LOGIC_VECTOR (37 downto 0);
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid695_pT1_uid454_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_reset : std_logic;
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_a0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid724_pT2_uid460_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid724_pT2_uid460_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_p : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_u : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_w : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_x : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_y : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_s : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid724_pT2_uid460_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_reset : std_logic;
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid759_pT3_uid466_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid759_pT3_uid466_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid759_pT3_uid466_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_reset : std_logic;
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid796_pT4_uid472_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid796_pT4_uid472_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid796_pT4_uid472_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_a0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid807_pT1_uid538_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid807_pT1_uid538_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_l : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_p : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_u : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_w : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_x : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_y : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_s : prodXY_uid568_pT1_uid388_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid807_pT1_uid538_invPolyEval_cma_ena1 : std_logic;
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_reset : std_logic;
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid810_pT2_uid544_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid810_pT2_uid544_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_l : prodXY_uid571_pT2_uid394_invPolyEval_cma_ltype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_p : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_u : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_w : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_x : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_y : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_s : prodXY_uid571_pT2_uid394_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_qq : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_q : STD_LOGIC_VECTOR (51 downto 0);
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid810_pT2_uid544_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_reset : std_logic;
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_a0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid838_pT3_uid550_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 0);
    attribute preserve of sm0_uid838_pT3_uid550_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_p : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_u : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_w : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_x : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_y : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_s : sm0_uid599_pT3_uid400_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid838_pT3_uid550_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_reset : std_logic;
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid879_pT4_uid556_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid879_pT4_uid556_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid879_pT4_uid556_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_reset : std_logic;
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_a0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid923_pT5_uid562_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid923_pT5_uid562_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_p : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_u : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_w : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_x : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_y : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_s : sm0_uid640_pT4_uid406_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid923_pT5_uid562_invPolyEval_cma_ena1 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_reset : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_a0 : signal is true;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_c0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_c0 : signal is true;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_p : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_u : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_w : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_x : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_y : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_s : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena1 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_reset : std_logic;
    type mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0 : signal is true;
    type mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0type is array(NATURAL range <>) of UNSIGNED(9 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0type(0 to 0);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0 : signal is true;
    type mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_p : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_u : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_w : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_x : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_y : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_s : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_q : STD_LOGIC_VECTOR (19 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_reset : std_logic;
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype is array(NATURAL range <>) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    type multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(37 downto 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(27 downto 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_l : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(54 downto 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_p : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(55 downto 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_u : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_w : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_x : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_y : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_s : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_l : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ltype(0 to 1);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_p : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_u : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_w : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_x : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_y : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_s : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0 : prodXY_uid568_pT1_uid388_invPolyEval_cma_ltype(0 to 1);
    attribute preserve of multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_l : prodXY_uid695_pT1_uid454_invPolyEval_cma_c0type(0 to 1);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_p : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_u : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_w : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_x : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_y : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_s : multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0 : prodXY_uid571_pT2_uid394_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_l : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ltype(0 to 1);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_p : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_u : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_w : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_x : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_y : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_s : multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_reset : std_logic;
    type sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0 : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0type(0 to 1);
    attribute preserve of sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0 : signal is true;
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0type(0 to 1);
    attribute preserve of sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0 : signal is true;
    type sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype is array(NATURAL range <>) of UNSIGNED(12 downto 0);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_p : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    type sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_u : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype(0 to 1);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_w : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype(0 to 1);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_x : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype(0 to 1);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_y : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype(0 to 1);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_utype(0 to 1);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_qq : STD_LOGIC_VECTOR (13 downto 0);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena0 : std_logic;
    signal sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena1 : std_logic;
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_reset : std_logic;
    type sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0type is array(NATURAL range <>) of UNSIGNED(1 downto 0);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0 : sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0type(0 to 1);
    attribute preserve of sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0 : signal is true;
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0type(0 to 1);
    attribute preserve of sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0 : signal is true;
    type sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ptype is array(NATURAL range <>) of UNSIGNED(11 downto 0);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_p : sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_u : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_w : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_x : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_y : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s : sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ptype(0 to 1);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_qq : STD_LOGIC_VECTOR (12 downto 0);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_q : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena0 : std_logic;
    signal sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena1 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_reset : std_logic;
    type mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0type is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0 : mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0type(0 to 1);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0 : signal is true;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0 : signal is true;
    type mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ptype is array(NATURAL range <>) of UNSIGNED(52 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_p : mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ptype(0 to 1);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_u : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 1);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_w : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_x : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_y : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_s : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena1 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_reset : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0 : signal is true;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0 : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0 : signal is true;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_p : sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ptype(0 to 1);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_u : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 1);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_w : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_x : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_y : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_s : multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_utype(0 to 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena0 : std_logic;
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena1 : std_logic;
    signal fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (62 downto 0);
    signal fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal expU_uid94_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (62 downto 0);
    signal expU_uid94_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expU_uid94_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (51 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal yAddr_uid111_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid111_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (46 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (63 downto 0);
    signal fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (63 downto 0);
    signal fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (43 downto 0);
    signal topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (60 downto 0);
    signal invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (54 downto 0);
    signal invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (52 downto 0);
    signal topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (14 downto 0);
    signal lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (39 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist23_expU_uid94_block_rsrvd_fix_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist24_lowRangeB_uid884_pT4_uid556_invPolyEval_b_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist25_aboveLeftY_uid878_pT4_uid556_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist26_aboveLeftX_uid877_pT4_uid556_invPolyEval_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist28_lowRangeA_uid650_pT4_uid406_invPolyEval_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist29_aboveLeftY_uid639_pT4_uid406_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist30_aboveLeftX_uid638_pT4_uid406_invPolyEval_b_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist39_yPE_uid240_div_uid46_block_rsrvd_fix_b_8_q : STD_LOGIC_VECTOR (41 downto 0);
    signal redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_updatedY_uid204_div_uid46_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist48_excRNaN_uid184_block_rsrvd_fix_q_32_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_excRZero_uid183_block_rsrvd_fix_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_expRCalc_uid155_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist52_expRPath3PreRnd_uid122_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist54_path2_uid91_block_rsrvd_fix_n_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_xyInInf_uid89_block_rsrvd_fix_q_30_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_excI_div_uid70_block_rsrvd_fix_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_excI_div_uid70_block_rsrvd_fix_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist58_singX_uid49_block_rsrvd_fix_b_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist61_fracX_uid48_block_rsrvd_fix_b_30_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist63_expX_uid47_block_rsrvd_fix_b_17_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist64_xInZero_uid45_block_rsrvd_fix_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist65_yInZero_uid41_block_rsrvd_fix_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist66_yInZero_uid41_block_rsrvd_fix_q_33_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist67_xInSign_uid36_block_rsrvd_fix_b_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist68_xInSign_uid36_block_rsrvd_fix_b_26_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist69_yInSign_uid35_block_rsrvd_fix_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist70_yInSign_uid35_block_rsrvd_fix_b_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist71_yInSign_uid35_block_rsrvd_fix_b_34_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist73_expXIsMax_uid27_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist74_expXIsMax_uid13_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist76_frac_xIn_uid11_block_rsrvd_fix_b_12_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0 : std_logic;
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ia : STD_LOGIC_VECTOR (43 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_iq : STD_LOGIC_VECTOR (43 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_q : STD_LOGIC_VECTOR (43 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i : signal is true;
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q : signal is true;
    signal redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0 : std_logic;
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ia : STD_LOGIC_VECTOR (46 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_iq : STD_LOGIC_VECTOR (46 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_q : STD_LOGIC_VECTOR (46 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i : signal is true;
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q : signal is true;
    signal redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_reset0 : std_logic;
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i : signal is true;
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq : std_logic;
    attribute preserve of redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq : signal is true;
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q : signal is true;
    signal redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_reset0 : std_logic;
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i : signal is true;
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq : std_logic;
    attribute preserve of redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq : signal is true;
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q : signal is true;
    signal redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_reset0 : std_logic;
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ia : STD_LOGIC_VECTOR (52 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_iq : STD_LOGIC_VECTOR (52 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i : signal is true;
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq : std_logic;
    attribute preserve of redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq : signal is true;
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q : signal is true;
    signal redist53_oFracU_uid96_block_rsrvd_fix_q_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_reset0 : std_logic;
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i : signal is true;
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq : std_logic;
    attribute preserve of redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq : signal is true;
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q : signal is true;
    signal redist59_fracX_uid48_block_rsrvd_fix_b_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_reset0 : std_logic;
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i : signal is true;
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq : std_logic;
    attribute preserve of redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq : signal is true;
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q : signal is true;
    signal redist60_fracX_uid48_block_rsrvd_fix_b_29_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_reset0 : std_logic;
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i : signal is true;
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq : std_logic;
    attribute preserve of redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq : signal is true;
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q : signal is true;
    signal redist62_expX_uid47_block_rsrvd_fix_b_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_reset0 : std_logic;
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i : signal is true;
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq : std_logic;
    attribute preserve of redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq : signal is true;
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q : signal is true;
    signal redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_reset0 : std_logic;
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i : signal is true;
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq : std_logic;
    attribute preserve of redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq : signal is true;
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q : signal is true;
    signal redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- frac_yIn_uid25_block_rsrvd_fix(BITSELECT,24)@10
    frac_yIn_uid25_block_rsrvd_fix_b <= in_0(51 downto 0);

    -- cstZeroWF_uid8_block_rsrvd_fix(CONSTANT,7)
    cstZeroWF_uid8_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000";

    -- fracXIsZero_uid28_block_rsrvd_fix(LOGICAL,27)@10 + 1
    fracXIsZero_uid28_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid8_block_rsrvd_fix_q = frac_yIn_uid25_block_rsrvd_fix_b ELSE "0";
    fracXIsZero_uid28_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid28_block_rsrvd_fix_qi, xout => fracXIsZero_uid28_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2(DELAY,1230)
    redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid28_block_rsrvd_fix_q, xout => redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid29_block_rsrvd_fix(LOGICAL,28)@12
    fracXIsNotZero_uid29_block_rsrvd_fix_q <= not (redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2_q);

    -- cstAllOWE_uid7_block_rsrvd_fix(CONSTANT,6)
    cstAllOWE_uid7_block_rsrvd_fix_q <= "11111111111";

    -- exp_yIn_uid24_block_rsrvd_fix(BITSELECT,23)@10
    exp_yIn_uid24_block_rsrvd_fix_b <= in_0(62 downto 52);

    -- expXIsMax_uid27_block_rsrvd_fix(LOGICAL,26)@10 + 1
    expXIsMax_uid27_block_rsrvd_fix_qi <= "1" WHEN exp_yIn_uid24_block_rsrvd_fix_b = cstAllOWE_uid7_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid27_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid27_block_rsrvd_fix_qi, xout => expXIsMax_uid27_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist73_expXIsMax_uid27_block_rsrvd_fix_q_2(DELAY,1231)
    redist73_expXIsMax_uid27_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid27_block_rsrvd_fix_q, xout => redist73_expXIsMax_uid27_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excN_yIn_uid31_block_rsrvd_fix(LOGICAL,30)@12
    excN_yIn_uid31_block_rsrvd_fix_q <= redist73_expXIsMax_uid27_block_rsrvd_fix_q_2_q and fracXIsNotZero_uid29_block_rsrvd_fix_q;

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_notEnable(LOGICAL,1323)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_nor(LOGICAL,1324)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_nor_q <= not (redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_notEnable_q or redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q);

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_last(CONSTANT,1320)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_last_q <= "0111";

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmp(LOGICAL,1321)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmp_q <= "1" WHEN redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_last_q = redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_q ELSE "0";

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg(REG,1322)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena(REG,1325)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_nor_q = "1") THEN
                redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_enaAnd(LOGICAL,1326)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_enaAnd_q <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_sticky_ena_q and VCC_q;

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt(COUNTER,1318)
    -- low=0, high=8, step=1, init=0
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq <= '1';
            ELSE
                redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq <= '0';
            END IF;
            IF (redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_eq = '1') THEN
                redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i + 8;
            ELSE
                redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_i, 4)));

    -- frac_xIn_uid11_block_rsrvd_fix(BITSELECT,10)@0
    frac_xIn_uid11_block_rsrvd_fix_b <= in_1(51 downto 0);

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr(REG,1319)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr_q <= "1000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem(DUALMEM,1317)
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ia <= STD_LOGIC_VECTOR(frac_xIn_uid11_block_rsrvd_fix_b);
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_aa <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_wraddr_q;
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ab <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_rdcnt_q;
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_reset0 <= areset;
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 52,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_aa,
        data_a => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_ab,
        q_b => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_iq
    );
    redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_q <= redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_iq(51 downto 0);

    -- redist76_frac_xIn_uid11_block_rsrvd_fix_b_12(DELAY,1234)
    redist76_frac_xIn_uid11_block_rsrvd_fix_b_12 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_q, xout => redist76_frac_xIn_uid11_block_rsrvd_fix_b_12_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid14_block_rsrvd_fix(LOGICAL,13)@12
    fracXIsZero_uid14_block_rsrvd_fix_q <= "1" WHEN cstZeroWF_uid8_block_rsrvd_fix_q = redist76_frac_xIn_uid11_block_rsrvd_fix_b_12_q ELSE "0";

    -- fracXIsNotZero_uid15_block_rsrvd_fix(LOGICAL,14)@12
    fracXIsNotZero_uid15_block_rsrvd_fix_q <= not (fracXIsZero_uid14_block_rsrvd_fix_q);

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_notEnable(LOGICAL,1333)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_nor(LOGICAL,1334)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_nor_q <= not (redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_notEnable_q or redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q);

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_last(CONSTANT,1330)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_last_q <= "0111";

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmp(LOGICAL,1331)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmp_q <= "1" WHEN redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_last_q = redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_q ELSE "0";

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg(REG,1332)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena(REG,1335)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_nor_q = "1") THEN
                redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_enaAnd(LOGICAL,1336)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_enaAnd_q <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_sticky_ena_q and VCC_q;

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt(COUNTER,1328)
    -- low=0, high=8, step=1, init=0
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i = TO_UNSIGNED(7, 4)) THEN
                redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq <= '1';
            ELSE
                redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq <= '0';
            END IF;
            IF (redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_eq = '1') THEN
                redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i + 8;
            ELSE
                redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_i, 4)));

    -- exp_xIn_uid10_block_rsrvd_fix(BITSELECT,9)@0
    exp_xIn_uid10_block_rsrvd_fix_b <= in_1(62 downto 52);

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr(REG,1329)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr_q <= "1000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem(DUALMEM,1327)
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ia <= STD_LOGIC_VECTOR(exp_xIn_uid10_block_rsrvd_fix_b);
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_aa <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_wraddr_q;
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ab <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_rdcnt_q;
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_reset0 <= areset;
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 9,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_reset0,
        clock1 => clk,
        address_a => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_aa,
        data_a => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_ab,
        q_b => redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_iq
    );
    redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_iq(10 downto 0);

    -- expXIsMax_uid13_block_rsrvd_fix(LOGICAL,12)@10 + 1
    expXIsMax_uid13_block_rsrvd_fix_qi <= "1" WHEN redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q = cstAllOWE_uid7_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid13_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid13_block_rsrvd_fix_qi, xout => expXIsMax_uid13_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist74_expXIsMax_uid13_block_rsrvd_fix_q_2(DELAY,1232)
    redist74_expXIsMax_uid13_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid13_block_rsrvd_fix_q, xout => redist74_expXIsMax_uid13_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excN_xIn_uid17_block_rsrvd_fix(LOGICAL,16)@12
    excN_xIn_uid17_block_rsrvd_fix_q <= redist74_expXIsMax_uid13_block_rsrvd_fix_q_2_q and fracXIsNotZero_uid15_block_rsrvd_fix_q;

    -- excRNaN_uid184_block_rsrvd_fix(LOGICAL,183)@12 + 1
    excRNaN_uid184_block_rsrvd_fix_qi <= excN_xIn_uid17_block_rsrvd_fix_q or excN_yIn_uid31_block_rsrvd_fix_q;
    excRNaN_uid184_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid184_block_rsrvd_fix_qi, xout => excRNaN_uid184_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist48_excRNaN_uid184_block_rsrvd_fix_q_32(DELAY,1206)
    redist48_excRNaN_uid184_block_rsrvd_fix_q_32 : dspba_delay
    GENERIC MAP ( width => 1, depth => 30, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid184_block_rsrvd_fix_q, xout => redist48_excRNaN_uid184_block_rsrvd_fix_q_32_q, clk => clk, aclr => areset );

    -- redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg(DELAY,1273)
    redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist48_excRNaN_uid184_block_rsrvd_fix_q_32_q, xout => redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid190_block_rsrvd_fix(LOGICAL,189)@44
    invExcRNaN_uid190_block_rsrvd_fix_q <= not (redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg_q);

    -- yInSign_uid35_block_rsrvd_fix(BITSELECT,34)@10
    yInSign_uid35_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_0(63 downto 63));

    -- redist69_yInSign_uid35_block_rsrvd_fix_b_3(DELAY,1227)
    redist69_yInSign_uid35_block_rsrvd_fix_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInSign_uid35_block_rsrvd_fix_b, xout => redist69_yInSign_uid35_block_rsrvd_fix_b_3_q, clk => clk, aclr => areset );

    -- redist70_yInSign_uid35_block_rsrvd_fix_b_16(DELAY,1228)
    redist70_yInSign_uid35_block_rsrvd_fix_b_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist69_yInSign_uid35_block_rsrvd_fix_b_3_q, xout => redist70_yInSign_uid35_block_rsrvd_fix_b_16_q, clk => clk, aclr => areset );

    -- redist71_yInSign_uid35_block_rsrvd_fix_b_34(DELAY,1229)
    redist71_yInSign_uid35_block_rsrvd_fix_b_34 : dspba_delay
    GENERIC MAP ( width => 1, depth => 18, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist70_yInSign_uid35_block_rsrvd_fix_b_16_q, xout => redist71_yInSign_uid35_block_rsrvd_fix_b_34_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signR_uid191_block_rsrvd_fix(LOGICAL,190)@44
    signR_uid191_block_rsrvd_fix_q <= redist71_yInSign_uid35_block_rsrvd_fix_b_34_q and invExcRNaN_uid190_block_rsrvd_fix_q;

    -- cstBiasP1_uid57_block_rsrvd_fix(CONSTANT,56)
    cstBiasP1_uid57_block_rsrvd_fix_q <= "10000000000";

    -- cstBias_uid54_block_rsrvd_fix(CONSTANT,53)
    cstBias_uid54_block_rsrvd_fix_q <= "01111111111";

    -- aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval(CONSTANT,784)
    aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q <= "000";

    -- rightShiftStage2Idx3Rng3_uid1058_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1057)@44
    rightShiftStage2Idx3Rng3_uid1058_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 3);

    -- rightShiftStage2Idx3_uid1060_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1059)@44
    rightShiftStage2Idx3_uid1060_fxpAlignedRes_uid164_block_rsrvd_fix_q <= aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q & rightShiftStage2Idx3Rng3_uid1058_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- padACst_uid168_block_rsrvd_fix(CONSTANT,167)
    padACst_uid168_block_rsrvd_fix_q <= "00";

    -- rightShiftStage2Idx2Rng2_uid1055_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1054)@44
    rightShiftStage2Idx2Rng2_uid1055_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 2);

    -- rightShiftStage2Idx2_uid1057_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1056)@44
    rightShiftStage2Idx2_uid1057_fxpAlignedRes_uid164_block_rsrvd_fix_q <= padACst_uid168_block_rsrvd_fix_q & rightShiftStage2Idx2Rng2_uid1055_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- rightShiftStage2Idx1Rng1_uid1052_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1051)@44
    rightShiftStage2Idx1Rng1_uid1052_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 1);

    -- rightShiftStage2Idx1_uid1054_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1053)@44
    rightShiftStage2Idx1_uid1054_fxpAlignedRes_uid164_block_rsrvd_fix_q <= GND_q & rightShiftStage2Idx1Rng1_uid1052_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- zS_uid103_block_rsrvd_fix(CONSTANT,102)
    zS_uid103_block_rsrvd_fix_q <= "000000000000";

    -- rightShiftStage1Idx3Rng12_uid1047_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1046)@44
    rightShiftStage1Idx3Rng12_uid1047_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 12);

    -- rightShiftStage1Idx3_uid1049_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1048)@44
    rightShiftStage1Idx3_uid1049_fxpAlignedRes_uid164_block_rsrvd_fix_q <= zS_uid103_block_rsrvd_fix_q & rightShiftStage1Idx3Rng12_uid1047_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix(CONSTANT,938)
    leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix_q <= "00000000";

    -- rightShiftStage1Idx2Rng8_uid1044_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1043)@44
    rightShiftStage1Idx2Rng8_uid1044_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 8);

    -- rightShiftStage1Idx2_uid1046_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1045)@44
    rightShiftStage1Idx2_uid1046_fxpAlignedRes_uid164_block_rsrvd_fix_q <= leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix_q & rightShiftStage1Idx2Rng8_uid1044_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval(CONSTANT,714)
    aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid1041_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1040)@44
    rightShiftStage1Idx1Rng4_uid1041_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q(105 downto 4);

    -- rightShiftStage1Idx1_uid1043_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1042)@44
    rightShiftStage1Idx1_uid1043_fxpAlignedRes_uid164_block_rsrvd_fix_q <= aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q & rightShiftStage1Idx1Rng4_uid1041_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- rightShiftStage0Idx3Pad48_uid1000_fxpOp2Path2_uid135_block_rsrvd_fix(CONSTANT,999)
    rightShiftStage0Idx3Pad48_uid1000_fxpOp2Path2_uid135_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng48_uid1036_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1035)@44
    rightShiftStage0Idx3Rng48_uid1036_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightPaddedIn_uid165_block_rsrvd_fix_q(105 downto 48);

    -- rightShiftStage0Idx3_uid1038_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1037)@44
    rightShiftStage0Idx3_uid1038_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0Idx3Pad48_uid1000_fxpOp2Path2_uid135_block_rsrvd_fix_q & rightShiftStage0Idx3Rng48_uid1036_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- rightShiftStage0Idx2Pad32_uid997_fxpOp2Path2_uid135_block_rsrvd_fix(CONSTANT,996)
    rightShiftStage0Idx2Pad32_uid997_fxpOp2Path2_uid135_block_rsrvd_fix_q <= "00000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng32_uid1033_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1032)@44
    rightShiftStage0Idx2Rng32_uid1033_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightPaddedIn_uid165_block_rsrvd_fix_q(105 downto 32);

    -- rightShiftStage0Idx2_uid1035_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1034)@44
    rightShiftStage0Idx2_uid1035_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0Idx2Pad32_uid997_fxpOp2Path2_uid135_block_rsrvd_fix_q & rightShiftStage0Idx2Rng32_uid1033_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix(CONSTANT,941)
    leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid1030_fxpAlignedRes_uid164_block_rsrvd_fix(BITSELECT,1029)@44
    rightShiftStage0Idx1Rng16_uid1030_fxpAlignedRes_uid164_block_rsrvd_fix_b <= rightPaddedIn_uid165_block_rsrvd_fix_q(105 downto 16);

    -- rightShiftStage0Idx1_uid1032_fxpAlignedRes_uid164_block_rsrvd_fix(BITJOIN,1031)@44
    rightShiftStage0Idx1_uid1032_fxpAlignedRes_uid164_block_rsrvd_fix_q <= leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix_q & rightShiftStage0Idx1Rng16_uid1030_fxpAlignedRes_uid164_block_rsrvd_fix_b;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_notEnable(LOGICAL,1269)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_nor(LOGICAL,1270)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_nor_q <= not (redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_notEnable_q or redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q);

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_last(CONSTANT,1266)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_last_q <= "01010";

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp(LOGICAL,1267)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_q);
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_q <= "1" WHEN redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_last_q = redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_b ELSE "0";

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg(REG,1268)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg_q <= STD_LOGIC_VECTOR(redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena(REG,1271)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_nor_q = "1") THEN
                redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_enaAnd(LOGICAL,1272)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_enaAnd_q <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_sticky_ena_q and VCC_q;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt(COUNTER,1264)
    -- low=0, high=11, step=1, init=0
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq <= '1';
            ELSE
                redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq <= '0';
            END IF;
            IF (redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_eq = '1') THEN
                redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i + 5;
            ELSE
                redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_i, 4)));

    -- excI_xIn_uid16_block_rsrvd_fix(LOGICAL,15)@12
    excI_xIn_uid16_block_rsrvd_fix_q <= redist74_expXIsMax_uid13_block_rsrvd_fix_q_2_q and fracXIsZero_uid14_block_rsrvd_fix_q;

    -- excI_yIn_uid30_block_rsrvd_fix(LOGICAL,29)@12
    excI_yIn_uid30_block_rsrvd_fix_q <= redist73_expXIsMax_uid27_block_rsrvd_fix_q_2_q and redist72_fracXIsZero_uid28_block_rsrvd_fix_q_2_q;

    -- excXIYI_uid290_div_uid46_block_rsrvd_fix(LOGICAL,289)@12
    excXIYI_uid290_div_uid46_block_rsrvd_fix_q <= excI_yIn_uid30_block_rsrvd_fix_q and excI_xIn_uid16_block_rsrvd_fix_q;

    -- excZ_y_uid225_div_uid46_block_rsrvd_fix(LOGICAL,224)@10 + 1
    excZ_y_uid225_div_uid46_block_rsrvd_fix_qi <= "1" WHEN redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q = cstAllZWE_uid53_block_rsrvd_fix_q ELSE "0";
    excZ_y_uid225_div_uid46_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid225_div_uid46_block_rsrvd_fix_qi, xout => excZ_y_uid225_div_uid46_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2(DELAY,1203)
    redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid225_div_uid46_block_rsrvd_fix_q, xout => redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excZ_x_uid211_div_uid46_block_rsrvd_fix(LOGICAL,210)@10 + 1
    excZ_x_uid211_div_uid46_block_rsrvd_fix_qi <= "1" WHEN exp_yIn_uid24_block_rsrvd_fix_b = cstAllZWE_uid53_block_rsrvd_fix_q ELSE "0";
    excZ_x_uid211_div_uid46_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid211_div_uid46_block_rsrvd_fix_qi, xout => excZ_x_uid211_div_uid46_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2(DELAY,1204)
    redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid211_div_uid46_block_rsrvd_fix_q, xout => redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excXZYZ_uid289_div_uid46_block_rsrvd_fix(LOGICAL,288)@12
    excXZYZ_uid289_div_uid46_block_rsrvd_fix_q <= redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q and redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q;

    -- excRNaN_uid291_div_uid46_block_rsrvd_fix(LOGICAL,290)@12
    excRNaN_uid291_div_uid46_block_rsrvd_fix_q <= excXZYZ_uid289_div_uid46_block_rsrvd_fix_q or excN_yIn_uid31_block_rsrvd_fix_q or excN_xIn_uid17_block_rsrvd_fix_q or excXIYI_uid290_div_uid46_block_rsrvd_fix_q;

    -- invExcRNaN_uid302_div_uid46_block_rsrvd_fix(LOGICAL,301)@12 + 1
    invExcRNaN_uid302_div_uid46_block_rsrvd_fix_qi <= not (excRNaN_uid291_div_uid46_block_rsrvd_fix_q);
    invExcRNaN_uid302_div_uid46_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExcRNaN_uid302_div_uid46_block_rsrvd_fix_qi, xout => invExcRNaN_uid302_div_uid46_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- xInSign_uid36_block_rsrvd_fix(BITSELECT,35)@0
    xInSign_uid36_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_1(63 downto 63));

    -- redist67_xInSign_uid36_block_rsrvd_fix_b_13(DELAY,1225)
    redist67_xInSign_uid36_block_rsrvd_fix_b_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInSign_uid36_block_rsrvd_fix_b, xout => redist67_xInSign_uid36_block_rsrvd_fix_b_13_q, clk => clk, aclr => areset );

    -- signR_uid234_div_uid46_block_rsrvd_fix(LOGICAL,233)@13
    signR_uid234_div_uid46_block_rsrvd_fix_q <= redist69_yInSign_uid35_block_rsrvd_fix_b_3_q xor redist67_xInSign_uid36_block_rsrvd_fix_b_13_q;

    -- sRPostExc_uid303_div_uid46_block_rsrvd_fix(LOGICAL,302)@13
    sRPostExc_uid303_div_uid46_block_rsrvd_fix_q <= signR_uid234_div_uid46_block_rsrvd_fix_q and invExcRNaN_uid302_div_uid46_block_rsrvd_fix_q;

    -- lOAdded_uid246_div_uid46_block_rsrvd_fix(BITJOIN,245)@10
    lOAdded_uid246_div_uid46_block_rsrvd_fix_q <= VCC_q & frac_yIn_uid25_block_rsrvd_fix_b;

    -- redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2(DELAY,1193)
    redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid246_div_uid46_block_rsrvd_fix_q, xout => redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- oFracXSE_mergedSignalTM_uid257_div_uid46_block_rsrvd_fix(BITJOIN,256)@12
    oFracXSE_mergedSignalTM_uid257_div_uid46_block_rsrvd_fix_q <= redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2_q & padACst_uid168_block_rsrvd_fix_q;

    -- divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix(ADD,252)@12
    divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_c);
    divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & redist35_lOAdded_uid246_div_uid46_block_rsrvd_fix_q_2_q);
    divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_a) + UNSIGNED(divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_b));
    divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_q <= divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_o(53 downto 0);

    -- topRangeY_uid489_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,488)@10
    topRangeY_uid489_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= lOAdded_uid246_div_uid46_block_rsrvd_fix_q(52 downto 26);

    -- yPE_uid240_div_uid46_block_rsrvd_fix(BITSELECT,239)@0
    yPE_uid240_div_uid46_block_rsrvd_fix_b <= in_1(41 downto 0);

    -- redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2(DELAY,1194)
    redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 42, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid240_div_uid46_block_rsrvd_fix_b, xout => redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4(DELAY,1195)
    redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 42, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2_q, xout => redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6(DELAY,1196)
    redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6 : dspba_delay
    GENERIC MAP ( width => 42, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4_q, xout => redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6_q, clk => clk, aclr => areset );

    -- redist39_yPE_uid240_div_uid46_block_rsrvd_fix_b_8(DELAY,1197)
    redist39_yPE_uid240_div_uid46_block_rsrvd_fix_b_8 : dspba_delay
    GENERIC MAP ( width => 42, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6_q, xout => redist39_yPE_uid240_div_uid46_block_rsrvd_fix_b_8_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval(BITJOIN,779)@8
    nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval_q <= GND_q & redist39_yPE_uid240_div_uid46_block_rsrvd_fix_b_8_q;

    -- topRangeX_uid782_pT4_uid472_invPolyEval(BITSELECT,781)@8
    topRangeX_uid782_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval_q(42 downto 16));

    -- yT3_uid465_invPolyEval(BITSELECT,464)@6
    yT3_uid465_invPolyEval_b <= redist38_yPE_uid240_div_uid46_block_rsrvd_fix_b_6_q(41 downto 3);

    -- nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval(BITJOIN,744)@6
    nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval_q <= GND_q & yT3_uid465_invPolyEval_b;

    -- aboveLeftX_uid749_pT3_uid466_invPolyEval(BITSELECT,748)@6
    aboveLeftX_uid749_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval_q(39 downto 22));

    -- yT2_uid459_invPolyEval(BITSELECT,458)@4
    yT2_uid459_invPolyEval_b <= redist37_yPE_uid240_div_uid46_block_rsrvd_fix_b_4_q(41 downto 12);

    -- nx_mergedSignalTM_uid710_pT2_uid460_invPolyEval(BITJOIN,709)@4
    nx_mergedSignalTM_uid710_pT2_uid460_invPolyEval_q <= GND_q & yT2_uid459_invPolyEval_b;

    -- topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select(BITSELECT,1155)@4
    topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid710_pT2_uid460_invPolyEval_q(30 downto 13));
    topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid710_pT2_uid460_invPolyEval_q(12 downto 0));

    -- aboveLeftY_mergedSignalTM_uid717_pT2_uid460_invPolyEval(BITJOIN,716)@4
    aboveLeftY_mergedSignalTM_uid717_pT2_uid460_invPolyEval_q <= topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_c & aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q;

    -- yAddr_uid239_div_uid46_block_rsrvd_fix(BITSELECT,238)@0
    yAddr_uid239_div_uid46_block_rsrvd_fix_b <= frac_xIn_uid11_block_rsrvd_fix_b(51 downto 42);

    -- memoryC4_uid445_invTables_lutmem(DUALMEM,1091)@0 + 2
    -- in j@20000000
    memoryC4_uid445_invTables_lutmem_aa <= yAddr_uid239_div_uid46_block_rsrvd_fix_b;
    memoryC4_uid445_invTables_lutmem_reset0 <= areset;
    memoryC4_uid445_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA19ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid445_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid445_invTables_lutmem_aa,
        q_a => memoryC4_uid445_invTables_lutmem_ir
    );
    memoryC4_uid445_invTables_lutmem_r <= memoryC4_uid445_invTables_lutmem_ir(8 downto 0);

    -- memoryC4_uid444_invTables_lutmem(DUALMEM,1090)@0 + 2
    -- in j@20000000
    memoryC4_uid444_invTables_lutmem_aa <= yAddr_uid239_div_uid46_block_rsrvd_fix_b;
    memoryC4_uid444_invTables_lutmem_reset0 <= areset;
    memoryC4_uid444_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA18ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid444_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid444_invTables_lutmem_aa,
        q_a => memoryC4_uid444_invTables_lutmem_ir
    );
    memoryC4_uid444_invTables_lutmem_r <= memoryC4_uid444_invTables_lutmem_ir(9 downto 0);

    -- os_uid446_invTables(BITJOIN,445)@2
    os_uid446_invTables_q <= memoryC4_uid445_invTables_lutmem_r & memoryC4_uid444_invTables_lutmem_r;

    -- yT1_uid453_invPolyEval(BITSELECT,452)@2
    yT1_uid453_invPolyEval_b <= redist36_yPE_uid240_div_uid46_block_rsrvd_fix_b_2_q(41 downto 23);

    -- prodXY_uid695_pT1_uid454_invPolyEval_cma(CHAINMULTADD,1116)@2 + 2
    prodXY_uid695_pT1_uid454_invPolyEval_cma_reset <= areset;
    prodXY_uid695_pT1_uid454_invPolyEval_cma_ena0 <= '1';
    prodXY_uid695_pT1_uid454_invPolyEval_cma_ena1 <= prodXY_uid695_pT1_uid454_invPolyEval_cma_ena0;
    prodXY_uid695_pT1_uid454_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid695_pT1_uid454_invPolyEval_cma_a0(0),20));
    prodXY_uid695_pT1_uid454_invPolyEval_cma_p(0) <= prodXY_uid695_pT1_uid454_invPolyEval_cma_l(0) * prodXY_uid695_pT1_uid454_invPolyEval_cma_c0(0);
    prodXY_uid695_pT1_uid454_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid695_pT1_uid454_invPolyEval_cma_p(0),39);
    prodXY_uid695_pT1_uid454_invPolyEval_cma_w(0) <= prodXY_uid695_pT1_uid454_invPolyEval_cma_u(0);
    prodXY_uid695_pT1_uid454_invPolyEval_cma_x(0) <= prodXY_uid695_pT1_uid454_invPolyEval_cma_w(0);
    prodXY_uid695_pT1_uid454_invPolyEval_cma_y(0) <= prodXY_uid695_pT1_uid454_invPolyEval_cma_x(0);
    prodXY_uid695_pT1_uid454_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid695_pT1_uid454_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid695_pT1_uid454_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid695_pT1_uid454_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid695_pT1_uid454_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid453_invPolyEval_b),19);
                prodXY_uid695_pT1_uid454_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(os_uid446_invTables_q),19);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid695_pT1_uid454_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid695_pT1_uid454_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid695_pT1_uid454_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid695_pT1_uid454_invPolyEval_cma_s(0) <= prodXY_uid695_pT1_uid454_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid695_pT1_uid454_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 38, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid695_pT1_uid454_invPolyEval_cma_s(0)(37 downto 0)), xout => prodXY_uid695_pT1_uid454_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid695_pT1_uid454_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid695_pT1_uid454_invPolyEval_cma_qq(37 downto 0));

    -- osig_uid696_pT1_uid454_invPolyEval(BITSELECT,695)@4
    osig_uid696_pT1_uid454_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid695_pT1_uid454_invPolyEval_cma_q(37 downto 17));

    -- highBBits_uid456_invPolyEval(BITSELECT,455)@4
    highBBits_uid456_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid696_pT1_uid454_invPolyEval_b(20 downto 1));

    -- redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2(DELAY,1198)
    redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 10, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid239_div_uid46_block_rsrvd_fix_b, xout => redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- memoryC3_uid441_invTables_lutmem(DUALMEM,1089)@2 + 2
    -- in j@20000000
    memoryC3_uid441_invTables_lutmem_aa <= redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q;
    memoryC3_uid441_invTables_lutmem_reset0 <= areset;
    memoryC3_uid441_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA17ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid441_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid441_invTables_lutmem_aa,
        q_a => memoryC3_uid441_invTables_lutmem_ir
    );
    memoryC3_uid441_invTables_lutmem_r <= memoryC3_uid441_invTables_lutmem_ir(9 downto 0);

    -- memoryC3_uid440_invTables_lutmem(DUALMEM,1088)@2 + 2
    -- in j@20000000
    memoryC3_uid440_invTables_lutmem_aa <= redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q;
    memoryC3_uid440_invTables_lutmem_reset0 <= areset;
    memoryC3_uid440_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA16ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid440_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid440_invTables_lutmem_aa,
        q_a => memoryC3_uid440_invTables_lutmem_ir
    );
    memoryC3_uid440_invTables_lutmem_r <= memoryC3_uid440_invTables_lutmem_ir(9 downto 0);

    -- memoryC3_uid439_invTables_lutmem(DUALMEM,1087)@2 + 2
    -- in j@20000000
    memoryC3_uid439_invTables_lutmem_aa <= redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q;
    memoryC3_uid439_invTables_lutmem_reset0 <= areset;
    memoryC3_uid439_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA15ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid439_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid439_invTables_lutmem_aa,
        q_a => memoryC3_uid439_invTables_lutmem_ir
    );
    memoryC3_uid439_invTables_lutmem_r <= memoryC3_uid439_invTables_lutmem_ir(9 downto 0);

    -- os_uid442_invTables(BITJOIN,441)@4
    os_uid442_invTables_q <= memoryC3_uid441_invTables_lutmem_r & memoryC3_uid440_invTables_lutmem_r & memoryC3_uid439_invTables_lutmem_r;

    -- s1sumAHighB_uid457_invPolyEval(ADD,456)@4
    s1sumAHighB_uid457_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 30 => os_uid442_invTables_q(29)) & os_uid442_invTables_q));
    s1sumAHighB_uid457_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 20 => highBBits_uid456_invPolyEval_b(19)) & highBBits_uid456_invPolyEval_b));
    s1sumAHighB_uid457_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid457_invPolyEval_a) + SIGNED(s1sumAHighB_uid457_invPolyEval_b));
    s1sumAHighB_uid457_invPolyEval_q <= s1sumAHighB_uid457_invPolyEval_o(30 downto 0);

    -- lowRangeB_uid455_invPolyEval(BITSELECT,454)@4
    lowRangeB_uid455_invPolyEval_in <= osig_uid696_pT1_uid454_invPolyEval_b(0 downto 0);
    lowRangeB_uid455_invPolyEval_b <= lowRangeB_uid455_invPolyEval_in(0 downto 0);

    -- s1_uid458_invPolyEval(BITJOIN,457)@4
    s1_uid458_invPolyEval_q <= s1sumAHighB_uid457_invPolyEval_q & lowRangeB_uid455_invPolyEval_b;

    -- topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select(BITSELECT,1152)@4
    topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_b <= STD_LOGIC_VECTOR(s1_uid458_invPolyEval_q(31 downto 14));
    topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_c <= STD_LOGIC_VECTOR(s1_uid458_invPolyEval_q(13 downto 0));

    -- rightBottomX_bottomExtension_uid719_pT2_uid460_invPolyEval(CONSTANT,718)
    rightBottomX_bottomExtension_uid719_pT2_uid460_invPolyEval_q <= "00000";

    -- rightBottomX_mergedSignalTM_uid721_pT2_uid460_invPolyEval(BITJOIN,720)@4
    rightBottomX_mergedSignalTM_uid721_pT2_uid460_invPolyEval_q <= topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_c & rightBottomX_bottomExtension_uid719_pT2_uid460_invPolyEval_q;

    -- multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma(CHAINMULTADD,1131)@4 + 2
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_l(0) * multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_l(1) * multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_u(0) + multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid721_pT2_uid460_invPolyEval_q),18);
                multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid717_pT2_uid460_invPolyEval_q),18);
                multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_b),18);
                multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid728_pT2_uid460_invPolyEval(BITSELECT,727)@6
    highBBits_uid728_pT2_uid460_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_q(36 downto 18));

    -- sm0_uid724_pT2_uid460_invPolyEval_cma(CHAINMULTADD,1117)@4 + 2
    sm0_uid724_pT2_uid460_invPolyEval_cma_reset <= areset;
    sm0_uid724_pT2_uid460_invPolyEval_cma_ena0 <= '1';
    sm0_uid724_pT2_uid460_invPolyEval_cma_ena1 <= sm0_uid724_pT2_uid460_invPolyEval_cma_ena0;
    sm0_uid724_pT2_uid460_invPolyEval_cma_p(0) <= sm0_uid724_pT2_uid460_invPolyEval_cma_a0(0) * sm0_uid724_pT2_uid460_invPolyEval_cma_c0(0);
    sm0_uid724_pT2_uid460_invPolyEval_cma_u(0) <= RESIZE(sm0_uid724_pT2_uid460_invPolyEval_cma_p(0),36);
    sm0_uid724_pT2_uid460_invPolyEval_cma_w(0) <= sm0_uid724_pT2_uid460_invPolyEval_cma_u(0);
    sm0_uid724_pT2_uid460_invPolyEval_cma_x(0) <= sm0_uid724_pT2_uid460_invPolyEval_cma_w(0);
    sm0_uid724_pT2_uid460_invPolyEval_cma_y(0) <= sm0_uid724_pT2_uid460_invPolyEval_cma_x(0);
    sm0_uid724_pT2_uid460_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid724_pT2_uid460_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid724_pT2_uid460_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid724_pT2_uid460_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid724_pT2_uid460_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid712_pT2_uid460_invPolyEval_merged_bit_select_b),18);
                sm0_uid724_pT2_uid460_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid713_pT2_uid460_invPolyEval_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid724_pT2_uid460_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid724_pT2_uid460_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid724_pT2_uid460_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid724_pT2_uid460_invPolyEval_cma_s(0) <= sm0_uid724_pT2_uid460_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid724_pT2_uid460_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid724_pT2_uid460_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid724_pT2_uid460_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid724_pT2_uid460_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid724_pT2_uid460_invPolyEval_cma_qq(35 downto 0));

    -- lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval(ADD,728)@6
    lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => sm0_uid724_pT2_uid460_invPolyEval_cma_q(35)) & sm0_uid724_pT2_uid460_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 19 => highBBits_uid728_pT2_uid460_invPolyEval_b(18)) & highBBits_uid728_pT2_uid460_invPolyEval_b));
    lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_b));
    lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_q <= lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_o(36 downto 0);

    -- lowRangeB_uid727_pT2_uid460_invPolyEval(BITSELECT,726)@6
    lowRangeB_uid727_pT2_uid460_invPolyEval_in <= multSumOfTwoTS_uid725_pT2_uid460_invPolyEval_cma_q(17 downto 0);
    lowRangeB_uid727_pT2_uid460_invPolyEval_b <= lowRangeB_uid727_pT2_uid460_invPolyEval_in(17 downto 0);

    -- lev1_a0_uid730_pT2_uid460_invPolyEval(BITJOIN,729)@6
    lev1_a0_uid730_pT2_uid460_invPolyEval_q <= lev1_a0sumAHighB_uid729_pT2_uid460_invPolyEval_q & lowRangeB_uid727_pT2_uid460_invPolyEval_b;

    -- os_uid731_pT2_uid460_invPolyEval(BITSELECT,730)@6
    os_uid731_pT2_uid460_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid730_pT2_uid460_invPolyEval_q(52 downto 0));
    os_uid731_pT2_uid460_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid731_pT2_uid460_invPolyEval_in(52 downto 22));

    -- highBBits_uid462_invPolyEval(BITSELECT,461)@6
    highBBits_uid462_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid731_pT2_uid460_invPolyEval_b(30 downto 1));

    -- redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4(DELAY,1199)
    redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 10, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_yAddr_uid239_div_uid46_block_rsrvd_fix_b_2_q, xout => redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- memoryC2_uid436_invTables_lutmem(DUALMEM,1086)@4 + 2
    -- in j@20000000
    memoryC2_uid436_invTables_lutmem_aa <= redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q;
    memoryC2_uid436_invTables_lutmem_reset0 <= areset;
    memoryC2_uid436_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA14ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid436_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid436_invTables_lutmem_aa,
        q_a => memoryC2_uid436_invTables_lutmem_ir
    );
    memoryC2_uid436_invTables_lutmem_r <= memoryC2_uid436_invTables_lutmem_ir(8 downto 0);

    -- memoryC2_uid435_invTables_lutmem(DUALMEM,1085)@4 + 2
    -- in j@20000000
    memoryC2_uid435_invTables_lutmem_aa <= redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q;
    memoryC2_uid435_invTables_lutmem_reset0 <= areset;
    memoryC2_uid435_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA13ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid435_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid435_invTables_lutmem_aa,
        q_a => memoryC2_uid435_invTables_lutmem_ir
    );
    memoryC2_uid435_invTables_lutmem_r <= memoryC2_uid435_invTables_lutmem_ir(9 downto 0);

    -- memoryC2_uid434_invTables_lutmem(DUALMEM,1084)@4 + 2
    -- in j@20000000
    memoryC2_uid434_invTables_lutmem_aa <= redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q;
    memoryC2_uid434_invTables_lutmem_reset0 <= areset;
    memoryC2_uid434_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA12ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid434_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid434_invTables_lutmem_aa,
        q_a => memoryC2_uid434_invTables_lutmem_ir
    );
    memoryC2_uid434_invTables_lutmem_r <= memoryC2_uid434_invTables_lutmem_ir(9 downto 0);

    -- memoryC2_uid433_invTables_lutmem(DUALMEM,1083)@4 + 2
    -- in j@20000000
    memoryC2_uid433_invTables_lutmem_aa <= redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q;
    memoryC2_uid433_invTables_lutmem_reset0 <= areset;
    memoryC2_uid433_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA11ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid433_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid433_invTables_lutmem_aa,
        q_a => memoryC2_uid433_invTables_lutmem_ir
    );
    memoryC2_uid433_invTables_lutmem_r <= memoryC2_uid433_invTables_lutmem_ir(9 downto 0);

    -- os_uid437_invTables(BITJOIN,436)@6
    os_uid437_invTables_q <= memoryC2_uid436_invTables_lutmem_r & memoryC2_uid435_invTables_lutmem_r & memoryC2_uid434_invTables_lutmem_r & memoryC2_uid433_invTables_lutmem_r;

    -- s2sumAHighB_uid463_invPolyEval(ADD,462)@6
    s2sumAHighB_uid463_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 39 => os_uid437_invTables_q(38)) & os_uid437_invTables_q));
    s2sumAHighB_uid463_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 30 => highBBits_uid462_invPolyEval_b(29)) & highBBits_uid462_invPolyEval_b));
    s2sumAHighB_uid463_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid463_invPolyEval_a) + SIGNED(s2sumAHighB_uid463_invPolyEval_b));
    s2sumAHighB_uid463_invPolyEval_q <= s2sumAHighB_uid463_invPolyEval_o(39 downto 0);

    -- lowRangeB_uid461_invPolyEval(BITSELECT,460)@6
    lowRangeB_uid461_invPolyEval_in <= os_uid731_pT2_uid460_invPolyEval_b(0 downto 0);
    lowRangeB_uid461_invPolyEval_b <= lowRangeB_uid461_invPolyEval_in(0 downto 0);

    -- s2_uid464_invPolyEval(BITJOIN,463)@6
    s2_uid464_invPolyEval_q <= s2sumAHighB_uid463_invPolyEval_q & lowRangeB_uid461_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval(BITSELECT,750)@6
    aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_in <= STD_LOGIC_VECTOR(s2_uid464_invPolyEval_q(13 downto 0));
    aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_in(13 downto 0));

    -- aboveLeftY_mergedSignalTM_uid752_pT3_uid466_invPolyEval(BITJOIN,751)@6
    aboveLeftY_mergedSignalTM_uid752_pT3_uid466_invPolyEval_q <= aboveLeftY_bottomRange_uid751_pT3_uid466_invPolyEval_b & aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q;

    -- rightBottomY_uid758_pT3_uid466_invPolyEval(BITSELECT,757)@6
    rightBottomY_uid758_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid464_invPolyEval_q(40 downto 23));

    -- rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval(BITSELECT,754)@6
    rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval_q(12 downto 0));
    rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_in(12 downto 0));

    -- rightBottomX_mergedSignalTM_uid756_pT3_uid466_invPolyEval(BITJOIN,755)@6
    rightBottomX_mergedSignalTM_uid756_pT3_uid466_invPolyEval_q <= rightBottomX_bottomRange_uid755_pT3_uid466_invPolyEval_b & rightBottomX_bottomExtension_uid719_pT2_uid460_invPolyEval_q;

    -- multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma(CHAINMULTADD,1132)@6 + 2
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_l(0) * multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_l(1) * multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_u(0) + multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid756_pT3_uid466_invPolyEval_q),18);
                multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid752_pT3_uid466_invPolyEval_q),18);
                multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid758_pT3_uid466_invPolyEval_b),18);
                multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid749_pT3_uid466_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid763_pT3_uid466_invPolyEval(BITSELECT,762)@8
    highBBits_uid763_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_q(36 downto 9));

    -- topRangeY_uid748_pT3_uid466_invPolyEval(BITSELECT,747)@6
    topRangeY_uid748_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid464_invPolyEval_q(40 downto 14));

    -- topRangeX_uid747_pT3_uid466_invPolyEval(BITSELECT,746)@6
    topRangeX_uid747_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid745_pT3_uid466_invPolyEval_q(39 downto 13));

    -- sm0_uid759_pT3_uid466_invPolyEval_cma(CHAINMULTADD,1118)@6 + 2
    sm0_uid759_pT3_uid466_invPolyEval_cma_reset <= areset;
    sm0_uid759_pT3_uid466_invPolyEval_cma_ena0 <= '1';
    sm0_uid759_pT3_uid466_invPolyEval_cma_ena1 <= sm0_uid759_pT3_uid466_invPolyEval_cma_ena0;
    sm0_uid759_pT3_uid466_invPolyEval_cma_p(0) <= sm0_uid759_pT3_uid466_invPolyEval_cma_a0(0) * sm0_uid759_pT3_uid466_invPolyEval_cma_c0(0);
    sm0_uid759_pT3_uid466_invPolyEval_cma_u(0) <= RESIZE(sm0_uid759_pT3_uid466_invPolyEval_cma_p(0),54);
    sm0_uid759_pT3_uid466_invPolyEval_cma_w(0) <= sm0_uid759_pT3_uid466_invPolyEval_cma_u(0);
    sm0_uid759_pT3_uid466_invPolyEval_cma_x(0) <= sm0_uid759_pT3_uid466_invPolyEval_cma_w(0);
    sm0_uid759_pT3_uid466_invPolyEval_cma_y(0) <= sm0_uid759_pT3_uid466_invPolyEval_cma_x(0);
    sm0_uid759_pT3_uid466_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid759_pT3_uid466_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid759_pT3_uid466_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid759_pT3_uid466_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid759_pT3_uid466_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid747_pT3_uid466_invPolyEval_b),27);
                sm0_uid759_pT3_uid466_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid748_pT3_uid466_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid759_pT3_uid466_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid759_pT3_uid466_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid759_pT3_uid466_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid759_pT3_uid466_invPolyEval_cma_s(0) <= sm0_uid759_pT3_uid466_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid759_pT3_uid466_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid759_pT3_uid466_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid759_pT3_uid466_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid759_pT3_uid466_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid759_pT3_uid466_invPolyEval_cma_qq(53 downto 0));

    -- lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval(ADD,763)@8
    lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => sm0_uid759_pT3_uid466_invPolyEval_cma_q(53)) & sm0_uid759_pT3_uid466_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid763_pT3_uid466_invPolyEval_b(27)) & highBBits_uid763_pT3_uid466_invPolyEval_b));
    lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_b));
    lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_q <= lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid762_pT3_uid466_invPolyEval(BITSELECT,761)@8
    lowRangeB_uid762_pT3_uid466_invPolyEval_in <= multSumOfTwoTS_uid760_pT3_uid466_invPolyEval_cma_q(8 downto 0);
    lowRangeB_uid762_pT3_uid466_invPolyEval_b <= lowRangeB_uid762_pT3_uid466_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid765_pT3_uid466_invPolyEval(BITJOIN,764)@8
    lev1_a0_uid765_pT3_uid466_invPolyEval_q <= lev1_a0sumAHighB_uid764_pT3_uid466_invPolyEval_q & lowRangeB_uid762_pT3_uid466_invPolyEval_b;

    -- os_uid766_pT3_uid466_invPolyEval(BITSELECT,765)@8
    os_uid766_pT3_uid466_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid765_pT3_uid466_invPolyEval_q(61 downto 0));
    os_uid766_pT3_uid466_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid766_pT3_uid466_invPolyEval_in(61 downto 21));

    -- highBBits_uid468_invPolyEval(BITSELECT,467)@8
    highBBits_uid468_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid766_pT3_uid466_invPolyEval_b(40 downto 1));

    -- redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6(DELAY,1200)
    redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6 : dspba_delay
    GENERIC MAP ( width => 10, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist41_yAddr_uid239_div_uid46_block_rsrvd_fix_b_4_q, xout => redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q, clk => clk, aclr => areset );

    -- memoryC1_uid430_invTables_lutmem(DUALMEM,1082)@6 + 2
    -- in j@20000000
    memoryC1_uid430_invTables_lutmem_aa <= redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q;
    memoryC1_uid430_invTables_lutmem_reset0 <= areset;
    memoryC1_uid430_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA10ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid430_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid430_invTables_lutmem_aa,
        q_a => memoryC1_uid430_invTables_lutmem_ir
    );
    memoryC1_uid430_invTables_lutmem_r <= memoryC1_uid430_invTables_lutmem_ir(8 downto 0);

    -- memoryC1_uid429_invTables_lutmem(DUALMEM,1081)@6 + 2
    -- in j@20000000
    memoryC1_uid429_invTables_lutmem_aa <= redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q;
    memoryC1_uid429_invTables_lutmem_reset0 <= areset;
    memoryC1_uid429_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA9ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid429_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid429_invTables_lutmem_aa,
        q_a => memoryC1_uid429_invTables_lutmem_ir
    );
    memoryC1_uid429_invTables_lutmem_r <= memoryC1_uid429_invTables_lutmem_ir(9 downto 0);

    -- memoryC1_uid428_invTables_lutmem(DUALMEM,1080)@6 + 2
    -- in j@20000000
    memoryC1_uid428_invTables_lutmem_aa <= redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q;
    memoryC1_uid428_invTables_lutmem_reset0 <= areset;
    memoryC1_uid428_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA8ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid428_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid428_invTables_lutmem_aa,
        q_a => memoryC1_uid428_invTables_lutmem_ir
    );
    memoryC1_uid428_invTables_lutmem_r <= memoryC1_uid428_invTables_lutmem_ir(9 downto 0);

    -- memoryC1_uid427_invTables_lutmem(DUALMEM,1079)@6 + 2
    -- in j@20000000
    memoryC1_uid427_invTables_lutmem_aa <= redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q;
    memoryC1_uid427_invTables_lutmem_reset0 <= areset;
    memoryC1_uid427_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA7ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid427_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid427_invTables_lutmem_aa,
        q_a => memoryC1_uid427_invTables_lutmem_ir
    );
    memoryC1_uid427_invTables_lutmem_r <= memoryC1_uid427_invTables_lutmem_ir(9 downto 0);

    -- memoryC1_uid426_invTables_lutmem(DUALMEM,1078)@6 + 2
    -- in j@20000000
    memoryC1_uid426_invTables_lutmem_aa <= redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q;
    memoryC1_uid426_invTables_lutmem_reset0 <= areset;
    memoryC1_uid426_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA6ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid426_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid426_invTables_lutmem_aa,
        q_a => memoryC1_uid426_invTables_lutmem_ir
    );
    memoryC1_uid426_invTables_lutmem_r <= memoryC1_uid426_invTables_lutmem_ir(9 downto 0);

    -- os_uid431_invTables(BITJOIN,430)@8
    os_uid431_invTables_q <= memoryC1_uid430_invTables_lutmem_r & memoryC1_uid429_invTables_lutmem_r & memoryC1_uid428_invTables_lutmem_r & memoryC1_uid427_invTables_lutmem_r & memoryC1_uid426_invTables_lutmem_r;

    -- s3sumAHighB_uid469_invPolyEval(ADD,468)@8
    s3sumAHighB_uid469_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid431_invTables_q(48)) & os_uid431_invTables_q));
    s3sumAHighB_uid469_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 40 => highBBits_uid468_invPolyEval_b(39)) & highBBits_uid468_invPolyEval_b));
    s3sumAHighB_uid469_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid469_invPolyEval_a) + SIGNED(s3sumAHighB_uid469_invPolyEval_b));
    s3sumAHighB_uid469_invPolyEval_q <= s3sumAHighB_uid469_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid467_invPolyEval(BITSELECT,466)@8
    lowRangeB_uid467_invPolyEval_in <= os_uid766_pT3_uid466_invPolyEval_b(0 downto 0);
    lowRangeB_uid467_invPolyEval_b <= lowRangeB_uid467_invPolyEval_in(0 downto 0);

    -- s3_uid470_invPolyEval(BITJOIN,469)@8
    s3_uid470_invPolyEval_q <= s3sumAHighB_uid469_invPolyEval_q & lowRangeB_uid467_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval(BITSELECT,785)@8
    aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid470_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_in(23 downto 0));

    -- aboveLeftY_mergedSignalTM_uid787_pT4_uid472_invPolyEval(BITJOIN,786)@8
    aboveLeftY_mergedSignalTM_uid787_pT4_uid472_invPolyEval_q <= aboveLeftY_bottomRange_uid786_pT4_uid472_invPolyEval_b & aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q;

    -- topRangeY_uid783_pT4_uid472_invPolyEval(BITSELECT,782)@8
    topRangeY_uid783_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid470_invPolyEval_q(50 downto 24));

    -- rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval(BITSELECT,789)@8
    rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval_q(15 downto 0));
    rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_in(15 downto 0));

    -- rightBottomX_mergedSignalTM_uid791_pT4_uid472_invPolyEval(BITJOIN,790)@8
    rightBottomX_mergedSignalTM_uid791_pT4_uid472_invPolyEval_q <= rightBottomX_bottomRange_uid790_pT4_uid472_invPolyEval_b & cstAllZWE_uid53_block_rsrvd_fix_q;

    -- multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma(CHAINMULTADD,1133)@8 + 2
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_l(0) * multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_l(1) * multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_u(0) + multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid791_pT4_uid472_invPolyEval_q),27);
                multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid787_pT4_uid472_invPolyEval_q),27);
                multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid783_pT4_uid472_invPolyEval_b),27);
                multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid782_pT4_uid472_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_qq(54 downto 0));

    -- highBBits_uid802_pT4_uid472_invPolyEval(BITSELECT,801)@10
    highBBits_uid802_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_q(54 downto 23));

    -- sm0_uid796_pT4_uid472_invPolyEval_cma(CHAINMULTADD,1119)@8 + 2
    sm0_uid796_pT4_uid472_invPolyEval_cma_reset <= areset;
    sm0_uid796_pT4_uid472_invPolyEval_cma_ena0 <= '1';
    sm0_uid796_pT4_uid472_invPolyEval_cma_ena1 <= sm0_uid796_pT4_uid472_invPolyEval_cma_ena0;
    sm0_uid796_pT4_uid472_invPolyEval_cma_p(0) <= sm0_uid796_pT4_uid472_invPolyEval_cma_a0(0) * sm0_uid796_pT4_uid472_invPolyEval_cma_c0(0);
    sm0_uid796_pT4_uid472_invPolyEval_cma_u(0) <= RESIZE(sm0_uid796_pT4_uid472_invPolyEval_cma_p(0),54);
    sm0_uid796_pT4_uid472_invPolyEval_cma_w(0) <= sm0_uid796_pT4_uid472_invPolyEval_cma_u(0);
    sm0_uid796_pT4_uid472_invPolyEval_cma_x(0) <= sm0_uid796_pT4_uid472_invPolyEval_cma_w(0);
    sm0_uid796_pT4_uid472_invPolyEval_cma_y(0) <= sm0_uid796_pT4_uid472_invPolyEval_cma_x(0);
    sm0_uid796_pT4_uid472_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid796_pT4_uid472_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid796_pT4_uid472_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid796_pT4_uid472_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid796_pT4_uid472_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid782_pT4_uid472_invPolyEval_b),27);
                sm0_uid796_pT4_uid472_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid783_pT4_uid472_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid796_pT4_uid472_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid796_pT4_uid472_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid796_pT4_uid472_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid796_pT4_uid472_invPolyEval_cma_s(0) <= sm0_uid796_pT4_uid472_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid796_pT4_uid472_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid796_pT4_uid472_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid796_pT4_uid472_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid796_pT4_uid472_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid796_pT4_uid472_invPolyEval_cma_qq(53 downto 0));

    -- aboveLeftY_uid795_pT4_uid472_invPolyEval(BITSELECT,794)@8
    aboveLeftY_uid795_pT4_uid472_invPolyEval_in <= s3_uid470_invPolyEval_q(23 downto 0);
    aboveLeftY_uid795_pT4_uid472_invPolyEval_b <= aboveLeftY_uid795_pT4_uid472_invPolyEval_in(23 downto 22);

    -- aboveLeftX_uid794_pT4_uid472_invPolyEval(BITSELECT,793)@8
    aboveLeftX_uid794_pT4_uid472_invPolyEval_in <= nx_mergedSignalTM_uid780_pT4_uid472_invPolyEval_q(15 downto 0);
    aboveLeftX_uid794_pT4_uid472_invPolyEval_b <= aboveLeftX_uid794_pT4_uid472_invPolyEval_in(15 downto 14);

    -- sm0_uid799_pT4_uid472_invPolyEval(MULT,798)@8 + 2
    sm0_uid799_pT4_uid472_invPolyEval_pr <= UNSIGNED(sm0_uid799_pT4_uid472_invPolyEval_a0) * UNSIGNED(sm0_uid799_pT4_uid472_invPolyEval_b0);
    sm0_uid799_pT4_uid472_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid799_pT4_uid472_invPolyEval_a0 <= (others => '0');
            sm0_uid799_pT4_uid472_invPolyEval_b0 <= (others => '0');
            sm0_uid799_pT4_uid472_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid799_pT4_uid472_invPolyEval_a0 <= aboveLeftX_uid794_pT4_uid472_invPolyEval_b;
            sm0_uid799_pT4_uid472_invPolyEval_b0 <= aboveLeftY_uid795_pT4_uid472_invPolyEval_b;
            sm0_uid799_pT4_uid472_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid799_pT4_uid472_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid799_pT4_uid472_invPolyEval_q <= sm0_uid799_pT4_uid472_invPolyEval_s1;

    -- sumAb_uid800_pT4_uid472_invPolyEval(BITJOIN,799)@10
    sumAb_uid800_pT4_uid472_invPolyEval_q <= sm0_uid796_pT4_uid472_invPolyEval_cma_q & sm0_uid799_pT4_uid472_invPolyEval_q;

    -- lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval(ADD,802)@10
    lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid800_pT4_uid472_invPolyEval_q(57)) & sumAb_uid800_pT4_uid472_invPolyEval_q));
    lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid802_pT4_uid472_invPolyEval_b(31)) & highBBits_uid802_pT4_uid472_invPolyEval_b));
    lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_b));
    lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_q <= lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid801_pT4_uid472_invPolyEval(BITSELECT,800)@10
    lowRangeB_uid801_pT4_uid472_invPolyEval_in <= multSumOfTwoTS_uid797_pT4_uid472_invPolyEval_cma_q(22 downto 0);
    lowRangeB_uid801_pT4_uid472_invPolyEval_b <= lowRangeB_uid801_pT4_uid472_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid804_pT4_uid472_invPolyEval(BITJOIN,803)@10
    lev1_a0_uid804_pT4_uid472_invPolyEval_q <= lev1_a0sumAHighB_uid803_pT4_uid472_invPolyEval_q & lowRangeB_uid801_pT4_uid472_invPolyEval_b;

    -- os_uid805_pT4_uid472_invPolyEval(BITSELECT,804)@10
    os_uid805_pT4_uid472_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid804_pT4_uid472_invPolyEval_q(79 downto 0));
    os_uid805_pT4_uid472_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid805_pT4_uid472_invPolyEval_in(79 downto 28));

    -- highBBits_uid474_invPolyEval(BITSELECT,473)@10
    highBBits_uid474_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid805_pT4_uid472_invPolyEval_b(51 downto 2));

    -- redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8(DELAY,1201)
    redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8 : dspba_delay
    GENERIC MAP ( width => 10, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist42_yAddr_uid239_div_uid46_block_rsrvd_fix_b_6_q, xout => redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q, clk => clk, aclr => areset );

    -- memoryC0_uid423_invTables_lutmem(DUALMEM,1077)@8 + 2
    -- in j@20000000
    memoryC0_uid423_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid423_invTables_lutmem_reset0 <= areset;
    memoryC0_uid423_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA5ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid423_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid423_invTables_lutmem_aa,
        q_a => memoryC0_uid423_invTables_lutmem_ir
    );
    memoryC0_uid423_invTables_lutmem_r <= memoryC0_uid423_invTables_lutmem_ir(9 downto 0);

    -- memoryC0_uid422_invTables_lutmem(DUALMEM,1076)@8 + 2
    -- in j@20000000
    memoryC0_uid422_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid422_invTables_lutmem_reset0 <= areset;
    memoryC0_uid422_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA4ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid422_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid422_invTables_lutmem_aa,
        q_a => memoryC0_uid422_invTables_lutmem_ir
    );
    memoryC0_uid422_invTables_lutmem_r <= memoryC0_uid422_invTables_lutmem_ir(9 downto 0);

    -- memoryC0_uid421_invTables_lutmem(DUALMEM,1075)@8 + 2
    -- in j@20000000
    memoryC0_uid421_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid421_invTables_lutmem_reset0 <= areset;
    memoryC0_uid421_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA3ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid421_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid421_invTables_lutmem_aa,
        q_a => memoryC0_uid421_invTables_lutmem_ir
    );
    memoryC0_uid421_invTables_lutmem_r <= memoryC0_uid421_invTables_lutmem_ir(9 downto 0);

    -- memoryC0_uid420_invTables_lutmem(DUALMEM,1074)@8 + 2
    -- in j@20000000
    memoryC0_uid420_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid420_invTables_lutmem_reset0 <= areset;
    memoryC0_uid420_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA2ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid420_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid420_invTables_lutmem_aa,
        q_a => memoryC0_uid420_invTables_lutmem_ir
    );
    memoryC0_uid420_invTables_lutmem_r <= memoryC0_uid420_invTables_lutmem_ir(9 downto 0);

    -- memoryC0_uid419_invTables_lutmem(DUALMEM,1073)@8 + 2
    -- in j@20000000
    memoryC0_uid419_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid419_invTables_lutmem_reset0 <= areset;
    memoryC0_uid419_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA1ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid419_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid419_invTables_lutmem_aa,
        q_a => memoryC0_uid419_invTables_lutmem_ir
    );
    memoryC0_uid419_invTables_lutmem_r <= memoryC0_uid419_invTables_lutmem_ir(9 downto 0);

    -- memoryC0_uid418_invTables_lutmem(DUALMEM,1072)@8 + 2
    -- in j@20000000
    memoryC0_uid418_invTables_lutmem_aa <= redist43_yAddr_uid239_div_uid46_block_rsrvd_fix_b_8_q;
    memoryC0_uid418_invTables_lutmem_reset0 <= areset;
    memoryC0_uid418_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 10,
        numwords_a => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid418_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid418_invTables_lutmem_aa,
        q_a => memoryC0_uid418_invTables_lutmem_ir
    );
    memoryC0_uid418_invTables_lutmem_r <= memoryC0_uid418_invTables_lutmem_ir(9 downto 0);

    -- os_uid424_invTables(BITJOIN,423)@10
    os_uid424_invTables_q <= memoryC0_uid423_invTables_lutmem_r & memoryC0_uid422_invTables_lutmem_r & memoryC0_uid421_invTables_lutmem_r & memoryC0_uid420_invTables_lutmem_r & memoryC0_uid419_invTables_lutmem_r & memoryC0_uid418_invTables_lutmem_r;

    -- s4sumAHighB_uid475_invPolyEval(ADD,474)@10
    s4sumAHighB_uid475_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 60 => os_uid424_invTables_q(59)) & os_uid424_invTables_q));
    s4sumAHighB_uid475_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 50 => highBBits_uid474_invPolyEval_b(49)) & highBBits_uid474_invPolyEval_b));
    s4sumAHighB_uid475_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid475_invPolyEval_a) + SIGNED(s4sumAHighB_uid475_invPolyEval_b));
    s4sumAHighB_uid475_invPolyEval_q <= s4sumAHighB_uid475_invPolyEval_o(60 downto 0);

    -- lowRangeB_uid473_invPolyEval(BITSELECT,472)@10
    lowRangeB_uid473_invPolyEval_in <= os_uid805_pT4_uid472_invPolyEval_b(1 downto 0);
    lowRangeB_uid473_invPolyEval_b <= lowRangeB_uid473_invPolyEval_in(1 downto 0);

    -- s4_uid476_invPolyEval(BITJOIN,475)@10
    s4_uid476_invPolyEval_q <= s4sumAHighB_uid475_invPolyEval_q & lowRangeB_uid473_invPolyEval_b;

    -- invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select(BITSELECT,1153)@10
    invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_in <= s4_uid476_invPolyEval_q(60 downto 0);
    invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_b <= invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_in(59 downto 5);
    invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c <= invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_in(60 downto 60);

    -- invYLowBits_uid248_div_uid46_block_rsrvd_fix(BITSELECT,247)@10
    invYLowBits_uid248_div_uid46_block_rsrvd_fix_in <= invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_b(53 downto 0);
    invYLowBits_uid248_div_uid46_block_rsrvd_fix_b <= invYLowBits_uid248_div_uid46_block_rsrvd_fix_in(53 downto 0);

    -- topRangeX_uid488_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,487)@10
    topRangeX_uid488_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= invYLowBits_uid248_div_uid46_block_rsrvd_fix_b(53 downto 27);

    -- sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma(CHAINMULTADD,1110)@10 + 2
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_reset <= areset;
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 <= '1';
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0;
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(0) <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(0) * sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(0);
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(0) <= RESIZE(sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(0),54);
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w(0) <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(0);
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x(0) <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w(0);
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y(0) <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x(0);
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 = '1') THEN
                sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeX_uid488_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b),27);
                sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(topRangeY_uid489_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 = '1') THEN
                sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s(0) <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s(0)(53 downto 0)), xout => sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq(53 downto 0));

    -- aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,497)@10
    aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in <= lOAdded_uid246_div_uid46_block_rsrvd_fix_q(25 downto 0);
    aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in(25 downto 20);

    -- aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,496)@10
    aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in <= invYLowBits_uid248_div_uid46_block_rsrvd_fix_b(26 downto 0);
    aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in(26 downto 21);

    -- sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(MULT,501)@10 + 2
    sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_pr <= UNSIGNED(UNSIGNED(sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a0) * UNSIGNED(sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b0));
    sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a0 <= (others => '0');
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b0 <= (others => '0');
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a0 <= aboveLeftX_uid497_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b;
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b0 <= aboveLeftY_uid498_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b;
            sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_s1 <= STD_LOGIC_VECTOR(sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_pr);
        END IF;
    END PROCESS;
    sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q <= sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_s1;

    -- sumAb_uid503_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITJOIN,502)@12
    sumAb_uid503_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q <= sm0_uid499_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q & sm0_uid502_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q;

    -- lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(ADD,505)@12
    lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & sumAb_uid503_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q);
    lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_c);
    lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_a) + UNSIGNED(lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b));
    lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_o(66 downto 0);

    -- aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,491)@10
    aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in <= lOAdded_uid246_div_uid46_block_rsrvd_fix_q(25 downto 0);
    aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in(25 downto 0);

    -- aboveLeftY_mergedSignalTM_uid493_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITJOIN,492)@10
    aboveLeftY_mergedSignalTM_uid493_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q <= aboveLeftY_bottomRange_uid492_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b & GND_q;

    -- rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,494)@10
    rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in <= invYLowBits_uid248_div_uid46_block_rsrvd_fix_b(26 downto 0);
    rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in(26 downto 0);

    -- multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma(CHAINMULTADD,1127)@10 + 2
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_reset <= areset;
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 <= '1';
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0;
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(0) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(0) * multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(0);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(1) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(1) * multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(1);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(0) <= RESIZE(multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(0),55);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(1) <= RESIZE(multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_p(1),55);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w(0) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(0) + multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_u(1);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x(0) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_w(0);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y(0) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_x(0);
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeY_uid489_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b),27);
                multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid493_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q),27);
                multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(rightBottomX_uid495_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b),27);
                multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_c0(1) <= RESIZE(UNSIGNED(topRangeX_uid488_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s(0) <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_qq(54 downto 0));

    -- lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select(BITSELECT,1156)@12
    lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_b <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q(14 downto 0);
    lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_c <= multSumOfTwoTS_uid500_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_cma_q(54 downto 15);

    -- lev1_a0_uid507_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITJOIN,506)@12
    lev1_a0_uid507_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid506_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q & lowRangeB_uid504_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_merged_bit_select_b;

    -- os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix(BITSELECT,507)@12
    os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in <= lev1_a0_uid507_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_q(80 downto 0);
    os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b <= os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_in(80 downto 25);

    -- lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select(BITSELECT,1154)@12
    lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_b <= os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b(2 downto 0);
    lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_c <= os_uid508_prodDivPreNormProd_uid250_div_uid46_block_rsrvd_fix_b(55 downto 3);

    -- divValPreNormT_uid254_div_uid46_block_rsrvd_fix(BITJOIN,253)@12
    divValPreNormT_uid254_div_uid46_block_rsrvd_fix_q <= divValPreNormThigh_uid253_div_uid46_block_rsrvd_fix_q & lowRangeA_uid251_div_uid46_block_rsrvd_fix_merged_bit_select_b;

    -- divValPreNormS_uid259_div_uid46_block_rsrvd_fix(BITSELECT,258)@12
    divValPreNormS_uid259_div_uid46_block_rsrvd_fix_b <= divValPreNormT_uid254_div_uid46_block_rsrvd_fix_q(56 downto 2);

    -- redist0_invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c_2(DELAY,1158)
    redist0_invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c, xout => redist0_invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- updatedY_uid204_div_uid46_block_rsrvd_fix(BITJOIN,203)@12
    updatedY_uid204_div_uid46_block_rsrvd_fix_q <= GND_q & cstZeroWF_uid8_block_rsrvd_fix_q;

    -- fracYZero_uid203_div_uid46_block_rsrvd_fix(LOGICAL,204)@12
    fracYZero_uid203_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist76_frac_xIn_uid11_block_rsrvd_fix_b_12_q);
    fracYZero_uid203_div_uid46_block_rsrvd_fix_q <= "1" WHEN fracYZero_uid203_div_uid46_block_rsrvd_fix_a = updatedY_uid204_div_uid46_block_rsrvd_fix_q ELSE "0";

    -- fracYPostZ_uid244_div_uid46_block_rsrvd_fix(LOGICAL,243)@12
    fracYPostZ_uid244_div_uid46_block_rsrvd_fix_q <= fracYZero_uid203_div_uid46_block_rsrvd_fix_q or redist0_invY_uid242_div_uid46_block_rsrvd_fix_merged_bit_select_c_2_q;

    -- divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix(MUX,259)@12
    divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_s <= fracYPostZ_uid244_div_uid46_block_rsrvd_fix_q;
    divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_combproc: PROCESS (divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_s, divValPreNormS_uid259_div_uid46_block_rsrvd_fix_b, oFracXSE_mergedSignalTM_uid257_div_uid46_block_rsrvd_fix_q)
    BEGIN
        CASE (divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_s) IS
            WHEN "0" => divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q <= divValPreNormS_uid259_div_uid46_block_rsrvd_fix_b;
            WHEN "1" => divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q <= oFracXSE_mergedSignalTM_uid257_div_uid46_block_rsrvd_fix_q;
            WHEN OTHERS => divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid261_div_uid46_block_rsrvd_fix(BITSELECT,260)@12
    norm_uid261_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q(54 downto 54));

    -- rndOp_uid269_div_uid46_block_rsrvd_fix(BITJOIN,268)@12
    rndOp_uid269_div_uid46_block_rsrvd_fix_q <= norm_uid261_div_uid46_block_rsrvd_fix_b & cstZeroWF_uid8_block_rsrvd_fix_q & VCC_q;

    -- cstBiasM1_uid55_block_rsrvd_fix(CONSTANT,54)
    cstBiasM1_uid55_block_rsrvd_fix_q <= "01111111110";

    -- expXmY_uid235_div_uid46_block_rsrvd_fix(SUB,234)@10 + 1
    expXmY_uid235_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & exp_yIn_uid24_block_rsrvd_fix_b);
    expXmY_uid235_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q);
    expXmY_uid235_div_uid46_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid235_div_uid46_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expXmY_uid235_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid235_div_uid46_block_rsrvd_fix_a) - UNSIGNED(expXmY_uid235_div_uid46_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expXmY_uid235_div_uid46_block_rsrvd_fix_q <= expXmY_uid235_div_uid46_block_rsrvd_fix_o(11 downto 0);

    -- redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2(DELAY,1202)
    redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXmY_uid235_div_uid46_block_rsrvd_fix_q, xout => redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- expR_uid236_div_uid46_block_rsrvd_fix(ADD,235)@12
    expR_uid236_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2_q(11)) & redist44_expXmY_uid235_div_uid46_block_rsrvd_fix_q_2_q));
    expR_uid236_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid55_block_rsrvd_fix_q));
    expR_uid236_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid236_div_uid46_block_rsrvd_fix_a) + SIGNED(expR_uid236_div_uid46_block_rsrvd_fix_b));
    expR_uid236_div_uid46_block_rsrvd_fix_q <= expR_uid236_div_uid46_block_rsrvd_fix_o(12 downto 0);

    -- divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix(BITSELECT,261)@12
    divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_in <= divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q(53 downto 0);
    divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_b <= divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_in(53 downto 1);

    -- divValPreNormLow_uid263_div_uid46_block_rsrvd_fix(BITSELECT,262)@12
    divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_in <= divValPreNormTrunc_uid260_div_uid46_block_rsrvd_fix_q(52 downto 0);
    divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_b <= divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_in(52 downto 0);

    -- normFracRnd_uid264_div_uid46_block_rsrvd_fix(MUX,263)@12
    normFracRnd_uid264_div_uid46_block_rsrvd_fix_s <= norm_uid261_div_uid46_block_rsrvd_fix_b;
    normFracRnd_uid264_div_uid46_block_rsrvd_fix_combproc: PROCESS (normFracRnd_uid264_div_uid46_block_rsrvd_fix_s, divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_b, divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_b)
    BEGIN
        CASE (normFracRnd_uid264_div_uid46_block_rsrvd_fix_s) IS
            WHEN "0" => normFracRnd_uid264_div_uid46_block_rsrvd_fix_q <= divValPreNormLow_uid263_div_uid46_block_rsrvd_fix_b;
            WHEN "1" => normFracRnd_uid264_div_uid46_block_rsrvd_fix_q <= divValPreNormHigh_uid262_div_uid46_block_rsrvd_fix_b;
            WHEN OTHERS => normFracRnd_uid264_div_uid46_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid265_div_uid46_block_rsrvd_fix(BITJOIN,264)@12
    expFracRnd_uid265_div_uid46_block_rsrvd_fix_q <= expR_uid236_div_uid46_block_rsrvd_fix_q & normFracRnd_uid264_div_uid46_block_rsrvd_fix_q;

    -- expFracPostRnd_uid270_div_uid46_block_rsrvd_fix(ADD,269)@12
    expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((67 downto 66 => expFracRnd_uid265_div_uid46_block_rsrvd_fix_q(65)) & expFracRnd_uid265_div_uid46_block_rsrvd_fix_q));
    expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & rndOp_uid269_div_uid46_block_rsrvd_fix_q));
    expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_a) + SIGNED(expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_b));
    expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_q <= expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_o(66 downto 0);

    -- excRPreExc_uid273_div_uid46_block_rsrvd_fix(BITSELECT,272)@12
    excRPreExc_uid273_div_uid46_block_rsrvd_fix_in <= expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_q(63 downto 0);
    excRPreExc_uid273_div_uid46_block_rsrvd_fix_b <= excRPreExc_uid273_div_uid46_block_rsrvd_fix_in(63 downto 53);

    -- redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1(DELAY,1191)
    redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRPreExc_uid273_div_uid46_block_rsrvd_fix_b, xout => redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid231_div_uid46_block_rsrvd_fix(LOGICAL,230)@12
    invExpXIsMax_uid231_div_uid46_block_rsrvd_fix_q <= not (redist74_expXIsMax_uid13_block_rsrvd_fix_q_2_q);

    -- InvExpXIsZero_uid232_div_uid46_block_rsrvd_fix(LOGICAL,231)@12
    InvExpXIsZero_uid232_div_uid46_block_rsrvd_fix_q <= not (redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q);

    -- excR_y_uid233_div_uid46_block_rsrvd_fix(LOGICAL,232)@12
    excR_y_uid233_div_uid46_block_rsrvd_fix_q <= InvExpXIsZero_uid232_div_uid46_block_rsrvd_fix_q and invExpXIsMax_uid231_div_uid46_block_rsrvd_fix_q;

    -- excXIYR_uid287_div_uid46_block_rsrvd_fix(LOGICAL,286)@12
    excXIYR_uid287_div_uid46_block_rsrvd_fix_q <= excI_yIn_uid30_block_rsrvd_fix_q and excR_y_uid233_div_uid46_block_rsrvd_fix_q;

    -- excXIYZ_uid286_div_uid46_block_rsrvd_fix(LOGICAL,285)@12
    excXIYZ_uid286_div_uid46_block_rsrvd_fix_q <= excI_yIn_uid30_block_rsrvd_fix_q and redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q;

    -- expRExt_uid274_div_uid46_block_rsrvd_fix(BITSELECT,273)@12
    expRExt_uid274_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_q(66 downto 53));

    -- expOvf_uid278_div_uid46_block_rsrvd_fix(COMPARE,277)@12
    expOvf_uid278_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid274_div_uid46_block_rsrvd_fix_b(13)) & expRExt_uid274_div_uid46_block_rsrvd_fix_b));
    expOvf_uid278_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid7_block_rsrvd_fix_q));
    expOvf_uid278_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid278_div_uid46_block_rsrvd_fix_a) - SIGNED(expOvf_uid278_div_uid46_block_rsrvd_fix_b));
    expOvf_uid278_div_uid46_block_rsrvd_fix_n(0) <= not (expOvf_uid278_div_uid46_block_rsrvd_fix_o(15));

    -- invExpXIsMax_uid217_div_uid46_block_rsrvd_fix(LOGICAL,216)@12
    invExpXIsMax_uid217_div_uid46_block_rsrvd_fix_q <= not (redist73_expXIsMax_uid27_block_rsrvd_fix_q_2_q);

    -- InvExpXIsZero_uid218_div_uid46_block_rsrvd_fix(LOGICAL,217)@12
    InvExpXIsZero_uid218_div_uid46_block_rsrvd_fix_q <= not (redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q);

    -- excR_x_uid219_div_uid46_block_rsrvd_fix(LOGICAL,218)@12
    excR_x_uid219_div_uid46_block_rsrvd_fix_q <= InvExpXIsZero_uid218_div_uid46_block_rsrvd_fix_q and invExpXIsMax_uid217_div_uid46_block_rsrvd_fix_q;

    -- excXRYROvf_uid285_div_uid46_block_rsrvd_fix(LOGICAL,284)@12
    excXRYROvf_uid285_div_uid46_block_rsrvd_fix_q <= excR_x_uid219_div_uid46_block_rsrvd_fix_q and excR_y_uid233_div_uid46_block_rsrvd_fix_q and expOvf_uid278_div_uid46_block_rsrvd_fix_n;

    -- excXRYZ_uid284_div_uid46_block_rsrvd_fix(LOGICAL,283)@12
    excXRYZ_uid284_div_uid46_block_rsrvd_fix_q <= excR_x_uid219_div_uid46_block_rsrvd_fix_q and redist45_excZ_y_uid225_div_uid46_block_rsrvd_fix_q_2_q;

    -- excRInf_uid288_div_uid46_block_rsrvd_fix(LOGICAL,287)@12
    excRInf_uid288_div_uid46_block_rsrvd_fix_q <= excXRYZ_uid284_div_uid46_block_rsrvd_fix_q or excXRYROvf_uid285_div_uid46_block_rsrvd_fix_q or excXIYZ_uid286_div_uid46_block_rsrvd_fix_q or excXIYR_uid287_div_uid46_block_rsrvd_fix_q;

    -- xRegOrZero_uid281_div_uid46_block_rsrvd_fix(LOGICAL,280)@12
    xRegOrZero_uid281_div_uid46_block_rsrvd_fix_q <= excR_x_uid219_div_uid46_block_rsrvd_fix_q or redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q;

    -- regOrZeroOverInf_uid282_div_uid46_block_rsrvd_fix(LOGICAL,281)@12
    regOrZeroOverInf_uid282_div_uid46_block_rsrvd_fix_q <= xRegOrZero_uid281_div_uid46_block_rsrvd_fix_q and excI_xIn_uid16_block_rsrvd_fix_q;

    -- expUdf_uid275_div_uid46_block_rsrvd_fix(COMPARE,274)@12
    expUdf_uid275_div_uid46_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & GND_q));
    expUdf_uid275_div_uid46_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid274_div_uid46_block_rsrvd_fix_b(13)) & expRExt_uid274_div_uid46_block_rsrvd_fix_b));
    expUdf_uid275_div_uid46_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid275_div_uid46_block_rsrvd_fix_a) - SIGNED(expUdf_uid275_div_uid46_block_rsrvd_fix_b));
    expUdf_uid275_div_uid46_block_rsrvd_fix_n(0) <= not (expUdf_uid275_div_uid46_block_rsrvd_fix_o(15));

    -- regOverRegWithUf_uid280_div_uid46_block_rsrvd_fix(LOGICAL,279)@12
    regOverRegWithUf_uid280_div_uid46_block_rsrvd_fix_q <= expUdf_uid275_div_uid46_block_rsrvd_fix_n and excR_x_uid219_div_uid46_block_rsrvd_fix_q and excR_y_uid233_div_uid46_block_rsrvd_fix_q;

    -- zeroOverReg_uid279_div_uid46_block_rsrvd_fix(LOGICAL,278)@12
    zeroOverReg_uid279_div_uid46_block_rsrvd_fix_q <= redist46_excZ_x_uid211_div_uid46_block_rsrvd_fix_q_2_q and excR_y_uid233_div_uid46_block_rsrvd_fix_q;

    -- excRZero_uid283_div_uid46_block_rsrvd_fix(LOGICAL,282)@12
    excRZero_uid283_div_uid46_block_rsrvd_fix_q <= zeroOverReg_uid279_div_uid46_block_rsrvd_fix_q or regOverRegWithUf_uid280_div_uid46_block_rsrvd_fix_q or regOrZeroOverInf_uid282_div_uid46_block_rsrvd_fix_q;

    -- concExc_uid292_div_uid46_block_rsrvd_fix(BITJOIN,291)@12
    concExc_uid292_div_uid46_block_rsrvd_fix_q <= excRNaN_uid291_div_uid46_block_rsrvd_fix_q & excRInf_uid288_div_uid46_block_rsrvd_fix_q & excRZero_uid283_div_uid46_block_rsrvd_fix_q;

    -- excREnc_uid293_div_uid46_block_rsrvd_fix(LOOKUP,292)@12 + 1
    excREnc_uid293_div_uid46_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid292_div_uid46_block_rsrvd_fix_q) IS
                WHEN "000" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "01";
                WHEN "001" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "00";
                WHEN "010" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "10";
                WHEN "011" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "00";
                WHEN "100" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "11";
                WHEN "101" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "00";
                WHEN "110" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "00";
                WHEN "111" => excREnc_uid293_div_uid46_block_rsrvd_fix_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid293_div_uid46_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid301_div_uid46_block_rsrvd_fix(MUX,300)@13
    expRPostExc_uid301_div_uid46_block_rsrvd_fix_s <= excREnc_uid293_div_uid46_block_rsrvd_fix_q;
    expRPostExc_uid301_div_uid46_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid301_div_uid46_block_rsrvd_fix_s, cstAllZWE_uid53_block_rsrvd_fix_q, redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1_q, cstAllOWE_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid301_div_uid46_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid301_div_uid46_block_rsrvd_fix_q <= cstAllZWE_uid53_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid301_div_uid46_block_rsrvd_fix_q <= redist33_excRPreExc_uid273_div_uid46_block_rsrvd_fix_b_1_q;
            WHEN "10" => expRPostExc_uid301_div_uid46_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid301_div_uid46_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid301_div_uid46_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstNaNWF_uid52_block_rsrvd_fix(CONSTANT,51)
    cstNaNWF_uid52_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExc_uid272_div_uid46_block_rsrvd_fix(BITSELECT,271)@12
    fracRPreExc_uid272_div_uid46_block_rsrvd_fix_in <= expFracPostRnd_uid270_div_uid46_block_rsrvd_fix_q(52 downto 0);
    fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b <= fracRPreExc_uid272_div_uid46_block_rsrvd_fix_in(52 downto 1);

    -- redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1(DELAY,1192)
    redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b, xout => redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid297_div_uid46_block_rsrvd_fix(MUX,296)@13
    fracRPostExc_uid297_div_uid46_block_rsrvd_fix_s <= excREnc_uid293_div_uid46_block_rsrvd_fix_q;
    fracRPostExc_uid297_div_uid46_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid297_div_uid46_block_rsrvd_fix_s, cstZeroWF_uid8_block_rsrvd_fix_q, redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1_q, cstNaNWF_uid52_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid297_div_uid46_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q <= redist34_fracRPreExc_uid272_div_uid46_block_rsrvd_fix_b_1_q;
            WHEN "10" => fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q <= cstNaNWF_uid52_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid304_div_uid46_block_rsrvd_fix(BITJOIN,303)@13
    divR_uid304_div_uid46_block_rsrvd_fix_q <= sRPostExc_uid303_div_uid46_block_rsrvd_fix_q & expRPostExc_uid301_div_uid46_block_rsrvd_fix_q & fracRPostExc_uid297_div_uid46_block_rsrvd_fix_q;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr(REG,1265)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr_q <= "1011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr_q <= STD_LOGIC_VECTOR(redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem(DUALMEM,1263)
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ia <= STD_LOGIC_VECTOR(divR_uid304_div_uid46_block_rsrvd_fix_q);
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_aa <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_wraddr_q;
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ab <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_rdcnt_q;
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_reset0 <= areset;
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 64,
        widthad_b => 4,
        numwords_b => 12,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_reset0,
        clock1 => clk,
        address_a => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_aa,
        data_a => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_ab,
        q_b => redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_iq
    );
    redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_iq(63 downto 0);

    -- singX_uid49_block_rsrvd_fix(BITSELECT,48)@26
    singX_uid49_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q(63 downto 63));

    -- redist58_singX_uid49_block_rsrvd_fix_b_17(DELAY,1216)
    redist58_singX_uid49_block_rsrvd_fix_b_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => singX_uid49_block_rsrvd_fix_b, xout => redist58_singX_uid49_block_rsrvd_fix_b_17_q, clk => clk, aclr => areset );

    -- piO2_uid80_block_rsrvd_fix(CONSTANT,79)
    piO2_uid80_block_rsrvd_fix_q <= "1100100100001111110110101010001000100001011010001100001";

    -- cstPiO2_uid82_block_rsrvd_fix(BITSELECT,81)@43
    cstPiO2_uid82_block_rsrvd_fix_in <= piO2_uid80_block_rsrvd_fix_q(53 downto 0);
    cstPiO2_uid82_block_rsrvd_fix_b <= cstPiO2_uid82_block_rsrvd_fix_in(53 downto 2);

    -- fpPiO2C_uid83_block_rsrvd_fix(BITJOIN,82)@43
    fpPiO2C_uid83_block_rsrvd_fix_q <= redist58_singX_uid49_block_rsrvd_fix_b_17_q & cstBias_uid54_block_rsrvd_fix_q & cstPiO2_uid82_block_rsrvd_fix_b;

    -- piO4_uid81_block_rsrvd_fix(CONSTANT,80)
    piO4_uid81_block_rsrvd_fix_q <= "11001001000011111101101010100010001000010110100011000";

    -- cstPiO4_uid85_block_rsrvd_fix(BITSELECT,84)@43
    cstPiO4_uid85_block_rsrvd_fix_in <= piO4_uid81_block_rsrvd_fix_q(51 downto 0);
    cstPiO4_uid85_block_rsrvd_fix_b <= cstPiO4_uid85_block_rsrvd_fix_in(51 downto 0);

    -- fpPiO4C_uid86_block_rsrvd_fix(BITJOIN,85)@43
    fpPiO4C_uid86_block_rsrvd_fix_q <= redist58_singX_uid49_block_rsrvd_fix_b_17_q & cstBiasM1_uid55_block_rsrvd_fix_q & cstPiO4_uid85_block_rsrvd_fix_b;

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_notEnable(LOGICAL,1291)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_nor(LOGICAL,1292)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_nor_q <= not (redist59_fracX_uid48_block_rsrvd_fix_b_13_notEnable_q or redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q);

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_last(CONSTANT,1288)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_last_q <= "01010";

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp(LOGICAL,1289)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_q);
    redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_q <= "1" WHEN redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_last_q = redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_b ELSE "0";

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg(REG,1290)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg_q <= STD_LOGIC_VECTOR(redist59_fracX_uid48_block_rsrvd_fix_b_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena(REG,1293)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist59_fracX_uid48_block_rsrvd_fix_b_13_nor_q = "1") THEN
                redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist59_fracX_uid48_block_rsrvd_fix_b_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_enaAnd(LOGICAL,1294)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_enaAnd_q <= redist59_fracX_uid48_block_rsrvd_fix_b_13_sticky_ena_q and VCC_q;

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt(COUNTER,1286)
    -- low=0, high=11, step=1, init=0
    redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq <= '1';
            ELSE
                redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq <= '0';
            END IF;
            IF (redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_eq = '1') THEN
                redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i <= redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i + 5;
            ELSE
                redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i <= redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_i, 4)));

    -- fracX_uid48_block_rsrvd_fix(BITSELECT,47)@13
    fracX_uid48_block_rsrvd_fix_b <= divR_uid304_div_uid46_block_rsrvd_fix_q(51 downto 0);

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr(REG,1287)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr_q <= "1011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr_q <= STD_LOGIC_VECTOR(redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist59_fracX_uid48_block_rsrvd_fix_b_13_mem(DUALMEM,1285)
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ia <= STD_LOGIC_VECTOR(fracX_uid48_block_rsrvd_fix_b);
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_aa <= redist59_fracX_uid48_block_rsrvd_fix_b_13_wraddr_q;
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ab <= redist59_fracX_uid48_block_rsrvd_fix_b_13_rdcnt_q;
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_reset0 <= areset;
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 52,
        widthad_b => 4,
        numwords_b => 12,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist59_fracX_uid48_block_rsrvd_fix_b_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_reset0,
        clock1 => clk,
        address_a => redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_aa,
        data_a => redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_ab,
        q_b => redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_iq
    );
    redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_q <= redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_iq(51 downto 0);

    -- fracXIsZero_uid68_block_rsrvd_fix(LOGICAL,67)@26
    fracXIsZero_uid68_block_rsrvd_fix_q <= "1" WHEN cstZeroWF_uid8_block_rsrvd_fix_q = redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_q ELSE "0";

    -- expX_uid47_block_rsrvd_fix(BITSELECT,46)@26
    expX_uid47_block_rsrvd_fix_b <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q(62 downto 52);

    -- expXIsMax_uid67_block_rsrvd_fix(LOGICAL,66)@26
    expXIsMax_uid67_block_rsrvd_fix_q <= "1" WHEN expX_uid47_block_rsrvd_fix_b = cstAllOWE_uid7_block_rsrvd_fix_q ELSE "0";

    -- excI_div_uid70_block_rsrvd_fix(LOGICAL,69)@26
    excI_div_uid70_block_rsrvd_fix_q <= expXIsMax_uid67_block_rsrvd_fix_q and fracXIsZero_uid68_block_rsrvd_fix_q;

    -- redist56_excI_div_uid70_block_rsrvd_fix_q_16(DELAY,1214)
    redist56_excI_div_uid70_block_rsrvd_fix_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_div_uid70_block_rsrvd_fix_q, xout => redist56_excI_div_uid70_block_rsrvd_fix_q_16_q, clk => clk, aclr => areset );

    -- redist57_excI_div_uid70_block_rsrvd_fix_q_17(DELAY,1215)
    redist57_excI_div_uid70_block_rsrvd_fix_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist56_excI_div_uid70_block_rsrvd_fix_q_16_q, xout => redist57_excI_div_uid70_block_rsrvd_fix_q_17_q, clk => clk, aclr => areset );

    -- constOut_uid88_block_rsrvd_fix(MUX,87)@43
    constOut_uid88_block_rsrvd_fix_s <= redist57_excI_div_uid70_block_rsrvd_fix_q_17_q;
    constOut_uid88_block_rsrvd_fix_combproc: PROCESS (constOut_uid88_block_rsrvd_fix_s, fpPiO4C_uid86_block_rsrvd_fix_q, fpPiO2C_uid83_block_rsrvd_fix_q)
    BEGIN
        CASE (constOut_uid88_block_rsrvd_fix_s) IS
            WHEN "0" => constOut_uid88_block_rsrvd_fix_q <= fpPiO4C_uid86_block_rsrvd_fix_q;
            WHEN "1" => constOut_uid88_block_rsrvd_fix_q <= fpPiO2C_uid83_block_rsrvd_fix_q;
            WHEN OTHERS => constOut_uid88_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracOutCst_uid152_block_rsrvd_fix_merged_bit_select(BITSELECT,1141)@43
    fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_in <= constOut_uid88_block_rsrvd_fix_q(62 downto 0);
    fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_b <= fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_in(51 downto 0);
    fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_c <= fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_in(62 downto 52);

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_notEnable(LOGICAL,1248)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_nor(LOGICAL,1249)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_nor_q <= not (redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q or redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q);

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg(REG,1247)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena(REG,1250)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_nor_q = "1") THEN
                redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_enaAnd(LOGICAL,1251)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q <= redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q and VCC_q;

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt(COUNTER,1245)
    -- low=0, high=1, step=1, init=0
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i <= redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i, 1)));

    -- leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix(BITSELECT,961)@27
    leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_in <= leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q(79 downto 0);
    leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_in(79 downto 0);

    -- leftShiftStage2Idx1_uid963_fxpU_uid108_block_rsrvd_fix(BITJOIN,962)@27
    leftShiftStage2Idx1_uid963_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage2Idx1Rng1_uid962_fxpU_uid108_block_rsrvd_fix_b & GND_q;

    -- leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix(BITSELECT,956)@27
    leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_in <= leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q(74 downto 0);
    leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_in(74 downto 0);

    -- rightBottomX_bottomExtension_uid677_pT5_uid412_invPolyEval(CONSTANT,676)
    rightBottomX_bottomExtension_uid677_pT5_uid412_invPolyEval_q <= "000000";

    -- leftShiftStage1Idx3_uid958_fxpU_uid108_block_rsrvd_fix(BITJOIN,957)@27
    leftShiftStage1Idx3_uid958_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx3Rng6_uid957_fxpU_uid108_block_rsrvd_fix_b & rightBottomX_bottomExtension_uid677_pT5_uid412_invPolyEval_q;

    -- leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix(BITSELECT,953)@27
    leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_in <= leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q(76 downto 0);
    leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_in(76 downto 0);

    -- leftShiftStage1Idx2_uid955_fxpU_uid108_block_rsrvd_fix(BITJOIN,954)@27
    leftShiftStage1Idx2_uid955_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx2Rng4_uid954_fxpU_uid108_block_rsrvd_fix_b & aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q;

    -- leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix(BITSELECT,950)@27
    leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_in <= leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q(78 downto 0);
    leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_in(78 downto 0);

    -- leftShiftStage1Idx1_uid952_fxpU_uid108_block_rsrvd_fix(BITJOIN,951)@27
    leftShiftStage1Idx1_uid952_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx1Rng2_uid951_fxpU_uid108_block_rsrvd_fix_b & padACst_uid168_block_rsrvd_fix_q;

    -- leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix(BITSELECT,945)@27
    leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_in <= oFracUExt_uid106_block_rsrvd_fix_q(56 downto 0);
    leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_in(56 downto 0);

    -- leftShiftStage0Idx3Pad24_uid945_fxpU_uid108_block_rsrvd_fix(CONSTANT,944)
    leftShiftStage0Idx3Pad24_uid945_fxpU_uid108_block_rsrvd_fix_q <= "000000000000000000000000";

    -- leftShiftStage0Idx3_uid947_fxpU_uid108_block_rsrvd_fix(BITJOIN,946)@27
    leftShiftStage0Idx3_uid947_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx3Rng24_uid946_fxpU_uid108_block_rsrvd_fix_b & leftShiftStage0Idx3Pad24_uid945_fxpU_uid108_block_rsrvd_fix_q;

    -- leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix(BITSELECT,942)@27
    leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_in <= oFracUExt_uid106_block_rsrvd_fix_q(64 downto 0);
    leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_in(64 downto 0);

    -- leftShiftStage0Idx2_uid944_fxpU_uid108_block_rsrvd_fix(BITJOIN,943)@27
    leftShiftStage0Idx2_uid944_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx2Rng16_uid943_fxpU_uid108_block_rsrvd_fix_b & leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix_q;

    -- leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix(BITSELECT,939)@27
    leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_in <= oFracUExt_uid106_block_rsrvd_fix_q(72 downto 0);
    leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_b <= leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_in(72 downto 0);

    -- leftShiftStage0Idx1_uid941_fxpU_uid108_block_rsrvd_fix(BITJOIN,940)@27
    leftShiftStage0Idx1_uid941_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx1Rng8_uid940_fxpU_uid108_block_rsrvd_fix_b & leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix_q;

    -- cst01pWShift_uid105_block_rsrvd_fix(CONSTANT,104)
    cst01pWShift_uid105_block_rsrvd_fix_q <= "0000000000000000000000000000";

    -- fracXIsNotZero_uid324_z_uid92_block_rsrvd_fix(LOGICAL,323)@26
    fracXIsNotZero_uid324_z_uid92_block_rsrvd_fix_q <= not (fracXIsZero_uid68_block_rsrvd_fix_q);

    -- excN_x_uid326_z_uid92_block_rsrvd_fix(LOGICAL,325)@26
    excN_x_uid326_z_uid92_block_rsrvd_fix_q <= expXIsMax_uid67_block_rsrvd_fix_q and fracXIsNotZero_uid324_z_uid92_block_rsrvd_fix_q;

    -- invExcRNaN_uid356_z_uid92_block_rsrvd_fix(LOGICAL,355)@26
    invExcRNaN_uid356_z_uid92_block_rsrvd_fix_q <= not (excN_x_uid326_z_uid92_block_rsrvd_fix_q);

    -- signR_uid357_z_uid92_block_rsrvd_fix(LOGICAL,356)@26
    signR_uid357_z_uid92_block_rsrvd_fix_q <= singX_uid49_block_rsrvd_fix_b and invExcRNaN_uid356_z_uid92_block_rsrvd_fix_q;

    -- cst2Bias_uid314_z_uid92_block_rsrvd_fix(CONSTANT,313)
    cst2Bias_uid314_z_uid92_block_rsrvd_fix_q <= "11111111110";

    -- expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix(SUB,341)@26
    expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cst2Bias_uid314_z_uid92_block_rsrvd_fix_q);
    expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & expX_uid47_block_rsrvd_fix_b);
    expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_a) - UNSIGNED(expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_b));
    expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_q <= expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_o(11 downto 0);

    -- expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix(BITSELECT,342)@26
    expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_in <= expRCompYIsOneExt_uid342_z_uid92_block_rsrvd_fix_q(10 downto 0);
    expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_b <= expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_in(10 downto 0);

    -- cst2BiasM1_uid313_z_uid92_block_rsrvd_fix(CONSTANT,312)
    cst2BiasM1_uid313_z_uid92_block_rsrvd_fix_q <= "11111111101";

    -- expRCompExt_uid339_z_uid92_block_rsrvd_fix(SUB,338)@26
    expRCompExt_uid339_z_uid92_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cst2BiasM1_uid313_z_uid92_block_rsrvd_fix_q);
    expRCompExt_uid339_z_uid92_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & expX_uid47_block_rsrvd_fix_b);
    expRCompExt_uid339_z_uid92_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expRCompExt_uid339_z_uid92_block_rsrvd_fix_a) - UNSIGNED(expRCompExt_uid339_z_uid92_block_rsrvd_fix_b));
    expRCompExt_uid339_z_uid92_block_rsrvd_fix_q <= expRCompExt_uid339_z_uid92_block_rsrvd_fix_o(11 downto 0);

    -- expRComp_uid340_z_uid92_block_rsrvd_fix(BITSELECT,339)@26
    expRComp_uid340_z_uid92_block_rsrvd_fix_in <= expRCompExt_uid339_z_uid92_block_rsrvd_fix_q(10 downto 0);
    expRComp_uid340_z_uid92_block_rsrvd_fix_b <= expRComp_uid340_z_uid92_block_rsrvd_fix_in(10 downto 0);

    -- redist47_updatedY_uid204_div_uid46_block_rsrvd_fix_q_1(DELAY,1205)
    redist47_updatedY_uid204_div_uid46_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => updatedY_uid204_div_uid46_block_rsrvd_fix_q, xout => redist47_updatedY_uid204_div_uid46_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid331_z_uid92_block_rsrvd_fix(LOGICAL,332)@13 + 1
    fracXIsZero_uid331_z_uid92_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & fracX_uid48_block_rsrvd_fix_b);
    fracXIsZero_uid331_z_uid92_block_rsrvd_fix_qi <= "1" WHEN fracXIsZero_uid331_z_uid92_block_rsrvd_fix_a = redist47_updatedY_uid204_div_uid46_block_rsrvd_fix_q_1_q ELSE "0";
    fracXIsZero_uid331_z_uid92_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid331_z_uid92_block_rsrvd_fix_qi, xout => fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13(DELAY,1189)
    redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q, xout => redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13_q, clk => clk, aclr => areset );

    -- expRCalc_uid348_z_uid92_block_rsrvd_fix(MUX,347)@26
    expRCalc_uid348_z_uid92_block_rsrvd_fix_s <= redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13_q;
    expRCalc_uid348_z_uid92_block_rsrvd_fix_combproc: PROCESS (expRCalc_uid348_z_uid92_block_rsrvd_fix_s, expRComp_uid340_z_uid92_block_rsrvd_fix_b, expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_b)
    BEGIN
        CASE (expRCalc_uid348_z_uid92_block_rsrvd_fix_s) IS
            WHEN "0" => expRCalc_uid348_z_uid92_block_rsrvd_fix_q <= expRComp_uid340_z_uid92_block_rsrvd_fix_b;
            WHEN "1" => expRCalc_uid348_z_uid92_block_rsrvd_fix_q <= expRCompYIsOne_uid343_z_uid92_block_rsrvd_fix_b;
            WHEN OTHERS => expRCalc_uid348_z_uid92_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- excZ_div_uid460_uid66_block_rsrvd_fix(LOGICAL,65)@26
    excZ_div_uid460_uid66_block_rsrvd_fix_q <= "1" WHEN expX_uid47_block_rsrvd_fix_b = cstAllZWE_uid53_block_rsrvd_fix_q ELSE "0";

    -- udf_uid341_z_uid92_block_rsrvd_fix(BITSELECT,340)@26
    udf_uid341_z_uid92_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => expRCompExt_uid339_z_uid92_block_rsrvd_fix_q(11)) & expRCompExt_uid339_z_uid92_block_rsrvd_fix_q));
    udf_uid341_z_uid92_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(udf_uid341_z_uid92_block_rsrvd_fix_in(12 downto 12));

    -- invExpXIsMax_uid327_z_uid92_block_rsrvd_fix(LOGICAL,326)@26
    invExpXIsMax_uid327_z_uid92_block_rsrvd_fix_q <= not (expXIsMax_uid67_block_rsrvd_fix_q);

    -- InvExpXIsZero_uid328_z_uid92_block_rsrvd_fix(LOGICAL,327)@26
    InvExpXIsZero_uid328_z_uid92_block_rsrvd_fix_q <= not (excZ_div_uid460_uid66_block_rsrvd_fix_q);

    -- excR_x_uid329_z_uid92_block_rsrvd_fix(LOGICAL,328)@26
    excR_x_uid329_z_uid92_block_rsrvd_fix_q <= InvExpXIsZero_uid328_z_uid92_block_rsrvd_fix_q and invExpXIsMax_uid327_z_uid92_block_rsrvd_fix_q;

    -- xRegAndUdf_uid349_z_uid92_block_rsrvd_fix(LOGICAL,348)@26
    xRegAndUdf_uid349_z_uid92_block_rsrvd_fix_q <= excR_x_uid329_z_uid92_block_rsrvd_fix_q and udf_uid341_z_uid92_block_rsrvd_fix_b;

    -- xIOrXRUdf_uid350_z_uid92_block_rsrvd_fix(LOGICAL,349)@26
    xIOrXRUdf_uid350_z_uid92_block_rsrvd_fix_q <= excI_div_uid70_block_rsrvd_fix_q or xRegAndUdf_uid349_z_uid92_block_rsrvd_fix_q;

    -- excSelBits_uid351_z_uid92_block_rsrvd_fix(BITJOIN,350)@26
    excSelBits_uid351_z_uid92_block_rsrvd_fix_q <= excN_x_uid326_z_uid92_block_rsrvd_fix_q & excZ_div_uid460_uid66_block_rsrvd_fix_q & xIOrXRUdf_uid350_z_uid92_block_rsrvd_fix_q;

    -- outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix(LOOKUP,351)@26
    outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_combproc: PROCESS (excSelBits_uid351_z_uid92_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid351_z_uid92_block_rsrvd_fix_q) IS
            WHEN "000" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "01";
            WHEN "001" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "00";
            WHEN "010" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "10";
            WHEN "011" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "01";
            WHEN "100" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "11";
            WHEN "101" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "01";
            WHEN "110" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "01";
            WHEN "111" => outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid355_z_uid92_block_rsrvd_fix(MUX,354)@26
    expRPostExc_uid355_z_uid92_block_rsrvd_fix_s <= outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q;
    expRPostExc_uid355_z_uid92_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid355_z_uid92_block_rsrvd_fix_s, cstAllZWE_uid53_block_rsrvd_fix_q, expRCalc_uid348_z_uid92_block_rsrvd_fix_q, cstAllOWE_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid355_z_uid92_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid355_z_uid92_block_rsrvd_fix_q <= cstAllZWE_uid53_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid355_z_uid92_block_rsrvd_fix_q <= expRCalc_uid348_z_uid92_block_rsrvd_fix_q;
            WHEN "10" => expRPostExc_uid355_z_uid92_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid355_z_uid92_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid355_z_uid92_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_notEnable(LOGICAL,1240)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_nor(LOGICAL,1241)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_nor_q <= not (redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_notEnable_q or redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q);

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg(REG,1239)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena(REG,1242)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_nor_q = "1") THEN
                redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_enaAnd(LOGICAL,1243)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q <= redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_sticky_ena_q and VCC_q;

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt(COUNTER,1237)
    -- low=0, high=1, step=1, init=0
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i <= redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_i, 1)));

    -- oFracX_uid330_z_uid92_block_rsrvd_fix(BITJOIN,329)@13
    oFracX_uid330_z_uid92_block_rsrvd_fix_q <= VCC_q & fracX_uid48_block_rsrvd_fix_b;

    -- y_uid334_z_uid92_block_rsrvd_fix(BITSELECT,333)@13
    y_uid334_z_uid92_block_rsrvd_fix_in <= oFracX_uid330_z_uid92_block_rsrvd_fix_q(51 downto 0);
    y_uid334_z_uid92_block_rsrvd_fix_b <= y_uid334_z_uid92_block_rsrvd_fix_in(51 downto 0);

    -- yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select(BITSELECT,1151)@13
    yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b <= y_uid334_z_uid92_block_rsrvd_fix_b(51 downto 44);
    yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c <= y_uid334_z_uid92_block_rsrvd_fix_b(43 downto 0);

    -- redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2(DELAY,1164)
    redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c, xout => redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4(DELAY,1165)
    redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2_q, xout => redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4_q, clk => clk, aclr => areset );

    -- redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6(DELAY,1166)
    redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4_q, xout => redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6_q, clk => clk, aclr => areset );

    -- redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8(DELAY,1167)
    redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8 : dspba_delay
    GENERIC MAP ( width => 44, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6_q, xout => redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8_q, clk => clk, aclr => areset );

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr(REG,1238)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q <= STD_LOGIC_VECTOR(redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem(DUALMEM,1236)
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ia <= STD_LOGIC_VECTOR(redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8_q);
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_aa <= redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q;
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ab <= redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q;
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0 <= areset;
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 44,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 44,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0,
        clock1 => clk,
        address_a => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_aa,
        data_a => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_ab,
        q_b => redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_iq
    );
    redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_q <= redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_iq(43 downto 0);

    -- nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval(BITJOIN,906)@24
    nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval_q <= GND_q & redist10_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_11_mem_q;

    -- topRangeX_uid909_pT5_uid562_invPolyEval(BITSELECT,908)@24
    topRangeX_uid909_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval_q(44 downto 18));

    -- yT4_uid555_invPolyEval(BITSELECT,554)@21
    yT4_uid555_invPolyEval_b <= redist9_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_8_q(43 downto 3);

    -- nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval(BITJOIN,860)@21
    nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q <= GND_q & yT4_uid555_invPolyEval_b;

    -- rightBottomX_uid875_pT4_uid556_invPolyEval(BITSELECT,874)@21
    rightBottomX_uid875_pT4_uid556_invPolyEval_in <= nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q(23 downto 0);
    rightBottomX_uid875_pT4_uid556_invPolyEval_b <= rightBottomX_uid875_pT4_uid556_invPolyEval_in(23 downto 22);

    -- yT3_uid549_invPolyEval(BITSELECT,548)@19
    yT3_uid549_invPolyEval_b <= redist8_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_6_q(43 downto 10);

    -- nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval(BITJOIN,824)@19
    nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval_q <= GND_q & yT3_uid549_invPolyEval_b;

    -- topRangeX_uid827_pT3_uid550_invPolyEval(BITSELECT,826)@19
    topRangeX_uid827_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval_q(34 downto 17));

    -- memoryC5_uid528_inverseTables_lutmem(DUALMEM,1099)@13 + 2
    -- in j@20000000
    memoryC5_uid528_inverseTables_lutmem_aa <= yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b;
    memoryC5_uid528_inverseTables_lutmem_reset0 <= areset;
    memoryC5_uid528_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA7ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC5_uid528_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC5_uid528_inverseTables_lutmem_aa,
        q_a => memoryC5_uid528_inverseTables_lutmem_ir
    );
    memoryC5_uid528_inverseTables_lutmem_r <= memoryC5_uid528_inverseTables_lutmem_ir(16 downto 0);

    -- yT1_uid537_invPolyEval(BITSELECT,536)@15
    yT1_uid537_invPolyEval_b <= redist6_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_2_q(43 downto 27);

    -- prodXY_uid807_pT1_uid538_invPolyEval_cma(CHAINMULTADD,1120)@15 + 2
    prodXY_uid807_pT1_uid538_invPolyEval_cma_reset <= areset;
    prodXY_uid807_pT1_uid538_invPolyEval_cma_ena0 <= '1';
    prodXY_uid807_pT1_uid538_invPolyEval_cma_ena1 <= prodXY_uid807_pT1_uid538_invPolyEval_cma_ena0;
    prodXY_uid807_pT1_uid538_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid807_pT1_uid538_invPolyEval_cma_a0(0),18));
    prodXY_uid807_pT1_uid538_invPolyEval_cma_p(0) <= prodXY_uid807_pT1_uid538_invPolyEval_cma_l(0) * prodXY_uid807_pT1_uid538_invPolyEval_cma_c0(0);
    prodXY_uid807_pT1_uid538_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid807_pT1_uid538_invPolyEval_cma_p(0),35);
    prodXY_uid807_pT1_uid538_invPolyEval_cma_w(0) <= prodXY_uid807_pT1_uid538_invPolyEval_cma_u(0);
    prodXY_uid807_pT1_uid538_invPolyEval_cma_x(0) <= prodXY_uid807_pT1_uid538_invPolyEval_cma_w(0);
    prodXY_uid807_pT1_uid538_invPolyEval_cma_y(0) <= prodXY_uid807_pT1_uid538_invPolyEval_cma_x(0);
    prodXY_uid807_pT1_uid538_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid807_pT1_uid538_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid807_pT1_uid538_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid807_pT1_uid538_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid807_pT1_uid538_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid537_invPolyEval_b),17);
                prodXY_uid807_pT1_uid538_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC5_uid528_inverseTables_lutmem_r),17);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid807_pT1_uid538_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid807_pT1_uid538_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid807_pT1_uid538_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid807_pT1_uid538_invPolyEval_cma_s(0) <= prodXY_uid807_pT1_uid538_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid807_pT1_uid538_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid807_pT1_uid538_invPolyEval_cma_s(0)(33 downto 0)), xout => prodXY_uid807_pT1_uid538_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid807_pT1_uid538_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid807_pT1_uid538_invPolyEval_cma_qq(33 downto 0));

    -- osig_uid808_pT1_uid538_invPolyEval(BITSELECT,807)@17
    osig_uid808_pT1_uid538_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid807_pT1_uid538_invPolyEval_cma_q(33 downto 16));

    -- highBBits_uid540_invPolyEval(BITSELECT,539)@17
    highBBits_uid540_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid808_pT1_uid538_invPolyEval_b(17 downto 1));

    -- redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2(DELAY,1159)
    redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b, xout => redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC4_uid525_inverseTables_lutmem(DUALMEM,1098)@15 + 2
    -- in j@20000000
    memoryC4_uid525_inverseTables_lutmem_aa <= redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2_q;
    memoryC4_uid525_inverseTables_lutmem_reset0 <= areset;
    memoryC4_uid525_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 25,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA6ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid525_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid525_inverseTables_lutmem_aa,
        q_a => memoryC4_uid525_inverseTables_lutmem_ir
    );
    memoryC4_uid525_inverseTables_lutmem_r <= memoryC4_uid525_inverseTables_lutmem_ir(24 downto 0);

    -- s1sumAHighB_uid541_invPolyEval(ADD,540)@17
    s1sumAHighB_uid541_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => memoryC4_uid525_inverseTables_lutmem_r(24)) & memoryC4_uid525_inverseTables_lutmem_r));
    s1sumAHighB_uid541_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 17 => highBBits_uid540_invPolyEval_b(16)) & highBBits_uid540_invPolyEval_b));
    s1sumAHighB_uid541_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid541_invPolyEval_a) + SIGNED(s1sumAHighB_uid541_invPolyEval_b));
    s1sumAHighB_uid541_invPolyEval_q <= s1sumAHighB_uid541_invPolyEval_o(25 downto 0);

    -- lowRangeB_uid539_invPolyEval(BITSELECT,538)@17
    lowRangeB_uid539_invPolyEval_in <= osig_uid808_pT1_uid538_invPolyEval_b(0 downto 0);
    lowRangeB_uid539_invPolyEval_b <= lowRangeB_uid539_invPolyEval_in(0 downto 0);

    -- s1_uid542_invPolyEval(BITJOIN,541)@17
    s1_uid542_invPolyEval_q <= s1sumAHighB_uid541_invPolyEval_q & lowRangeB_uid539_invPolyEval_b;

    -- yT2_uid543_invPolyEval(BITSELECT,542)@17
    yT2_uid543_invPolyEval_b <= redist7_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_c_4_q(43 downto 19);

    -- prodXY_uid810_pT2_uid544_invPolyEval_cma(CHAINMULTADD,1121)@17 + 2
    prodXY_uid810_pT2_uid544_invPolyEval_cma_reset <= areset;
    prodXY_uid810_pT2_uid544_invPolyEval_cma_ena0 <= '1';
    prodXY_uid810_pT2_uid544_invPolyEval_cma_ena1 <= prodXY_uid810_pT2_uid544_invPolyEval_cma_ena0;
    prodXY_uid810_pT2_uid544_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid810_pT2_uid544_invPolyEval_cma_a0(0),26));
    prodXY_uid810_pT2_uid544_invPolyEval_cma_p(0) <= prodXY_uid810_pT2_uid544_invPolyEval_cma_l(0) * prodXY_uid810_pT2_uid544_invPolyEval_cma_c0(0);
    prodXY_uid810_pT2_uid544_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid810_pT2_uid544_invPolyEval_cma_p(0),53);
    prodXY_uid810_pT2_uid544_invPolyEval_cma_w(0) <= prodXY_uid810_pT2_uid544_invPolyEval_cma_u(0);
    prodXY_uid810_pT2_uid544_invPolyEval_cma_x(0) <= prodXY_uid810_pT2_uid544_invPolyEval_cma_w(0);
    prodXY_uid810_pT2_uid544_invPolyEval_cma_y(0) <= prodXY_uid810_pT2_uid544_invPolyEval_cma_x(0);
    prodXY_uid810_pT2_uid544_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid810_pT2_uid544_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid810_pT2_uid544_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid810_pT2_uid544_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid810_pT2_uid544_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT2_uid543_invPolyEval_b),25);
                prodXY_uid810_pT2_uid544_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid542_invPolyEval_q),27);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid810_pT2_uid544_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid810_pT2_uid544_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid810_pT2_uid544_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid810_pT2_uid544_invPolyEval_cma_s(0) <= prodXY_uid810_pT2_uid544_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid810_pT2_uid544_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid810_pT2_uid544_invPolyEval_cma_s(0)(51 downto 0)), xout => prodXY_uid810_pT2_uid544_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid810_pT2_uid544_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid810_pT2_uid544_invPolyEval_cma_qq(51 downto 0));

    -- osig_uid811_pT2_uid544_invPolyEval(BITSELECT,810)@19
    osig_uid811_pT2_uid544_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid810_pT2_uid544_invPolyEval_cma_q(51 downto 24));

    -- highBBits_uid546_invPolyEval(BITSELECT,545)@19
    highBBits_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid811_pT2_uid544_invPolyEval_b(27 downto 1));

    -- redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4(DELAY,1160)
    redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist1_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_2_q, xout => redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- memoryC3_uid522_inverseTables_lutmem(DUALMEM,1097)@17 + 2
    -- in j@20000000
    memoryC3_uid522_inverseTables_lutmem_aa <= redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4_q;
    memoryC3_uid522_inverseTables_lutmem_reset0 <= areset;
    memoryC3_uid522_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 34,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA5ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid522_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid522_inverseTables_lutmem_aa,
        q_a => memoryC3_uid522_inverseTables_lutmem_ir
    );
    memoryC3_uid522_inverseTables_lutmem_r <= memoryC3_uid522_inverseTables_lutmem_ir(33 downto 0);

    -- s2sumAHighB_uid547_invPolyEval(ADD,546)@19
    s2sumAHighB_uid547_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => memoryC3_uid522_inverseTables_lutmem_r(33)) & memoryC3_uid522_inverseTables_lutmem_r));
    s2sumAHighB_uid547_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => highBBits_uid546_invPolyEval_b(26)) & highBBits_uid546_invPolyEval_b));
    s2sumAHighB_uid547_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid547_invPolyEval_a) + SIGNED(s2sumAHighB_uid547_invPolyEval_b));
    s2sumAHighB_uid547_invPolyEval_q <= s2sumAHighB_uid547_invPolyEval_o(34 downto 0);

    -- lowRangeB_uid545_invPolyEval(BITSELECT,544)@19
    lowRangeB_uid545_invPolyEval_in <= osig_uid811_pT2_uid544_invPolyEval_b(0 downto 0);
    lowRangeB_uid545_invPolyEval_b <= lowRangeB_uid545_invPolyEval_in(0 downto 0);

    -- s2_uid548_invPolyEval(BITJOIN,547)@19
    s2_uid548_invPolyEval_q <= s2sumAHighB_uid547_invPolyEval_q & lowRangeB_uid545_invPolyEval_b;

    -- aboveLeftY_uid830_pT3_uid550_invPolyEval(BITSELECT,829)@19
    aboveLeftY_uid830_pT3_uid550_invPolyEval_in <= s2_uid548_invPolyEval_q(17 downto 0);
    aboveLeftY_uid830_pT3_uid550_invPolyEval_b <= aboveLeftY_uid830_pT3_uid550_invPolyEval_in(17 downto 0);

    -- topRangeY_uid828_pT3_uid550_invPolyEval(BITSELECT,827)@19
    topRangeY_uid828_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid548_invPolyEval_q(35 downto 18));

    -- rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval(BITSELECT,831)@19
    rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval_q(16 downto 0));
    rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_in(16 downto 0));

    -- rightBottomX_mergedSignalTM_uid833_pT3_uid550_invPolyEval(BITJOIN,832)@19
    rightBottomX_mergedSignalTM_uid833_pT3_uid550_invPolyEval_q <= rightBottomX_bottomRange_uid832_pT3_uid550_invPolyEval_b & GND_q;

    -- multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma(CHAINMULTADD,1134)@19 + 2
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_l(0) * multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_l(1) * multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_u(0) + multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid833_pT3_uid550_invPolyEval_q),18);
                multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_uid830_pT3_uid550_invPolyEval_b),18);
                multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid828_pT3_uid550_invPolyEval_b),18);
                multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid827_pT3_uid550_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid844_pT3_uid550_invPolyEval(BITSELECT,843)@21
    highBBits_uid844_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_q(36 downto 14));

    -- sm0_uid838_pT3_uid550_invPolyEval_cma(CHAINMULTADD,1122)@19 + 2
    sm0_uid838_pT3_uid550_invPolyEval_cma_reset <= areset;
    sm0_uid838_pT3_uid550_invPolyEval_cma_ena0 <= '1';
    sm0_uid838_pT3_uid550_invPolyEval_cma_ena1 <= sm0_uid838_pT3_uid550_invPolyEval_cma_ena0;
    sm0_uid838_pT3_uid550_invPolyEval_cma_p(0) <= sm0_uid838_pT3_uid550_invPolyEval_cma_a0(0) * sm0_uid838_pT3_uid550_invPolyEval_cma_c0(0);
    sm0_uid838_pT3_uid550_invPolyEval_cma_u(0) <= RESIZE(sm0_uid838_pT3_uid550_invPolyEval_cma_p(0),36);
    sm0_uid838_pT3_uid550_invPolyEval_cma_w(0) <= sm0_uid838_pT3_uid550_invPolyEval_cma_u(0);
    sm0_uid838_pT3_uid550_invPolyEval_cma_x(0) <= sm0_uid838_pT3_uid550_invPolyEval_cma_w(0);
    sm0_uid838_pT3_uid550_invPolyEval_cma_y(0) <= sm0_uid838_pT3_uid550_invPolyEval_cma_x(0);
    sm0_uid838_pT3_uid550_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid838_pT3_uid550_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid838_pT3_uid550_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid838_pT3_uid550_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid838_pT3_uid550_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid827_pT3_uid550_invPolyEval_b),18);
                sm0_uid838_pT3_uid550_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid828_pT3_uid550_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid838_pT3_uid550_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid838_pT3_uid550_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid838_pT3_uid550_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid838_pT3_uid550_invPolyEval_cma_s(0) <= sm0_uid838_pT3_uid550_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid838_pT3_uid550_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid838_pT3_uid550_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid838_pT3_uid550_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid838_pT3_uid550_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid838_pT3_uid550_invPolyEval_cma_qq(35 downto 0));

    -- aboveLeftY_uid837_pT3_uid550_invPolyEval(BITSELECT,836)@19
    aboveLeftY_uid837_pT3_uid550_invPolyEval_in <= s2_uid548_invPolyEval_q(17 downto 0);
    aboveLeftY_uid837_pT3_uid550_invPolyEval_b <= aboveLeftY_uid837_pT3_uid550_invPolyEval_in(17 downto 16);

    -- aboveLeftX_uid836_pT3_uid550_invPolyEval(BITSELECT,835)@19
    aboveLeftX_uid836_pT3_uid550_invPolyEval_in <= nx_mergedSignalTM_uid825_pT3_uid550_invPolyEval_q(16 downto 0);
    aboveLeftX_uid836_pT3_uid550_invPolyEval_b <= aboveLeftX_uid836_pT3_uid550_invPolyEval_in(16 downto 15);

    -- sm0_uid841_pT3_uid550_invPolyEval(MULT,840)@19 + 2
    sm0_uid841_pT3_uid550_invPolyEval_pr <= UNSIGNED(sm0_uid841_pT3_uid550_invPolyEval_a0) * UNSIGNED(sm0_uid841_pT3_uid550_invPolyEval_b0);
    sm0_uid841_pT3_uid550_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid841_pT3_uid550_invPolyEval_a0 <= (others => '0');
            sm0_uid841_pT3_uid550_invPolyEval_b0 <= (others => '0');
            sm0_uid841_pT3_uid550_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid841_pT3_uid550_invPolyEval_a0 <= aboveLeftX_uid836_pT3_uid550_invPolyEval_b;
            sm0_uid841_pT3_uid550_invPolyEval_b0 <= aboveLeftY_uid837_pT3_uid550_invPolyEval_b;
            sm0_uid841_pT3_uid550_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid841_pT3_uid550_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid841_pT3_uid550_invPolyEval_q <= sm0_uid841_pT3_uid550_invPolyEval_s1;

    -- sumAb_uid842_pT3_uid550_invPolyEval(BITJOIN,841)@21
    sumAb_uid842_pT3_uid550_invPolyEval_q <= sm0_uid838_pT3_uid550_invPolyEval_cma_q & sm0_uid841_pT3_uid550_invPolyEval_q;

    -- lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval(ADD,844)@21
    lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => sumAb_uid842_pT3_uid550_invPolyEval_q(39)) & sumAb_uid842_pT3_uid550_invPolyEval_q));
    lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 23 => highBBits_uid844_pT3_uid550_invPolyEval_b(22)) & highBBits_uid844_pT3_uid550_invPolyEval_b));
    lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_b));
    lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_q <= lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid843_pT3_uid550_invPolyEval(BITSELECT,842)@21
    lowRangeB_uid843_pT3_uid550_invPolyEval_in <= multSumOfTwoTS_uid839_pT3_uid550_invPolyEval_cma_q(13 downto 0);
    lowRangeB_uid843_pT3_uid550_invPolyEval_b <= lowRangeB_uid843_pT3_uid550_invPolyEval_in(13 downto 0);

    -- lev1_a0_uid846_pT3_uid550_invPolyEval(BITJOIN,845)@21
    lev1_a0_uid846_pT3_uid550_invPolyEval_q <= lev1_a0sumAHighB_uid845_pT3_uid550_invPolyEval_q & lowRangeB_uid843_pT3_uid550_invPolyEval_b;

    -- os_uid847_pT3_uid550_invPolyEval(BITSELECT,846)@21
    os_uid847_pT3_uid550_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid846_pT3_uid550_invPolyEval_q(52 downto 0));
    os_uid847_pT3_uid550_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid847_pT3_uid550_invPolyEval_in(52 downto 18));

    -- highBBits_uid552_invPolyEval(BITSELECT,551)@21
    highBBits_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid847_pT3_uid550_invPolyEval_b(34 downto 1));

    -- redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6(DELAY,1161)
    redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist2_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_4_q, xout => redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6_q, clk => clk, aclr => areset );

    -- memoryC2_uid518_inverseTables_lutmem(DUALMEM,1096)@19 + 2
    -- in j@20000000
    memoryC2_uid518_inverseTables_lutmem_aa <= redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6_q;
    memoryC2_uid518_inverseTables_lutmem_reset0 <= areset;
    memoryC2_uid518_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA4ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid518_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid518_inverseTables_lutmem_aa,
        q_a => memoryC2_uid518_inverseTables_lutmem_ir
    );
    memoryC2_uid518_inverseTables_lutmem_r <= memoryC2_uid518_inverseTables_lutmem_ir(39 downto 0);

    -- os_uid520_inverseTables(BITJOIN,519)@21
    os_uid520_inverseTables_q <= GND_q & memoryC2_uid518_inverseTables_lutmem_r;

    -- s3sumAHighB_uid553_invPolyEval(ADD,552)@21
    s3sumAHighB_uid553_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 41 => os_uid520_inverseTables_q(40)) & os_uid520_inverseTables_q));
    s3sumAHighB_uid553_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 34 => highBBits_uid552_invPolyEval_b(33)) & highBBits_uid552_invPolyEval_b));
    s3sumAHighB_uid553_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid553_invPolyEval_a) + SIGNED(s3sumAHighB_uid553_invPolyEval_b));
    s3sumAHighB_uid553_invPolyEval_q <= s3sumAHighB_uid553_invPolyEval_o(41 downto 0);

    -- lowRangeB_uid551_invPolyEval(BITSELECT,550)@21
    lowRangeB_uid551_invPolyEval_in <= os_uid847_pT3_uid550_invPolyEval_b(0 downto 0);
    lowRangeB_uid551_invPolyEval_b <= lowRangeB_uid551_invPolyEval_in(0 downto 0);

    -- s3_uid554_invPolyEval(BITJOIN,553)@21
    s3_uid554_invPolyEval_q <= s3sumAHighB_uid553_invPolyEval_q & lowRangeB_uid551_invPolyEval_b;

    -- rightBottomY_uid876_pT4_uid556_invPolyEval(BITSELECT,875)@21
    rightBottomY_uid876_pT4_uid556_invPolyEval_in <= s3_uid554_invPolyEval_q(15 downto 0);
    rightBottomY_uid876_pT4_uid556_invPolyEval_b <= rightBottomY_uid876_pT4_uid556_invPolyEval_in(15 downto 14);

    -- aboveLeftX_uid877_pT4_uid556_invPolyEval(BITSELECT,876)@21
    aboveLeftX_uid877_pT4_uid556_invPolyEval_in <= nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q(14 downto 0);
    aboveLeftX_uid877_pT4_uid556_invPolyEval_b <= aboveLeftX_uid877_pT4_uid556_invPolyEval_in(14 downto 13);

    -- redist26_aboveLeftX_uid877_pT4_uid556_invPolyEval_b_1(DELAY,1184)
    redist26_aboveLeftX_uid877_pT4_uid556_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftX_uid877_pT4_uid556_invPolyEval_b, xout => redist26_aboveLeftX_uid877_pT4_uid556_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftY_uid878_pT4_uid556_invPolyEval(BITSELECT,877)@21
    aboveLeftY_uid878_pT4_uid556_invPolyEval_in <= s3_uid554_invPolyEval_q(24 downto 0);
    aboveLeftY_uid878_pT4_uid556_invPolyEval_b <= aboveLeftY_uid878_pT4_uid556_invPolyEval_in(24 downto 23);

    -- redist25_aboveLeftY_uid878_pT4_uid556_invPolyEval_b_1(DELAY,1183)
    redist25_aboveLeftY_uid878_pT4_uid556_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftY_uid878_pT4_uid556_invPolyEval_b, xout => redist25_aboveLeftY_uid878_pT4_uid556_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma(CHAINMULTADD,1138)@21 + 2
    -- in e@22
    -- in g@22
    -- out q@24
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_reset <= areset;
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena0 <= '1';
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena1 <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena0;
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_p(0) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0(0) * sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0(0);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_p(1) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0(1) * sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0(1);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_u(0) <= RESIZE(sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_p(0),13);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_u(1) <= RESIZE(sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_p(1),13);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_w(0) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_u(0);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_w(1) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_u(1);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_x(0) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_w(0);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_x(1) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_w(1);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_y(0) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s(1) + sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_x(0);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_y(1) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_x(1);
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0 <= (others => (others => '0'));
            sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena0 = '1') THEN
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0(0) <= RESIZE(UNSIGNED(redist25_aboveLeftY_uid878_pT4_uid556_invPolyEval_b_1_q),2);
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_a0(1) <= RESIZE(UNSIGNED(rightBottomY_uid876_pT4_uid556_invPolyEval_b),2);
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0(0) <= RESIZE(UNSIGNED(redist26_aboveLeftX_uid877_pT4_uid556_invPolyEval_b_1_q),10);
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_c0(1) <= RESIZE(UNSIGNED(rightBottomX_uid875_pT4_uid556_invPolyEval_b),10);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_ena1 = '1') THEN
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s(0) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_y(0);
                sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s(1) <= sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 13, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_s(0)(12 downto 0)), xout => sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_qq, clk => clk, aclr => areset );
    sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_q <= STD_LOGIC_VECTOR(sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_qq(4 downto 0));

    -- aboveLeftX_uid865_pT4_uid556_invPolyEval(BITSELECT,864)@21
    aboveLeftX_uid865_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q(41 downto 24));

    -- aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval(BITSELECT,866)@21
    aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid554_invPolyEval_q(15 downto 0));
    aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_in(15 downto 0));

    -- aboveLeftY_mergedSignalTM_uid868_pT4_uid556_invPolyEval(BITJOIN,867)@21
    aboveLeftY_mergedSignalTM_uid868_pT4_uid556_invPolyEval_q <= aboveLeftY_bottomRange_uid867_pT4_uid556_invPolyEval_b & padACst_uid168_block_rsrvd_fix_q;

    -- rightBottomY_uid874_pT4_uid556_invPolyEval(BITSELECT,873)@21
    rightBottomY_uid874_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid554_invPolyEval_q(42 downto 25));

    -- rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval(BITSELECT,870)@21
    rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q(14 downto 0));
    rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_in(14 downto 0));

    -- rightBottomX_mergedSignalTM_uid872_pT4_uid556_invPolyEval(BITJOIN,871)@21
    rightBottomX_mergedSignalTM_uid872_pT4_uid556_invPolyEval_q <= rightBottomX_bottomRange_uid871_pT4_uid556_invPolyEval_b & aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q;

    -- multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma(CHAINMULTADD,1135)@21 + 2
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_l(0) * multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_l(1) * multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_u(0) + multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid872_pT4_uid556_invPolyEval_q),18);
                multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid868_pT4_uid556_invPolyEval_q),18);
                multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid874_pT4_uid556_invPolyEval_b),18);
                multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid865_pT4_uid556_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid885_pT4_uid556_invPolyEval(BITSELECT,884)@23
    highBBits_uid885_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_q(36 downto 9));

    -- topRangeY_uid864_pT4_uid556_invPolyEval(BITSELECT,863)@21
    topRangeY_uid864_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid554_invPolyEval_q(42 downto 16));

    -- topRangeX_uid863_pT4_uid556_invPolyEval(BITSELECT,862)@21
    topRangeX_uid863_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid861_pT4_uid556_invPolyEval_q(41 downto 15));

    -- sm0_uid879_pT4_uid556_invPolyEval_cma(CHAINMULTADD,1123)@21 + 2
    sm0_uid879_pT4_uid556_invPolyEval_cma_reset <= areset;
    sm0_uid879_pT4_uid556_invPolyEval_cma_ena0 <= '1';
    sm0_uid879_pT4_uid556_invPolyEval_cma_ena1 <= sm0_uid879_pT4_uid556_invPolyEval_cma_ena0;
    sm0_uid879_pT4_uid556_invPolyEval_cma_p(0) <= sm0_uid879_pT4_uid556_invPolyEval_cma_a0(0) * sm0_uid879_pT4_uid556_invPolyEval_cma_c0(0);
    sm0_uid879_pT4_uid556_invPolyEval_cma_u(0) <= RESIZE(sm0_uid879_pT4_uid556_invPolyEval_cma_p(0),54);
    sm0_uid879_pT4_uid556_invPolyEval_cma_w(0) <= sm0_uid879_pT4_uid556_invPolyEval_cma_u(0);
    sm0_uid879_pT4_uid556_invPolyEval_cma_x(0) <= sm0_uid879_pT4_uid556_invPolyEval_cma_w(0);
    sm0_uid879_pT4_uid556_invPolyEval_cma_y(0) <= sm0_uid879_pT4_uid556_invPolyEval_cma_x(0);
    sm0_uid879_pT4_uid556_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid879_pT4_uid556_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid879_pT4_uid556_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid879_pT4_uid556_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid879_pT4_uid556_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid863_pT4_uid556_invPolyEval_b),27);
                sm0_uid879_pT4_uid556_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid864_pT4_uid556_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid879_pT4_uid556_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid879_pT4_uid556_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid879_pT4_uid556_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid879_pT4_uid556_invPolyEval_cma_s(0) <= sm0_uid879_pT4_uid556_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid879_pT4_uid556_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid879_pT4_uid556_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid879_pT4_uid556_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid879_pT4_uid556_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid879_pT4_uid556_invPolyEval_cma_qq(53 downto 0));

    -- lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval(ADD,885)@23 + 1
    lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => sm0_uid879_pT4_uid556_invPolyEval_cma_q(53)) & sm0_uid879_pT4_uid556_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid885_pT4_uid556_invPolyEval_b(27)) & highBBits_uid885_pT4_uid556_invPolyEval_b));
    lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_b));
        END IF;
    END PROCESS;
    lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_q <= lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid884_pT4_uid556_invPolyEval(BITSELECT,883)@23
    lowRangeB_uid884_pT4_uid556_invPolyEval_in <= multSumOfTwoTS_uid880_pT4_uid556_invPolyEval_cma_q(8 downto 0);
    lowRangeB_uid884_pT4_uid556_invPolyEval_b <= lowRangeB_uid884_pT4_uid556_invPolyEval_in(8 downto 0);

    -- redist24_lowRangeB_uid884_pT4_uid556_invPolyEval_b_1(DELAY,1182)
    redist24_lowRangeB_uid884_pT4_uid556_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeB_uid884_pT4_uid556_invPolyEval_b, xout => redist24_lowRangeB_uid884_pT4_uid556_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev1_a0_uid887_pT4_uid556_invPolyEval(BITJOIN,886)@24
    lev1_a0_uid887_pT4_uid556_invPolyEval_q <= lev1_a0sumAHighB_uid886_pT4_uid556_invPolyEval_q & redist24_lowRangeB_uid884_pT4_uid556_invPolyEval_b_1_q;

    -- highABits_uid890_pT4_uid556_invPolyEval(BITSELECT,889)@24
    highABits_uid890_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid887_pT4_uid556_invPolyEval_q(63 downto 14));

    -- lev2_a0high_uid891_pT4_uid556_invPolyEval(ADD,890)@24
    lev2_a0high_uid891_pT4_uid556_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 50 => highABits_uid890_pT4_uid556_invPolyEval_b(49)) & highABits_uid890_pT4_uid556_invPolyEval_b));
    lev2_a0high_uid891_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000" & sm0_uid882_pT4_uid556_invPolyEval_lev1_a1_uid888_pT4_uid556_invPolyEval_sm1_uid883_pT4_uid556_invPolyEval_merged_cma_q));
    lev2_a0high_uid891_pT4_uid556_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid891_pT4_uid556_invPolyEval_a) + SIGNED(lev2_a0high_uid891_pT4_uid556_invPolyEval_b));
    lev2_a0high_uid891_pT4_uid556_invPolyEval_q <= lev2_a0high_uid891_pT4_uid556_invPolyEval_o(50 downto 0);

    -- lowRangeA_uid889_pT4_uid556_invPolyEval(BITSELECT,888)@24
    lowRangeA_uid889_pT4_uid556_invPolyEval_in <= lev1_a0_uid887_pT4_uid556_invPolyEval_q(13 downto 0);
    lowRangeA_uid889_pT4_uid556_invPolyEval_b <= lowRangeA_uid889_pT4_uid556_invPolyEval_in(13 downto 0);

    -- lev2_a0_uid892_pT4_uid556_invPolyEval(BITJOIN,891)@24
    lev2_a0_uid892_pT4_uid556_invPolyEval_q <= lev2_a0high_uid891_pT4_uid556_invPolyEval_q & lowRangeA_uid889_pT4_uid556_invPolyEval_b;

    -- os_uid893_pT4_uid556_invPolyEval(BITSELECT,892)@24
    os_uid893_pT4_uid556_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid892_pT4_uid556_invPolyEval_q(61 downto 0));
    os_uid893_pT4_uid556_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid893_pT4_uid556_invPolyEval_in(61 downto 19));

    -- highBBits_uid558_invPolyEval(BITSELECT,557)@24
    highBBits_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid893_pT4_uid556_invPolyEval_b(42 downto 1));

    -- redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9(DELAY,1162)
    redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist3_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_6_q, xout => redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9_q, clk => clk, aclr => areset );

    -- memoryC1_uid515_inverseTables_lutmem(DUALMEM,1095)@22 + 2
    -- in j@20000000
    memoryC1_uid515_inverseTables_lutmem_aa <= redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9_q;
    memoryC1_uid515_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid515_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA3ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid515_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid515_inverseTables_lutmem_aa,
        q_a => memoryC1_uid515_inverseTables_lutmem_ir
    );
    memoryC1_uid515_inverseTables_lutmem_r <= memoryC1_uid515_inverseTables_lutmem_ir(8 downto 0);

    -- memoryC1_uid514_inverseTables_lutmem(DUALMEM,1094)@22 + 2
    -- in j@20000000
    memoryC1_uid514_inverseTables_lutmem_aa <= redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9_q;
    memoryC1_uid514_inverseTables_lutmem_reset0 <= areset;
    memoryC1_uid514_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA2ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid514_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid514_inverseTables_lutmem_aa,
        q_a => memoryC1_uid514_inverseTables_lutmem_ir
    );
    memoryC1_uid514_inverseTables_lutmem_r <= memoryC1_uid514_inverseTables_lutmem_ir(39 downto 0);

    -- os_uid516_inverseTables(BITJOIN,515)@24
    os_uid516_inverseTables_q <= memoryC1_uid515_inverseTables_lutmem_r & memoryC1_uid514_inverseTables_lutmem_r;

    -- s4sumAHighB_uid559_invPolyEval(ADD,558)@24
    s4sumAHighB_uid559_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid516_inverseTables_q(48)) & os_uid516_inverseTables_q));
    s4sumAHighB_uid559_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 42 => highBBits_uid558_invPolyEval_b(41)) & highBBits_uid558_invPolyEval_b));
    s4sumAHighB_uid559_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid559_invPolyEval_a) + SIGNED(s4sumAHighB_uid559_invPolyEval_b));
    s4sumAHighB_uid559_invPolyEval_q <= s4sumAHighB_uid559_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid557_invPolyEval(BITSELECT,556)@24
    lowRangeB_uid557_invPolyEval_in <= os_uid893_pT4_uid556_invPolyEval_b(0 downto 0);
    lowRangeB_uid557_invPolyEval_b <= lowRangeB_uid557_invPolyEval_in(0 downto 0);

    -- s4_uid560_invPolyEval(BITJOIN,559)@24
    s4_uid560_invPolyEval_q <= s4sumAHighB_uid559_invPolyEval_q & lowRangeB_uid557_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval(BITSELECT,912)@24
    aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_in <= STD_LOGIC_VECTOR(s4_uid560_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_in(23 downto 0));

    -- aboveLeftY_mergedSignalTM_uid914_pT5_uid562_invPolyEval(BITJOIN,913)@24
    aboveLeftY_mergedSignalTM_uid914_pT5_uid562_invPolyEval_q <= aboveLeftY_bottomRange_uid913_pT5_uid562_invPolyEval_b & aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q;

    -- topRangeY_uid910_pT5_uid562_invPolyEval(BITSELECT,909)@24
    topRangeY_uid910_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(s4_uid560_invPolyEval_q(50 downto 24));

    -- rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval(BITSELECT,916)@24
    rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval_q(17 downto 0));
    rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_in(17 downto 0));

    -- rightBottomX_bottomExtension_uid916_pT5_uid562_invPolyEval(CONSTANT,915)
    rightBottomX_bottomExtension_uid916_pT5_uid562_invPolyEval_q <= "000000000";

    -- rightBottomX_mergedSignalTM_uid918_pT5_uid562_invPolyEval(BITJOIN,917)@24
    rightBottomX_mergedSignalTM_uid918_pT5_uid562_invPolyEval_q <= rightBottomX_bottomRange_uid917_pT5_uid562_invPolyEval_b & rightBottomX_bottomExtension_uid916_pT5_uid562_invPolyEval_q;

    -- multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma(CHAINMULTADD,1136)@24 + 2
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_l(0) * multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_l(1) * multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_u(0) + multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid918_pT5_uid562_invPolyEval_q),27);
                multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid914_pT5_uid562_invPolyEval_q),27);
                multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid910_pT5_uid562_invPolyEval_b),27);
                multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid909_pT5_uid562_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_qq(54 downto 0));

    -- highBBits_uid929_pT5_uid562_invPolyEval(BITSELECT,928)@26
    highBBits_uid929_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_q(54 downto 23));

    -- sm0_uid923_pT5_uid562_invPolyEval_cma(CHAINMULTADD,1124)@24 + 2
    sm0_uid923_pT5_uid562_invPolyEval_cma_reset <= areset;
    sm0_uid923_pT5_uid562_invPolyEval_cma_ena0 <= '1';
    sm0_uid923_pT5_uid562_invPolyEval_cma_ena1 <= sm0_uid923_pT5_uid562_invPolyEval_cma_ena0;
    sm0_uid923_pT5_uid562_invPolyEval_cma_p(0) <= sm0_uid923_pT5_uid562_invPolyEval_cma_a0(0) * sm0_uid923_pT5_uid562_invPolyEval_cma_c0(0);
    sm0_uid923_pT5_uid562_invPolyEval_cma_u(0) <= RESIZE(sm0_uid923_pT5_uid562_invPolyEval_cma_p(0),54);
    sm0_uid923_pT5_uid562_invPolyEval_cma_w(0) <= sm0_uid923_pT5_uid562_invPolyEval_cma_u(0);
    sm0_uid923_pT5_uid562_invPolyEval_cma_x(0) <= sm0_uid923_pT5_uid562_invPolyEval_cma_w(0);
    sm0_uid923_pT5_uid562_invPolyEval_cma_y(0) <= sm0_uid923_pT5_uid562_invPolyEval_cma_x(0);
    sm0_uid923_pT5_uid562_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid923_pT5_uid562_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid923_pT5_uid562_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid923_pT5_uid562_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid923_pT5_uid562_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid909_pT5_uid562_invPolyEval_b),27);
                sm0_uid923_pT5_uid562_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid910_pT5_uid562_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid923_pT5_uid562_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid923_pT5_uid562_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid923_pT5_uid562_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid923_pT5_uid562_invPolyEval_cma_s(0) <= sm0_uid923_pT5_uid562_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid923_pT5_uid562_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid923_pT5_uid562_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid923_pT5_uid562_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid923_pT5_uid562_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid923_pT5_uid562_invPolyEval_cma_qq(53 downto 0));

    -- aboveLeftY_uid922_pT5_uid562_invPolyEval(BITSELECT,921)@24
    aboveLeftY_uid922_pT5_uid562_invPolyEval_in <= s4_uid560_invPolyEval_q(23 downto 0);
    aboveLeftY_uid922_pT5_uid562_invPolyEval_b <= aboveLeftY_uid922_pT5_uid562_invPolyEval_in(23 downto 22);

    -- aboveLeftX_uid921_pT5_uid562_invPolyEval(BITSELECT,920)@24
    aboveLeftX_uid921_pT5_uid562_invPolyEval_in <= nx_mergedSignalTM_uid907_pT5_uid562_invPolyEval_q(17 downto 0);
    aboveLeftX_uid921_pT5_uid562_invPolyEval_b <= aboveLeftX_uid921_pT5_uid562_invPolyEval_in(17 downto 16);

    -- sm0_uid926_pT5_uid562_invPolyEval(MULT,925)@24 + 2
    sm0_uid926_pT5_uid562_invPolyEval_pr <= UNSIGNED(sm0_uid926_pT5_uid562_invPolyEval_a0) * UNSIGNED(sm0_uid926_pT5_uid562_invPolyEval_b0);
    sm0_uid926_pT5_uid562_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid926_pT5_uid562_invPolyEval_a0 <= (others => '0');
            sm0_uid926_pT5_uid562_invPolyEval_b0 <= (others => '0');
            sm0_uid926_pT5_uid562_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid926_pT5_uid562_invPolyEval_a0 <= aboveLeftX_uid921_pT5_uid562_invPolyEval_b;
            sm0_uid926_pT5_uid562_invPolyEval_b0 <= aboveLeftY_uid922_pT5_uid562_invPolyEval_b;
            sm0_uid926_pT5_uid562_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid926_pT5_uid562_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid926_pT5_uid562_invPolyEval_q <= sm0_uid926_pT5_uid562_invPolyEval_s1;

    -- sumAb_uid927_pT5_uid562_invPolyEval(BITJOIN,926)@26
    sumAb_uid927_pT5_uid562_invPolyEval_q <= sm0_uid923_pT5_uid562_invPolyEval_cma_q & sm0_uid926_pT5_uid562_invPolyEval_q;

    -- lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval(ADD,929)@26
    lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid927_pT5_uid562_invPolyEval_q(57)) & sumAb_uid927_pT5_uid562_invPolyEval_q));
    lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid929_pT5_uid562_invPolyEval_b(31)) & highBBits_uid929_pT5_uid562_invPolyEval_b));
    lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_b));
    lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_q <= lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid928_pT5_uid562_invPolyEval(BITSELECT,927)@26
    lowRangeB_uid928_pT5_uid562_invPolyEval_in <= multSumOfTwoTS_uid924_pT5_uid562_invPolyEval_cma_q(22 downto 0);
    lowRangeB_uid928_pT5_uid562_invPolyEval_b <= lowRangeB_uid928_pT5_uid562_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid931_pT5_uid562_invPolyEval(BITJOIN,930)@26
    lev1_a0_uid931_pT5_uid562_invPolyEval_q <= lev1_a0sumAHighB_uid930_pT5_uid562_invPolyEval_q & lowRangeB_uid928_pT5_uid562_invPolyEval_b;

    -- os_uid932_pT5_uid562_invPolyEval(BITSELECT,931)@26
    os_uid932_pT5_uid562_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid931_pT5_uid562_invPolyEval_q(79 downto 0));
    os_uid932_pT5_uid562_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid932_pT5_uid562_invPolyEval_in(79 downto 28));

    -- highBBits_uid564_invPolyEval(BITSELECT,563)@26
    highBBits_uid564_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid932_pT5_uid562_invPolyEval_b(51 downto 2));

    -- redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11(DELAY,1163)
    redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_9_q, xout => redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11_q, clk => clk, aclr => areset );

    -- memoryC0_uid511_inverseTables_lutmem(DUALMEM,1093)@24 + 2
    -- in j@20000000
    memoryC0_uid511_inverseTables_lutmem_aa <= redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11_q;
    memoryC0_uid511_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid511_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 18,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA1ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid511_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid511_inverseTables_lutmem_aa,
        q_a => memoryC0_uid511_inverseTables_lutmem_ir
    );
    memoryC0_uid511_inverseTables_lutmem_r <= memoryC0_uid511_inverseTables_lutmem_ir(17 downto 0);

    -- memoryC0_uid510_inverseTables_lutmem(DUALMEM,1092)@24 + 2
    -- in j@20000000
    memoryC0_uid510_inverseTables_lutmem_aa <= redist5_yAddr_uid336_z_uid92_block_rsrvd_fix_merged_bit_select_b_11_q;
    memoryC0_uid510_inverseTables_lutmem_reset0 <= areset;
    memoryC0_uid510_inverseTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0ZrseTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid510_inverseTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid510_inverseTables_lutmem_aa,
        q_a => memoryC0_uid510_inverseTables_lutmem_ir
    );
    memoryC0_uid510_inverseTables_lutmem_r <= memoryC0_uid510_inverseTables_lutmem_ir(39 downto 0);

    -- os_uid512_inverseTables(BITJOIN,511)@26
    os_uid512_inverseTables_q <= memoryC0_uid511_inverseTables_lutmem_r & memoryC0_uid510_inverseTables_lutmem_r;

    -- s5sumAHighB_uid565_invPolyEval(ADD,564)@26
    s5sumAHighB_uid565_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => os_uid512_inverseTables_q(57)) & os_uid512_inverseTables_q));
    s5sumAHighB_uid565_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 50 => highBBits_uid564_invPolyEval_b(49)) & highBBits_uid564_invPolyEval_b));
    s5sumAHighB_uid565_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s5sumAHighB_uid565_invPolyEval_a) + SIGNED(s5sumAHighB_uid565_invPolyEval_b));
    s5sumAHighB_uid565_invPolyEval_q <= s5sumAHighB_uid565_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid563_invPolyEval(BITSELECT,562)@26
    lowRangeB_uid563_invPolyEval_in <= os_uid932_pT5_uid562_invPolyEval_b(1 downto 0);
    lowRangeB_uid563_invPolyEval_b <= lowRangeB_uid563_invPolyEval_in(1 downto 0);

    -- s5_uid566_invPolyEval(BITJOIN,565)@26
    s5_uid566_invPolyEval_q <= s5sumAHighB_uid565_invPolyEval_q & lowRangeB_uid563_invPolyEval_b;

    -- fxpInverseRes_uid344_z_uid92_block_rsrvd_fix(BITSELECT,343)@26
    fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_in <= s5_uid566_invPolyEval_q(57 downto 0);
    fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_b <= fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_in(57 downto 5);

    -- fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix(BITSELECT,345)@26
    fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_in <= fxpInverseRes_uid344_z_uid92_block_rsrvd_fix_b(51 downto 0);
    fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_b <= fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_in(51 downto 0);

    -- fracRCalc_uid347_z_uid92_block_rsrvd_fix(MUX,346)@26
    fracRCalc_uid347_z_uid92_block_rsrvd_fix_s <= redist31_fracXIsZero_uid331_z_uid92_block_rsrvd_fix_q_13_q;
    fracRCalc_uid347_z_uid92_block_rsrvd_fix_combproc: PROCESS (fracRCalc_uid347_z_uid92_block_rsrvd_fix_s, fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_b, cstZeroWF_uid8_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRCalc_uid347_z_uid92_block_rsrvd_fix_s) IS
            WHEN "0" => fracRCalc_uid347_z_uid92_block_rsrvd_fix_q <= fxpInverseResFrac_uid346_z_uid92_block_rsrvd_fix_b;
            WHEN "1" => fracRCalc_uid347_z_uid92_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN OTHERS => fracRCalc_uid347_z_uid92_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid354_z_uid92_block_rsrvd_fix(MUX,353)@26
    fracRPostExc_uid354_z_uid92_block_rsrvd_fix_s <= outMuxSelEnc_uid352_z_uid92_block_rsrvd_fix_q;
    fracRPostExc_uid354_z_uid92_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid354_z_uid92_block_rsrvd_fix_s, cstZeroWF_uid8_block_rsrvd_fix_q, fracRCalc_uid347_z_uid92_block_rsrvd_fix_q, cstNaNWF_uid52_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid354_z_uid92_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q <= fracRCalc_uid347_z_uid92_block_rsrvd_fix_q;
            WHEN "10" => fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q <= cstNaNWF_uid52_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid358_z_uid92_block_rsrvd_fix(BITJOIN,357)@26
    R_uid358_z_uid92_block_rsrvd_fix_q <= signR_uid357_z_uid92_block_rsrvd_fix_q & expRPostExc_uid355_z_uid92_block_rsrvd_fix_q & fracRPostExc_uid354_z_uid92_block_rsrvd_fix_q;

    -- path2_uid91_block_rsrvd_fix(COMPARE,90)@26
    path2_uid91_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expX_uid47_block_rsrvd_fix_b);
    path2_uid91_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBias_uid54_block_rsrvd_fix_q);
    path2_uid91_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(path2_uid91_block_rsrvd_fix_a) - UNSIGNED(path2_uid91_block_rsrvd_fix_b));
    path2_uid91_block_rsrvd_fix_n(0) <= not (path2_uid91_block_rsrvd_fix_o(12));

    -- u_uid93_block_rsrvd_fix(MUX,92)@26
    u_uid93_block_rsrvd_fix_s <= path2_uid91_block_rsrvd_fix_n;
    u_uid93_block_rsrvd_fix_combproc: PROCESS (u_uid93_block_rsrvd_fix_s, redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q, R_uid358_z_uid92_block_rsrvd_fix_q)
    BEGIN
        CASE (u_uid93_block_rsrvd_fix_s) IS
            WHEN "0" => u_uid93_block_rsrvd_fix_q <= redist32_divR_uid304_div_uid46_block_rsrvd_fix_q_13_mem_q;
            WHEN "1" => u_uid93_block_rsrvd_fix_q <= R_uid358_z_uid92_block_rsrvd_fix_q;
            WHEN OTHERS => u_uid93_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expU_uid94_block_rsrvd_fix_merged_bit_select(BITSELECT,1142)@26
    expU_uid94_block_rsrvd_fix_merged_bit_select_in <= u_uid93_block_rsrvd_fix_q(62 downto 0);
    expU_uid94_block_rsrvd_fix_merged_bit_select_b <= expU_uid94_block_rsrvd_fix_merged_bit_select_in(62 downto 52);
    expU_uid94_block_rsrvd_fix_merged_bit_select_c <= expU_uid94_block_rsrvd_fix_merged_bit_select_in(51 downto 0);

    -- redist23_expU_uid94_block_rsrvd_fix_merged_bit_select_c_1(DELAY,1181)
    redist23_expU_uid94_block_rsrvd_fix_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid94_block_rsrvd_fix_merged_bit_select_c, xout => redist23_expU_uid94_block_rsrvd_fix_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- oFracU_uid96_block_rsrvd_fix(BITJOIN,95)@27
    oFracU_uid96_block_rsrvd_fix_q <= VCC_q & redist23_expU_uid94_block_rsrvd_fix_merged_bit_select_c_1_q;

    -- oFracUExt_uid106_block_rsrvd_fix(BITJOIN,105)@27
    oFracUExt_uid106_block_rsrvd_fix_q <= cst01pWShift_uid105_block_rsrvd_fix_q & oFracU_uid96_block_rsrvd_fix_q;

    -- leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix(MUX,948)@27
    leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_s <= leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_b;
    leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_combproc: PROCESS (leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_s, oFracUExt_uid106_block_rsrvd_fix_q, leftShiftStage0Idx1_uid941_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage0Idx2_uid944_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage0Idx3_uid947_fxpU_uid108_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q <= oFracUExt_uid106_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx1_uid941_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx2_uid944_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0Idx3_uid947_fxpU_uid108_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix(MUX,959)@27
    leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_s <= leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_c;
    leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_combproc: PROCESS (leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_s, leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage1Idx1_uid952_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage1Idx2_uid955_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage1Idx3_uid958_fxpU_uid108_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage0_uid949_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx1_uid952_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx2_uid955_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1Idx3_uid958_fxpU_uid108_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- shiftBias_uid99_block_rsrvd_fix(CONSTANT,98)
    shiftBias_uid99_block_rsrvd_fix_q <= "01111100011";

    -- redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1(DELAY,1179)
    redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expU_uid94_block_rsrvd_fix_merged_bit_select_b, xout => redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- shiftValue_uid100_block_rsrvd_fix(SUB,99)@27
    shiftValue_uid100_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1_q);
    shiftValue_uid100_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & shiftBias_uid99_block_rsrvd_fix_q);
    shiftValue_uid100_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValue_uid100_block_rsrvd_fix_a) - UNSIGNED(shiftValue_uid100_block_rsrvd_fix_b));
    shiftValue_uid100_block_rsrvd_fix_q <= shiftValue_uid100_block_rsrvd_fix_o(11 downto 0);

    -- xMSB_uid101_block_rsrvd_fix(BITSELECT,100)@27
    xMSB_uid101_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(shiftValue_uid100_block_rsrvd_fix_q(11 downto 11));

    -- shiftValuePostNeg_uid104_block_rsrvd_fix(MUX,103)@27
    shiftValuePostNeg_uid104_block_rsrvd_fix_s <= xMSB_uid101_block_rsrvd_fix_b;
    shiftValuePostNeg_uid104_block_rsrvd_fix_combproc: PROCESS (shiftValuePostNeg_uid104_block_rsrvd_fix_s, shiftValue_uid100_block_rsrvd_fix_q, zS_uid103_block_rsrvd_fix_q)
    BEGIN
        CASE (shiftValuePostNeg_uid104_block_rsrvd_fix_s) IS
            WHEN "0" => shiftValuePostNeg_uid104_block_rsrvd_fix_q <= shiftValue_uid100_block_rsrvd_fix_q;
            WHEN "1" => shiftValuePostNeg_uid104_block_rsrvd_fix_q <= zS_uid103_block_rsrvd_fix_q;
            WHEN OTHERS => shiftValuePostNeg_uid104_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fxpShifterBits_uid107_block_rsrvd_fix(BITSELECT,106)@27
    fxpShifterBits_uid107_block_rsrvd_fix_in <= shiftValuePostNeg_uid104_block_rsrvd_fix_q(4 downto 0);
    fxpShifterBits_uid107_block_rsrvd_fix_b <= fxpShifterBits_uid107_block_rsrvd_fix_in(4 downto 0);

    -- leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select(BITSELECT,1144)@27
    leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_b <= fxpShifterBits_uid107_block_rsrvd_fix_b(4 downto 3);
    leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_c <= fxpShifterBits_uid107_block_rsrvd_fix_b(2 downto 1);
    leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_d <= fxpShifterBits_uid107_block_rsrvd_fix_b(0 downto 0);

    -- leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix(MUX,964)@27
    leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_s <= leftShiftStageSel4Dto3_uid948_fxpU_uid108_block_rsrvd_fix_merged_bit_select_d;
    leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_combproc: PROCESS (leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_s, leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q, leftShiftStage2Idx1_uid963_fxpU_uid108_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_s) IS
            WHEN "0" => leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage1_uid960_fxpU_uid108_block_rsrvd_fix_q;
            WHEN "1" => leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_q <= leftShiftStage2Idx1_uid963_fxpU_uid108_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- y_uid109_block_rsrvd_fix(BITSELECT,108)@27
    y_uid109_block_rsrvd_fix_in <= leftShiftStage2_uid965_fxpU_uid108_block_rsrvd_fix_q(79 downto 0);
    y_uid109_block_rsrvd_fix_b <= y_uid109_block_rsrvd_fix_in(79 downto 1);

    -- yAddr_uid111_block_rsrvd_fix_merged_bit_select(BITSELECT,1145)@27
    yAddr_uid111_block_rsrvd_fix_merged_bit_select_b <= y_uid109_block_rsrvd_fix_b(78 downto 71);
    yAddr_uid111_block_rsrvd_fix_merged_bit_select_c <= y_uid109_block_rsrvd_fix_b(70 downto 24);

    -- redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2(DELAY,1174)
    redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 47, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid111_block_rsrvd_fix_merged_bit_select_c, xout => redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2_q, clk => clk, aclr => areset );

    -- redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4(DELAY,1175)
    redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4 : dspba_delay
    GENERIC MAP ( width => 47, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2_q, xout => redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4_q, clk => clk, aclr => areset );

    -- redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6(DELAY,1176)
    redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6 : dspba_delay
    GENERIC MAP ( width => 47, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4_q, xout => redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6_q, clk => clk, aclr => areset );

    -- redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8(DELAY,1177)
    redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8 : dspba_delay
    GENERIC MAP ( width => 47, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6_q, xout => redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8_q, clk => clk, aclr => areset );

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr(REG,1246)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q <= STD_LOGIC_VECTOR(redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem(DUALMEM,1244)
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ia <= STD_LOGIC_VECTOR(redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8_q);
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_aa <= redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_wraddr_q;
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ab <= redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_rdcnt_q;
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0 <= areset;
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 47,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 47,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_reset0,
        clock1 => clk,
        address_a => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_aa,
        data_a => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_ab,
        q_b => redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_iq
    );
    redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_q <= redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_iq(46 downto 0);

    -- nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval(BITJOIN,667)@38
    nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval_q <= GND_q & redist20_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_11_mem_q;

    -- topRangeX_uid670_pT5_uid412_invPolyEval(BITSELECT,669)@38
    topRangeX_uid670_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval_q(47 downto 21));

    -- yT4_uid405_invPolyEval(BITSELECT,404)@35
    yT4_uid405_invPolyEval_b <= redist19_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_8_q(46 downto 5);

    -- nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval(BITJOIN,621)@35
    nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q <= GND_q & yT4_uid405_invPolyEval_b;

    -- rightBottomX_uid636_pT4_uid406_invPolyEval(BITSELECT,635)@35
    rightBottomX_uid636_pT4_uid406_invPolyEval_in <= nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q(24 downto 0);
    rightBottomX_uid636_pT4_uid406_invPolyEval_b <= rightBottomX_uid636_pT4_uid406_invPolyEval_in(24 downto 22);

    -- yT3_uid399_invPolyEval(BITSELECT,398)@33
    yT3_uid399_invPolyEval_b <= redist18_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_6_q(46 downto 13);

    -- nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval(BITJOIN,585)@33
    nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval_q <= GND_q & yT3_uid399_invPolyEval_b;

    -- topRangeX_uid588_pT3_uid400_invPolyEval(BITSELECT,587)@33
    topRangeX_uid588_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval_q(34 downto 17));

    -- memoryC5_uid378_atan2Tables_lutmem(DUALMEM,1071)@27 + 2
    -- in j@20000000
    memoryC5_uid378_atan2Tables_lutmem_aa <= yAddr_uid111_block_rsrvd_fix_merged_bit_select_b;
    memoryC5_uid378_atan2Tables_lutmem_reset0 <= areset;
    memoryC5_uid378_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 17,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA8Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC5_uid378_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC5_uid378_atan2Tables_lutmem_aa,
        q_a => memoryC5_uid378_atan2Tables_lutmem_ir
    );
    memoryC5_uid378_atan2Tables_lutmem_r <= memoryC5_uid378_atan2Tables_lutmem_ir(16 downto 0);

    -- yT1_uid387_invPolyEval(BITSELECT,386)@29
    yT1_uid387_invPolyEval_b <= redist16_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_2_q(46 downto 30);

    -- prodXY_uid568_pT1_uid388_invPolyEval_cma(CHAINMULTADD,1111)@29 + 2
    prodXY_uid568_pT1_uid388_invPolyEval_cma_reset <= areset;
    prodXY_uid568_pT1_uid388_invPolyEval_cma_ena0 <= '1';
    prodXY_uid568_pT1_uid388_invPolyEval_cma_ena1 <= prodXY_uid568_pT1_uid388_invPolyEval_cma_ena0;
    prodXY_uid568_pT1_uid388_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid568_pT1_uid388_invPolyEval_cma_a0(0),18));
    prodXY_uid568_pT1_uid388_invPolyEval_cma_p(0) <= prodXY_uid568_pT1_uid388_invPolyEval_cma_l(0) * prodXY_uid568_pT1_uid388_invPolyEval_cma_c0(0);
    prodXY_uid568_pT1_uid388_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid568_pT1_uid388_invPolyEval_cma_p(0),35);
    prodXY_uid568_pT1_uid388_invPolyEval_cma_w(0) <= prodXY_uid568_pT1_uid388_invPolyEval_cma_u(0);
    prodXY_uid568_pT1_uid388_invPolyEval_cma_x(0) <= prodXY_uid568_pT1_uid388_invPolyEval_cma_w(0);
    prodXY_uid568_pT1_uid388_invPolyEval_cma_y(0) <= prodXY_uid568_pT1_uid388_invPolyEval_cma_x(0);
    prodXY_uid568_pT1_uid388_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid568_pT1_uid388_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid568_pT1_uid388_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid568_pT1_uid388_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid568_pT1_uid388_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid387_invPolyEval_b),17);
                prodXY_uid568_pT1_uid388_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC5_uid378_atan2Tables_lutmem_r),17);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid568_pT1_uid388_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid568_pT1_uid388_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid568_pT1_uid388_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid568_pT1_uid388_invPolyEval_cma_s(0) <= prodXY_uid568_pT1_uid388_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid568_pT1_uid388_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid568_pT1_uid388_invPolyEval_cma_s(0)(33 downto 0)), xout => prodXY_uid568_pT1_uid388_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid568_pT1_uid388_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid568_pT1_uid388_invPolyEval_cma_qq(33 downto 0));

    -- osig_uid569_pT1_uid388_invPolyEval(BITSELECT,568)@31
    osig_uid569_pT1_uid388_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid568_pT1_uid388_invPolyEval_cma_q(33 downto 16));

    -- highBBits_uid390_invPolyEval(BITSELECT,389)@31
    highBBits_uid390_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid569_pT1_uid388_invPolyEval_b(17 downto 1));

    -- redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2(DELAY,1169)
    redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid111_block_rsrvd_fix_merged_bit_select_b, xout => redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2_q, clk => clk, aclr => areset );

    -- memoryC4_uid375_atan2Tables_lutmem(DUALMEM,1070)@29 + 2
    -- in j@20000000
    memoryC4_uid375_atan2Tables_lutmem_aa <= redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2_q;
    memoryC4_uid375_atan2Tables_lutmem_reset0 <= areset;
    memoryC4_uid375_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 25,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA7Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid375_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid375_atan2Tables_lutmem_aa,
        q_a => memoryC4_uid375_atan2Tables_lutmem_ir
    );
    memoryC4_uid375_atan2Tables_lutmem_r <= memoryC4_uid375_atan2Tables_lutmem_ir(24 downto 0);

    -- s1sumAHighB_uid391_invPolyEval(ADD,390)@31
    s1sumAHighB_uid391_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => memoryC4_uid375_atan2Tables_lutmem_r(24)) & memoryC4_uid375_atan2Tables_lutmem_r));
    s1sumAHighB_uid391_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 17 => highBBits_uid390_invPolyEval_b(16)) & highBBits_uid390_invPolyEval_b));
    s1sumAHighB_uid391_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid391_invPolyEval_a) + SIGNED(s1sumAHighB_uid391_invPolyEval_b));
    s1sumAHighB_uid391_invPolyEval_q <= s1sumAHighB_uid391_invPolyEval_o(25 downto 0);

    -- lowRangeB_uid389_invPolyEval(BITSELECT,388)@31
    lowRangeB_uid389_invPolyEval_in <= osig_uid569_pT1_uid388_invPolyEval_b(0 downto 0);
    lowRangeB_uid389_invPolyEval_b <= lowRangeB_uid389_invPolyEval_in(0 downto 0);

    -- s1_uid392_invPolyEval(BITJOIN,391)@31
    s1_uid392_invPolyEval_q <= s1sumAHighB_uid391_invPolyEval_q & lowRangeB_uid389_invPolyEval_b;

    -- yT2_uid393_invPolyEval(BITSELECT,392)@31
    yT2_uid393_invPolyEval_b <= redist17_yAddr_uid111_block_rsrvd_fix_merged_bit_select_c_4_q(46 downto 22);

    -- prodXY_uid571_pT2_uid394_invPolyEval_cma(CHAINMULTADD,1112)@31 + 2
    prodXY_uid571_pT2_uid394_invPolyEval_cma_reset <= areset;
    prodXY_uid571_pT2_uid394_invPolyEval_cma_ena0 <= '1';
    prodXY_uid571_pT2_uid394_invPolyEval_cma_ena1 <= prodXY_uid571_pT2_uid394_invPolyEval_cma_ena0;
    prodXY_uid571_pT2_uid394_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid571_pT2_uid394_invPolyEval_cma_a0(0),26));
    prodXY_uid571_pT2_uid394_invPolyEval_cma_p(0) <= prodXY_uid571_pT2_uid394_invPolyEval_cma_l(0) * prodXY_uid571_pT2_uid394_invPolyEval_cma_c0(0);
    prodXY_uid571_pT2_uid394_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid571_pT2_uid394_invPolyEval_cma_p(0),53);
    prodXY_uid571_pT2_uid394_invPolyEval_cma_w(0) <= prodXY_uid571_pT2_uid394_invPolyEval_cma_u(0);
    prodXY_uid571_pT2_uid394_invPolyEval_cma_x(0) <= prodXY_uid571_pT2_uid394_invPolyEval_cma_w(0);
    prodXY_uid571_pT2_uid394_invPolyEval_cma_y(0) <= prodXY_uid571_pT2_uid394_invPolyEval_cma_x(0);
    prodXY_uid571_pT2_uid394_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid571_pT2_uid394_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid571_pT2_uid394_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid571_pT2_uid394_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid571_pT2_uid394_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT2_uid393_invPolyEval_b),25);
                prodXY_uid571_pT2_uid394_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid392_invPolyEval_q),27);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid571_pT2_uid394_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid571_pT2_uid394_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid571_pT2_uid394_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid571_pT2_uid394_invPolyEval_cma_s(0) <= prodXY_uid571_pT2_uid394_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid571_pT2_uid394_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 52, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid571_pT2_uid394_invPolyEval_cma_s(0)(51 downto 0)), xout => prodXY_uid571_pT2_uid394_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid571_pT2_uid394_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid571_pT2_uid394_invPolyEval_cma_qq(51 downto 0));

    -- osig_uid572_pT2_uid394_invPolyEval(BITSELECT,571)@33
    osig_uid572_pT2_uid394_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid571_pT2_uid394_invPolyEval_cma_q(51 downto 24));

    -- highBBits_uid396_invPolyEval(BITSELECT,395)@33
    highBBits_uid396_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid572_pT2_uid394_invPolyEval_b(27 downto 1));

    -- redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4(DELAY,1170)
    redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist11_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_2_q, xout => redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4_q, clk => clk, aclr => areset );

    -- memoryC3_uid372_atan2Tables_lutmem(DUALMEM,1069)@31 + 2
    -- in j@20000000
    memoryC3_uid372_atan2Tables_lutmem_aa <= redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4_q;
    memoryC3_uid372_atan2Tables_lutmem_reset0 <= areset;
    memoryC3_uid372_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 34,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA6Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid372_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid372_atan2Tables_lutmem_aa,
        q_a => memoryC3_uid372_atan2Tables_lutmem_ir
    );
    memoryC3_uid372_atan2Tables_lutmem_r <= memoryC3_uid372_atan2Tables_lutmem_ir(33 downto 0);

    -- s2sumAHighB_uid397_invPolyEval(ADD,396)@33
    s2sumAHighB_uid397_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 34 => memoryC3_uid372_atan2Tables_lutmem_r(33)) & memoryC3_uid372_atan2Tables_lutmem_r));
    s2sumAHighB_uid397_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => highBBits_uid396_invPolyEval_b(26)) & highBBits_uid396_invPolyEval_b));
    s2sumAHighB_uid397_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid397_invPolyEval_a) + SIGNED(s2sumAHighB_uid397_invPolyEval_b));
    s2sumAHighB_uid397_invPolyEval_q <= s2sumAHighB_uid397_invPolyEval_o(34 downto 0);

    -- lowRangeB_uid395_invPolyEval(BITSELECT,394)@33
    lowRangeB_uid395_invPolyEval_in <= osig_uid572_pT2_uid394_invPolyEval_b(0 downto 0);
    lowRangeB_uid395_invPolyEval_b <= lowRangeB_uid395_invPolyEval_in(0 downto 0);

    -- s2_uid398_invPolyEval(BITJOIN,397)@33
    s2_uid398_invPolyEval_q <= s2sumAHighB_uid397_invPolyEval_q & lowRangeB_uid395_invPolyEval_b;

    -- aboveLeftY_uid591_pT3_uid400_invPolyEval(BITSELECT,590)@33
    aboveLeftY_uid591_pT3_uid400_invPolyEval_in <= s2_uid398_invPolyEval_q(17 downto 0);
    aboveLeftY_uid591_pT3_uid400_invPolyEval_b <= aboveLeftY_uid591_pT3_uid400_invPolyEval_in(17 downto 0);

    -- topRangeY_uid589_pT3_uid400_invPolyEval(BITSELECT,588)@33
    topRangeY_uid589_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid398_invPolyEval_q(35 downto 18));

    -- rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval(BITSELECT,592)@33
    rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval_q(16 downto 0));
    rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_in(16 downto 0));

    -- rightBottomX_mergedSignalTM_uid594_pT3_uid400_invPolyEval(BITJOIN,593)@33
    rightBottomX_mergedSignalTM_uid594_pT3_uid400_invPolyEval_q <= rightBottomX_bottomRange_uid593_pT3_uid400_invPolyEval_b & GND_q;

    -- multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma(CHAINMULTADD,1128)@33 + 2
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_l(0) * multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_l(1) * multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_u(0) + multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid594_pT3_uid400_invPolyEval_q),18);
                multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_uid591_pT3_uid400_invPolyEval_b),18);
                multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid589_pT3_uid400_invPolyEval_b),18);
                multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid588_pT3_uid400_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid605_pT3_uid400_invPolyEval(BITSELECT,604)@35
    highBBits_uid605_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_q(36 downto 14));

    -- sm0_uid599_pT3_uid400_invPolyEval_cma(CHAINMULTADD,1113)@33 + 2
    sm0_uid599_pT3_uid400_invPolyEval_cma_reset <= areset;
    sm0_uid599_pT3_uid400_invPolyEval_cma_ena0 <= '1';
    sm0_uid599_pT3_uid400_invPolyEval_cma_ena1 <= sm0_uid599_pT3_uid400_invPolyEval_cma_ena0;
    sm0_uid599_pT3_uid400_invPolyEval_cma_p(0) <= sm0_uid599_pT3_uid400_invPolyEval_cma_a0(0) * sm0_uid599_pT3_uid400_invPolyEval_cma_c0(0);
    sm0_uid599_pT3_uid400_invPolyEval_cma_u(0) <= RESIZE(sm0_uid599_pT3_uid400_invPolyEval_cma_p(0),36);
    sm0_uid599_pT3_uid400_invPolyEval_cma_w(0) <= sm0_uid599_pT3_uid400_invPolyEval_cma_u(0);
    sm0_uid599_pT3_uid400_invPolyEval_cma_x(0) <= sm0_uid599_pT3_uid400_invPolyEval_cma_w(0);
    sm0_uid599_pT3_uid400_invPolyEval_cma_y(0) <= sm0_uid599_pT3_uid400_invPolyEval_cma_x(0);
    sm0_uid599_pT3_uid400_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid599_pT3_uid400_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid599_pT3_uid400_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid599_pT3_uid400_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid599_pT3_uid400_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid588_pT3_uid400_invPolyEval_b),18);
                sm0_uid599_pT3_uid400_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid589_pT3_uid400_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid599_pT3_uid400_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid599_pT3_uid400_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid599_pT3_uid400_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid599_pT3_uid400_invPolyEval_cma_s(0) <= sm0_uid599_pT3_uid400_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid599_pT3_uid400_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid599_pT3_uid400_invPolyEval_cma_s(0)(35 downto 0)), xout => sm0_uid599_pT3_uid400_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid599_pT3_uid400_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid599_pT3_uid400_invPolyEval_cma_qq(35 downto 0));

    -- aboveLeftY_uid598_pT3_uid400_invPolyEval(BITSELECT,597)@33
    aboveLeftY_uid598_pT3_uid400_invPolyEval_in <= s2_uid398_invPolyEval_q(17 downto 0);
    aboveLeftY_uid598_pT3_uid400_invPolyEval_b <= aboveLeftY_uid598_pT3_uid400_invPolyEval_in(17 downto 16);

    -- aboveLeftX_uid597_pT3_uid400_invPolyEval(BITSELECT,596)@33
    aboveLeftX_uid597_pT3_uid400_invPolyEval_in <= nx_mergedSignalTM_uid586_pT3_uid400_invPolyEval_q(16 downto 0);
    aboveLeftX_uid597_pT3_uid400_invPolyEval_b <= aboveLeftX_uid597_pT3_uid400_invPolyEval_in(16 downto 15);

    -- sm0_uid602_pT3_uid400_invPolyEval(MULT,601)@33 + 2
    sm0_uid602_pT3_uid400_invPolyEval_pr <= UNSIGNED(sm0_uid602_pT3_uid400_invPolyEval_a0) * UNSIGNED(sm0_uid602_pT3_uid400_invPolyEval_b0);
    sm0_uid602_pT3_uid400_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid602_pT3_uid400_invPolyEval_a0 <= (others => '0');
            sm0_uid602_pT3_uid400_invPolyEval_b0 <= (others => '0');
            sm0_uid602_pT3_uid400_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid602_pT3_uid400_invPolyEval_a0 <= aboveLeftX_uid597_pT3_uid400_invPolyEval_b;
            sm0_uid602_pT3_uid400_invPolyEval_b0 <= aboveLeftY_uid598_pT3_uid400_invPolyEval_b;
            sm0_uid602_pT3_uid400_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid602_pT3_uid400_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid602_pT3_uid400_invPolyEval_q <= sm0_uid602_pT3_uid400_invPolyEval_s1;

    -- sumAb_uid603_pT3_uid400_invPolyEval(BITJOIN,602)@35
    sumAb_uid603_pT3_uid400_invPolyEval_q <= sm0_uid599_pT3_uid400_invPolyEval_cma_q & sm0_uid602_pT3_uid400_invPolyEval_q;

    -- lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval(ADD,605)@35
    lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 40 => sumAb_uid603_pT3_uid400_invPolyEval_q(39)) & sumAb_uid603_pT3_uid400_invPolyEval_q));
    lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 23 => highBBits_uid605_pT3_uid400_invPolyEval_b(22)) & highBBits_uid605_pT3_uid400_invPolyEval_b));
    lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_b));
    lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_q <= lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_o(40 downto 0);

    -- lowRangeB_uid604_pT3_uid400_invPolyEval(BITSELECT,603)@35
    lowRangeB_uid604_pT3_uid400_invPolyEval_in <= multSumOfTwoTS_uid600_pT3_uid400_invPolyEval_cma_q(13 downto 0);
    lowRangeB_uid604_pT3_uid400_invPolyEval_b <= lowRangeB_uid604_pT3_uid400_invPolyEval_in(13 downto 0);

    -- lev1_a0_uid607_pT3_uid400_invPolyEval(BITJOIN,606)@35
    lev1_a0_uid607_pT3_uid400_invPolyEval_q <= lev1_a0sumAHighB_uid606_pT3_uid400_invPolyEval_q & lowRangeB_uid604_pT3_uid400_invPolyEval_b;

    -- os_uid608_pT3_uid400_invPolyEval(BITSELECT,607)@35
    os_uid608_pT3_uid400_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid607_pT3_uid400_invPolyEval_q(52 downto 0));
    os_uid608_pT3_uid400_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid608_pT3_uid400_invPolyEval_in(52 downto 18));

    -- highBBits_uid402_invPolyEval(BITSELECT,401)@35
    highBBits_uid402_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid608_pT3_uid400_invPolyEval_b(34 downto 1));

    -- redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6(DELAY,1171)
    redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist12_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_4_q, xout => redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6_q, clk => clk, aclr => areset );

    -- memoryC2_uid369_atan2Tables_lutmem(DUALMEM,1068)@33 + 2
    -- in j@20000000
    memoryC2_uid369_atan2Tables_lutmem_aa <= redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6_q;
    memoryC2_uid369_atan2Tables_lutmem_reset0 <= areset;
    memoryC2_uid369_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 2,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA5Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid369_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid369_atan2Tables_lutmem_aa,
        q_a => memoryC2_uid369_atan2Tables_lutmem_ir
    );
    memoryC2_uid369_atan2Tables_lutmem_r <= memoryC2_uid369_atan2Tables_lutmem_ir(1 downto 0);

    -- memoryC2_uid368_atan2Tables_lutmem(DUALMEM,1067)@33 + 2
    -- in j@20000000
    memoryC2_uid368_atan2Tables_lutmem_aa <= redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6_q;
    memoryC2_uid368_atan2Tables_lutmem_reset0 <= areset;
    memoryC2_uid368_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA4Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid368_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid368_atan2Tables_lutmem_aa,
        q_a => memoryC2_uid368_atan2Tables_lutmem_ir
    );
    memoryC2_uid368_atan2Tables_lutmem_r <= memoryC2_uid368_atan2Tables_lutmem_ir(39 downto 0);

    -- os_uid370_atan2Tables(BITJOIN,369)@35
    os_uid370_atan2Tables_q <= memoryC2_uid369_atan2Tables_lutmem_r & memoryC2_uid368_atan2Tables_lutmem_r;

    -- s3sumAHighB_uid403_invPolyEval(ADD,402)@35
    s3sumAHighB_uid403_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 42 => os_uid370_atan2Tables_q(41)) & os_uid370_atan2Tables_q));
    s3sumAHighB_uid403_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 34 => highBBits_uid402_invPolyEval_b(33)) & highBBits_uid402_invPolyEval_b));
    s3sumAHighB_uid403_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid403_invPolyEval_a) + SIGNED(s3sumAHighB_uid403_invPolyEval_b));
    s3sumAHighB_uid403_invPolyEval_q <= s3sumAHighB_uid403_invPolyEval_o(42 downto 0);

    -- lowRangeB_uid401_invPolyEval(BITSELECT,400)@35
    lowRangeB_uid401_invPolyEval_in <= os_uid608_pT3_uid400_invPolyEval_b(0 downto 0);
    lowRangeB_uid401_invPolyEval_b <= lowRangeB_uid401_invPolyEval_in(0 downto 0);

    -- s3_uid404_invPolyEval(BITJOIN,403)@35
    s3_uid404_invPolyEval_q <= s3sumAHighB_uid403_invPolyEval_q & lowRangeB_uid401_invPolyEval_b;

    -- rightBottomY_uid637_pT4_uid406_invPolyEval(BITSELECT,636)@35
    rightBottomY_uid637_pT4_uid406_invPolyEval_in <= s3_uid404_invPolyEval_q(16 downto 0);
    rightBottomY_uid637_pT4_uid406_invPolyEval_b <= rightBottomY_uid637_pT4_uid406_invPolyEval_in(16 downto 14);

    -- aboveLeftX_uid638_pT4_uid406_invPolyEval(BITSELECT,637)@35
    aboveLeftX_uid638_pT4_uid406_invPolyEval_in <= nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q(15 downto 0);
    aboveLeftX_uid638_pT4_uid406_invPolyEval_b <= aboveLeftX_uid638_pT4_uid406_invPolyEval_in(15 downto 13);

    -- redist30_aboveLeftX_uid638_pT4_uid406_invPolyEval_b_1(DELAY,1188)
    redist30_aboveLeftX_uid638_pT4_uid406_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftX_uid638_pT4_uid406_invPolyEval_b, xout => redist30_aboveLeftX_uid638_pT4_uid406_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- aboveLeftY_uid639_pT4_uid406_invPolyEval(BITSELECT,638)@35
    aboveLeftY_uid639_pT4_uid406_invPolyEval_in <= s3_uid404_invPolyEval_q(25 downto 0);
    aboveLeftY_uid639_pT4_uid406_invPolyEval_b <= aboveLeftY_uid639_pT4_uid406_invPolyEval_in(25 downto 23);

    -- redist29_aboveLeftY_uid639_pT4_uid406_invPolyEval_b_1(DELAY,1187)
    redist29_aboveLeftY_uid639_pT4_uid406_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aboveLeftY_uid639_pT4_uid406_invPolyEval_b, xout => redist29_aboveLeftY_uid639_pT4_uid406_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma(CHAINMULTADD,1137)@35 + 2
    -- in e@36
    -- in g@36
    -- out q@38
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_reset <= areset;
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena0 <= '1';
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena1 <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena0;
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_p(0) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0(0) * sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0(0);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_p(1) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0(1) * sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0(1);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_u(0) <= RESIZE(sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_p(0),14);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_u(1) <= RESIZE(sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_p(1),14);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_w(0) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_u(0);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_w(1) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_u(1);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_x(0) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_w(0);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_x(1) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_w(1);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_y(0) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s(1) + sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_x(0);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_y(1) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_x(1);
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0 <= (others => (others => '0'));
            sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena0 = '1') THEN
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0(0) <= RESIZE(UNSIGNED(redist29_aboveLeftY_uid639_pT4_uid406_invPolyEval_b_1_q),3);
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_a0(1) <= RESIZE(UNSIGNED(rightBottomY_uid637_pT4_uid406_invPolyEval_b),3);
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0(0) <= RESIZE(UNSIGNED(redist30_aboveLeftX_uid638_pT4_uid406_invPolyEval_b_1_q),10);
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_c0(1) <= RESIZE(UNSIGNED(rightBottomX_uid636_pT4_uid406_invPolyEval_b),10);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_ena1 = '1') THEN
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s(0) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_y(0);
                sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s(1) <= sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_y(1);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 14, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_s(0)(13 downto 0)), xout => sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_qq, clk => clk, aclr => areset );
    sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_q <= STD_LOGIC_VECTOR(sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_qq(6 downto 0));

    -- aboveLeftX_uid626_pT4_uid406_invPolyEval(BITSELECT,625)@35
    aboveLeftX_uid626_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q(42 downto 25));

    -- aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval(BITSELECT,627)@35
    aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid404_invPolyEval_q(16 downto 0));
    aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_in(16 downto 0));

    -- aboveLeftY_mergedSignalTM_uid629_pT4_uid406_invPolyEval(BITJOIN,628)@35
    aboveLeftY_mergedSignalTM_uid629_pT4_uid406_invPolyEval_q <= aboveLeftY_bottomRange_uid628_pT4_uid406_invPolyEval_b & GND_q;

    -- rightBottomY_uid635_pT4_uid406_invPolyEval(BITSELECT,634)@35
    rightBottomY_uid635_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid404_invPolyEval_q(43 downto 26));

    -- rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval(BITSELECT,631)@35
    rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q(15 downto 0));
    rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_in(15 downto 0));

    -- rightBottomX_mergedSignalTM_uid633_pT4_uid406_invPolyEval(BITJOIN,632)@35
    rightBottomX_mergedSignalTM_uid633_pT4_uid406_invPolyEval_q <= rightBottomX_bottomRange_uid632_pT4_uid406_invPolyEval_b & padACst_uid168_block_rsrvd_fix_q;

    -- multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma(CHAINMULTADD,1129)@35 + 2
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_l(0) * multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_l(1) * multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_u(0) + multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid633_pT4_uid406_invPolyEval_q),18);
                multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid629_pT4_uid406_invPolyEval_q),18);
                multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid635_pT4_uid406_invPolyEval_b),18);
                multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid626_pT4_uid406_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid646_pT4_uid406_invPolyEval(BITSELECT,645)@37
    highBBits_uid646_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_q(36 downto 9));

    -- topRangeY_uid625_pT4_uid406_invPolyEval(BITSELECT,624)@35
    topRangeY_uid625_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid404_invPolyEval_q(43 downto 17));

    -- topRangeX_uid624_pT4_uid406_invPolyEval(BITSELECT,623)@35
    topRangeX_uid624_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid622_pT4_uid406_invPolyEval_q(42 downto 16));

    -- sm0_uid640_pT4_uid406_invPolyEval_cma(CHAINMULTADD,1114)@35 + 2
    sm0_uid640_pT4_uid406_invPolyEval_cma_reset <= areset;
    sm0_uid640_pT4_uid406_invPolyEval_cma_ena0 <= '1';
    sm0_uid640_pT4_uid406_invPolyEval_cma_ena1 <= sm0_uid640_pT4_uid406_invPolyEval_cma_ena0;
    sm0_uid640_pT4_uid406_invPolyEval_cma_p(0) <= sm0_uid640_pT4_uid406_invPolyEval_cma_a0(0) * sm0_uid640_pT4_uid406_invPolyEval_cma_c0(0);
    sm0_uid640_pT4_uid406_invPolyEval_cma_u(0) <= RESIZE(sm0_uid640_pT4_uid406_invPolyEval_cma_p(0),54);
    sm0_uid640_pT4_uid406_invPolyEval_cma_w(0) <= sm0_uid640_pT4_uid406_invPolyEval_cma_u(0);
    sm0_uid640_pT4_uid406_invPolyEval_cma_x(0) <= sm0_uid640_pT4_uid406_invPolyEval_cma_w(0);
    sm0_uid640_pT4_uid406_invPolyEval_cma_y(0) <= sm0_uid640_pT4_uid406_invPolyEval_cma_x(0);
    sm0_uid640_pT4_uid406_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid640_pT4_uid406_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid640_pT4_uid406_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid640_pT4_uid406_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid640_pT4_uid406_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid624_pT4_uid406_invPolyEval_b),27);
                sm0_uid640_pT4_uid406_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid625_pT4_uid406_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid640_pT4_uid406_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid640_pT4_uid406_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid640_pT4_uid406_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid640_pT4_uid406_invPolyEval_cma_s(0) <= sm0_uid640_pT4_uid406_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid640_pT4_uid406_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid640_pT4_uid406_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid640_pT4_uid406_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid640_pT4_uid406_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid640_pT4_uid406_invPolyEval_cma_qq(53 downto 0));

    -- lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval(ADD,646)@37
    lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => sm0_uid640_pT4_uid406_invPolyEval_cma_q(53)) & sm0_uid640_pT4_uid406_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid646_pT4_uid406_invPolyEval_b(27)) & highBBits_uid646_pT4_uid406_invPolyEval_b));
    lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_b));
    lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_q <= lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid645_pT4_uid406_invPolyEval(BITSELECT,644)@37
    lowRangeB_uid645_pT4_uid406_invPolyEval_in <= multSumOfTwoTS_uid641_pT4_uid406_invPolyEval_cma_q(8 downto 0);
    lowRangeB_uid645_pT4_uid406_invPolyEval_b <= lowRangeB_uid645_pT4_uid406_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid648_pT4_uid406_invPolyEval(BITJOIN,647)@37
    lev1_a0_uid648_pT4_uid406_invPolyEval_q <= lev1_a0sumAHighB_uid647_pT4_uid406_invPolyEval_q & lowRangeB_uid645_pT4_uid406_invPolyEval_b;

    -- highABits_uid651_pT4_uid406_invPolyEval(BITSELECT,650)@37
    highABits_uid651_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid648_pT4_uid406_invPolyEval_q(63 downto 12));

    -- redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1(DELAY,1185)
    redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => highABits_uid651_pT4_uid406_invPolyEval_b, xout => redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0high_uid652_pT4_uid406_invPolyEval(ADD,651)@38
    lev2_a0high_uid652_pT4_uid406_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((53 downto 52 => redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1_q(51)) & redist27_highABits_uid651_pT4_uid406_invPolyEval_b_1_q));
    lev2_a0high_uid652_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000" & sm0_uid643_pT4_uid406_invPolyEval_lev1_a1_uid649_pT4_uid406_invPolyEval_sm1_uid644_pT4_uid406_invPolyEval_merged_cma_q));
    lev2_a0high_uid652_pT4_uid406_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid652_pT4_uid406_invPolyEval_a) + SIGNED(lev2_a0high_uid652_pT4_uid406_invPolyEval_b));
    lev2_a0high_uid652_pT4_uid406_invPolyEval_q <= lev2_a0high_uid652_pT4_uid406_invPolyEval_o(52 downto 0);

    -- lowRangeA_uid650_pT4_uid406_invPolyEval(BITSELECT,649)@37
    lowRangeA_uid650_pT4_uid406_invPolyEval_in <= lev1_a0_uid648_pT4_uid406_invPolyEval_q(11 downto 0);
    lowRangeA_uid650_pT4_uid406_invPolyEval_b <= lowRangeA_uid650_pT4_uid406_invPolyEval_in(11 downto 0);

    -- redist28_lowRangeA_uid650_pT4_uid406_invPolyEval_b_1(DELAY,1186)
    redist28_lowRangeA_uid650_pT4_uid406_invPolyEval_b_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => lowRangeA_uid650_pT4_uid406_invPolyEval_b, xout => redist28_lowRangeA_uid650_pT4_uid406_invPolyEval_b_1_q, clk => clk, aclr => areset );

    -- lev2_a0_uid653_pT4_uid406_invPolyEval(BITJOIN,652)@38
    lev2_a0_uid653_pT4_uid406_invPolyEval_q <= lev2_a0high_uid652_pT4_uid406_invPolyEval_q & redist28_lowRangeA_uid650_pT4_uid406_invPolyEval_b_1_q;

    -- os_uid654_pT4_uid406_invPolyEval(BITSELECT,653)@38
    os_uid654_pT4_uid406_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid653_pT4_uid406_invPolyEval_q(61 downto 0));
    os_uid654_pT4_uid406_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid654_pT4_uid406_invPolyEval_in(61 downto 18));

    -- highBBits_uid408_invPolyEval(BITSELECT,407)@38
    highBBits_uid408_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid654_pT4_uid406_invPolyEval_b(43 downto 1));

    -- redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9(DELAY,1172)
    redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist13_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_6_q, xout => redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9_q, clk => clk, aclr => areset );

    -- memoryC1_uid365_atan2Tables_lutmem(DUALMEM,1066)@36 + 2
    -- in j@20000000
    memoryC1_uid365_atan2Tables_lutmem_aa <= redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9_q;
    memoryC1_uid365_atan2Tables_lutmem_reset0 <= areset;
    memoryC1_uid365_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA3Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid365_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid365_atan2Tables_lutmem_aa,
        q_a => memoryC1_uid365_atan2Tables_lutmem_ir
    );
    memoryC1_uid365_atan2Tables_lutmem_r <= memoryC1_uid365_atan2Tables_lutmem_ir(9 downto 0);

    -- memoryC1_uid364_atan2Tables_lutmem(DUALMEM,1065)@36 + 2
    -- in j@20000000
    memoryC1_uid364_atan2Tables_lutmem_aa <= redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9_q;
    memoryC1_uid364_atan2Tables_lutmem_reset0 <= areset;
    memoryC1_uid364_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA2Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid364_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid364_atan2Tables_lutmem_aa,
        q_a => memoryC1_uid364_atan2Tables_lutmem_ir
    );
    memoryC1_uid364_atan2Tables_lutmem_r <= memoryC1_uid364_atan2Tables_lutmem_ir(39 downto 0);

    -- os_uid366_atan2Tables(BITJOIN,365)@38
    os_uid366_atan2Tables_q <= memoryC1_uid365_atan2Tables_lutmem_r & memoryC1_uid364_atan2Tables_lutmem_r;

    -- s4sumAHighB_uid409_invPolyEval(ADD,408)@38
    s4sumAHighB_uid409_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 50 => os_uid366_atan2Tables_q(49)) & os_uid366_atan2Tables_q));
    s4sumAHighB_uid409_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((50 downto 43 => highBBits_uid408_invPolyEval_b(42)) & highBBits_uid408_invPolyEval_b));
    s4sumAHighB_uid409_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid409_invPolyEval_a) + SIGNED(s4sumAHighB_uid409_invPolyEval_b));
    s4sumAHighB_uid409_invPolyEval_q <= s4sumAHighB_uid409_invPolyEval_o(50 downto 0);

    -- lowRangeB_uid407_invPolyEval(BITSELECT,406)@38
    lowRangeB_uid407_invPolyEval_in <= os_uid654_pT4_uid406_invPolyEval_b(0 downto 0);
    lowRangeB_uid407_invPolyEval_b <= lowRangeB_uid407_invPolyEval_in(0 downto 0);

    -- s4_uid410_invPolyEval(BITJOIN,409)@38
    s4_uid410_invPolyEval_q <= s4sumAHighB_uid409_invPolyEval_q & lowRangeB_uid407_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval(BITSELECT,673)@38
    aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_in <= STD_LOGIC_VECTOR(s4_uid410_invPolyEval_q(24 downto 0));
    aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_in(24 downto 0));

    -- aboveLeftY_mergedSignalTM_uid675_pT5_uid412_invPolyEval(BITJOIN,674)@38
    aboveLeftY_mergedSignalTM_uid675_pT5_uid412_invPolyEval_q <= aboveLeftY_bottomRange_uid674_pT5_uid412_invPolyEval_b & padACst_uid168_block_rsrvd_fix_q;

    -- topRangeY_uid671_pT5_uid412_invPolyEval(BITSELECT,670)@38
    topRangeY_uid671_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(s4_uid410_invPolyEval_q(51 downto 25));

    -- rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval(BITSELECT,677)@38
    rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval_q(20 downto 0));
    rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_in(20 downto 0));

    -- rightBottomX_mergedSignalTM_uid679_pT5_uid412_invPolyEval(BITJOIN,678)@38
    rightBottomX_mergedSignalTM_uid679_pT5_uid412_invPolyEval_q <= rightBottomX_bottomRange_uid678_pT5_uid412_invPolyEval_b & rightBottomX_bottomExtension_uid677_pT5_uid412_invPolyEval_q;

    -- multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma(CHAINMULTADD,1130)@38 + 2
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_l(0) * multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_l(1) * multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_u(0) + multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid679_pT5_uid412_invPolyEval_q),27);
                multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid675_pT5_uid412_invPolyEval_q),27);
                multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid671_pT5_uid412_invPolyEval_b),27);
                multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid670_pT5_uid412_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_qq(54 downto 0));

    -- highBBits_uid690_pT5_uid412_invPolyEval(BITSELECT,689)@40
    highBBits_uid690_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_q(54 downto 21));

    -- sm0_uid684_pT5_uid412_invPolyEval_cma(CHAINMULTADD,1115)@38 + 2
    sm0_uid684_pT5_uid412_invPolyEval_cma_reset <= areset;
    sm0_uid684_pT5_uid412_invPolyEval_cma_ena0 <= '1';
    sm0_uid684_pT5_uid412_invPolyEval_cma_ena1 <= sm0_uid684_pT5_uid412_invPolyEval_cma_ena0;
    sm0_uid684_pT5_uid412_invPolyEval_cma_p(0) <= sm0_uid684_pT5_uid412_invPolyEval_cma_a0(0) * sm0_uid684_pT5_uid412_invPolyEval_cma_c0(0);
    sm0_uid684_pT5_uid412_invPolyEval_cma_u(0) <= RESIZE(sm0_uid684_pT5_uid412_invPolyEval_cma_p(0),54);
    sm0_uid684_pT5_uid412_invPolyEval_cma_w(0) <= sm0_uid684_pT5_uid412_invPolyEval_cma_u(0);
    sm0_uid684_pT5_uid412_invPolyEval_cma_x(0) <= sm0_uid684_pT5_uid412_invPolyEval_cma_w(0);
    sm0_uid684_pT5_uid412_invPolyEval_cma_y(0) <= sm0_uid684_pT5_uid412_invPolyEval_cma_x(0);
    sm0_uid684_pT5_uid412_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid684_pT5_uid412_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid684_pT5_uid412_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid684_pT5_uid412_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid684_pT5_uid412_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid670_pT5_uid412_invPolyEval_b),27);
                sm0_uid684_pT5_uid412_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid671_pT5_uid412_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid684_pT5_uid412_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid684_pT5_uid412_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid684_pT5_uid412_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid684_pT5_uid412_invPolyEval_cma_s(0) <= sm0_uid684_pT5_uid412_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid684_pT5_uid412_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid684_pT5_uid412_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid684_pT5_uid412_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid684_pT5_uid412_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid684_pT5_uid412_invPolyEval_cma_qq(53 downto 0));

    -- aboveLeftY_uid683_pT5_uid412_invPolyEval(BITSELECT,682)@38
    aboveLeftY_uid683_pT5_uid412_invPolyEval_in <= s4_uid410_invPolyEval_q(24 downto 0);
    aboveLeftY_uid683_pT5_uid412_invPolyEval_b <= aboveLeftY_uid683_pT5_uid412_invPolyEval_in(24 downto 22);

    -- aboveLeftX_uid682_pT5_uid412_invPolyEval(BITSELECT,681)@38
    aboveLeftX_uid682_pT5_uid412_invPolyEval_in <= nx_mergedSignalTM_uid668_pT5_uid412_invPolyEval_q(20 downto 0);
    aboveLeftX_uid682_pT5_uid412_invPolyEval_b <= aboveLeftX_uid682_pT5_uid412_invPolyEval_in(20 downto 18);

    -- sm0_uid687_pT5_uid412_invPolyEval(MULT,686)@38 + 2
    sm0_uid687_pT5_uid412_invPolyEval_pr <= UNSIGNED(sm0_uid687_pT5_uid412_invPolyEval_a0) * UNSIGNED(sm0_uid687_pT5_uid412_invPolyEval_b0);
    sm0_uid687_pT5_uid412_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid687_pT5_uid412_invPolyEval_a0 <= (others => '0');
            sm0_uid687_pT5_uid412_invPolyEval_b0 <= (others => '0');
            sm0_uid687_pT5_uid412_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid687_pT5_uid412_invPolyEval_a0 <= aboveLeftX_uid682_pT5_uid412_invPolyEval_b;
            sm0_uid687_pT5_uid412_invPolyEval_b0 <= aboveLeftY_uid683_pT5_uid412_invPolyEval_b;
            sm0_uid687_pT5_uid412_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid687_pT5_uid412_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid687_pT5_uid412_invPolyEval_q <= sm0_uid687_pT5_uid412_invPolyEval_s1;

    -- sumAb_uid688_pT5_uid412_invPolyEval(BITJOIN,687)@40
    sumAb_uid688_pT5_uid412_invPolyEval_q <= sm0_uid684_pT5_uid412_invPolyEval_cma_q & sm0_uid687_pT5_uid412_invPolyEval_q;

    -- lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval(ADD,690)@40
    lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 60 => sumAb_uid688_pT5_uid412_invPolyEval_q(59)) & sumAb_uid688_pT5_uid412_invPolyEval_q));
    lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 34 => highBBits_uid690_pT5_uid412_invPolyEval_b(33)) & highBBits_uid690_pT5_uid412_invPolyEval_b));
    lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_b));
    lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_q <= lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_o(60 downto 0);

    -- lowRangeB_uid689_pT5_uid412_invPolyEval(BITSELECT,688)@40
    lowRangeB_uid689_pT5_uid412_invPolyEval_in <= multSumOfTwoTS_uid685_pT5_uid412_invPolyEval_cma_q(20 downto 0);
    lowRangeB_uid689_pT5_uid412_invPolyEval_b <= lowRangeB_uid689_pT5_uid412_invPolyEval_in(20 downto 0);

    -- lev1_a0_uid692_pT5_uid412_invPolyEval(BITJOIN,691)@40
    lev1_a0_uid692_pT5_uid412_invPolyEval_q <= lev1_a0sumAHighB_uid691_pT5_uid412_invPolyEval_q & lowRangeB_uid689_pT5_uid412_invPolyEval_b;

    -- os_uid693_pT5_uid412_invPolyEval(BITSELECT,692)@40
    os_uid693_pT5_uid412_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid692_pT5_uid412_invPolyEval_q(79 downto 0));
    os_uid693_pT5_uid412_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid693_pT5_uid412_invPolyEval_in(79 downto 27));

    -- highBBits_uid414_invPolyEval(BITSELECT,413)@40
    highBBits_uid414_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid693_pT5_uid412_invPolyEval_b(52 downto 2));

    -- redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11(DELAY,1173)
    redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist14_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_9_q, xout => redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11_q, clk => clk, aclr => areset );

    -- memoryC0_uid361_atan2Tables_lutmem(DUALMEM,1064)@38 + 2
    -- in j@20000000
    memoryC0_uid361_atan2Tables_lutmem_aa <= redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11_q;
    memoryC0_uid361_atan2Tables_lutmem_reset0 <= areset;
    memoryC0_uid361_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 20,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA1Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid361_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid361_atan2Tables_lutmem_aa,
        q_a => memoryC0_uid361_atan2Tables_lutmem_ir
    );
    memoryC0_uid361_atan2Tables_lutmem_r <= memoryC0_uid361_atan2Tables_lutmem_ir(19 downto 0);

    -- memoryC0_uid360_atan2Tables_lutmem(DUALMEM,1063)@38 + 2
    -- in j@20000000
    memoryC0_uid360_atan2Tables_lutmem_aa <= redist15_yAddr_uid111_block_rsrvd_fix_merged_bit_select_b_11_q;
    memoryC0_uid360_atan2Tables_lutmem_reset0 <= areset;
    memoryC0_uid360_atan2Tables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 40,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_arcTanA0Zan2Tables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid360_atan2Tables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid360_atan2Tables_lutmem_aa,
        q_a => memoryC0_uid360_atan2Tables_lutmem_ir
    );
    memoryC0_uid360_atan2Tables_lutmem_r <= memoryC0_uid360_atan2Tables_lutmem_ir(39 downto 0);

    -- os_uid362_atan2Tables(BITJOIN,361)@40
    os_uid362_atan2Tables_q <= memoryC0_uid361_atan2Tables_lutmem_r & memoryC0_uid360_atan2Tables_lutmem_r;

    -- s5sumAHighB_uid415_invPolyEval(ADD,414)@40
    s5sumAHighB_uid415_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 60 => os_uid362_atan2Tables_q(59)) & os_uid362_atan2Tables_q));
    s5sumAHighB_uid415_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((60 downto 51 => highBBits_uid414_invPolyEval_b(50)) & highBBits_uid414_invPolyEval_b));
    s5sumAHighB_uid415_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s5sumAHighB_uid415_invPolyEval_a) + SIGNED(s5sumAHighB_uid415_invPolyEval_b));
    s5sumAHighB_uid415_invPolyEval_q <= s5sumAHighB_uid415_invPolyEval_o(60 downto 0);

    -- lowRangeB_uid413_invPolyEval(BITSELECT,412)@40
    lowRangeB_uid413_invPolyEval_in <= os_uid693_pT5_uid412_invPolyEval_b(1 downto 0);
    lowRangeB_uid413_invPolyEval_b <= lowRangeB_uid413_invPolyEval_in(1 downto 0);

    -- s5_uid416_invPolyEval(BITJOIN,415)@40
    s5_uid416_invPolyEval_q <= s5sumAHighB_uid415_invPolyEval_q & lowRangeB_uid413_invPolyEval_b;

    -- fxpAtanXOXRes_uid114_block_rsrvd_fix(BITSELECT,113)@40
    fxpAtanXOXRes_uid114_block_rsrvd_fix_in <= s5_uid416_invPolyEval_q(60 downto 0);
    fxpAtanXOXRes_uid114_block_rsrvd_fix_b <= fxpAtanXOXRes_uid114_block_rsrvd_fix_in(60 downto 5);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select(BITSELECT,1146)@40
    mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_b <= fxpAtanXOXRes_uid114_block_rsrvd_fix_b(26 downto 0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_c <= fxpAtanXOXRes_uid114_block_rsrvd_fix_b(53 downto 27);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_d <= fxpAtanXOXRes_uid114_block_rsrvd_fix_b(55 downto 54);

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_notEnable(LOGICAL,1281)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_nor(LOGICAL,1282)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_nor_q <= not (redist53_oFracU_uid96_block_rsrvd_fix_q_13_notEnable_q or redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q);

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_last(CONSTANT,1278)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_last_q <= "01001";

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp(LOGICAL,1279)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_b <= STD_LOGIC_VECTOR("0" & redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_q);
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_q <= "1" WHEN redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_last_q = redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_b ELSE "0";

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg(REG,1280)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg_q <= STD_LOGIC_VECTOR(redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmp_q);
        END IF;
    END PROCESS;

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena(REG,1283)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist53_oFracU_uid96_block_rsrvd_fix_q_13_nor_q = "1") THEN
                redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q <= STD_LOGIC_VECTOR(redist53_oFracU_uid96_block_rsrvd_fix_q_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_enaAnd(LOGICAL,1284)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_enaAnd_q <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_sticky_ena_q and VCC_q;

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt(COUNTER,1276)
    -- low=0, high=10, step=1, init=0
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq <= '1';
            ELSE
                redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq <= '0';
            END IF;
            IF (redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_eq = '1') THEN
                redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i + 6;
            ELSE
                redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_i, 4)));

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr(REG,1277)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr_q <= STD_LOGIC_VECTOR(redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem(DUALMEM,1275)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ia <= STD_LOGIC_VECTOR(oFracU_uid96_block_rsrvd_fix_q);
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_aa <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_wraddr_q;
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ab <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_rdcnt_q;
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_reset0 <= areset;
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 53,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 53,
        widthad_b => 4,
        numwords_b => 11,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist53_oFracU_uid96_block_rsrvd_fix_q_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_reset0,
        clock1 => clk,
        address_a => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_aa,
        data_a => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_ab,
        q_b => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_iq
    );
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_q <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_iq(52 downto 0);

    -- redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg(DELAY,1274)
    redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist53_oFracU_uid96_block_rsrvd_fix_q_13_mem_q, xout => redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg_q, clk => clk, aclr => areset );

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select(BITSELECT,1143)@40
    mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_b <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg_q(26 downto 0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c <= redist53_oFracU_uid96_block_rsrvd_fix_q_13_outputreg_q(52 downto 27);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select(BITSELECT,1157)@40
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_b <= mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c(17 downto 0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_c <= mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c(25 downto 18);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3(MULT,1103)@40 + 2
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_pr <= UNSIGNED(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_a0) * UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_b0));
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_a0 <= (others => '0');
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_b0 <= (others => '0');
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_a0 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_c;
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_b0 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_d;
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_s1 <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_pr);
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_s1;

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7(BITSHIFT,1107)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_qint <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im3_q & "000000000000000000";
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_qint(27 downto 0);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma(CHAINMULTADD,1126)@40 + 2
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_reset <= areset;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena0 <= '1';
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena1 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena0;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_p(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0(0) * mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_p(0),28);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_w(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_u(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_x(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_w(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_y(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_x(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_a0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_bs1_merged_bit_select_b),18);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_c0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_d),10);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_s(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_s(0)(27 downto 0)), xout => mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_qq(19 downto 0));

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0(ADD,1109)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_a <= STD_LOGIC_VECTOR("000000000" & mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_im0_cma_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_align_7_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_a) + UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_b));
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_o(28 downto 0);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19(BITSHIFT,985)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_qint <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im13_result_add_0_0_q(27 downto 0) & "000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_qint(108 downto 0);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma(CHAINMULTADD,1140)@40 + 2
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_reset <= areset;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena0 <= '1';
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena1 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena0;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_p(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0(0) * mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_p(1) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0(1) * mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0(1);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_p(0),55);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_u(1) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_p(1),55);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_w(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_u(0) + mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_u(1);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_x(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_w(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_y(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_x(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c),27);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_a0(1) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_c),27);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_b),27);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_c0(1) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_s(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_s(0)(54 downto 0)), xout => mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_qq(54 downto 0));

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17(BITSHIFT,983)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_qint <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma8_cma_q & "000000000000000000000000000";
    mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_qint(81 downto 0);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma(CHAINMULTADD,1139)@40 + 2
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_reset <= areset;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena0 <= '1';
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena1 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena0;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_p(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0(0) * mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_p(1) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0(1) * mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0(1);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_p(0),54);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_u(1) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_p(1),54);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_w(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_u(0) + mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_u(1);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_x(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_w(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_y(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_x(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_d),26);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_a0(1) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_c),26);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_b),27);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_c0(1) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_c),27);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_s(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_s(0)(53 downto 0)), xout => mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_qq(53 downto 0));

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma(CHAINMULTADD,1125)@40 + 2
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_reset <= areset;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena0 <= '1';
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena1 <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena0;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_p(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_a0(0) * mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_c0(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_u(0) <= RESIZE(mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_p(0),54);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_w(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_u(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_x(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_w(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_y(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_x(0);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_a0 <= (others => (others => '0'));
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena0 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_a0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs1_merged_bit_select_b),27);
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_c0(0) <= RESIZE(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_bs2_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_ena1 = '1') THEN
                mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_s(0) <= mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_s(0)(53 downto 0)), xout => mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_qq, clk => clk, aclr => areset );
    mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_q <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_qq(53 downto 0));

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_join_16(BITJOIN,982)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_join_16_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_ma3_cma_q & mulXAtanXOXRes_uid115_block_rsrvd_fix_im0_cma_q;

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0(ADD,987)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid115_block_rsrvd_fix_join_16_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & mulXAtanXOXRes_uid115_block_rsrvd_fix_align_17_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_a) + UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_b));
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_o(108 downto 0);

    -- mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0(ADD,988)@42
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_a <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_0_0_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_b <= STD_LOGIC_VECTOR("0" & mulXAtanXOXRes_uid115_block_rsrvd_fix_align_19_q);
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_a) + UNSIGNED(mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_b));
    mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_q <= mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_o(109 downto 0);

    -- normBit_uid116_block_rsrvd_fix(BITSELECT,115)@42
    normBit_uid116_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_q(107 downto 0));
    normBit_uid116_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(normBit_uid116_block_rsrvd_fix_in(107 downto 107));

    -- invNormBit_uid120_block_rsrvd_fix(LOGICAL,119)@42
    invNormBit_uid120_block_rsrvd_fix_q <= not (normBit_uid116_block_rsrvd_fix_b);

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_notEnable(LOGICAL,1259)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_nor(LOGICAL,1260)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_nor_q <= not (redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_notEnable_q or redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q);

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_last(CONSTANT,1256)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_last_q <= "01011";

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp(LOGICAL,1257)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_q);
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_q <= "1" WHEN redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_last_q = redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_b ELSE "0";

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg(REG,1258)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg_q <= STD_LOGIC_VECTOR(redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena(REG,1261)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_nor_q = "1") THEN
                redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_enaAnd(LOGICAL,1262)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_enaAnd_q <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_sticky_ena_q and VCC_q;

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt(COUNTER,1254)
    -- low=0, high=12, step=1, init=0
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i = TO_UNSIGNED(11, 4)) THEN
                redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq <= '1';
            ELSE
                redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq <= '0';
            END IF;
            IF (redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_eq = '1') THEN
                redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i + 4;
            ELSE
                redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_i, 4)));

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr(REG,1255)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr_q <= "1100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem(DUALMEM,1253)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ia <= STD_LOGIC_VECTOR(redist21_expU_uid94_block_rsrvd_fix_merged_bit_select_b_1_q);
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_aa <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_wraddr_q;
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ab <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_rdcnt_q;
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_reset0 <= areset;
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 13,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_reset0,
        clock1 => clk,
        address_a => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_aa,
        data_a => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_ab,
        q_b => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_iq
    );
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_q <= redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_iq(10 downto 0);

    -- redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg(DELAY,1252)
    redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_mem_q, xout => redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg_q, clk => clk, aclr => areset );

    -- expRPath3Ext_uid121_block_rsrvd_fix(SUB,120)@42
    expRPath3Ext_uid121_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg_q);
    expRPath3Ext_uid121_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000000" & invNormBit_uid120_block_rsrvd_fix_q);
    expRPath3Ext_uid121_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expRPath3Ext_uid121_block_rsrvd_fix_a) - UNSIGNED(expRPath3Ext_uid121_block_rsrvd_fix_b));
    expRPath3Ext_uid121_block_rsrvd_fix_q <= expRPath3Ext_uid121_block_rsrvd_fix_o(11 downto 0);

    -- expRPath3PreRnd_uid122_block_rsrvd_fix(BITSELECT,121)@42
    expRPath3PreRnd_uid122_block_rsrvd_fix_in <= expRPath3Ext_uid121_block_rsrvd_fix_q(10 downto 0);
    expRPath3PreRnd_uid122_block_rsrvd_fix_b <= expRPath3PreRnd_uid122_block_rsrvd_fix_in(10 downto 0);

    -- redist52_expRPath3PreRnd_uid122_block_rsrvd_fix_b_1(DELAY,1210)
    redist52_expRPath3PreRnd_uid122_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPath3PreRnd_uid122_block_rsrvd_fix_b, xout => redist52_expRPath3PreRnd_uid122_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- fracRPath3High_uid117_block_rsrvd_fix(BITSELECT,116)@42
    fracRPath3High_uid117_block_rsrvd_fix_in <= mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_q(106 downto 0);
    fracRPath3High_uid117_block_rsrvd_fix_b <= fracRPath3High_uid117_block_rsrvd_fix_in(106 downto 54);

    -- fracRPath3Low_uid118_block_rsrvd_fix(BITSELECT,117)@42
    fracRPath3Low_uid118_block_rsrvd_fix_in <= mulXAtanXOXRes_uid115_block_rsrvd_fix_result_add_1_0_q(105 downto 0);
    fracRPath3Low_uid118_block_rsrvd_fix_b <= fracRPath3Low_uid118_block_rsrvd_fix_in(105 downto 53);

    -- fracRPath3Pre_uid119_block_rsrvd_fix(MUX,118)@42 + 1
    fracRPath3Pre_uid119_block_rsrvd_fix_s <= normBit_uid116_block_rsrvd_fix_b;
    fracRPath3Pre_uid119_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPath3Pre_uid119_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPath3Pre_uid119_block_rsrvd_fix_s) IS
                WHEN "0" => fracRPath3Pre_uid119_block_rsrvd_fix_q <= fracRPath3Low_uid118_block_rsrvd_fix_b;
                WHEN "1" => fracRPath3Pre_uid119_block_rsrvd_fix_q <= fracRPath3High_uid117_block_rsrvd_fix_b;
                WHEN OTHERS => fracRPath3Pre_uid119_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- expFracRPath3PreRnd_uid123_block_rsrvd_fix(BITJOIN,122)@43
    expFracRPath3PreRnd_uid123_block_rsrvd_fix_q <= redist52_expRPath3PreRnd_uid122_block_rsrvd_fix_b_1_q & fracRPath3Pre_uid119_block_rsrvd_fix_q;

    -- fracRPath3PostRnd_uid126_block_rsrvd_fix(ADD,125)@43
    fracRPath3PostRnd_uid126_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expFracRPath3PreRnd_uid123_block_rsrvd_fix_q);
    fracRPath3PostRnd_uid126_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000000000000000" & VCC_q);
    fracRPath3PostRnd_uid126_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPath3PostRnd_uid126_block_rsrvd_fix_a) + UNSIGNED(fracRPath3PostRnd_uid126_block_rsrvd_fix_b));
    fracRPath3PostRnd_uid126_block_rsrvd_fix_q <= fracRPath3PostRnd_uid126_block_rsrvd_fix_o(64 downto 0);

    -- fracRPath3_uid127_block_rsrvd_fix_merged_bit_select(BITSELECT,1147)@43
    fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_in <= fracRPath3PostRnd_uid126_block_rsrvd_fix_q(63 downto 0);
    fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_b <= fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_in(52 downto 1);
    fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_c <= fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_in(63 downto 53);

    -- rightShiftStage2Idx3Rng3_uid1021_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1020)@43
    rightShiftStage2Idx3Rng3_uid1021_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 3);

    -- rightShiftStage2Idx3_uid1023_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1022)@43
    rightShiftStage2Idx3_uid1023_fxpOp2Path2_uid135_block_rsrvd_fix_q <= aboveLeftY_bottomExtension_uid785_pT4_uid472_invPolyEval_q & rightShiftStage2Idx3Rng3_uid1021_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage2Idx2Rng2_uid1018_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1017)@43
    rightShiftStage2Idx2Rng2_uid1018_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 2);

    -- rightShiftStage2Idx2_uid1020_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1019)@43
    rightShiftStage2Idx2_uid1020_fxpOp2Path2_uid135_block_rsrvd_fix_q <= padACst_uid168_block_rsrvd_fix_q & rightShiftStage2Idx2Rng2_uid1018_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage2Idx1Rng1_uid1015_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1014)@43
    rightShiftStage2Idx1Rng1_uid1015_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 1);

    -- rightShiftStage2Idx1_uid1017_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1016)@43
    rightShiftStage2Idx1_uid1017_fxpOp2Path2_uid135_block_rsrvd_fix_q <= GND_q & rightShiftStage2Idx1Rng1_uid1015_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage1Idx3Rng12_uid1010_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1009)@43
    rightShiftStage1Idx3Rng12_uid1010_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 12);

    -- rightShiftStage1Idx3_uid1012_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1011)@43
    rightShiftStage1Idx3_uid1012_fxpOp2Path2_uid135_block_rsrvd_fix_q <= zS_uid103_block_rsrvd_fix_q & rightShiftStage1Idx3Rng12_uid1010_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage1Idx2Rng8_uid1007_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1006)@43
    rightShiftStage1Idx2Rng8_uid1007_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 8);

    -- rightShiftStage1Idx2_uid1009_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1008)@43
    rightShiftStage1Idx2_uid1009_fxpOp2Path2_uid135_block_rsrvd_fix_q <= leftShiftStage0Idx1Pad8_uid939_fxpU_uid108_block_rsrvd_fix_q & rightShiftStage1Idx2Rng8_uid1007_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage1Idx1Rng4_uid1004_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,1003)@43
    rightShiftStage1Idx1Rng4_uid1004_fxpOp2Path2_uid135_block_rsrvd_fix_b <= rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q(53 downto 4);

    -- rightShiftStage1Idx1_uid1006_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1005)@43
    rightShiftStage1Idx1_uid1006_fxpOp2Path2_uid135_block_rsrvd_fix_q <= aboveLeftY_bottomExtension_uid715_pT2_uid460_invPolyEval_q & rightShiftStage1Idx1Rng4_uid1004_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage0Idx3Rng48_uid999_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,998)@43
    rightShiftStage0Idx3Rng48_uid999_fxpOp2Path2_uid135_block_rsrvd_fix_b <= oFracRPath2_uid133_block_rsrvd_fix_q(53 downto 48);

    -- rightShiftStage0Idx3_uid1001_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,1000)@43
    rightShiftStage0Idx3_uid1001_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0Idx3Pad48_uid1000_fxpOp2Path2_uid135_block_rsrvd_fix_q & rightShiftStage0Idx3Rng48_uid999_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage0Idx2Rng32_uid996_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,995)@43
    rightShiftStage0Idx2Rng32_uid996_fxpOp2Path2_uid135_block_rsrvd_fix_b <= oFracRPath2_uid133_block_rsrvd_fix_q(53 downto 32);

    -- rightShiftStage0Idx2_uid998_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,997)@43
    rightShiftStage0Idx2_uid998_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0Idx2Pad32_uid997_fxpOp2Path2_uid135_block_rsrvd_fix_q & rightShiftStage0Idx2Rng32_uid996_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- rightShiftStage0Idx1Rng16_uid993_fxpOp2Path2_uid135_block_rsrvd_fix(BITSELECT,992)@43
    rightShiftStage0Idx1Rng16_uid993_fxpOp2Path2_uid135_block_rsrvd_fix_b <= oFracRPath2_uid133_block_rsrvd_fix_q(53 downto 16);

    -- rightShiftStage0Idx1_uid995_fxpOp2Path2_uid135_block_rsrvd_fix(BITJOIN,994)@43
    rightShiftStage0Idx1_uid995_fxpOp2Path2_uid135_block_rsrvd_fix_q <= leftShiftStage0Idx2Pad16_uid942_fxpU_uid108_block_rsrvd_fix_q & rightShiftStage0Idx1Rng16_uid993_fxpOp2Path2_uid135_block_rsrvd_fix_b;

    -- oFracRPath2_uid133_block_rsrvd_fix(BITJOIN,132)@43
    oFracRPath2_uid133_block_rsrvd_fix_q <= VCC_q & fracRPath3Pre_uid119_block_rsrvd_fix_q;

    -- rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix(MUX,1002)@43
    rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_b;
    rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_s, oFracRPath2_uid133_block_rsrvd_fix_q, rightShiftStage0Idx1_uid995_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage0Idx2_uid998_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage0Idx3_uid1001_fxpOp2Path2_uid135_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q <= oFracRPath2_uid133_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid995_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid998_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0Idx3_uid1001_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix(MUX,1013)@43
    rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_c;
    rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_s, rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage1Idx1_uid1006_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage1Idx2_uid1009_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage1Idx3_uid1012_fxpOp2Path2_uid135_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage0_uid1003_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid1006_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid1009_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid1012_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP2_uid59_block_rsrvd_fix(CONSTANT,58)
    cstWFP2_uid59_block_rsrvd_fix_q <= "00000110110";

    -- cstBiasMWF_uid56_block_rsrvd_fix(CONSTANT,55)
    cstBiasMWF_uid56_block_rsrvd_fix_q <= "01111001011";

    -- shiftOut_uid130_block_rsrvd_fix(COMPARE,129)@42
    shiftOut_uid130_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg_q);
    shiftOut_uid130_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid56_block_rsrvd_fix_q);
    shiftOut_uid130_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftOut_uid130_block_rsrvd_fix_a) - UNSIGNED(shiftOut_uid130_block_rsrvd_fix_b));
    shiftOut_uid130_block_rsrvd_fix_c(0) <= shiftOut_uid130_block_rsrvd_fix_o(12);

    -- shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged(SUB,989)@42 + 1
    shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid54_block_rsrvd_fix_q);
    shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_b <= STD_LOGIC_VECTOR("0" & expRPath3PreRnd_uid122_block_rsrvd_fix_b);
    shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_i <= "0" & cstWFP2_uid59_block_rsrvd_fix_q;
    shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (shiftOut_uid130_block_rsrvd_fix_c = "1") THEN
                shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_o <= shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_i;
            ELSE
                shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_a) - UNSIGNED(shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_b));
            END IF;
        END IF;
    END PROCESS;
    shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_q <= shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_o(10 downto 0);

    -- sValPostSOutR_uid134_block_rsrvd_fix(BITSELECT,133)@43
    sValPostSOutR_uid134_block_rsrvd_fix_in <= shiftValPath2PreSub_uid129_block_rsrvd_fix_sValPostSOut_uid132_block_rsrvd_fix_merged_q(5 downto 0);
    sValPostSOutR_uid134_block_rsrvd_fix_b <= sValPostSOutR_uid134_block_rsrvd_fix_in(5 downto 0);

    -- rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select(BITSELECT,1148)@43
    rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_b <= sValPostSOutR_uid134_block_rsrvd_fix_b(5 downto 4);
    rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_c <= sValPostSOutR_uid134_block_rsrvd_fix_b(3 downto 2);
    rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_d <= sValPostSOutR_uid134_block_rsrvd_fix_b(1 downto 0);

    -- rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix(MUX,1024)@43
    rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1002_fxpOp2Path2_uid135_block_rsrvd_fix_merged_bit_select_d;
    rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_combproc: PROCESS (rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_s, rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage2Idx1_uid1017_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage2Idx2_uid1020_fxpOp2Path2_uid135_block_rsrvd_fix_q, rightShiftStage2Idx3_uid1023_fxpOp2Path2_uid135_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage1_uid1014_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid1017_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage2Idx2_uid1020_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q <= rightShiftStage2Idx3_uid1023_fxpOp2Path2_uid135_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bPostPad_uid137_block_rsrvd_fix(BITJOIN,136)@43
    bPostPad_uid137_block_rsrvd_fix_q <= rightShiftStage2_uid1025_fxpOp2Path2_uid135_block_rsrvd_fix_q & GND_q;

    -- path2Diff_uid138_block_rsrvd_fix(SUB,137)@43
    path2Diff_uid138_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & piO2_uid80_block_rsrvd_fix_q);
    path2Diff_uid138_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & bPostPad_uid137_block_rsrvd_fix_q);
    path2Diff_uid138_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(path2Diff_uid138_block_rsrvd_fix_a) - UNSIGNED(path2Diff_uid138_block_rsrvd_fix_b));
    path2Diff_uid138_block_rsrvd_fix_q <= path2Diff_uid138_block_rsrvd_fix_o(55 downto 0);

    -- normBitPath2Diff_uid139_block_rsrvd_fix(BITSELECT,138)@43
    normBitPath2Diff_uid139_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(path2Diff_uid138_block_rsrvd_fix_q(54 downto 0));
    normBitPath2Diff_uid139_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(normBitPath2Diff_uid139_block_rsrvd_fix_in(54 downto 54));

    -- expRPath2_uid143_block_rsrvd_fix(MUX,142)@43
    expRPath2_uid143_block_rsrvd_fix_s <= normBitPath2Diff_uid139_block_rsrvd_fix_b;
    expRPath2_uid143_block_rsrvd_fix_combproc: PROCESS (expRPath2_uid143_block_rsrvd_fix_s, cstBiasM1_uid55_block_rsrvd_fix_q, cstBias_uid54_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPath2_uid143_block_rsrvd_fix_s) IS
            WHEN "0" => expRPath2_uid143_block_rsrvd_fix_q <= cstBiasM1_uid55_block_rsrvd_fix_q;
            WHEN "1" => expRPath2_uid143_block_rsrvd_fix_q <= cstBias_uid54_block_rsrvd_fix_q;
            WHEN OTHERS => expRPath2_uid143_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- path2DiffHigh_uid140_block_rsrvd_fix(BITSELECT,139)@43
    path2DiffHigh_uid140_block_rsrvd_fix_in <= path2Diff_uid138_block_rsrvd_fix_q(53 downto 0);
    path2DiffHigh_uid140_block_rsrvd_fix_b <= path2DiffHigh_uid140_block_rsrvd_fix_in(53 downto 1);

    -- path2DiffLow_uid141_block_rsrvd_fix(BITSELECT,140)@43
    path2DiffLow_uid141_block_rsrvd_fix_in <= path2Diff_uid138_block_rsrvd_fix_q(52 downto 0);
    path2DiffLow_uid141_block_rsrvd_fix_b <= path2DiffLow_uid141_block_rsrvd_fix_in(52 downto 0);

    -- fracRPath2_uid142_block_rsrvd_fix(MUX,141)@43
    fracRPath2_uid142_block_rsrvd_fix_s <= normBitPath2Diff_uid139_block_rsrvd_fix_b;
    fracRPath2_uid142_block_rsrvd_fix_combproc: PROCESS (fracRPath2_uid142_block_rsrvd_fix_s, path2DiffLow_uid141_block_rsrvd_fix_b, path2DiffHigh_uid140_block_rsrvd_fix_b)
    BEGIN
        CASE (fracRPath2_uid142_block_rsrvd_fix_s) IS
            WHEN "0" => fracRPath2_uid142_block_rsrvd_fix_q <= path2DiffLow_uid141_block_rsrvd_fix_b;
            WHEN "1" => fracRPath2_uid142_block_rsrvd_fix_q <= path2DiffHigh_uid140_block_rsrvd_fix_b;
            WHEN OTHERS => fracRPath2_uid142_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracConc_uid146_block_rsrvd_fix(BITJOIN,145)@43
    expFracConc_uid146_block_rsrvd_fix_q <= expRPath2_uid143_block_rsrvd_fix_q & fracRPath2_uid142_block_rsrvd_fix_q;

    -- expFracRPath2PostRnd_uid147_block_rsrvd_fix(ADD,146)@43
    expFracRPath2PostRnd_uid147_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expFracConc_uid146_block_rsrvd_fix_q);
    expFracRPath2PostRnd_uid147_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000000000000000" & VCC_q);
    expFracRPath2PostRnd_uid147_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPath2PostRnd_uid147_block_rsrvd_fix_a) + UNSIGNED(expFracRPath2PostRnd_uid147_block_rsrvd_fix_b));
    expFracRPath2PostRnd_uid147_block_rsrvd_fix_q <= expFracRPath2PostRnd_uid147_block_rsrvd_fix_o(64 downto 0);

    -- fracRPath2_uid148_block_rsrvd_fix_merged_bit_select(BITSELECT,1149)@43
    fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_in <= expFracRPath2PostRnd_uid147_block_rsrvd_fix_q(63 downto 0);
    fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_b <= fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_in(52 downto 1);
    fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_c <= fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_in(63 downto 53);

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_notEnable(LOGICAL,1302)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_nor(LOGICAL,1303)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_nor_q <= not (redist60_fracX_uid48_block_rsrvd_fix_b_29_notEnable_q or redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q);

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_last(CONSTANT,1299)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_last_q <= "01100";

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp(LOGICAL,1300)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_b <= STD_LOGIC_VECTOR("0" & redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_q);
    redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_q <= "1" WHEN redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_last_q = redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_b ELSE "0";

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg(REG,1301)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg_q <= STD_LOGIC_VECTOR(redist60_fracX_uid48_block_rsrvd_fix_b_29_cmp_q);
        END IF;
    END PROCESS;

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena(REG,1304)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist60_fracX_uid48_block_rsrvd_fix_b_29_nor_q = "1") THEN
                redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q <= STD_LOGIC_VECTOR(redist60_fracX_uid48_block_rsrvd_fix_b_29_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_enaAnd(LOGICAL,1305)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_enaAnd_q <= redist60_fracX_uid48_block_rsrvd_fix_b_29_sticky_ena_q and VCC_q;

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt(COUNTER,1297)
    -- low=0, high=13, step=1, init=0
    redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i = TO_UNSIGNED(12, 4)) THEN
                redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq <= '1';
            ELSE
                redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq <= '0';
            END IF;
            IF (redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_eq = '1') THEN
                redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i <= redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i + 3;
            ELSE
                redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i <= redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_i, 4)));

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr(REG,1298)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr_q <= "1101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr_q <= STD_LOGIC_VECTOR(redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_mem(DUALMEM,1296)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ia <= STD_LOGIC_VECTOR(redist59_fracX_uid48_block_rsrvd_fix_b_13_mem_q);
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_aa <= redist60_fracX_uid48_block_rsrvd_fix_b_29_wraddr_q;
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ab <= redist60_fracX_uid48_block_rsrvd_fix_b_29_rdcnt_q;
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_reset0 <= areset;
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 52,
        widthad_b => 4,
        numwords_b => 14,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist60_fracX_uid48_block_rsrvd_fix_b_29_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_reset0,
        clock1 => clk,
        address_a => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_aa,
        data_a => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_ab,
        q_b => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_iq
    );
    redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_q <= redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_iq(51 downto 0);

    -- redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg(DELAY,1295)
    redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist60_fracX_uid48_block_rsrvd_fix_b_29_mem_q, xout => redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg_q, clk => clk, aclr => areset );

    -- redist61_fracX_uid48_block_rsrvd_fix_b_30(DELAY,1219)
    redist61_fracX_uid48_block_rsrvd_fix_b_30 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg_q, xout => redist61_fracX_uid48_block_rsrvd_fix_b_30_q, clk => clk, aclr => areset );

    -- xyInInf_uid89_block_rsrvd_fix(LOGICAL,88)@12 + 1
    xyInInf_uid89_block_rsrvd_fix_qi <= excI_xIn_uid16_block_rsrvd_fix_q and excI_yIn_uid30_block_rsrvd_fix_q;
    xyInInf_uid89_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid89_block_rsrvd_fix_qi, xout => xyInInf_uid89_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist55_xyInInf_uid89_block_rsrvd_fix_q_30(DELAY,1213)
    redist55_xyInInf_uid89_block_rsrvd_fix_q_30 : dspba_delay
    GENERIC MAP ( width => 1, depth => 29, reset_kind => "ASYNC" )
    PORT MAP ( xin => xyInInf_uid89_block_rsrvd_fix_q, xout => redist55_xyInInf_uid89_block_rsrvd_fix_q_30_q, clk => clk, aclr => areset );

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_notEnable(LOGICAL,1313)
    redist62_expX_uid47_block_rsrvd_fix_b_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_nor(LOGICAL,1314)
    redist62_expX_uid47_block_rsrvd_fix_b_16_nor_q <= not (redist62_expX_uid47_block_rsrvd_fix_b_16_notEnable_q or redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q);

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_mem_last(CONSTANT,1310)
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_last_q <= "01100";

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_cmp(LOGICAL,1311)
    redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_b <= STD_LOGIC_VECTOR("0" & redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_q);
    redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_q <= "1" WHEN redist62_expX_uid47_block_rsrvd_fix_b_16_mem_last_q = redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_b ELSE "0";

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg(REG,1312)
    redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg_q <= STD_LOGIC_VECTOR(redist62_expX_uid47_block_rsrvd_fix_b_16_cmp_q);
        END IF;
    END PROCESS;

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena(REG,1315)
    redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist62_expX_uid47_block_rsrvd_fix_b_16_nor_q = "1") THEN
                redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q <= STD_LOGIC_VECTOR(redist62_expX_uid47_block_rsrvd_fix_b_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_enaAnd(LOGICAL,1316)
    redist62_expX_uid47_block_rsrvd_fix_b_16_enaAnd_q <= redist62_expX_uid47_block_rsrvd_fix_b_16_sticky_ena_q and VCC_q;

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt(COUNTER,1308)
    -- low=0, high=13, step=1, init=0
    redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i = TO_UNSIGNED(12, 4)) THEN
                redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq <= '1';
            ELSE
                redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq <= '0';
            END IF;
            IF (redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_eq = '1') THEN
                redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i <= redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i + 3;
            ELSE
                redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i <= redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_i, 4)));

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr(REG,1309)
    redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr_q <= "1101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr_q <= STD_LOGIC_VECTOR(redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_mem(DUALMEM,1307)
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ia <= STD_LOGIC_VECTOR(expX_uid47_block_rsrvd_fix_b);
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_aa <= redist62_expX_uid47_block_rsrvd_fix_b_16_wraddr_q;
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ab <= redist62_expX_uid47_block_rsrvd_fix_b_16_rdcnt_q;
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_reset0 <= areset;
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 11,
        widthad_b => 4,
        numwords_b => 14,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist62_expX_uid47_block_rsrvd_fix_b_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_reset0,
        clock1 => clk,
        address_a => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_aa,
        data_a => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_ab,
        q_b => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_iq
    );
    redist62_expX_uid47_block_rsrvd_fix_b_16_mem_q <= redist62_expX_uid47_block_rsrvd_fix_b_16_mem_iq(10 downto 0);

    -- redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg(DELAY,1306)
    redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist62_expX_uid47_block_rsrvd_fix_b_16_mem_q, xout => redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg_q, clk => clk, aclr => areset );

    -- expXIsBias_uid78_block_rsrvd_fix(LOGICAL,77)@42
    expXIsBias_uid78_block_rsrvd_fix_q <= "1" WHEN redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg_q = cstBias_uid54_block_rsrvd_fix_q ELSE "0";

    -- updatedY_uid76_block_rsrvd_fix(BITJOIN,75)@42
    updatedY_uid76_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q & cstZeroWF_uid8_block_rsrvd_fix_q;

    -- fracXIsZero_uid75_block_rsrvd_fix(LOGICAL,76)@42
    fracXIsZero_uid75_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000" & redist60_fracX_uid48_block_rsrvd_fix_b_29_outputreg_q);
    fracXIsZero_uid75_block_rsrvd_fix_q <= "1" WHEN fracXIsZero_uid75_block_rsrvd_fix_a = updatedY_uid76_block_rsrvd_fix_q ELSE "0";

    -- inIsOne_uid79_block_rsrvd_fix(LOGICAL,78)@42
    inIsOne_uid79_block_rsrvd_fix_q <= fracXIsZero_uid75_block_rsrvd_fix_q and expXIsBias_uid78_block_rsrvd_fix_q;

    -- arctanIsConst_uid90_block_rsrvd_fix(LOGICAL,89)@42
    arctanIsConst_uid90_block_rsrvd_fix_q <= redist56_excI_div_uid70_block_rsrvd_fix_q_16_q or inIsOne_uid79_block_rsrvd_fix_q or redist55_xyInInf_uid89_block_rsrvd_fix_q_30_q;

    -- biasMwShift_uid97_block_rsrvd_fix(CONSTANT,96)
    biasMwShift_uid97_block_rsrvd_fix_q <= "01111100100";

    -- atanUIsU_uid98_block_rsrvd_fix(COMPARE,97)@42
    atanUIsU_uid98_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & biasMwShift_uid97_block_rsrvd_fix_q);
    atanUIsU_uid98_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & redist22_expU_uid94_block_rsrvd_fix_merged_bit_select_b_16_outputreg_q);
    atanUIsU_uid98_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(atanUIsU_uid98_block_rsrvd_fix_a) - UNSIGNED(atanUIsU_uid98_block_rsrvd_fix_b));
    atanUIsU_uid98_block_rsrvd_fix_n(0) <= not (atanUIsU_uid98_block_rsrvd_fix_o(12));

    -- redist54_path2_uid91_block_rsrvd_fix_n_16(DELAY,1212)
    redist54_path2_uid91_block_rsrvd_fix_n_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => path2_uid91_block_rsrvd_fix_n, xout => redist54_path2_uid91_block_rsrvd_fix_n_16_q, clk => clk, aclr => areset );

    -- pathSelBits_uid150_block_rsrvd_fix(BITJOIN,149)@42
    pathSelBits_uid150_block_rsrvd_fix_q <= arctanIsConst_uid90_block_rsrvd_fix_q & atanUIsU_uid98_block_rsrvd_fix_n & redist54_path2_uid91_block_rsrvd_fix_n_16_q;

    -- fracOutMuxSelEnc_uid151_block_rsrvd_fix(LOOKUP,150)@42 + 1
    fracOutMuxSelEnc_uid151_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (pathSelBits_uid150_block_rsrvd_fix_q) IS
                WHEN "000" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "10";
                WHEN "001" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "01";
                WHEN "010" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "00";
                WHEN "011" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "01";
                WHEN "100" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "11";
                WHEN "101" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "11";
                WHEN "110" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "11";
                WHEN "111" => fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= "11";
                WHEN OTHERS => -- unreachable
                               fracOutMuxSelEnc_uid151_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRCalc_uid153_block_rsrvd_fix(MUX,152)@43 + 1
    fracRCalc_uid153_block_rsrvd_fix_s <= fracOutMuxSelEnc_uid151_block_rsrvd_fix_q;
    fracRCalc_uid153_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRCalc_uid153_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRCalc_uid153_block_rsrvd_fix_s) IS
                WHEN "00" => fracRCalc_uid153_block_rsrvd_fix_q <= redist61_fracX_uid48_block_rsrvd_fix_b_30_q;
                WHEN "01" => fracRCalc_uid153_block_rsrvd_fix_q <= fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_b;
                WHEN "10" => fracRCalc_uid153_block_rsrvd_fix_q <= fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_b;
                WHEN "11" => fracRCalc_uid153_block_rsrvd_fix_q <= fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_b;
                WHEN OTHERS => fracRCalc_uid153_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracRCalc_uid163_block_rsrvd_fix(BITJOIN,162)@44
    oFracRCalc_uid163_block_rsrvd_fix_q <= VCC_q & fracRCalc_uid153_block_rsrvd_fix_q;

    -- padConst_uid164_block_rsrvd_fix(CONSTANT,163)
    padConst_uid164_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid165_block_rsrvd_fix(BITJOIN,164)@44
    rightPaddedIn_uid165_block_rsrvd_fix_q <= oFracRCalc_uid163_block_rsrvd_fix_q & padConst_uid164_block_rsrvd_fix_q;

    -- rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix(MUX,1039)@44
    rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_b;
    rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_s, rightPaddedIn_uid165_block_rsrvd_fix_q, rightShiftStage0Idx1_uid1032_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage0Idx2_uid1035_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage0Idx3_uid1038_fxpAlignedRes_uid164_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightPaddedIn_uid165_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid1032_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid1035_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0Idx3_uid1038_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix(MUX,1050)@44
    rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_c;
    rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_s, rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage1Idx1_uid1043_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage1Idx2_uid1046_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage1Idx3_uid1049_fxpAlignedRes_uid164_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage0_uid1040_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid1043_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid1046_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid1049_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstWFP1_uid58_block_rsrvd_fix(CONSTANT,57)
    cstWFP1_uid58_block_rsrvd_fix_q <= "00000110101";

    -- zwEwF_uid37_block_rsrvd_fix(CONSTANT,36)
    zwEwF_uid37_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000000000000000000";

    -- yInExpFrac_uid40_block_rsrvd_fix(BITJOIN,39)@10
    yInExpFrac_uid40_block_rsrvd_fix_q <= exp_yIn_uid24_block_rsrvd_fix_b & frac_yIn_uid25_block_rsrvd_fix_b;

    -- yInZero_uid41_block_rsrvd_fix(LOGICAL,40)@10 + 1
    yInZero_uid41_block_rsrvd_fix_qi <= "1" WHEN yInExpFrac_uid40_block_rsrvd_fix_q = zwEwF_uid37_block_rsrvd_fix_q ELSE "0";
    yInZero_uid41_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid41_block_rsrvd_fix_qi, xout => yInZero_uid41_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist65_yInZero_uid41_block_rsrvd_fix_q_16(DELAY,1223)
    redist65_yInZero_uid41_block_rsrvd_fix_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => yInZero_uid41_block_rsrvd_fix_q, xout => redist65_yInZero_uid41_block_rsrvd_fix_q_16_q, clk => clk, aclr => areset );

    -- redist66_yInZero_uid41_block_rsrvd_fix_q_33(DELAY,1224)
    redist66_yInZero_uid41_block_rsrvd_fix_q_33 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist65_yInZero_uid41_block_rsrvd_fix_q_16_q, xout => redist66_yInZero_uid41_block_rsrvd_fix_q_33_q, clk => clk, aclr => areset );

    -- sOutAlignRes_uid158_block_rsrvd_fix(COMPARE,157)@43
    sOutAlignRes_uid158_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expRCalc_uid155_block_rsrvd_fix_q);
    sOutAlignRes_uid158_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBiasMWF_uid56_block_rsrvd_fix_q);
    sOutAlignRes_uid158_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(sOutAlignRes_uid158_block_rsrvd_fix_a) - UNSIGNED(sOutAlignRes_uid158_block_rsrvd_fix_b));
    sOutAlignRes_uid158_block_rsrvd_fix_c(0) <= sOutAlignRes_uid158_block_rsrvd_fix_o(12);

    -- yInZOrsOutAlignRes_uid159_block_rsrvd_fix(LOGICAL,158)@43
    yInZOrsOutAlignRes_uid159_block_rsrvd_fix_q <= sOutAlignRes_uid158_block_rsrvd_fix_c or redist66_yInZero_uid41_block_rsrvd_fix_q_33_q;

    -- redist63_expX_uid47_block_rsrvd_fix_b_17(DELAY,1221)
    redist63_expX_uid47_block_rsrvd_fix_b_17 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist62_expX_uid47_block_rsrvd_fix_b_16_outputreg_q, xout => redist63_expX_uid47_block_rsrvd_fix_b_17_q, clk => clk, aclr => areset );

    -- expRCalc_uid155_block_rsrvd_fix(MUX,154)@43
    expRCalc_uid155_block_rsrvd_fix_s <= fracOutMuxSelEnc_uid151_block_rsrvd_fix_q;
    expRCalc_uid155_block_rsrvd_fix_combproc: PROCESS (expRCalc_uid155_block_rsrvd_fix_s, redist63_expX_uid47_block_rsrvd_fix_b_17_q, fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_c, fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_c, fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (expRCalc_uid155_block_rsrvd_fix_s) IS
            WHEN "00" => expRCalc_uid155_block_rsrvd_fix_q <= redist63_expX_uid47_block_rsrvd_fix_b_17_q;
            WHEN "01" => expRCalc_uid155_block_rsrvd_fix_q <= fracRPath2_uid148_block_rsrvd_fix_merged_bit_select_c;
            WHEN "10" => expRCalc_uid155_block_rsrvd_fix_q <= fracRPath3_uid127_block_rsrvd_fix_merged_bit_select_c;
            WHEN "11" => expRCalc_uid155_block_rsrvd_fix_q <= fracOutCst_uid152_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => expRCalc_uid155_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged(SUB,1026)@43 + 1
    sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_a <= STD_LOGIC_VECTOR("0" & cstBias_uid54_block_rsrvd_fix_q);
    sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_b <= STD_LOGIC_VECTOR("0" & expRCalc_uid155_block_rsrvd_fix_q);
    sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_i <= "0" & cstWFP1_uid58_block_rsrvd_fix_q;
    sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yInZOrsOutAlignRes_uid159_block_rsrvd_fix_q = "1") THEN
                sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_o <= sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_i;
            ELSE
                sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_a) - UNSIGNED(sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_b));
            END IF;
        END IF;
    END PROCESS;
    sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_q <= sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_o(10 downto 0);

    -- sValPostSOutRange_uid162_block_rsrvd_fix(BITSELECT,161)@44
    sValPostSOutRange_uid162_block_rsrvd_fix_in <= sValAlignRes_uid157_block_rsrvd_fix_sValPostSAlignOut_uid161_block_rsrvd_fix_merged_q(5 downto 0);
    sValPostSOutRange_uid162_block_rsrvd_fix_b <= sValPostSOutRange_uid162_block_rsrvd_fix_in(5 downto 0);

    -- rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select(BITSELECT,1150)@44
    rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_b <= sValPostSOutRange_uid162_block_rsrvd_fix_b(5 downto 4);
    rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_c <= sValPostSOutRange_uid162_block_rsrvd_fix_b(3 downto 2);
    rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_d <= sValPostSOutRange_uid162_block_rsrvd_fix_b(1 downto 0);

    -- rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix(MUX,1061)@44
    rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_s <= rightShiftStageSel5Dto4_uid1039_fxpAlignedRes_uid164_block_rsrvd_fix_merged_bit_select_d;
    rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_combproc: PROCESS (rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_s, rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage2Idx1_uid1054_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage2Idx2_uid1057_fxpAlignedRes_uid164_block_rsrvd_fix_q, rightShiftStage2Idx3_uid1060_fxpAlignedRes_uid164_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage1_uid1051_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid1054_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage2Idx2_uid1057_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q <= rightShiftStage2Idx3_uid1060_fxpAlignedRes_uid164_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstPi_uid156_block_rsrvd_fix(CONSTANT,155)
    cstPi_uid156_block_rsrvd_fix_q <= "110010010000111111011010101000100010000101101000110000100011010011000100110001100110001010001011100000010";

    -- aPostPad_uid169_block_rsrvd_fix(BITJOIN,168)@44
    aPostPad_uid169_block_rsrvd_fix_q <= cstPi_uid156_block_rsrvd_fix_q & padACst_uid168_block_rsrvd_fix_q;

    -- subRes_uid170_block_rsrvd_fix(SUB,169)@44
    subRes_uid170_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid169_block_rsrvd_fix_q);
    subRes_uid170_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & rightShiftStage2_uid1062_fxpAlignedRes_uid164_block_rsrvd_fix_q);
    subRes_uid170_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(subRes_uid170_block_rsrvd_fix_a) - UNSIGNED(subRes_uid170_block_rsrvd_fix_b));
    subRes_uid170_block_rsrvd_fix_q <= subRes_uid170_block_rsrvd_fix_o(107 downto 0);

    -- subResNormBit_uid171_block_rsrvd_fix(BITSELECT,170)@44
    subResNormBit_uid171_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(subRes_uid170_block_rsrvd_fix_q(106 downto 0));
    subResNormBit_uid171_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(subResNormBit_uid171_block_rsrvd_fix_in(106 downto 106));

    -- expRSub_uid175_block_rsrvd_fix(MUX,174)@44
    expRSub_uid175_block_rsrvd_fix_s <= subResNormBit_uid171_block_rsrvd_fix_b;
    expRSub_uid175_block_rsrvd_fix_combproc: PROCESS (expRSub_uid175_block_rsrvd_fix_s, cstBias_uid54_block_rsrvd_fix_q, cstBiasP1_uid57_block_rsrvd_fix_q)
    BEGIN
        CASE (expRSub_uid175_block_rsrvd_fix_s) IS
            WHEN "0" => expRSub_uid175_block_rsrvd_fix_q <= cstBias_uid54_block_rsrvd_fix_q;
            WHEN "1" => expRSub_uid175_block_rsrvd_fix_q <= cstBiasP1_uid57_block_rsrvd_fix_q;
            WHEN OTHERS => expRSub_uid175_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist51_expRCalc_uid155_block_rsrvd_fix_q_1(DELAY,1209)
    redist51_expRCalc_uid155_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRCalc_uid155_block_rsrvd_fix_q, xout => redist51_expRCalc_uid155_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- xInExpFrac_uid44_block_rsrvd_fix(BITJOIN,43)@10
    xInExpFrac_uid44_block_rsrvd_fix_q <= redist77_exp_xIn_uid10_block_rsrvd_fix_b_10_mem_q & redist75_frac_xIn_uid11_block_rsrvd_fix_b_10_mem_q;

    -- xInZero_uid45_block_rsrvd_fix(LOGICAL,44)@10 + 1
    xInZero_uid45_block_rsrvd_fix_qi <= "1" WHEN xInExpFrac_uid44_block_rsrvd_fix_q = zwEwF_uid37_block_rsrvd_fix_q ELSE "0";
    xInZero_uid45_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid45_block_rsrvd_fix_qi, xout => xInZero_uid45_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist64_xInZero_uid45_block_rsrvd_fix_q_16(DELAY,1222)
    redist64_xInZero_uid45_block_rsrvd_fix_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInZero_uid45_block_rsrvd_fix_q, xout => redist64_xInZero_uid45_block_rsrvd_fix_q_16_q, clk => clk, aclr => areset );

    -- redist68_xInSign_uid36_block_rsrvd_fix_b_26(DELAY,1226)
    redist68_xInSign_uid36_block_rsrvd_fix_b_26 : dspba_delay
    GENERIC MAP ( width => 1, depth => 13, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist67_xInSign_uid36_block_rsrvd_fix_b_13_q, xout => redist68_xInSign_uid36_block_rsrvd_fix_b_26_q, clk => clk, aclr => areset );

    -- xInIsLTEZero_uid176_block_rsrvd_fix(LOGICAL,175)@26 + 1
    xInIsLTEZero_uid176_block_rsrvd_fix_qi <= redist68_xInSign_uid36_block_rsrvd_fix_b_26_q or redist64_xInZero_uid45_block_rsrvd_fix_q_16_q;
    xInIsLTEZero_uid176_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid176_block_rsrvd_fix_qi, xout => xInIsLTEZero_uid176_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18(DELAY,1208)
    redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => xInIsLTEZero_uid176_block_rsrvd_fix_q, xout => redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18_q, clk => clk, aclr => areset );

    -- expRFinal_uid178_block_rsrvd_fix(MUX,177)@44
    expRFinal_uid178_block_rsrvd_fix_s <= redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18_q;
    expRFinal_uid178_block_rsrvd_fix_combproc: PROCESS (expRFinal_uid178_block_rsrvd_fix_s, redist51_expRCalc_uid155_block_rsrvd_fix_q_1_q, expRSub_uid175_block_rsrvd_fix_q)
    BEGIN
        CASE (expRFinal_uid178_block_rsrvd_fix_s) IS
            WHEN "0" => expRFinal_uid178_block_rsrvd_fix_q <= redist51_expRCalc_uid155_block_rsrvd_fix_q_1_q;
            WHEN "1" => expRFinal_uid178_block_rsrvd_fix_q <= expRSub_uid175_block_rsrvd_fix_q;
            WHEN OTHERS => expRFinal_uid178_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cstAllZWE_uid53_block_rsrvd_fix(CONSTANT,52)
    cstAllZWE_uid53_block_rsrvd_fix_q <= "00000000000";

    -- invXInSign_uid180_block_rsrvd_fix(LOGICAL,179)@26
    invXInSign_uid180_block_rsrvd_fix_q <= not (redist68_xInSign_uid36_block_rsrvd_fix_b_26_q);

    -- excRZero2_uid181_block_rsrvd_fix(LOGICAL,180)@26
    excRZero2_uid181_block_rsrvd_fix_q <= redist64_xInZero_uid45_block_rsrvd_fix_q_16_q and redist65_yInZero_uid41_block_rsrvd_fix_q_16_q and invXInSign_uid180_block_rsrvd_fix_q;

    -- invYInSign_uid179_block_rsrvd_fix(LOGICAL,178)@26
    invYInSign_uid179_block_rsrvd_fix_q <= not (redist70_yInSign_uid35_block_rsrvd_fix_b_16_q);

    -- excRZero1_uid182_block_rsrvd_fix(LOGICAL,181)@26
    excRZero1_uid182_block_rsrvd_fix_q <= excZ_div_uid460_uid66_block_rsrvd_fix_q and invYInSign_uid179_block_rsrvd_fix_q and invXInSign_uid180_block_rsrvd_fix_q;

    -- excRZero_uid183_block_rsrvd_fix(LOGICAL,182)@26 + 1
    excRZero_uid183_block_rsrvd_fix_qi <= excRZero1_uid182_block_rsrvd_fix_q or excRZero2_uid181_block_rsrvd_fix_q;
    excRZero_uid183_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid183_block_rsrvd_fix_qi, xout => excRZero_uid183_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist49_excRZero_uid183_block_rsrvd_fix_q_18(DELAY,1207)
    redist49_excRZero_uid183_block_rsrvd_fix_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 17, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid183_block_rsrvd_fix_q, xout => redist49_excRZero_uid183_block_rsrvd_fix_q_18_q, clk => clk, aclr => areset );

    -- excSelBits_uid185_block_rsrvd_fix(BITJOIN,184)@44
    excSelBits_uid185_block_rsrvd_fix_q <= redist48_excRNaN_uid184_block_rsrvd_fix_q_32_outputreg_q & GND_q & redist49_excRZero_uid183_block_rsrvd_fix_q_18_q;

    -- outMuxSelEnc_uid186_block_rsrvd_fix(LOOKUP,185)@44
    outMuxSelEnc_uid186_block_rsrvd_fix_combproc: PROCESS (excSelBits_uid185_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excSelBits_uid185_block_rsrvd_fix_q) IS
            WHEN "000" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "01";
            WHEN "001" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "00";
            WHEN "010" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "10";
            WHEN "011" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "01";
            WHEN "100" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "11";
            WHEN "101" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "01";
            WHEN "110" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "01";
            WHEN "111" => outMuxSelEnc_uid186_block_rsrvd_fix_q <= "01";
            WHEN OTHERS => -- unreachable
                           outMuxSelEnc_uid186_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid189_block_rsrvd_fix(MUX,188)@44
    expRPostExc_uid189_block_rsrvd_fix_s <= outMuxSelEnc_uid186_block_rsrvd_fix_q;
    expRPostExc_uid189_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid189_block_rsrvd_fix_s, cstAllZWE_uid53_block_rsrvd_fix_q, expRFinal_uid178_block_rsrvd_fix_q, cstAllOWE_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid189_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid189_block_rsrvd_fix_q <= cstAllZWE_uid53_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid189_block_rsrvd_fix_q <= expRFinal_uid178_block_rsrvd_fix_q;
            WHEN "10" => expRPostExc_uid189_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid189_block_rsrvd_fix_q <= cstAllOWE_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid189_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- subResHigh_uid172_block_rsrvd_fix(BITSELECT,171)@44
    subResHigh_uid172_block_rsrvd_fix_in <= subRes_uid170_block_rsrvd_fix_q(105 downto 0);
    subResHigh_uid172_block_rsrvd_fix_b <= subResHigh_uid172_block_rsrvd_fix_in(105 downto 54);

    -- subResLow_uid173_block_rsrvd_fix(BITSELECT,172)@44
    subResLow_uid173_block_rsrvd_fix_in <= subRes_uid170_block_rsrvd_fix_q(104 downto 0);
    subResLow_uid173_block_rsrvd_fix_b <= subResLow_uid173_block_rsrvd_fix_in(104 downto 53);

    -- fracRSub_uid174_block_rsrvd_fix(MUX,173)@44
    fracRSub_uid174_block_rsrvd_fix_s <= subResNormBit_uid171_block_rsrvd_fix_b;
    fracRSub_uid174_block_rsrvd_fix_combproc: PROCESS (fracRSub_uid174_block_rsrvd_fix_s, subResLow_uid173_block_rsrvd_fix_b, subResHigh_uid172_block_rsrvd_fix_b)
    BEGIN
        CASE (fracRSub_uid174_block_rsrvd_fix_s) IS
            WHEN "0" => fracRSub_uid174_block_rsrvd_fix_q <= subResLow_uid173_block_rsrvd_fix_b;
            WHEN "1" => fracRSub_uid174_block_rsrvd_fix_q <= subResHigh_uid172_block_rsrvd_fix_b;
            WHEN OTHERS => fracRSub_uid174_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRFinal_uid177_block_rsrvd_fix(MUX,176)@44
    fracRFinal_uid177_block_rsrvd_fix_s <= redist50_xInIsLTEZero_uid176_block_rsrvd_fix_q_18_q;
    fracRFinal_uid177_block_rsrvd_fix_combproc: PROCESS (fracRFinal_uid177_block_rsrvd_fix_s, fracRCalc_uid153_block_rsrvd_fix_q, fracRSub_uid174_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRFinal_uid177_block_rsrvd_fix_s) IS
            WHEN "0" => fracRFinal_uid177_block_rsrvd_fix_q <= fracRCalc_uid153_block_rsrvd_fix_q;
            WHEN "1" => fracRFinal_uid177_block_rsrvd_fix_q <= fracRSub_uid174_block_rsrvd_fix_q;
            WHEN OTHERS => fracRFinal_uid177_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostExc_uid188_block_rsrvd_fix(MUX,187)@44
    fracRPostExc_uid188_block_rsrvd_fix_s <= outMuxSelEnc_uid186_block_rsrvd_fix_q;
    fracRPostExc_uid188_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid188_block_rsrvd_fix_s, cstZeroWF_uid8_block_rsrvd_fix_q, fracRFinal_uid177_block_rsrvd_fix_q, cstNaNWF_uid52_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid188_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid188_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid188_block_rsrvd_fix_q <= fracRFinal_uid177_block_rsrvd_fix_q;
            WHEN "10" => fracRPostExc_uid188_block_rsrvd_fix_q <= cstZeroWF_uid8_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid188_block_rsrvd_fix_q <= cstNaNWF_uid52_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid188_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid192_block_rsrvd_fix(BITJOIN,191)@44
    R_uid192_block_rsrvd_fix_q <= signR_uid191_block_rsrvd_fix_q & expRPostExc_uid189_block_rsrvd_fix_q & fracRPostExc_uid188_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,5)@44
    out_primWireOut <= R_uid192_block_rsrvd_fix_q;

END normal;
