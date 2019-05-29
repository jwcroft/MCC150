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

-- VHDL created from floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u
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

entity floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u is
    port (
        in_0 : in std_logic_vector(63 downto 0);  -- float64_m52
        in_1 : in std_logic_vector(63 downto 0);  -- float64_m52
        out_primWireOut : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u;

architecture normal of floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_subBloA0Z140i0k614004ki02975u is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal xGTEy_uid9_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid9_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid9_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid10_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSigY_uid11_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid12_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expY_uid13_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ypn_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal aSig_uid18_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bSig_uid19_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cstAllOWE_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstZeroWF_uid21_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal cstAllZWE_uid22_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal exp_aSig_uid23_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_aSig_uid23_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_aSig_uid24_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_aSig_uid24_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_aSig_uid18_uid25_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid26_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid27_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid28_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid29_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid30_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid30_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid31_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid32_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid33_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid37_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_bSig_uid37_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_bSig_uid38_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_bSig_uid38_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_bSig_uid19_uid39_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid40_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid40_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid41_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid41_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid42_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid43_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid44_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid44_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid45_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid46_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid47_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid52_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid53_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid54_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid58_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid58_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracB_uid61_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expAmExpB_uid62_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid62_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid62_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid62_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cWFP2_uid63_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid65_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid65_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid65_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid65_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightPaddedIn_uid67_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal iShiftedOut_uid69_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid70_block_rsrvd_fix_b : STD_LOGIC_VECTOR (106 downto 0);
    signal alignFracBPostShiftOut_uid70_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid73_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid76_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid78_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid79_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOp_uid82_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid83_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid83_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracAddResult_uid84_block_rsrvd_fix_a : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid84_block_rsrvd_fix_b : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid84_block_rsrvd_fix_o : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid84_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_in : STD_LOGIC_VECTOR (55 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracGRS_uid86_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal cAmA_uid88_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aMinusA_uid89_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid91_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal oneCST_uid92_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expInc_uid93_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid93_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid93_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid93_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expPostNorm_uid94_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid94_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid94_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid94_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Sticky0_uid95_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid95_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid96_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid96_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid97_block_rsrvd_fix_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid97_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid98_block_rsrvd_fix_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid98_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid99_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid99_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid100_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid101_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid102_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid103_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid104_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal fracPostNormRndRange_uid104_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracR_uid105_block_rsrvd_fix_q : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFrac_uid106_block_rsrvd_fix_a : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid106_block_rsrvd_fix_b : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid106_block_rsrvd_fix_o : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid106_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal wEP2AllOwE_uid107_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rndExp_uid108_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExp_uid108_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rOvfEQMax_uid109_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid111_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFracOvfBits_uid111_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid112_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid113_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid114_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rUdfEQMin_uid115_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid116_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rUdfExtraBit_uid116_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid117_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid118_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid118_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExc_uid119_block_rsrvd_fix_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expRPreExc_uid119_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal regInputs_uid120_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid120_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid121_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid122_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid123_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid124_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid125_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid126_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid127_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid128_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid129_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid130_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid131_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid132_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid133_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid134_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid135_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid136_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid137_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid138_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid139_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid139_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid140_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid141_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid142_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid145_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid145_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid149_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid149_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal R_uid150_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal zs_uid152_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid154_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid155_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_in : STD_LOGIC_VECTOR (24 downto 0);
    signal vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cStage_uid157_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid160_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid162_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid166_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid168_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid172_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid174_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid178_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid180_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid185_lzCountVal_uid87_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid186_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid187_lzCountVal_uid87_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal wIntCst_uid191_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng32_uid193_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage0Idx1_uid195_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx2Rng64_uid196_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage0Idx2Pad64_uid197_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx2_uid198_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx3Rng96_uid199_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx3Pad96_uid200_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage0Idx3_uid201_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx1Rng8_uid204_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (98 downto 0);
    signal rightShiftStage1Idx1_uid206_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx2Rng16_uid207_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage1Idx2_uid209_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng24_uid210_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (82 downto 0);
    signal rightShiftStage1Idx3Pad24_uid211_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx3_uid212_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx1Rng2_uid215_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage2Idx1_uid217_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx2Rng4_uid218_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage2Idx2_uid220_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx3Rng6_uid221_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (100 downto 0);
    signal rightShiftStage2Idx3Pad6_uid222_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage2Idx3_uid223_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3Idx1Rng1_uid226_alignmentShifter_uid66_block_rsrvd_fix_b : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage3Idx1_uid228_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal zeroOutCst_uid231_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal r_uid232_alignmentShifter_uid66_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid232_alignmentShifter_uid66_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid238_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid241_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Pad48_uid242_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid244_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid249_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid252_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Pad12_uid253_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid255_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid260_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid263_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Pad3_uid264_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid266_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid71_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyBits_uid71_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (54 downto 0);
    signal rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_aMinusA_uid89_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (55 downto 0);
    signal redist6_effSub_uid54_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sigB_uid53_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sigB_uid53_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sigA_uid52_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_sigA_uid52_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_InvExpXIsZero_uid46_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_excI_bSig_uid43_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expXIsMax_uid40_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_excI_aSig_uid29_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excZ_aSig_uid18_uid25_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_frac_aSig_uid24_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist21_exp_aSig_uid23_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (10 downto 0);

begin


    -- cAmA_uid88_block_rsrvd_fix(CONSTANT,87)
    cAmA_uid88_block_rsrvd_fix_q <= "111001";

    -- zs_uid152_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,151)
    zs_uid152_lzCountVal_uid87_block_rsrvd_fix_q <= "00000000000000000000000000000000";

    -- sigY_uid10_block_rsrvd_fix(BITSELECT,9)@0
    sigY_uid10_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_1(63 downto 63));

    -- invSigY_uid11_block_rsrvd_fix(LOGICAL,10)@0
    invSigY_uid11_block_rsrvd_fix_q <= not (sigY_uid10_block_rsrvd_fix_b);

    -- expY_uid13_block_rsrvd_fix(BITSELECT,12)@0
    expY_uid13_block_rsrvd_fix_b <= in_1(62 downto 52);

    -- fracY_uid12_block_rsrvd_fix(BITSELECT,11)@0
    fracY_uid12_block_rsrvd_fix_b <= in_1(51 downto 0);

    -- ypn_uid14_block_rsrvd_fix(BITJOIN,13)@0
    ypn_uid14_block_rsrvd_fix_q <= invSigY_uid11_block_rsrvd_fix_q & expY_uid13_block_rsrvd_fix_b & fracY_uid12_block_rsrvd_fix_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid8_block_rsrvd_fix(BITSELECT,7)@0
    expFracY_uid8_block_rsrvd_fix_b <= in_1(62 downto 0);

    -- expFracX_uid7_block_rsrvd_fix(BITSELECT,6)@0
    expFracX_uid7_block_rsrvd_fix_b <= in_0(62 downto 0);

    -- xGTEy_uid9_block_rsrvd_fix(COMPARE,8)@0
    xGTEy_uid9_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expFracX_uid7_block_rsrvd_fix_b);
    xGTEy_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expFracY_uid8_block_rsrvd_fix_b);
    xGTEy_uid9_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid9_block_rsrvd_fix_a) - UNSIGNED(xGTEy_uid9_block_rsrvd_fix_b));
    xGTEy_uid9_block_rsrvd_fix_n(0) <= not (xGTEy_uid9_block_rsrvd_fix_o(64));

    -- bSig_uid19_block_rsrvd_fix(MUX,18)@0
    bSig_uid19_block_rsrvd_fix_s <= xGTEy_uid9_block_rsrvd_fix_n;
    bSig_uid19_block_rsrvd_fix_combproc: PROCESS (bSig_uid19_block_rsrvd_fix_s, in_0, ypn_uid14_block_rsrvd_fix_q)
    BEGIN
        CASE (bSig_uid19_block_rsrvd_fix_s) IS
            WHEN "0" => bSig_uid19_block_rsrvd_fix_q <= in_0;
            WHEN "1" => bSig_uid19_block_rsrvd_fix_q <= ypn_uid14_block_rsrvd_fix_q;
            WHEN OTHERS => bSig_uid19_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid53_block_rsrvd_fix(BITSELECT,52)@0
    sigB_uid53_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(bSig_uid19_block_rsrvd_fix_q(63 downto 63));

    -- redist7_sigB_uid53_block_rsrvd_fix_b_1(DELAY,283)
    redist7_sigB_uid53_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid53_block_rsrvd_fix_b, xout => redist7_sigB_uid53_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid18_block_rsrvd_fix(MUX,17)@0
    aSig_uid18_block_rsrvd_fix_s <= xGTEy_uid9_block_rsrvd_fix_n;
    aSig_uid18_block_rsrvd_fix_combproc: PROCESS (aSig_uid18_block_rsrvd_fix_s, ypn_uid14_block_rsrvd_fix_q, in_0)
    BEGIN
        CASE (aSig_uid18_block_rsrvd_fix_s) IS
            WHEN "0" => aSig_uid18_block_rsrvd_fix_q <= ypn_uid14_block_rsrvd_fix_q;
            WHEN "1" => aSig_uid18_block_rsrvd_fix_q <= in_0;
            WHEN OTHERS => aSig_uid18_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid52_block_rsrvd_fix(BITSELECT,51)@0
    sigA_uid52_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(aSig_uid18_block_rsrvd_fix_q(63 downto 63));

    -- redist9_sigA_uid52_block_rsrvd_fix_b_1(DELAY,285)
    redist9_sigA_uid52_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid52_block_rsrvd_fix_b, xout => redist9_sigA_uid52_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid54_block_rsrvd_fix(LOGICAL,53)@1
    effSub_uid54_block_rsrvd_fix_q <= redist9_sigA_uid52_block_rsrvd_fix_b_1_q xor redist7_sigB_uid53_block_rsrvd_fix_b_1_q;

    -- exp_bSig_uid37_block_rsrvd_fix(BITSELECT,36)@0
    exp_bSig_uid37_block_rsrvd_fix_in <= bSig_uid19_block_rsrvd_fix_q(62 downto 0);
    exp_bSig_uid37_block_rsrvd_fix_b <= exp_bSig_uid37_block_rsrvd_fix_in(62 downto 52);

    -- exp_aSig_uid23_block_rsrvd_fix(BITSELECT,22)@0
    exp_aSig_uid23_block_rsrvd_fix_in <= aSig_uid18_block_rsrvd_fix_q(62 downto 0);
    exp_aSig_uid23_block_rsrvd_fix_b <= exp_aSig_uid23_block_rsrvd_fix_in(62 downto 52);

    -- expAmExpB_uid62_block_rsrvd_fix(SUB,61)@0
    expAmExpB_uid62_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid23_block_rsrvd_fix_b);
    expAmExpB_uid62_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid37_block_rsrvd_fix_b);
    expAmExpB_uid62_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid62_block_rsrvd_fix_a) - UNSIGNED(expAmExpB_uid62_block_rsrvd_fix_b));
    expAmExpB_uid62_block_rsrvd_fix_q <= expAmExpB_uid62_block_rsrvd_fix_o(11 downto 0);

    -- cWFP2_uid63_block_rsrvd_fix(CONSTANT,62)
    cWFP2_uid63_block_rsrvd_fix_q <= "110110";

    -- shiftedOut_uid65_block_rsrvd_fix(COMPARE,64)@0 + 1
    shiftedOut_uid65_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00000000" & cWFP2_uid63_block_rsrvd_fix_q);
    shiftedOut_uid65_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid62_block_rsrvd_fix_q);
    shiftedOut_uid65_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid65_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid65_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid65_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid65_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid65_block_rsrvd_fix_c(0) <= shiftedOut_uid65_block_rsrvd_fix_o(13);

    -- iShiftedOut_uid69_block_rsrvd_fix(LOGICAL,68)@1
    iShiftedOut_uid69_block_rsrvd_fix_q <= not (shiftedOut_uid65_block_rsrvd_fix_c);

    -- zeroOutCst_uid231_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,230)
    zeroOutCst_uid231_alignmentShifter_uid66_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Rng1_uid226_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,225)@1
    rightShiftStage3Idx1Rng1_uid226_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 1);

    -- rightShiftStage3Idx1_uid228_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,227)@1
    rightShiftStage3Idx1_uid228_alignmentShifter_uid66_block_rsrvd_fix_q <= GND_q & rightShiftStage3Idx1Rng1_uid226_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- rightShiftStage2Idx3Pad6_uid222_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,221)
    rightShiftStage2Idx3Pad6_uid222_alignmentShifter_uid66_block_rsrvd_fix_q <= "000000";

    -- rightShiftStage2Idx3Rng6_uid221_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,220)@1
    rightShiftStage2Idx3Rng6_uid221_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 6);

    -- rightShiftStage2Idx3_uid223_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,222)@1
    rightShiftStage2Idx3_uid223_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage2Idx3Pad6_uid222_alignmentShifter_uid66_block_rsrvd_fix_q & rightShiftStage2Idx3Rng6_uid221_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- zs_uid172_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,171)
    zs_uid172_lzCountVal_uid87_block_rsrvd_fix_q <= "0000";

    -- rightShiftStage2Idx2Rng4_uid218_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,217)@1
    rightShiftStage2Idx2Rng4_uid218_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 4);

    -- rightShiftStage2Idx2_uid220_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,219)@1
    rightShiftStage2Idx2_uid220_alignmentShifter_uid66_block_rsrvd_fix_q <= zs_uid172_lzCountVal_uid87_block_rsrvd_fix_q & rightShiftStage2Idx2Rng4_uid218_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- zs_uid178_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,177)
    zs_uid178_lzCountVal_uid87_block_rsrvd_fix_q <= "00";

    -- rightShiftStage2Idx1Rng2_uid215_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,214)@1
    rightShiftStage2Idx1Rng2_uid215_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 2);

    -- rightShiftStage2Idx1_uid217_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,216)@1
    rightShiftStage2Idx1_uid217_alignmentShifter_uid66_block_rsrvd_fix_q <= zs_uid178_lzCountVal_uid87_block_rsrvd_fix_q & rightShiftStage2Idx1Rng2_uid215_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- rightShiftStage1Idx3Pad24_uid211_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,210)
    rightShiftStage1Idx3Pad24_uid211_alignmentShifter_uid66_block_rsrvd_fix_q <= "000000000000000000000000";

    -- rightShiftStage1Idx3Rng24_uid210_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,209)@1
    rightShiftStage1Idx3Rng24_uid210_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 24);

    -- rightShiftStage1Idx3_uid212_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,211)@1
    rightShiftStage1Idx3_uid212_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage1Idx3Pad24_uid211_alignmentShifter_uid66_block_rsrvd_fix_q & rightShiftStage1Idx3Rng24_uid210_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- zs_uid160_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,159)
    zs_uid160_lzCountVal_uid87_block_rsrvd_fix_q <= "0000000000000000";

    -- rightShiftStage1Idx2Rng16_uid207_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,206)@1
    rightShiftStage1Idx2Rng16_uid207_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 16);

    -- rightShiftStage1Idx2_uid209_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,208)@1
    rightShiftStage1Idx2_uid209_alignmentShifter_uid66_block_rsrvd_fix_q <= zs_uid160_lzCountVal_uid87_block_rsrvd_fix_q & rightShiftStage1Idx2Rng16_uid207_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- zs_uid166_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,165)
    zs_uid166_lzCountVal_uid87_block_rsrvd_fix_q <= "00000000";

    -- rightShiftStage1Idx1Rng8_uid204_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,203)@1
    rightShiftStage1Idx1Rng8_uid204_alignmentShifter_uid66_block_rsrvd_fix_b <= rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q(106 downto 8);

    -- rightShiftStage1Idx1_uid206_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,205)@1
    rightShiftStage1Idx1_uid206_alignmentShifter_uid66_block_rsrvd_fix_q <= zs_uid166_lzCountVal_uid87_block_rsrvd_fix_q & rightShiftStage1Idx1Rng8_uid204_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- rightShiftStage0Idx3Pad96_uid200_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,199)
    rightShiftStage0Idx3Pad96_uid200_alignmentShifter_uid66_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng96_uid199_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,198)@1
    rightShiftStage0Idx3Rng96_uid199_alignmentShifter_uid66_block_rsrvd_fix_b <= rightPaddedIn_uid67_block_rsrvd_fix_q(106 downto 96);

    -- rightShiftStage0Idx3_uid201_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,200)@1
    rightShiftStage0Idx3_uid201_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0Idx3Pad96_uid200_alignmentShifter_uid66_block_rsrvd_fix_q & rightShiftStage0Idx3Rng96_uid199_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- rightShiftStage0Idx2Pad64_uid197_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,196)
    rightShiftStage0Idx2Pad64_uid197_alignmentShifter_uid66_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng64_uid196_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,195)@1
    rightShiftStage0Idx2Rng64_uid196_alignmentShifter_uid66_block_rsrvd_fix_b <= rightPaddedIn_uid67_block_rsrvd_fix_q(106 downto 64);

    -- rightShiftStage0Idx2_uid198_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,197)@1
    rightShiftStage0Idx2_uid198_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0Idx2Pad64_uid197_alignmentShifter_uid66_block_rsrvd_fix_q & rightShiftStage0Idx2Rng64_uid196_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- rightShiftStage0Idx1Rng32_uid193_alignmentShifter_uid66_block_rsrvd_fix(BITSELECT,192)@1
    rightShiftStage0Idx1Rng32_uid193_alignmentShifter_uid66_block_rsrvd_fix_b <= rightPaddedIn_uid67_block_rsrvd_fix_q(106 downto 32);

    -- rightShiftStage0Idx1_uid195_alignmentShifter_uid66_block_rsrvd_fix(BITJOIN,194)@1
    rightShiftStage0Idx1_uid195_alignmentShifter_uid66_block_rsrvd_fix_q <= zs_uid152_lzCountVal_uid87_block_rsrvd_fix_q & rightShiftStage0Idx1Rng32_uid193_alignmentShifter_uid66_block_rsrvd_fix_b;

    -- cstAllZWE_uid22_block_rsrvd_fix(CONSTANT,21)
    cstAllZWE_uid22_block_rsrvd_fix_q <= "00000000000";

    -- excZ_bSig_uid19_uid39_block_rsrvd_fix(LOGICAL,38)@0
    excZ_bSig_uid19_uid39_block_rsrvd_fix_q <= "1" WHEN exp_bSig_uid37_block_rsrvd_fix_b = cstAllZWE_uid22_block_rsrvd_fix_q ELSE "0";

    -- redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1(DELAY,291)
    redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid19_uid39_block_rsrvd_fix_q, xout => redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid46_block_rsrvd_fix(LOGICAL,45)@1
    InvExpXIsZero_uid46_block_rsrvd_fix_q <= not (redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1_q);

    -- cstZeroWF_uid21_block_rsrvd_fix(CONSTANT,20)
    cstZeroWF_uid21_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000";

    -- frac_bSig_uid38_block_rsrvd_fix(BITSELECT,37)@0
    frac_bSig_uid38_block_rsrvd_fix_in <= bSig_uid19_block_rsrvd_fix_q(51 downto 0);
    frac_bSig_uid38_block_rsrvd_fix_b <= frac_bSig_uid38_block_rsrvd_fix_in(51 downto 0);

    -- fracBz_uid58_block_rsrvd_fix(MUX,57)@0 + 1
    fracBz_uid58_block_rsrvd_fix_s <= excZ_bSig_uid19_uid39_block_rsrvd_fix_q;
    fracBz_uid58_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracBz_uid58_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracBz_uid58_block_rsrvd_fix_s) IS
                WHEN "0" => fracBz_uid58_block_rsrvd_fix_q <= frac_bSig_uid38_block_rsrvd_fix_b;
                WHEN "1" => fracBz_uid58_block_rsrvd_fix_q <= cstZeroWF_uid21_block_rsrvd_fix_q;
                WHEN OTHERS => fracBz_uid58_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracB_uid61_block_rsrvd_fix(BITJOIN,60)@1
    oFracB_uid61_block_rsrvd_fix_q <= InvExpXIsZero_uid46_block_rsrvd_fix_q & fracBz_uid58_block_rsrvd_fix_q;

    -- padConst_uid66_block_rsrvd_fix(CONSTANT,65)
    padConst_uid66_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid67_block_rsrvd_fix(BITJOIN,66)@1
    rightPaddedIn_uid67_block_rsrvd_fix_q <= oFracB_uid61_block_rsrvd_fix_q & padConst_uid66_block_rsrvd_fix_q;

    -- rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select(BITSELECT,269)@0
    rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in <= expAmExpB_uid62_block_rsrvd_fix_q(6 downto 0);
    rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b <= rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in(6 downto 5);
    rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c <= rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in(4 downto 3);
    rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d <= rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in(2 downto 1);
    rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e <= rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_in(0 downto 0);

    -- redist0_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b_1(DELAY,276)
    redist0_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b, xout => redist0_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix(MUX,202)@1
    rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_s <= redist0_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_b_1_q;
    rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_s, rightPaddedIn_uid67_block_rsrvd_fix_q, rightShiftStage0Idx1_uid195_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage0Idx2_uid198_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage0Idx3_uid201_alignmentShifter_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q <= rightPaddedIn_uid67_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid195_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid198_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0Idx3_uid201_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c_1(DELAY,277)
    redist1_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c, xout => redist1_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix(MUX,213)@1
    rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_s <= redist1_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_c_1_q;
    rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_s, rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage1Idx1_uid206_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage1Idx2_uid209_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage1Idx3_uid212_alignmentShifter_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage0_uid203_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid206_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid209_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid212_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d_1(DELAY,278)
    redist2_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d, xout => redist2_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix(MUX,224)@1
    rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_s <= redist2_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_d_1_q;
    rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_combproc: PROCESS (rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_s, rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage2Idx1_uid217_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage2Idx2_uid220_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage2Idx3_uid223_alignmentShifter_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage1_uid214_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid217_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage2Idx2_uid220_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage2Idx3_uid223_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e_1(DELAY,279)
    redist3_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e, xout => redist3_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e_1_q, clk => clk, aclr => areset );

    -- rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix(MUX,229)@1
    rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_s <= redist3_rightShiftStageSel6Dto5_uid202_alignmentShifter_uid66_block_rsrvd_fix_merged_bit_select_e_1_q;
    rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_combproc: PROCESS (rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_s, rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q, rightShiftStage3Idx1_uid228_alignmentShifter_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_s) IS
            WHEN "0" => rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage2_uid225_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "1" => rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage3Idx1_uid228_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid191_alignmentShifter_uid66_block_rsrvd_fix(CONSTANT,190)
    wIntCst_uid191_alignmentShifter_uid66_block_rsrvd_fix_q <= "1101011";

    -- shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix(COMPARE,191)@0 + 1
    shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid62_block_rsrvd_fix_q);
    shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000" & wIntCst_uid191_alignmentShifter_uid66_block_rsrvd_fix_q);
    shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_n(0) <= not (shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_o(13));

    -- r_uid232_alignmentShifter_uid66_block_rsrvd_fix(MUX,231)@1
    r_uid232_alignmentShifter_uid66_block_rsrvd_fix_s <= shiftedOut_uid192_alignmentShifter_uid66_block_rsrvd_fix_n;
    r_uid232_alignmentShifter_uid66_block_rsrvd_fix_combproc: PROCESS (r_uid232_alignmentShifter_uid66_block_rsrvd_fix_s, rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q, zeroOutCst_uid231_alignmentShifter_uid66_block_rsrvd_fix_q)
    BEGIN
        CASE (r_uid232_alignmentShifter_uid66_block_rsrvd_fix_s) IS
            WHEN "0" => r_uid232_alignmentShifter_uid66_block_rsrvd_fix_q <= rightShiftStage3_uid230_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN "1" => r_uid232_alignmentShifter_uid66_block_rsrvd_fix_q <= zeroOutCst_uid231_alignmentShifter_uid66_block_rsrvd_fix_q;
            WHEN OTHERS => r_uid232_alignmentShifter_uid66_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid70_block_rsrvd_fix(LOGICAL,69)@1
    alignFracBPostShiftOut_uid70_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((106 downto 1 => iShiftedOut_uid69_block_rsrvd_fix_q(0)) & iShiftedOut_uid69_block_rsrvd_fix_q));
    alignFracBPostShiftOut_uid70_block_rsrvd_fix_q <= r_uid232_alignmentShifter_uid66_block_rsrvd_fix_q and alignFracBPostShiftOut_uid70_block_rsrvd_fix_b;

    -- stickyBits_uid71_block_rsrvd_fix_merged_bit_select(BITSELECT,270)@1
    stickyBits_uid71_block_rsrvd_fix_merged_bit_select_b <= alignFracBPostShiftOut_uid70_block_rsrvd_fix_q(51 downto 0);
    stickyBits_uid71_block_rsrvd_fix_merged_bit_select_c <= alignFracBPostShiftOut_uid70_block_rsrvd_fix_q(106 downto 52);

    -- fracBAddOp_uid82_block_rsrvd_fix(BITJOIN,81)@1
    fracBAddOp_uid82_block_rsrvd_fix_q <= GND_q & stickyBits_uid71_block_rsrvd_fix_merged_bit_select_c;

    -- fracBAddOpPostXor_uid83_block_rsrvd_fix(LOGICAL,82)@1
    fracBAddOpPostXor_uid83_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((55 downto 1 => effSub_uid54_block_rsrvd_fix_q(0)) & effSub_uid54_block_rsrvd_fix_q));
    fracBAddOpPostXor_uid83_block_rsrvd_fix_q <= fracBAddOp_uid82_block_rsrvd_fix_q xor fracBAddOpPostXor_uid83_block_rsrvd_fix_b;

    -- zocst_uid78_block_rsrvd_fix(CONSTANT,77)
    zocst_uid78_block_rsrvd_fix_q <= "01";

    -- frac_aSig_uid24_block_rsrvd_fix(BITSELECT,23)@0
    frac_aSig_uid24_block_rsrvd_fix_in <= aSig_uid18_block_rsrvd_fix_q(51 downto 0);
    frac_aSig_uid24_block_rsrvd_fix_b <= frac_aSig_uid24_block_rsrvd_fix_in(51 downto 0);

    -- redist20_frac_aSig_uid24_block_rsrvd_fix_b_1(DELAY,296)
    redist20_frac_aSig_uid24_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid24_block_rsrvd_fix_b, xout => redist20_frac_aSig_uid24_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid73_block_rsrvd_fix(LOGICAL,72)@1
    cmpEQ_stickyBits_cZwF_uid73_block_rsrvd_fix_q <= "1" WHEN stickyBits_uid71_block_rsrvd_fix_merged_bit_select_b = cstZeroWF_uid21_block_rsrvd_fix_q ELSE "0";

    -- effSubInvSticky_uid76_block_rsrvd_fix(LOGICAL,75)@1
    effSubInvSticky_uid76_block_rsrvd_fix_q <= effSub_uid54_block_rsrvd_fix_q and cmpEQ_stickyBits_cZwF_uid73_block_rsrvd_fix_q;

    -- fracAAddOp_uid79_block_rsrvd_fix(BITJOIN,78)@1
    fracAAddOp_uid79_block_rsrvd_fix_q <= zocst_uid78_block_rsrvd_fix_q & redist20_frac_aSig_uid24_block_rsrvd_fix_b_1_q & GND_q & effSubInvSticky_uid76_block_rsrvd_fix_q;

    -- fracAddResult_uid84_block_rsrvd_fix(ADD,83)@1
    fracAddResult_uid84_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid79_block_rsrvd_fix_q);
    fracAddResult_uid84_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid83_block_rsrvd_fix_q);
    fracAddResult_uid84_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid84_block_rsrvd_fix_a) + UNSIGNED(fracAddResult_uid84_block_rsrvd_fix_b));
    fracAddResult_uid84_block_rsrvd_fix_q <= fracAddResult_uid84_block_rsrvd_fix_o(56 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix(BITSELECT,84)@1
    rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_in <= fracAddResult_uid84_block_rsrvd_fix_q(55 downto 0);
    rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b <= rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_in(55 downto 0);

    -- redist5_rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b_1(DELAY,281)
    redist5_rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 56, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b, xout => redist5_rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix(LOGICAL,73)@1 + 1
    invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_qi <= not (cmpEQ_stickyBits_cZwF_uid73_block_rsrvd_fix_q);
    invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_qi, xout => invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracGRS_uid86_block_rsrvd_fix(BITJOIN,85)@2
    fracGRS_uid86_block_rsrvd_fix_q <= redist5_rangeFracAddResultMwfp3Dto0_uid85_block_rsrvd_fix_b_1_q & invCmpEQ_stickyBits_cZwF_uid74_block_rsrvd_fix_q;

    -- rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix(BITSELECT,152)@2
    rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix_b <= fracGRS_uid86_block_rsrvd_fix_q(56 downto 25);

    -- vCount_uid154_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,153)@2
    vCount_uid154_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix_b = zs_uid152_lzCountVal_uid87_block_rsrvd_fix_q ELSE "0";

    -- vStage_uid156_lzCountVal_uid87_block_rsrvd_fix(BITSELECT,155)@2
    vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_in <= fracGRS_uid86_block_rsrvd_fix_q(24 downto 0);
    vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_b <= vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_in(24 downto 0);

    -- mO_uid155_lzCountVal_uid87_block_rsrvd_fix(CONSTANT,154)
    mO_uid155_lzCountVal_uid87_block_rsrvd_fix_q <= "1111111";

    -- cStage_uid157_lzCountVal_uid87_block_rsrvd_fix(BITJOIN,156)@2
    cStage_uid157_lzCountVal_uid87_block_rsrvd_fix_q <= vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_b & mO_uid155_lzCountVal_uid87_block_rsrvd_fix_q;

    -- vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix(MUX,158)@2
    vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_s <= vCount_uid154_lzCountVal_uid87_block_rsrvd_fix_q;
    vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_combproc: PROCESS (vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_s, rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix_b, cStage_uid157_lzCountVal_uid87_block_rsrvd_fix_q)
    BEGIN
        CASE (vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid153_lzCountVal_uid87_block_rsrvd_fix_b;
            WHEN "1" => vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q <= cStage_uid157_lzCountVal_uid87_block_rsrvd_fix_q;
            WHEN OTHERS => vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select(BITSELECT,271)@2
    rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q(31 downto 16);
    rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid159_lzCountVal_uid87_block_rsrvd_fix_q(15 downto 0);

    -- vCount_uid162_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,161)@2
    vCount_uid162_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b = zs_uid160_lzCountVal_uid87_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix(MUX,164)@2
    vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_s <= vCount_uid162_lzCountVal_uid87_block_rsrvd_fix_q;
    vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_combproc: PROCESS (vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_s, rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b, rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid161_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select(BITSELECT,272)@2
    rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q(15 downto 8);
    rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid165_lzCountVal_uid87_block_rsrvd_fix_q(7 downto 0);

    -- vCount_uid168_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,167)@2
    vCount_uid168_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b = zs_uid166_lzCountVal_uid87_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix(MUX,170)@2
    vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_s <= vCount_uid168_lzCountVal_uid87_block_rsrvd_fix_q;
    vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_combproc: PROCESS (vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_s, rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b, rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid167_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select(BITSELECT,273)@2
    rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q(7 downto 4);
    rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid171_lzCountVal_uid87_block_rsrvd_fix_q(3 downto 0);

    -- vCount_uid174_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,173)@2
    vCount_uid174_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b = zs_uid172_lzCountVal_uid87_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix(MUX,176)@2
    vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_s <= vCount_uid174_lzCountVal_uid87_block_rsrvd_fix_q;
    vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_combproc: PROCESS (vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_s, rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b, rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid173_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select(BITSELECT,274)@2
    rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q(3 downto 2);
    rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid177_lzCountVal_uid87_block_rsrvd_fix_q(1 downto 0);

    -- vCount_uid180_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,179)@2
    vCount_uid180_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b = zs_uid178_lzCountVal_uid87_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix(MUX,182)@2
    vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_s <= vCount_uid180_lzCountVal_uid87_block_rsrvd_fix_q;
    vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_combproc: PROCESS (vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_s, rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b, rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_q <= rVStage_uid179_lzCountVal_uid87_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid185_lzCountVal_uid87_block_rsrvd_fix(BITSELECT,184)@2
    rVStage_uid185_lzCountVal_uid87_block_rsrvd_fix_b <= vStagei_uid183_lzCountVal_uid87_block_rsrvd_fix_q(1 downto 1);

    -- vCount_uid186_lzCountVal_uid87_block_rsrvd_fix(LOGICAL,185)@2
    vCount_uid186_lzCountVal_uid87_block_rsrvd_fix_q <= "1" WHEN rVStage_uid185_lzCountVal_uid87_block_rsrvd_fix_b = GND_q ELSE "0";

    -- r_uid187_lzCountVal_uid87_block_rsrvd_fix(BITJOIN,186)@2
    r_uid187_lzCountVal_uid87_block_rsrvd_fix_q <= vCount_uid154_lzCountVal_uid87_block_rsrvd_fix_q & vCount_uid162_lzCountVal_uid87_block_rsrvd_fix_q & vCount_uid168_lzCountVal_uid87_block_rsrvd_fix_q & vCount_uid174_lzCountVal_uid87_block_rsrvd_fix_q & vCount_uid180_lzCountVal_uid87_block_rsrvd_fix_q & vCount_uid186_lzCountVal_uid87_block_rsrvd_fix_q;

    -- aMinusA_uid89_block_rsrvd_fix(LOGICAL,88)@2
    aMinusA_uid89_block_rsrvd_fix_q <= "1" WHEN r_uid187_lzCountVal_uid87_block_rsrvd_fix_q = cAmA_uid88_block_rsrvd_fix_q ELSE "0";

    -- invAMinusA_uid131_block_rsrvd_fix(LOGICAL,130)@2
    invAMinusA_uid131_block_rsrvd_fix_q <= not (aMinusA_uid89_block_rsrvd_fix_q);

    -- redist10_sigA_uid52_block_rsrvd_fix_b_2(DELAY,286)
    redist10_sigA_uid52_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_sigA_uid52_block_rsrvd_fix_b_1_q, xout => redist10_sigA_uid52_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid20_block_rsrvd_fix(CONSTANT,19)
    cstAllOWE_uid20_block_rsrvd_fix_q <= "11111111111";

    -- expXIsMax_uid40_block_rsrvd_fix(LOGICAL,39)@0 + 1
    expXIsMax_uid40_block_rsrvd_fix_qi <= "1" WHEN exp_bSig_uid37_block_rsrvd_fix_b = cstAllOWE_uid20_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid40_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid40_block_rsrvd_fix_qi, xout => expXIsMax_uid40_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist14_expXIsMax_uid40_block_rsrvd_fix_q_2(DELAY,290)
    redist14_expXIsMax_uid40_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid40_block_rsrvd_fix_q, xout => redist14_expXIsMax_uid40_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid45_block_rsrvd_fix(LOGICAL,44)@2
    invExpXIsMax_uid45_block_rsrvd_fix_q <= not (redist14_expXIsMax_uid40_block_rsrvd_fix_q_2_q);

    -- redist11_InvExpXIsZero_uid46_block_rsrvd_fix_q_1(DELAY,287)
    redist11_InvExpXIsZero_uid46_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid46_block_rsrvd_fix_q, xout => redist11_InvExpXIsZero_uid46_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid47_block_rsrvd_fix(LOGICAL,46)@2
    excR_bSig_uid47_block_rsrvd_fix_q <= redist11_InvExpXIsZero_uid46_block_rsrvd_fix_q_1_q and invExpXIsMax_uid45_block_rsrvd_fix_q;

    -- redist21_exp_aSig_uid23_block_rsrvd_fix_b_2(DELAY,297)
    redist21_exp_aSig_uid23_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid23_block_rsrvd_fix_b, xout => redist21_exp_aSig_uid23_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid26_block_rsrvd_fix(LOGICAL,25)@2
    expXIsMax_uid26_block_rsrvd_fix_q <= "1" WHEN redist21_exp_aSig_uid23_block_rsrvd_fix_b_2_q = cstAllOWE_uid20_block_rsrvd_fix_q ELSE "0";

    -- invExpXIsMax_uid31_block_rsrvd_fix(LOGICAL,30)@2
    invExpXIsMax_uid31_block_rsrvd_fix_q <= not (expXIsMax_uid26_block_rsrvd_fix_q);

    -- excZ_aSig_uid18_uid25_block_rsrvd_fix(LOGICAL,24)@2
    excZ_aSig_uid18_uid25_block_rsrvd_fix_q <= "1" WHEN redist21_exp_aSig_uid23_block_rsrvd_fix_b_2_q = cstAllZWE_uid22_block_rsrvd_fix_q ELSE "0";

    -- InvExpXIsZero_uid32_block_rsrvd_fix(LOGICAL,31)@2
    InvExpXIsZero_uid32_block_rsrvd_fix_q <= not (excZ_aSig_uid18_uid25_block_rsrvd_fix_q);

    -- excR_aSig_uid33_block_rsrvd_fix(LOGICAL,32)@2
    excR_aSig_uid33_block_rsrvd_fix_q <= InvExpXIsZero_uid32_block_rsrvd_fix_q and invExpXIsMax_uid31_block_rsrvd_fix_q;

    -- signRReg_uid132_block_rsrvd_fix(LOGICAL,131)@2
    signRReg_uid132_block_rsrvd_fix_q <= excR_aSig_uid33_block_rsrvd_fix_q and excR_bSig_uid47_block_rsrvd_fix_q and redist10_sigA_uid52_block_rsrvd_fix_b_2_q and invAMinusA_uid131_block_rsrvd_fix_q;

    -- redist8_sigB_uid53_block_rsrvd_fix_b_2(DELAY,284)
    redist8_sigB_uid53_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_sigB_uid53_block_rsrvd_fix_b_1_q, xout => redist8_sigB_uid53_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2(DELAY,292)
    redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_1_q, xout => redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid136_block_rsrvd_fix(LOGICAL,135)@2
    excAZBZSigASigB_uid136_block_rsrvd_fix_q <= excZ_aSig_uid18_uid25_block_rsrvd_fix_q and redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2_q and redist10_sigA_uid52_block_rsrvd_fix_b_2_q and redist8_sigB_uid53_block_rsrvd_fix_b_2_q;

    -- excBZARSigA_uid137_block_rsrvd_fix(LOGICAL,136)@2
    excBZARSigA_uid137_block_rsrvd_fix_q <= redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2_q and excR_aSig_uid33_block_rsrvd_fix_q and redist10_sigA_uid52_block_rsrvd_fix_b_2_q;

    -- signRZero_uid138_block_rsrvd_fix(LOGICAL,137)@2
    signRZero_uid138_block_rsrvd_fix_q <= excBZARSigA_uid137_block_rsrvd_fix_q or excAZBZSigASigB_uid136_block_rsrvd_fix_q;

    -- fracXIsZero_uid41_block_rsrvd_fix(LOGICAL,40)@0 + 1
    fracXIsZero_uid41_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid21_block_rsrvd_fix_q = frac_bSig_uid38_block_rsrvd_fix_b ELSE "0";
    fracXIsZero_uid41_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid41_block_rsrvd_fix_qi, xout => fracXIsZero_uid41_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2(DELAY,289)
    redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid41_block_rsrvd_fix_q, xout => redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excI_bSig_uid43_block_rsrvd_fix(LOGICAL,42)@2
    excI_bSig_uid43_block_rsrvd_fix_q <= redist14_expXIsMax_uid40_block_rsrvd_fix_q_2_q and redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2_q;

    -- sigBBInf_uid133_block_rsrvd_fix(LOGICAL,132)@2
    sigBBInf_uid133_block_rsrvd_fix_q <= redist8_sigB_uid53_block_rsrvd_fix_b_2_q and excI_bSig_uid43_block_rsrvd_fix_q;

    -- fracXIsZero_uid27_block_rsrvd_fix(LOGICAL,26)@1 + 1
    fracXIsZero_uid27_block_rsrvd_fix_qi <= "1" WHEN cstZeroWF_uid21_block_rsrvd_fix_q = redist20_frac_aSig_uid24_block_rsrvd_fix_b_1_q ELSE "0";
    fracXIsZero_uid27_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid27_block_rsrvd_fix_qi, xout => fracXIsZero_uid27_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excI_aSig_uid29_block_rsrvd_fix(LOGICAL,28)@2
    excI_aSig_uid29_block_rsrvd_fix_q <= expXIsMax_uid26_block_rsrvd_fix_q and fracXIsZero_uid27_block_rsrvd_fix_q;

    -- sigAAInf_uid134_block_rsrvd_fix(LOGICAL,133)@2
    sigAAInf_uid134_block_rsrvd_fix_q <= redist10_sigA_uid52_block_rsrvd_fix_b_2_q and excI_aSig_uid29_block_rsrvd_fix_q;

    -- signRInf_uid135_block_rsrvd_fix(LOGICAL,134)@2
    signRInf_uid135_block_rsrvd_fix_q <= sigAAInf_uid134_block_rsrvd_fix_q or sigBBInf_uid133_block_rsrvd_fix_q;

    -- signRInfRZRReg_uid139_block_rsrvd_fix(LOGICAL,138)@2 + 1
    signRInfRZRReg_uid139_block_rsrvd_fix_qi <= signRInf_uid135_block_rsrvd_fix_q or signRZero_uid138_block_rsrvd_fix_q or signRReg_uid132_block_rsrvd_fix_q;
    signRInfRZRReg_uid139_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid139_block_rsrvd_fix_qi, xout => signRInfRZRReg_uid139_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid42_block_rsrvd_fix(LOGICAL,41)@2
    fracXIsNotZero_uid42_block_rsrvd_fix_q <= not (redist13_fracXIsZero_uid41_block_rsrvd_fix_q_2_q);

    -- excN_bSig_uid44_block_rsrvd_fix(LOGICAL,43)@2 + 1
    excN_bSig_uid44_block_rsrvd_fix_qi <= redist14_expXIsMax_uid40_block_rsrvd_fix_q_2_q and fracXIsNotZero_uid42_block_rsrvd_fix_q;
    excN_bSig_uid44_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid44_block_rsrvd_fix_qi, xout => excN_bSig_uid44_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid28_block_rsrvd_fix(LOGICAL,27)@2
    fracXIsNotZero_uid28_block_rsrvd_fix_q <= not (fracXIsZero_uid27_block_rsrvd_fix_q);

    -- excN_aSig_uid30_block_rsrvd_fix(LOGICAL,29)@2 + 1
    excN_aSig_uid30_block_rsrvd_fix_qi <= expXIsMax_uid26_block_rsrvd_fix_q and fracXIsNotZero_uid28_block_rsrvd_fix_q;
    excN_aSig_uid30_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid30_block_rsrvd_fix_qi, xout => excN_aSig_uid30_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excRNaN2_uid126_block_rsrvd_fix(LOGICAL,125)@3
    excRNaN2_uid126_block_rsrvd_fix_q <= excN_aSig_uid30_block_rsrvd_fix_q or excN_bSig_uid44_block_rsrvd_fix_q;

    -- redist6_effSub_uid54_block_rsrvd_fix_q_2(DELAY,282)
    redist6_effSub_uid54_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid54_block_rsrvd_fix_q, xout => redist6_effSub_uid54_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- redist12_excI_bSig_uid43_block_rsrvd_fix_q_1(DELAY,288)
    redist12_excI_bSig_uid43_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid43_block_rsrvd_fix_q, xout => redist12_excI_bSig_uid43_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- redist18_excI_aSig_uid29_block_rsrvd_fix_q_1(DELAY,294)
    redist18_excI_aSig_uid29_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid29_block_rsrvd_fix_q, xout => redist18_excI_aSig_uid29_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid127_block_rsrvd_fix(LOGICAL,126)@3
    excAIBISub_uid127_block_rsrvd_fix_q <= redist18_excI_aSig_uid29_block_rsrvd_fix_q_1_q and redist12_excI_bSig_uid43_block_rsrvd_fix_q_1_q and redist6_effSub_uid54_block_rsrvd_fix_q_2_q;

    -- excRNaN_uid128_block_rsrvd_fix(LOGICAL,127)@3
    excRNaN_uid128_block_rsrvd_fix_q <= excAIBISub_uid127_block_rsrvd_fix_q or excRNaN2_uid126_block_rsrvd_fix_q;

    -- invExcRNaN_uid140_block_rsrvd_fix(LOGICAL,139)@3
    invExcRNaN_uid140_block_rsrvd_fix_q <= not (excRNaN_uid128_block_rsrvd_fix_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid141_block_rsrvd_fix(LOGICAL,140)@3
    signRPostExc_uid141_block_rsrvd_fix_q <= invExcRNaN_uid140_block_rsrvd_fix_q and signRInfRZRReg_uid139_block_rsrvd_fix_q;

    -- cRBit_uid101_block_rsrvd_fix(CONSTANT,100)
    cRBit_uid101_block_rsrvd_fix_q <= "01000";

    -- leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,264)@2
    leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_in(53 downto 0);

    -- leftShiftStage2Idx3Pad3_uid264_fracPostNormExt_uid90_block_rsrvd_fix(CONSTANT,263)
    leftShiftStage2Idx3Pad3_uid264_fracPostNormExt_uid90_block_rsrvd_fix_q <= "000";

    -- leftShiftStage2Idx3_uid266_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,265)@2
    leftShiftStage2Idx3_uid266_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx3Rng3_uid265_fracPostNormExt_uid90_block_rsrvd_fix_b & leftShiftStage2Idx3Pad3_uid264_fracPostNormExt_uid90_block_rsrvd_fix_q;

    -- leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,261)@2
    leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_in(54 downto 0);

    -- leftShiftStage2Idx2_uid263_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,262)@2
    leftShiftStage2Idx2_uid263_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx2Rng2_uid262_fracPostNormExt_uid90_block_rsrvd_fix_b & zs_uid178_lzCountVal_uid87_block_rsrvd_fix_q;

    -- leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,258)@2
    leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_in(55 downto 0);

    -- leftShiftStage2Idx1_uid260_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,259)@2
    leftShiftStage2Idx1_uid260_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx1Rng1_uid259_fracPostNormExt_uid90_block_rsrvd_fix_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,253)@2
    leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_in(44 downto 0);

    -- leftShiftStage1Idx3Pad12_uid253_fracPostNormExt_uid90_block_rsrvd_fix(CONSTANT,252)
    leftShiftStage1Idx3Pad12_uid253_fracPostNormExt_uid90_block_rsrvd_fix_q <= "000000000000";

    -- leftShiftStage1Idx3_uid255_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,254)@2
    leftShiftStage1Idx3_uid255_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx3Rng12_uid254_fracPostNormExt_uid90_block_rsrvd_fix_b & leftShiftStage1Idx3Pad12_uid253_fracPostNormExt_uid90_block_rsrvd_fix_q;

    -- leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,250)@2
    leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_in(48 downto 0);

    -- leftShiftStage1Idx2_uid252_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,251)@2
    leftShiftStage1Idx2_uid252_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx2Rng8_uid251_fracPostNormExt_uid90_block_rsrvd_fix_b & zs_uid166_lzCountVal_uid87_block_rsrvd_fix_q;

    -- leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,247)@2
    leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_in <= leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_in(52 downto 0);

    -- leftShiftStage1Idx1_uid249_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,248)@2
    leftShiftStage1Idx1_uid249_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx1Rng4_uid248_fracPostNormExt_uid90_block_rsrvd_fix_b & zs_uid172_lzCountVal_uid87_block_rsrvd_fix_q;

    -- leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,242)@2
    leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_in <= fracGRS_uid86_block_rsrvd_fix_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_in(8 downto 0);

    -- leftShiftStage0Idx3Pad48_uid242_fracPostNormExt_uid90_block_rsrvd_fix(CONSTANT,241)
    leftShiftStage0Idx3Pad48_uid242_fracPostNormExt_uid90_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx3_uid244_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,243)@2
    leftShiftStage0Idx3_uid244_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0Idx3Rng48_uid243_fracPostNormExt_uid90_block_rsrvd_fix_b & leftShiftStage0Idx3Pad48_uid242_fracPostNormExt_uid90_block_rsrvd_fix_q;

    -- leftShiftStage0Idx2_uid241_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,240)@2
    leftShiftStage0Idx2_uid241_fracPostNormExt_uid90_block_rsrvd_fix_q <= vStage_uid156_lzCountVal_uid87_block_rsrvd_fix_b & zs_uid152_lzCountVal_uid87_block_rsrvd_fix_q;

    -- leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix(BITSELECT,236)@2
    leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_in <= fracGRS_uid86_block_rsrvd_fix_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_b <= leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_in(40 downto 0);

    -- leftShiftStage0Idx1_uid238_fracPostNormExt_uid90_block_rsrvd_fix(BITJOIN,237)@2
    leftShiftStage0Idx1_uid238_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0Idx1Rng16_uid237_fracPostNormExt_uid90_block_rsrvd_fix_b & zs_uid160_lzCountVal_uid87_block_rsrvd_fix_q;

    -- leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix(MUX,245)@2
    leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_b;
    leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_combproc: PROCESS (leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_s, fracGRS_uid86_block_rsrvd_fix_q, leftShiftStage0Idx1_uid238_fracPostNormExt_uid90_block_rsrvd_fix_q, leftShiftStage0Idx2_uid241_fracPostNormExt_uid90_block_rsrvd_fix_q, leftShiftStage0Idx3_uid244_fracPostNormExt_uid90_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q <= fracGRS_uid86_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0Idx1_uid238_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0Idx2_uid241_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0Idx3_uid244_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix(MUX,256)@2
    leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_c;
    leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_combproc: PROCESS (leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_s, leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q, leftShiftStage1Idx1_uid249_fracPostNormExt_uid90_block_rsrvd_fix_q, leftShiftStage1Idx2_uid252_fracPostNormExt_uid90_block_rsrvd_fix_q, leftShiftStage1Idx3_uid255_fracPostNormExt_uid90_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage0_uid246_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx1_uid249_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx2_uid252_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1Idx3_uid255_fracPostNormExt_uid90_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select(BITSELECT,275)@2
    leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_b <= r_uid187_lzCountVal_uid87_block_rsrvd_fix_q(5 downto 4);
    leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_c <= r_uid187_lzCountVal_uid87_block_rsrvd_fix_q(3 downto 2);
    leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_d <= r_uid187_lzCountVal_uid87_block_rsrvd_fix_q(1 downto 0);

    -- leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix(MUX,267)@2 + 1
    leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid245_fracPostNormExt_uid90_block_rsrvd_fix_merged_bit_select_d;
    leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_s) IS
                WHEN "00" => leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage1_uid257_fracPostNormExt_uid90_block_rsrvd_fix_q;
                WHEN "01" => leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx1_uid260_fracPostNormExt_uid90_block_rsrvd_fix_q;
                WHEN "10" => leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx2_uid263_fracPostNormExt_uid90_block_rsrvd_fix_q;
                WHEN "11" => leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= leftShiftStage2Idx3_uid266_fracPostNormExt_uid90_block_rsrvd_fix_q;
                WHEN OTHERS => leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- LSB_uid99_block_rsrvd_fix(BITSELECT,98)@3
    LSB_uid99_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(4 downto 0));
    LSB_uid99_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(LSB_uid99_block_rsrvd_fix_in(4 downto 4));

    -- Guard_uid98_block_rsrvd_fix(BITSELECT,97)@3
    Guard_uid98_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(3 downto 0));
    Guard_uid98_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Guard_uid98_block_rsrvd_fix_in(3 downto 3));

    -- Round_uid97_block_rsrvd_fix(BITSELECT,96)@3
    Round_uid97_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(2 downto 0));
    Round_uid97_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Round_uid97_block_rsrvd_fix_in(2 downto 2));

    -- Sticky1_uid96_block_rsrvd_fix(BITSELECT,95)@3
    Sticky1_uid96_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(1 downto 0));
    Sticky1_uid96_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Sticky1_uid96_block_rsrvd_fix_in(1 downto 1));

    -- Sticky0_uid95_block_rsrvd_fix(BITSELECT,94)@3
    Sticky0_uid95_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(0 downto 0));
    Sticky0_uid95_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Sticky0_uid95_block_rsrvd_fix_in(0 downto 0));

    -- rndBitCond_uid100_block_rsrvd_fix(BITJOIN,99)@3
    rndBitCond_uid100_block_rsrvd_fix_q <= LSB_uid99_block_rsrvd_fix_b & Guard_uid98_block_rsrvd_fix_b & Round_uid97_block_rsrvd_fix_b & Sticky1_uid96_block_rsrvd_fix_b & Sticky0_uid95_block_rsrvd_fix_b;

    -- rBi_uid102_block_rsrvd_fix(LOGICAL,101)@3
    rBi_uid102_block_rsrvd_fix_q <= "1" WHEN rndBitCond_uid100_block_rsrvd_fix_q = cRBit_uid101_block_rsrvd_fix_q ELSE "0";

    -- roundBit_uid103_block_rsrvd_fix(LOGICAL,102)@3
    roundBit_uid103_block_rsrvd_fix_q <= not (rBi_uid102_block_rsrvd_fix_q);

    -- oneCST_uid92_block_rsrvd_fix(CONSTANT,91)
    oneCST_uid92_block_rsrvd_fix_q <= "00000000001";

    -- expInc_uid93_block_rsrvd_fix(ADD,92)@2
    expInc_uid93_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist21_exp_aSig_uid23_block_rsrvd_fix_b_2_q);
    expInc_uid93_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & oneCST_uid92_block_rsrvd_fix_q);
    expInc_uid93_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid93_block_rsrvd_fix_a) + UNSIGNED(expInc_uid93_block_rsrvd_fix_b));
    expInc_uid93_block_rsrvd_fix_q <= expInc_uid93_block_rsrvd_fix_o(11 downto 0);

    -- expPostNorm_uid94_block_rsrvd_fix(SUB,93)@2 + 1
    expPostNorm_uid94_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expInc_uid93_block_rsrvd_fix_q);
    expPostNorm_uid94_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000" & r_uid187_lzCountVal_uid87_block_rsrvd_fix_q);
    expPostNorm_uid94_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid94_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid94_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid94_block_rsrvd_fix_a) - UNSIGNED(expPostNorm_uid94_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expPostNorm_uid94_block_rsrvd_fix_q <= expPostNorm_uid94_block_rsrvd_fix_o(12 downto 0);

    -- fracPostNorm_uid91_block_rsrvd_fix(BITSELECT,90)@3
    fracPostNorm_uid91_block_rsrvd_fix_b <= leftShiftStage2_uid268_fracPostNormExt_uid90_block_rsrvd_fix_q(56 downto 1);

    -- fracPostNormRndRange_uid104_block_rsrvd_fix(BITSELECT,103)@3
    fracPostNormRndRange_uid104_block_rsrvd_fix_in <= fracPostNorm_uid91_block_rsrvd_fix_b(54 downto 0);
    fracPostNormRndRange_uid104_block_rsrvd_fix_b <= fracPostNormRndRange_uid104_block_rsrvd_fix_in(54 downto 2);

    -- expFracR_uid105_block_rsrvd_fix(BITJOIN,104)@3
    expFracR_uid105_block_rsrvd_fix_q <= expPostNorm_uid94_block_rsrvd_fix_q & fracPostNormRndRange_uid104_block_rsrvd_fix_b;

    -- rndExpFrac_uid106_block_rsrvd_fix(ADD,105)@3
    rndExpFrac_uid106_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expFracR_uid105_block_rsrvd_fix_q);
    rndExpFrac_uid106_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_uid103_block_rsrvd_fix_q);
    rndExpFrac_uid106_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid106_block_rsrvd_fix_a) + UNSIGNED(rndExpFrac_uid106_block_rsrvd_fix_b));
    rndExpFrac_uid106_block_rsrvd_fix_q <= rndExpFrac_uid106_block_rsrvd_fix_o(66 downto 0);

    -- expRPreExc_uid119_block_rsrvd_fix(BITSELECT,118)@3
    expRPreExc_uid119_block_rsrvd_fix_in <= rndExpFrac_uid106_block_rsrvd_fix_q(63 downto 0);
    expRPreExc_uid119_block_rsrvd_fix_b <= expRPreExc_uid119_block_rsrvd_fix_in(63 downto 53);

    -- rndExpFracOvfBits_uid111_block_rsrvd_fix(BITSELECT,110)@3
    rndExpFracOvfBits_uid111_block_rsrvd_fix_in <= rndExpFrac_uid106_block_rsrvd_fix_q(65 downto 0);
    rndExpFracOvfBits_uid111_block_rsrvd_fix_b <= rndExpFracOvfBits_uid111_block_rsrvd_fix_in(65 downto 64);

    -- rOvfExtraBits_uid112_block_rsrvd_fix(LOGICAL,111)@3
    rOvfExtraBits_uid112_block_rsrvd_fix_q <= "1" WHEN rndExpFracOvfBits_uid111_block_rsrvd_fix_b = zocst_uid78_block_rsrvd_fix_q ELSE "0";

    -- wEP2AllOwE_uid107_block_rsrvd_fix(CONSTANT,106)
    wEP2AllOwE_uid107_block_rsrvd_fix_q <= "0011111111111";

    -- rndExp_uid108_block_rsrvd_fix(BITSELECT,107)@3
    rndExp_uid108_block_rsrvd_fix_in <= rndExpFrac_uid106_block_rsrvd_fix_q(65 downto 0);
    rndExp_uid108_block_rsrvd_fix_b <= rndExp_uid108_block_rsrvd_fix_in(65 downto 53);

    -- rOvfEQMax_uid109_block_rsrvd_fix(LOGICAL,108)@3
    rOvfEQMax_uid109_block_rsrvd_fix_q <= "1" WHEN rndExp_uid108_block_rsrvd_fix_b = wEP2AllOwE_uid107_block_rsrvd_fix_q ELSE "0";

    -- rOvf_uid113_block_rsrvd_fix(LOGICAL,112)@3
    rOvf_uid113_block_rsrvd_fix_q <= rOvfEQMax_uid109_block_rsrvd_fix_q or rOvfExtraBits_uid112_block_rsrvd_fix_q;

    -- regInputs_uid120_block_rsrvd_fix(LOGICAL,119)@2 + 1
    regInputs_uid120_block_rsrvd_fix_qi <= excR_aSig_uid33_block_rsrvd_fix_q and excR_bSig_uid47_block_rsrvd_fix_q;
    regInputs_uid120_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid120_block_rsrvd_fix_qi, xout => regInputs_uid120_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- rInfOvf_uid123_block_rsrvd_fix(LOGICAL,122)@3
    rInfOvf_uid123_block_rsrvd_fix_q <= regInputs_uid120_block_rsrvd_fix_q and rOvf_uid113_block_rsrvd_fix_q;

    -- excRInfVInC_uid124_block_rsrvd_fix(BITJOIN,123)@3
    excRInfVInC_uid124_block_rsrvd_fix_q <= rInfOvf_uid123_block_rsrvd_fix_q & excN_bSig_uid44_block_rsrvd_fix_q & excN_aSig_uid30_block_rsrvd_fix_q & redist12_excI_bSig_uid43_block_rsrvd_fix_q_1_q & redist18_excI_aSig_uid29_block_rsrvd_fix_q_1_q & redist6_effSub_uid54_block_rsrvd_fix_q_2_q;

    -- excRInf_uid125_block_rsrvd_fix(LOOKUP,124)@3
    excRInf_uid125_block_rsrvd_fix_combproc: PROCESS (excRInfVInC_uid124_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid124_block_rsrvd_fix_q) IS
            WHEN "000000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "000001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "000010" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "000011" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "000100" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "000101" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "000110" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "000111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "001111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "010111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "011111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100000" => excRInf_uid125_block_rsrvd_fix_q <= "1";
            WHEN "100001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "100111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "101111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "110111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111000" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111001" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111010" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111011" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111100" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111101" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111110" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN "111111" => excRInf_uid125_block_rsrvd_fix_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid125_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist4_aMinusA_uid89_block_rsrvd_fix_q_1(DELAY,280)
    redist4_aMinusA_uid89_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid89_block_rsrvd_fix_q, xout => redist4_aMinusA_uid89_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid116_block_rsrvd_fix(BITSELECT,115)@3
    rUdfExtraBit_uid116_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(rndExpFrac_uid106_block_rsrvd_fix_q(65 downto 0));
    rUdfExtraBit_uid116_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid116_block_rsrvd_fix_in(65 downto 65));

    -- wEP2AllZ_uid114_block_rsrvd_fix(CONSTANT,113)
    wEP2AllZ_uid114_block_rsrvd_fix_q <= "0000000000000";

    -- rUdfEQMin_uid115_block_rsrvd_fix(LOGICAL,114)@3
    rUdfEQMin_uid115_block_rsrvd_fix_q <= "1" WHEN rndExp_uid108_block_rsrvd_fix_b = wEP2AllZ_uid114_block_rsrvd_fix_q ELSE "0";

    -- rUdf_uid117_block_rsrvd_fix(LOGICAL,116)@3
    rUdf_uid117_block_rsrvd_fix_q <= rUdfEQMin_uid115_block_rsrvd_fix_q or rUdfExtraBit_uid116_block_rsrvd_fix_b;

    -- redist17_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_3(DELAY,293)
    redist17_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_2_q, xout => redist17_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- redist19_excZ_aSig_uid18_uid25_block_rsrvd_fix_q_1(DELAY,295)
    redist19_excZ_aSig_uid18_uid25_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid18_uid25_block_rsrvd_fix_q, xout => redist19_excZ_aSig_uid18_uid25_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid121_block_rsrvd_fix(BITJOIN,120)@3
    excRZeroVInC_uid121_block_rsrvd_fix_q <= redist4_aMinusA_uid89_block_rsrvd_fix_q_1_q & rUdf_uid117_block_rsrvd_fix_q & regInputs_uid120_block_rsrvd_fix_q & redist17_excZ_bSig_uid19_uid39_block_rsrvd_fix_q_3_q & redist19_excZ_aSig_uid18_uid25_block_rsrvd_fix_q_1_q;

    -- excRZero_uid122_block_rsrvd_fix(LOOKUP,121)@3
    excRZero_uid122_block_rsrvd_fix_combproc: PROCESS (excRZeroVInC_uid121_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid121_block_rsrvd_fix_q) IS
            WHEN "00000" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00001" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00010" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00011" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "00100" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00101" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00110" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "00111" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01000" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01001" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01010" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01011" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "01100" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "01101" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01110" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "01111" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10000" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10001" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10010" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10011" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "10100" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "10101" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10110" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "10111" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11000" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11001" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11010" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11011" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "11100" => excRZero_uid122_block_rsrvd_fix_q <= "1";
            WHEN "11101" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11110" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN "11111" => excRZero_uid122_block_rsrvd_fix_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid122_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid129_block_rsrvd_fix(BITJOIN,128)@3
    concExc_uid129_block_rsrvd_fix_q <= excRNaN_uid128_block_rsrvd_fix_q & excRInf_uid125_block_rsrvd_fix_q & excRZero_uid122_block_rsrvd_fix_q;

    -- excREnc_uid130_block_rsrvd_fix(LOOKUP,129)@3
    excREnc_uid130_block_rsrvd_fix_combproc: PROCESS (concExc_uid129_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid129_block_rsrvd_fix_q) IS
            WHEN "000" => excREnc_uid130_block_rsrvd_fix_q <= "01";
            WHEN "001" => excREnc_uid130_block_rsrvd_fix_q <= "00";
            WHEN "010" => excREnc_uid130_block_rsrvd_fix_q <= "10";
            WHEN "011" => excREnc_uid130_block_rsrvd_fix_q <= "10";
            WHEN "100" => excREnc_uid130_block_rsrvd_fix_q <= "11";
            WHEN "101" => excREnc_uid130_block_rsrvd_fix_q <= "11";
            WHEN "110" => excREnc_uid130_block_rsrvd_fix_q <= "11";
            WHEN "111" => excREnc_uid130_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid130_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid149_block_rsrvd_fix(MUX,148)@3
    expRPostExc_uid149_block_rsrvd_fix_s <= excREnc_uid130_block_rsrvd_fix_q;
    expRPostExc_uid149_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid149_block_rsrvd_fix_s, cstAllZWE_uid22_block_rsrvd_fix_q, expRPreExc_uid119_block_rsrvd_fix_b, cstAllOWE_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid149_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid149_block_rsrvd_fix_q <= cstAllZWE_uid22_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid149_block_rsrvd_fix_q <= expRPreExc_uid119_block_rsrvd_fix_b;
            WHEN "10" => expRPostExc_uid149_block_rsrvd_fix_q <= cstAllOWE_uid20_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid149_block_rsrvd_fix_q <= cstAllOWE_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid149_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid142_block_rsrvd_fix(CONSTANT,141)
    oneFracRPostExc2_uid142_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracRPreExc_uid118_block_rsrvd_fix(BITSELECT,117)@3
    fracRPreExc_uid118_block_rsrvd_fix_in <= rndExpFrac_uid106_block_rsrvd_fix_q(52 downto 0);
    fracRPreExc_uid118_block_rsrvd_fix_b <= fracRPreExc_uid118_block_rsrvd_fix_in(52 downto 1);

    -- fracRPostExc_uid145_block_rsrvd_fix(MUX,144)@3
    fracRPostExc_uid145_block_rsrvd_fix_s <= excREnc_uid130_block_rsrvd_fix_q;
    fracRPostExc_uid145_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid145_block_rsrvd_fix_s, cstZeroWF_uid21_block_rsrvd_fix_q, fracRPreExc_uid118_block_rsrvd_fix_b, oneFracRPostExc2_uid142_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid145_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid145_block_rsrvd_fix_q <= cstZeroWF_uid21_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid145_block_rsrvd_fix_q <= fracRPreExc_uid118_block_rsrvd_fix_b;
            WHEN "10" => fracRPostExc_uid145_block_rsrvd_fix_q <= cstZeroWF_uid21_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid145_block_rsrvd_fix_q <= oneFracRPostExc2_uid142_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid145_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid150_block_rsrvd_fix(BITJOIN,149)@3
    R_uid150_block_rsrvd_fix_q <= signRPostExc_uid141_block_rsrvd_fix_q & expRPostExc_uid149_block_rsrvd_fix_q & fracRPostExc_uid145_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,5)@3
    out_primWireOut <= R_uid150_block_rsrvd_fix_q;

END normal;
