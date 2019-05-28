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

-- VHDL created from floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA0Z03p06o303d06o00rf30z
-- VHDL created on Tue May 28 16:51:56 2019


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

entity floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA0Z03p06o303d06o00rf30z is
    port (
        in_0 : in std_logic_vector(63 downto 0);  -- float64_m52
        in_1 : in std_logic_vector(63 downto 0);  -- float64_m52
        out_primWireOut : out std_logic_vector(63 downto 0);  -- float64_m52
        clk : in std_logic;
        areset : in std_logic
    );
end floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA0Z03p06o303d06o00rf30z;

architecture normal of floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA0Z03p06o303d06o00rf30z is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sQ_uid12_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sFloorAbsQ_uid13_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ySign_uid15_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fraction_uid16_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal exp_uid17_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal invYSign_uid18_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minusY_uid19_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cstBiasM1_uid22_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstBias_uid23_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expX_uid25_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracX_uid26_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signX_uid27_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid28_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracY_uid29_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signY_uid30_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal paddingY_uid31_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal updatedY_uid32_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracYZero_uid31_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (52 downto 0);
    signal fracYZero_uid31_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excZ_x_uid39_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid40_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid41_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid42_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid43_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid44_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid45_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid46_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid47_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid53_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid54_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid55_q_uid7_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid56_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid57_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid58_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid59_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid60_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid61_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid62_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid63_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid63_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid63_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expXmY_uid63_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expR_uid64_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid64_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid64_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expR_uid64_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal yAddr_uid67_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal yPE_uid68_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (40 downto 0);
    signal invY_uid70_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (60 downto 0);
    signal invY_uid70_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal invYO_uid71_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (61 downto 0);
    signal invYO_uid71_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid73_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal z4_uid76_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal oFracXZ4_uid77_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal norm_uid80_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (55 downto 0);
    signal divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal normFracRnd_uid83_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid83_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal expFracRnd_uid84_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal zeroPaddingInAddition_uid90_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracPostRnd_uid91_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (67 downto 0);
    signal fracXExt_uid93_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndF_uid95_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal fracPostRndF_uid95_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndF_uid96_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expPostRndFR_uid97_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (64 downto 0);
    signal expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expPostRndF_uid98_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expPostRndF_uid98_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal lOAdded_uid100_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal lOAdded_uid103_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (106 downto 0);
    signal qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (105 downto 0);
    signal qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (104 downto 0);
    signal qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal qDivProdExp_uid112_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid112_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid112_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (14 downto 0);
    signal qDivProdExp_uid112_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (13 downto 0);
    signal qDivProdFracWF_uid113_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal qDivProdLTX_opA_uid115_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal qDivProdLTX_opB_uid116_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid118_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal betweenFPwF_uid118_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraUlp_uid119_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostRndFT_uid120_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPreExc_uid123_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal ovfIncRnd_uid125_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPreExc_uid128_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expRPreExc_uid128_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expRExt_uid130_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expUdf_uid131_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid131_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid131_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (15 downto 0);
    signal expUdf_uid131_q_uid7_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid134_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid134_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid134_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (15 downto 0);
    signal expOvf_uid134_q_uid7_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid135_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid136_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid137_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid138_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid139_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid140_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid141_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid142_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid143_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid144_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid145_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid146_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid147_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid148_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid149_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRPostExc_uid153_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid157_q_uid7_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid157_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid158_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid159_q_uid7_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid159_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal divR_uid160_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal expFracX_uid162_absQ_uid8_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal R_uid163_absQ_uid8_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid173_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid174_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid175_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid176_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid177_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid178_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid184_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsZero_uid185_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal biasPwF_uid187_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_in : STD_LOGIC_VECTOR (5 downto 0);
    signal unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (5 downto 0);
    signal maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal fracPostMask_uid195_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal invertedMaskBits_uid198_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal discardedFracBits_uid199_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal flagDiscardedFracBits_uid201_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ovfExpFrac_uid203_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (64 downto 0);
    signal negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal negXNoDiscardBits_uid210_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expCompRangeNegNoDiscBits_uid211_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal posXAndCompRange_uid213_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal nCompPosOrNegWithZeroDiscBits_uid214_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invResIszero_uid215_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal resNotZeroAndComp_uid216_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal fracRNoExc_uid220_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal notInfOrZero_uid221_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expCompRangeNegNoDiscBits_uid230_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal intCase_uid231_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expRNoExc_uid233_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal excXNOrI_uid234_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcXZ_uid236_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal floorX_uid238_floorAbsQ_uid9_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal expX_uid240_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal signX_uid242_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid252_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid254_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid255_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid256_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid274_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal biasInc_uid279_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (13 downto 0);
    signal signR_uid282_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (104 downto 0);
    signal fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (103 downto 0);
    signal fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (50 downto 0);
    signal stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (50 downto 0);
    signal extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyExtendedRange_uid291_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyRangeComparator_uid293_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sticky_uid294_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lrs_uid296_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionConstant_uid297_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal roundBitDetectionPattern_uid298_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid299_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracPreRound_uid300_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal roundBitAndNormalizationOp_uid302_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (54 downto 0);
    signal expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (68 downto 0);
    signal expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (67 downto 0);
    signal fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (10 downto 0);
    signal expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (16 downto 0);
    signal expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid310_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid311_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid312_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid313_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid315_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid316_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid317_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid318_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid320_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid321_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid322_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid324_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invExcRNaN_uid335_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid336_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid337_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal expFracX_uid339_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid340_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal expFracY_uid340_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal xGTEy_uid341_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid341_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid341_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (64 downto 0);
    signal xGTEy_uid341_modRes_uid20_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid342_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid343_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal fracY_uid343_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expY_uid344_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal expY_uid344_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ypn_uid345_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal aSig_uid349_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid349_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bSig_uid350_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid350_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid357_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid359_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid362_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid363_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid364_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (62 downto 0);
    signal exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (51 downto 0);
    signal frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid373_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid376_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid378_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid383_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid384_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid385_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid389_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid389_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal oFracB_uid392_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (52 downto 0);
    signal expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal cWFP2_uid394_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (53 downto 0);
    signal rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal iShiftedOut_uid400_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (106 downto 0);
    signal alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid404_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid407_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid409_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid410_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOp_uid413_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (55 downto 0);
    signal fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (56 downto 0);
    signal fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (55 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal cAmA_uid419_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid422_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal oneCST_uid423_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expInc_uid424_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid424_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid424_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (11 downto 0);
    signal expInc_uid424_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (11 downto 0);
    signal expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal Sticky0_uid426_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid426_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid427_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid427_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid428_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid428_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid429_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid429_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid430_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid430_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid431_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid432_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid433_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid434_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal expFracR_uid436_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (66 downto 0);
    signal rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (66 downto 0);
    signal wEP2AllOwE_uid438_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rndExp_uid439_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExp_uid439_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (12 downto 0);
    signal rOvfEQMax_uid440_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid443_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid444_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid445_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (12 downto 0);
    signal rUdfEQMin_uid446_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (65 downto 0);
    signal rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid448_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (63 downto 0);
    signal expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal regInputs_uid451_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid451_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid452_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid453_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid454_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid455_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid456_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid457_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid458_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid459_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid460_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid461_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid462_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid463_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid464_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid465_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid466_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid467_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid468_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid469_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid471_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid472_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (51 downto 0);
    signal expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (10 downto 0);
    signal R_uid481_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid496_invTables_q : STD_LOGIC_VECTOR (60 downto 0);
    signal os_uid508_invTables_q : STD_LOGIC_VECTOR (48 downto 0);
    signal os_uid518_invTables_q : STD_LOGIC_VECTOR (37 downto 0);
    signal os_uid526_invTables_q : STD_LOGIC_VECTOR (27 downto 0);
    signal os_uid532_invTables_q : STD_LOGIC_VECTOR (15 downto 0);
    signal yT1_uid539_invPolyEval_b : STD_LOGIC_VECTOR (15 downto 0);
    signal lowRangeB_uid541_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid541_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid542_invPolyEval_b : STD_LOGIC_VECTOR (16 downto 0);
    signal s1sumAHighB_uid543_invPolyEval_a : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid543_invPolyEval_b : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid543_invPolyEval_o : STD_LOGIC_VECTOR (28 downto 0);
    signal s1sumAHighB_uid543_invPolyEval_q : STD_LOGIC_VECTOR (28 downto 0);
    signal s1_uid544_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yT2_uid545_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lowRangeB_uid547_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid547_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid548_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal s2sumAHighB_uid549_invPolyEval_a : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid549_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid549_invPolyEval_o : STD_LOGIC_VECTOR (38 downto 0);
    signal s2sumAHighB_uid549_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal s2_uid550_invPolyEval_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yT3_uid551_invPolyEval_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lowRangeB_uid553_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid553_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid554_invPolyEval_b : STD_LOGIC_VECTOR (38 downto 0);
    signal s3sumAHighB_uid555_invPolyEval_a : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid555_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid555_invPolyEval_o : STD_LOGIC_VECTOR (49 downto 0);
    signal s3sumAHighB_uid555_invPolyEval_q : STD_LOGIC_VECTOR (49 downto 0);
    signal s3_uid556_invPolyEval_q : STD_LOGIC_VECTOR (50 downto 0);
    signal lowRangeB_uid559_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid559_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid560_invPolyEval_b : STD_LOGIC_VECTOR (49 downto 0);
    signal s4sumAHighB_uid561_invPolyEval_a : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid561_invPolyEval_b : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid561_invPolyEval_o : STD_LOGIC_VECTOR (61 downto 0);
    signal s4sumAHighB_uid561_invPolyEval_q : STD_LOGIC_VECTOR (61 downto 0);
    signal s4_uid562_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal topRangeX_uid574_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid575_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_mergedSignalTM_uid579_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (28 downto 0);
    signal rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (28 downto 0);
    signal aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (6 downto 0);
    signal aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightBottomY_uid586_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 : STD_LOGIC_VECTOR (13 downto 0);
    signal sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr : UNSIGNED (13 downto 0);
    signal sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (13 downto 0);
    signal sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr : UNSIGNED (6 downto 0);
    attribute multstyle : string;
    attribute multstyle of sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr : signal is "logic";
    signal sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sumAb_uid592_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (67 downto 0);
    signal lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (68 downto 0);
    signal lev1_a0_uid596_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (81 downto 0);
    signal lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (62 downto 0);
    signal lev2_a0_uid600_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q : STD_LOGIC_VECTOR (82 downto 0);
    signal os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in : STD_LOGIC_VECTOR (80 downto 0);
    signal os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b : STD_LOGIC_VECTOR (56 downto 0);
    signal topRangeY_uid604_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aboveLeftY_mergedSignalTM_uid609_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_mergedSignalTM_uid613_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (26 downto 0);
    signal add0_uid627_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (107 downto 0);
    signal add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_a : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_o : STD_LOGIC_VECTOR (81 downto 0);
    signal add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (81 downto 0);
    signal add1_uid631_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q : STD_LOGIC_VECTOR (108 downto 0);
    signal osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in : STD_LOGIC_VECTOR (107 downto 0);
    signal osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b : STD_LOGIC_VECTOR (105 downto 0);
    signal zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid636_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid637_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (24 downto 0);
    signal vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cStage_uid639_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid644_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid650_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid656_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid662_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid667_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid668_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (5 downto 0);
    signal osig_uid672_pT1_uid540_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftX_uid680_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (3 downto 0);
    signal aboveLeftY_uid681_pT2_uid546_invPolyEval_in : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_uid681_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightBottomX_uid682_pT2_uid546_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal rightBottomX_uid682_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightBottomY_uid683_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (5 downto 0);
    signal topRangeX_uid684_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid685_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal sm0_uid687_pT2_uid546_invPolyEval_a0 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid687_pT2_uid546_invPolyEval_b0 : STD_LOGIC_VECTOR (2 downto 0);
    signal sm0_uid687_pT2_uid546_invPolyEval_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid687_pT2_uid546_invPolyEval_pr : UNSIGNED (6 downto 0);
    attribute multstyle of sm0_uid687_pT2_uid546_invPolyEval_pr : signal is "logic";
    signal sm0_uid687_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid688_pT2_uid546_invPolyEval_a0 : STD_LOGIC_VECTOR (0 downto 0);
    signal sm0_uid688_pT2_uid546_invPolyEval_b0 : STD_LOGIC_VECTOR (5 downto 0);
    signal sm0_uid688_pT2_uid546_invPolyEval_s1 : STD_LOGIC_VECTOR (6 downto 0);
    signal sm0_uid688_pT2_uid546_invPolyEval_pr : SIGNED (7 downto 0);
    attribute multstyle of sm0_uid688_pT2_uid546_invPolyEval_pr : signal is "logic";
    signal sm0_uid688_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (6 downto 0);
    signal lowRangeA_uid689_pT2_uid546_invPolyEval_in : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid689_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (19 downto 0);
    signal highABits_uid690_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0high_uid691_pT2_uid546_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid691_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid691_pT2_uid546_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev1_a0high_uid691_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0_uid692_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lowRangeA_uid693_pT2_uid546_invPolyEval_in : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid693_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (19 downto 0);
    signal highABits_uid694_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev2_a0high_uid695_pT2_uid546_invPolyEval_a : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid695_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid695_pT2_uid546_invPolyEval_o : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0high_uid695_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (35 downto 0);
    signal lev2_a0_uid696_pT2_uid546_invPolyEval_q : STD_LOGIC_VECTOR (55 downto 0);
    signal os_uid697_pT2_uid546_invPolyEval_in : STD_LOGIC_VECTOR (53 downto 0);
    signal os_uid697_pT2_uid546_invPolyEval_b : STD_LOGIC_VECTOR (28 downto 0);
    signal nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (38 downto 0);
    signal topRangeX_uid713_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid714_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid715_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aboveLeftY_bottomExtension_uid716_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aboveLeftY_mergedSignalTM_uid718_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomX_bottomExtension_uid720_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_in : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_mergedSignalTM_uid722_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rightBottomY_uid724_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (17 downto 0);
    signal lowRangeB_uid728_pT3_uid552_invPolyEval_in : STD_LOGIC_VECTOR (8 downto 0);
    signal lowRangeB_uid728_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (8 downto 0);
    signal highBBits_uid729_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (27 downto 0);
    signal lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_a : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_o : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (54 downto 0);
    signal lev1_a0_uid731_pT3_uid552_invPolyEval_q : STD_LOGIC_VECTOR (63 downto 0);
    signal os_uid732_pT3_uid552_invPolyEval_in : STD_LOGIC_VECTOR (61 downto 0);
    signal os_uid732_pT3_uid552_invPolyEval_b : STD_LOGIC_VECTOR (39 downto 0);
    signal nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (41 downto 0);
    signal topRangeX_uid748_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeY_uid749_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftY_bottomExtension_uid751_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (2 downto 0);
    signal aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_mergedSignalTM_uid753_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal rightBottomX_bottomExtension_uid755_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightBottomX_mergedSignalTM_uid757_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aboveLeftX_uid760_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aboveLeftX_uid760_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal aboveLeftY_uid761_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aboveLeftY_uid761_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid765_pT4_uid558_invPolyEval_a0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid765_pT4_uid558_invPolyEval_b0 : STD_LOGIC_VECTOR (1 downto 0);
    signal sm0_uid765_pT4_uid558_invPolyEval_s1 : STD_LOGIC_VECTOR (3 downto 0);
    signal sm0_uid765_pT4_uid558_invPolyEval_pr : UNSIGNED (3 downto 0);
    attribute multstyle of sm0_uid765_pT4_uid558_invPolyEval_pr : signal is "logic";
    signal sm0_uid765_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (3 downto 0);
    signal sumAb_uid766_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (57 downto 0);
    signal lowRangeB_uid767_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (22 downto 0);
    signal lowRangeB_uid767_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal highBBits_uid768_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_a : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_o : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (58 downto 0);
    signal lev1_a0_uid770_pT4_uid558_invPolyEval_q : STD_LOGIC_VECTOR (81 downto 0);
    signal os_uid771_pT4_uid558_invPolyEval_in : STD_LOGIC_VECTOR (79 downto 0);
    signal os_uid771_pT4_uid558_invPolyEval_b : STD_LOGIC_VECTOR (51 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_in : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_bs5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_join_11_q : STD_LOGIC_VECTOR (106 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_q : STD_LOGIC_VECTOR (81 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_qint : STD_LOGIC_VECTOR (81 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_a : STD_LOGIC_VECTOR (107 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_b : STD_LOGIC_VECTOR (107 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_o : STD_LOGIC_VECTOR (107 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_q : STD_LOGIC_VECTOR (107 downto 0);
    signal wIntCst_uid792_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (6 downto 0);
    signal shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_a : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_o : STD_LOGIC_VECTOR (13 downto 0);
    signal shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng32_uid794_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (74 downto 0);
    signal rightShiftStage0Idx1_uid796_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx2Rng64_uid797_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (42 downto 0);
    signal rightShiftStage0Idx2Pad64_uid798_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx2_uid799_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0Idx3Rng96_uid800_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx3Pad96_uid801_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (95 downto 0);
    signal rightShiftStage0Idx3_uid802_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx1Rng8_uid805_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (98 downto 0);
    signal rightShiftStage1Idx1_uid807_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx2Rng16_uid808_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (90 downto 0);
    signal rightShiftStage1Idx2_uid810_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1Idx3Rng24_uid811_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (82 downto 0);
    signal rightShiftStage1Idx3Pad24_uid812_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx3_uid813_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx1Rng2_uid816_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (104 downto 0);
    signal rightShiftStage2Idx1_uid818_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx2Rng4_uid819_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (102 downto 0);
    signal rightShiftStage2Idx2_uid821_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2Idx3Rng6_uid822_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (100 downto 0);
    signal rightShiftStage2Idx3_uid824_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3Idx1Rng1_uid827_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (105 downto 0);
    signal rightShiftStage3Idx1_uid829_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal zeroOutCst_uid832_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (106 downto 0);
    signal leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (40 downto 0);
    signal leftShiftStage0Idx1_uid839_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx2_uid842_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0Idx3Pad48_uid843_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (8 downto 0);
    signal leftShiftStage0Idx3_uid845_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (52 downto 0);
    signal leftShiftStage1Idx1_uid850_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (48 downto 0);
    signal leftShiftStage1Idx2_uid853_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (44 downto 0);
    signal leftShiftStage1Idx3_uid856_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage2Idx1_uid861_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (54 downto 0);
    signal leftShiftStage2Idx2_uid864_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b : STD_LOGIC_VECTOR (53 downto 0);
    signal leftShiftStage2Idx3_uid867_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q : STD_LOGIC_VECTOR (56 downto 0);
    signal memoryC0_uid483_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid483_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid483_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid483_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid483_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid483_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid484_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid484_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid484_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid484_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid484_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid484_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid485_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid485_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid485_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid485_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid485_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid485_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid486_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid486_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid486_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid486_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid486_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid486_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid487_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid487_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid487_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid487_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid487_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid487_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid488_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid488_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid488_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid488_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid488_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid488_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid489_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid489_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid489_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid489_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid489_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid489_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid490_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid490_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid490_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid490_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid490_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid490_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid491_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid491_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid491_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid491_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid491_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid491_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid492_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid492_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid492_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid492_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid492_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid492_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid493_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid493_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid493_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid493_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid493_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid493_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid494_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid494_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid494_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid494_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC0_uid494_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC0_uid494_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid498_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid498_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid498_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid498_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid498_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid498_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid499_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid499_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid499_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid499_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid499_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid499_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid500_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid500_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid500_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid500_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid500_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid500_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid501_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid501_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid501_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid501_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid501_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid501_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid502_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid502_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid502_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid502_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid502_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid502_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid503_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid503_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid503_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid503_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid503_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid503_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid504_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid504_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid504_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid504_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid504_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid504_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid505_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid505_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid505_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid505_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid505_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid505_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid506_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid506_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid506_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid506_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid506_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid506_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC1_uid507_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid507_invTables_lutmem_ia : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC1_uid507_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid507_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC1_uid507_invTables_lutmem_ir : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC1_uid507_invTables_lutmem_r : STD_LOGIC_VECTOR (3 downto 0);
    signal memoryC2_uid510_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid510_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid510_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid510_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid510_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid510_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid511_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid511_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid511_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid511_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid511_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid511_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid512_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid512_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid512_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid512_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid512_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid512_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid513_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid513_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid513_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid513_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid513_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid513_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid514_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid514_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid514_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid514_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid514_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid514_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid515_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid515_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid515_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid515_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid515_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid515_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid516_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid516_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid516_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid516_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid516_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid516_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC2_uid517_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid517_invTables_lutmem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC2_uid517_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid517_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC2_uid517_invTables_lutmem_ir : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC2_uid517_invTables_lutmem_r : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC3_uid520_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid520_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid520_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid520_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid520_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid520_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid521_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid521_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid521_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid521_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid521_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid521_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid522_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid522_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid522_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid522_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid522_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid522_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid523_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid523_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid523_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid523_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid523_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid523_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid524_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid524_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid524_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid524_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid524_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid524_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC3_uid525_invTables_lutmem_reset0 : std_logic;
    signal memoryC3_uid525_invTables_lutmem_ia : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC3_uid525_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid525_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC3_uid525_invTables_lutmem_ir : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC3_uid525_invTables_lutmem_r : STD_LOGIC_VECTOR (2 downto 0);
    signal memoryC4_uid528_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid528_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid528_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid528_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid528_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid528_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid529_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid529_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid529_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid529_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid529_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid529_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid530_invTables_lutmem_reset0 : std_logic;
    signal memoryC4_uid530_invTables_lutmem_ia : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid530_invTables_lutmem_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid530_invTables_lutmem_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal memoryC4_uid530_invTables_lutmem_ir : STD_LOGIC_VECTOR (4 downto 0);
    signal memoryC4_uid530_invTables_lutmem_r : STD_LOGIC_VECTOR (4 downto 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_reset : std_logic;
    type sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type is array(NATURAL range <>) of UNSIGNED(26 downto 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 : signal is true;
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 : signal is true;
    type sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype is array(NATURAL range <>) of UNSIGNED(53 downto 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 : std_logic;
    signal sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 : std_logic;
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset : std_logic;
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : signal is true;
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : signal is true;
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 : std_logic;
    signal topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 : std_logic;
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset : std_logic;
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : signal is true;
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : signal is true;
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 : std_logic;
    signal sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 : std_logic;
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_reset : std_logic;
    type prodXY_uid671_pT1_uid540_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(15 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_a0 : prodXY_uid671_pT1_uid540_invPolyEval_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid671_pT1_uid540_invPolyEval_cma_a0 : signal is true;
    type prodXY_uid671_pT1_uid540_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_c0 : prodXY_uid671_pT1_uid540_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of prodXY_uid671_pT1_uid540_invPolyEval_cma_c0 : signal is true;
    type prodXY_uid671_pT1_uid540_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_l : prodXY_uid671_pT1_uid540_invPolyEval_cma_ltype(0 to 0);
    type prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(32 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_p : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_u : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_w : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_x : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_y : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_s : prodXY_uid671_pT1_uid540_invPolyEval_cma_ptype(0 to 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_qq : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_q : STD_LOGIC_VECTOR (31 downto 0);
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_ena0 : std_logic;
    signal prodXY_uid671_pT1_uid540_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_reset : std_logic;
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of sm0_uid686_pT2_uid546_invPolyEval_cma_a0 : signal is true;
    type sm0_uid686_pT2_uid546_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(26 downto 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_c0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid686_pT2_uid546_invPolyEval_cma_c0 : signal is true;
    type sm0_uid686_pT2_uid546_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(27 downto 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_l : sm0_uid686_pT2_uid546_invPolyEval_cma_ltype(0 to 0);
    type sm0_uid686_pT2_uid546_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(54 downto 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_p : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_u : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_w : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_x : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_y : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_s : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid686_pT2_uid546_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_reset : std_logic;
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_a0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid725_pT3_uid552_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_c0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid725_pT3_uid552_invPolyEval_cma_c0 : signal is true;
    type sm0_uid725_pT3_uid552_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(53 downto 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_p : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_u : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_w : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_x : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_y : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_s : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid725_pT3_uid552_invPolyEval_cma_ena1 : std_logic;
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_reset : std_logic;
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_a0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid762_pT4_uid558_invPolyEval_cma_a0 : signal is true;
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_c0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 0);
    attribute preserve of sm0_uid762_pT4_uid558_invPolyEval_cma_c0 : signal is true;
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_p : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_u : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_w : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_x : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_y : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_s : sm0_uid725_pT3_uid552_invPolyEval_cma_ptype(0 to 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_ena0 : std_logic;
    signal sm0_uid762_pT4_uid558_invPolyEval_cma_ena1 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_reset : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_a0 : signal is true;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_c0 : signal is true;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_u : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_w : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_x : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_y : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_s : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_qq : STD_LOGIC_VECTOR (53 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_q : STD_LOGIC_VECTOR (53 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena0 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena1 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_reset : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 0);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_a0 : signal is true;
    type qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0type is array(NATURAL range <>) of UNSIGNED(25 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0 : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0type(0 to 0);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0 : signal is true;
    type qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype is array(NATURAL range <>) of UNSIGNED(52 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_p : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_u : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_w : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_x : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_y : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_s : qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ptype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_qq : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_q : STD_LOGIC_VECTOR (52 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena0 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_reset : std_logic;
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype is array(NATURAL range <>) of UNSIGNED(54 downto 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset : std_logic;
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 1);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_reset : std_logic;
    type multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0 : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0 : signal is true;
    type multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0type is array(NATURAL range <>) of SIGNED(17 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0 : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0 : signal is true;
    type multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ltype is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_l : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ltype(0 to 1);
    type multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ptype is array(NATURAL range <>) of SIGNED(36 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_p : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(37 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_u : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_w : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_x : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_y : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_s : multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena1 : std_logic;
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_reset : std_logic;
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0 : signal is true;
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0 : sm0_uid686_pT2_uid546_invPolyEval_cma_c0type(0 to 1);
    attribute preserve of multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0 : signal is true;
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_l : sm0_uid686_pT2_uid546_invPolyEval_cma_ltype(0 to 1);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_p : sm0_uid686_pT2_uid546_invPolyEval_cma_ptype(0 to 1);
    type multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype is array(NATURAL range <>) of SIGNED(55 downto 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_u : multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype(0 to 1);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_w : multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_x : multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_y : multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_s : multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_utype(0 to 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena0 : std_logic;
    signal multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena1 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_reset : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0 : signal is true;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0 : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0type(0 to 1);
    attribute preserve of qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0 : signal is true;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_p : sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ptype(0 to 1);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_u : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 1);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_w : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_x : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_y : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_s : multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_utype(0 to 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_qq : STD_LOGIC_VECTOR (54 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_q : STD_LOGIC_VECTOR (54 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena0 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena1 : std_logic;
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (26 downto 0);
    signal intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (62 downto 0);
    signal intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (62 downto 0);
    signal fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (10 downto 0);
    signal topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (51 downto 0);
    signal stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (54 downto 0);
    signal lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (19 downto 0);
    signal lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (61 downto 0);
    signal lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (26 downto 0);
    signal lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (80 downto 0);
    signal rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (15 downto 0);
    signal rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_d : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b : STD_LOGIC_VECTOR (12 downto 0);
    signal lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c : STD_LOGIC_VECTOR (41 downto 0);
    signal redist0_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist1_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist2_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (55 downto 0);
    signal redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist24_signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist27_expOvf_uid134_q_uid7_block_rsrvd_fix_n_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_expUdf_uid131_q_uid7_block_rsrvd_fix_n_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist30_extraUlp_uid119_q_uid7_block_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist35_lOAdded_uid73_q_uid7_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_invYO_uid71_q_uid7_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist41_yPE_uid68_q_uid7_block_rsrvd_fix_b_8_q : STD_LOGIC_VECTOR (40 downto 0);
    signal redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_excN_y_uid58_q_uid7_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_signY_uid30_q_uid7_block_rsrvd_fix_b_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist56_expY_uid28_q_uid7_block_rsrvd_fix_b_16_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist60_in_0_in_0_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist61_in_0_in_0_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg_q : STD_LOGIC_VECTOR (52 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_reset0 : std_logic;
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_q : STD_LOGIC_VECTOR (51 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i : signal is true;
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq : std_logic;
    attribute preserve of redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq : signal is true;
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only : boolean;
    attribute preserve_syn_only of redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q : signal is true;
    signal redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_reset0 : std_logic;
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve of redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i : signal is true;
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq : std_logic;
    attribute preserve of redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq : signal is true;
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q : signal is true;
    signal redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_in_0_in_0_8_mem_reset0 : std_logic;
    signal redist62_in_0_in_0_8_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_in_0_in_0_8_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_in_0_in_0_8_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_in_0_in_0_8_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_in_0_in_0_8_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist62_in_0_in_0_8_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_in_0_in_0_8_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist62_in_0_in_0_8_rdcnt_i : signal is true;
    signal redist62_in_0_in_0_8_rdcnt_eq : std_logic;
    attribute preserve of redist62_in_0_in_0_8_rdcnt_eq : signal is true;
    signal redist62_in_0_in_0_8_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_in_0_in_0_8_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist62_in_0_in_0_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_in_0_in_0_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_in_0_in_0_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_in_0_in_0_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist62_in_0_in_0_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve_syn_only of redist62_in_0_in_0_8_sticky_ena_q : signal is true;
    signal redist62_in_0_in_0_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cAmA_uid419_modRes_uid20_block_rsrvd_fix(CONSTANT,418)
    cAmA_uid419_modRes_uid20_block_rsrvd_fix_q <= "111001";

    -- zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(CONSTANT,633)
    zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "00000000000000000000000000000000";

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_notEnable(LOGICAL,1007)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_nor(LOGICAL,1008)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_nor_q <= not (redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_notEnable_q or redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q);

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_last(CONSTANT,1004)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_last_q <= "01001";

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp(LOGICAL,1005)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_q);
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_q <= "1" WHEN redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_last_q = redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_b ELSE "0";

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg(REG,1006)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg_q <= STD_LOGIC_VECTOR(redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmp_q);
        END IF;
    END PROCESS;

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena(REG,1009)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_nor_q = "1") THEN
                redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_enaAnd(LOGICAL,1010)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_enaAnd_q <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q and VCC_q;

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt(COUNTER,1002)
    -- low=0, high=10, step=1, init=0
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '1';
            ELSE
                redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '0';
            END IF;
            IF (redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq = '1') THEN
                redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i + 6;
            ELSE
                redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_i, 4)));

    -- fracY_uid29_q_uid7_block_rsrvd_fix(BITSELECT,28)@0
    fracY_uid29_q_uid7_block_rsrvd_fix_b <= in_1(51 downto 0);

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr(REG,1003)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr_q <= STD_LOGIC_VECTOR(redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem(DUALMEM,1001)
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ia <= STD_LOGIC_VECTOR(fracY_uid29_q_uid7_block_rsrvd_fix_b);
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_aa <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_wraddr_q;
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ab <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_rdcnt_q;
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_reset0 <= areset;
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 52,
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
        clocken1 => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_reset0,
        clock1 => clk,
        address_a => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_aa,
        data_a => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_ab,
        q_b => redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_iq
    );
    redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_q <= redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_iq(51 downto 0);

    -- fracXIsZero_uid55_q_uid7_block_rsrvd_fix(LOGICAL,54)@12 + 1
    fracXIsZero_uid55_q_uid7_block_rsrvd_fix_qi <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_q ELSE "0";
    fracXIsZero_uid55_q_uid7_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid55_q_uid7_block_rsrvd_fix_qi, xout => fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2(DELAY,986)
    redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q, xout => redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid34_q_uid7_block_rsrvd_fix(CONSTANT,33)
    cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q <= "11111111111";

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_notEnable(LOGICAL,1017)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_nor(LOGICAL,1018)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_nor_q <= not (redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_notEnable_q or redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q);

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_last(CONSTANT,1014)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_last_q <= "01001";

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp(LOGICAL,1015)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_b <= STD_LOGIC_VECTOR("0" & redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_q);
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_q <= "1" WHEN redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_last_q = redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_b ELSE "0";

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg(REG,1016)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg_q <= STD_LOGIC_VECTOR(redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmp_q);
        END IF;
    END PROCESS;

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena(REG,1019)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_nor_q = "1") THEN
                redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q <= STD_LOGIC_VECTOR(redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_enaAnd(LOGICAL,1020)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_enaAnd_q <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_sticky_ena_q and VCC_q;

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt(COUNTER,1012)
    -- low=0, high=10, step=1, init=0
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i = TO_UNSIGNED(9, 4)) THEN
                redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '1';
            ELSE
                redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq <= '0';
            END IF;
            IF (redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_eq = '1') THEN
                redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i + 6;
            ELSE
                redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_i, 4)));

    -- expY_uid28_q_uid7_block_rsrvd_fix(BITSELECT,27)@0
    expY_uid28_q_uid7_block_rsrvd_fix_b <= in_1(62 downto 52);

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr(REG,1013)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr_q <= "1010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr_q <= STD_LOGIC_VECTOR(redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem(DUALMEM,1011)
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ia <= STD_LOGIC_VECTOR(expY_uid28_q_uid7_block_rsrvd_fix_b);
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_aa <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_wraddr_q;
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ab <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_rdcnt_q;
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_reset0 <= areset;
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 11,
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
        clocken1 => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_reset0,
        clock1 => clk,
        address_a => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_aa,
        data_a => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_ab,
        q_b => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_iq
    );
    redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_q <= redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_iq(10 downto 0);

    -- redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14(DELAY,992)
    redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_q, xout => redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q, clk => clk, aclr => areset );

    -- expXIsMax_uid54_q_uid7_block_rsrvd_fix(LOGICAL,53)@14
    expXIsMax_uid54_q_uid7_block_rsrvd_fix_q <= "1" WHEN redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- excI_y_uid57_q_uid7_block_rsrvd_fix(LOGICAL,56)@14
    excI_y_uid57_q_uid7_block_rsrvd_fix_q <= expXIsMax_uid54_q_uid7_block_rsrvd_fix_q and redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2_q;

    -- fracX_uid26_q_uid7_block_rsrvd_fix(BITSELECT,25)@10
    fracX_uid26_q_uid7_block_rsrvd_fix_b <= in_0(51 downto 0);

    -- redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2(DELAY,994)
    redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracX_uid26_q_uid7_block_rsrvd_fix_b, xout => redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4(DELAY,995)
    redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 52, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2_q, xout => redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid41_q_uid7_block_rsrvd_fix(LOGICAL,40)@14
    fracXIsZero_uid41_q_uid7_block_rsrvd_fix_q <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4_q ELSE "0";

    -- redist60_in_0_in_0_2(DELAY,997)
    redist60_in_0_in_0_2 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_0, xout => redist60_in_0_in_0_2_q, clk => clk, aclr => areset );

    -- expX_uid25_q_uid7_block_rsrvd_fix(BITSELECT,24)@12
    expX_uid25_q_uid7_block_rsrvd_fix_b <= redist60_in_0_in_0_2_q(62 downto 52);

    -- redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2(DELAY,996)
    redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid25_q_uid7_block_rsrvd_fix_b, xout => redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid40_q_uid7_block_rsrvd_fix(LOGICAL,39)@14
    expXIsMax_uid40_q_uid7_block_rsrvd_fix_q <= "1" WHEN redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- excI_x_uid43_q_uid7_block_rsrvd_fix(LOGICAL,42)@14
    excI_x_uid43_q_uid7_block_rsrvd_fix_q <= expXIsMax_uid40_q_uid7_block_rsrvd_fix_q and fracXIsZero_uid41_q_uid7_block_rsrvd_fix_q;

    -- excXIYI_uid146_q_uid7_block_rsrvd_fix(LOGICAL,145)@14
    excXIYI_uid146_q_uid7_block_rsrvd_fix_q <= excI_x_uid43_q_uid7_block_rsrvd_fix_q and excI_y_uid57_q_uid7_block_rsrvd_fix_q;

    -- fracXIsNotZero_uid56_q_uid7_block_rsrvd_fix(LOGICAL,55)@14
    fracXIsNotZero_uid56_q_uid7_block_rsrvd_fix_q <= not (redist49_fracXIsZero_uid55_q_uid7_block_rsrvd_fix_q_2_q);

    -- excN_y_uid58_q_uid7_block_rsrvd_fix(LOGICAL,57)@14
    excN_y_uid58_q_uid7_block_rsrvd_fix_q <= expXIsMax_uid54_q_uid7_block_rsrvd_fix_q and fracXIsNotZero_uid56_q_uid7_block_rsrvd_fix_q;

    -- fracXIsNotZero_uid42_q_uid7_block_rsrvd_fix(LOGICAL,41)@14
    fracXIsNotZero_uid42_q_uid7_block_rsrvd_fix_q <= not (fracXIsZero_uid41_q_uid7_block_rsrvd_fix_q);

    -- excN_x_uid44_q_uid7_block_rsrvd_fix(LOGICAL,43)@14
    excN_x_uid44_q_uid7_block_rsrvd_fix_q <= expXIsMax_uid40_q_uid7_block_rsrvd_fix_q and fracXIsNotZero_uid42_q_uid7_block_rsrvd_fix_q;

    -- cstAllZWE_uid36_q_uid7_block_rsrvd_fix(CONSTANT,35)
    cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q <= "00000000000";

    -- excZ_y_uid53_q_uid7_block_rsrvd_fix(LOGICAL,52)@14
    excZ_y_uid53_q_uid7_block_rsrvd_fix_q <= "1" WHEN redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- excZ_x_uid39_q_uid7_block_rsrvd_fix(LOGICAL,38)@14
    excZ_x_uid39_q_uid7_block_rsrvd_fix_q <= "1" WHEN redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- excXZYZ_uid145_q_uid7_block_rsrvd_fix(LOGICAL,144)@14
    excXZYZ_uid145_q_uid7_block_rsrvd_fix_q <= excZ_x_uid39_q_uid7_block_rsrvd_fix_q and excZ_y_uid53_q_uid7_block_rsrvd_fix_q;

    -- excRNaN_uid147_q_uid7_block_rsrvd_fix(LOGICAL,146)@14
    excRNaN_uid147_q_uid7_block_rsrvd_fix_q <= excXZYZ_uid145_q_uid7_block_rsrvd_fix_q or excN_x_uid44_q_uid7_block_rsrvd_fix_q or excN_y_uid58_q_uid7_block_rsrvd_fix_q or excXIYI_uid146_q_uid7_block_rsrvd_fix_q;

    -- invExcRNaN_uid158_q_uid7_block_rsrvd_fix(LOGICAL,157)@14
    invExcRNaN_uid158_q_uid7_block_rsrvd_fix_q <= not (excRNaN_uid147_q_uid7_block_rsrvd_fix_q);

    -- signY_uid30_q_uid7_block_rsrvd_fix(BITSELECT,29)@0
    signY_uid30_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(in_1(63 downto 63));

    -- redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14(DELAY,988)
    redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC" )
    PORT MAP ( xin => signY_uid30_q_uid7_block_rsrvd_fix_b, xout => redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14_q, clk => clk, aclr => areset );

    -- redist61_in_0_in_0_4(DELAY,998)
    redist61_in_0_in_0_4 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist60_in_0_in_0_2_q, xout => redist61_in_0_in_0_4_q, clk => clk, aclr => areset );

    -- signX_uid27_q_uid7_block_rsrvd_fix(BITSELECT,26)@14
    signX_uid27_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(redist61_in_0_in_0_4_q(63 downto 63));

    -- signR_uid62_q_uid7_block_rsrvd_fix(LOGICAL,61)@14
    signR_uid62_q_uid7_block_rsrvd_fix_q <= signX_uid27_q_uid7_block_rsrvd_fix_b xor redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14_q;

    -- sRPostExc_uid159_q_uid7_block_rsrvd_fix(LOGICAL,158)@14 + 1
    sRPostExc_uid159_q_uid7_block_rsrvd_fix_qi <= signR_uid62_q_uid7_block_rsrvd_fix_q and invExcRNaN_uid158_q_uid7_block_rsrvd_fix_q;
    sRPostExc_uid159_q_uid7_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sRPostExc_uid159_q_uid7_block_rsrvd_fix_qi, xout => sRPostExc_uid159_q_uid7_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- fracXExt_uid93_q_uid7_block_rsrvd_fix(BITJOIN,92)@12
    fracXExt_uid93_q_uid7_block_rsrvd_fix_q <= redist57_fracX_uid26_q_uid7_block_rsrvd_fix_b_2_q & GND_q;

    -- lOAdded_uid73_q_uid7_block_rsrvd_fix(BITJOIN,72)@10
    lOAdded_uid73_q_uid7_block_rsrvd_fix_q <= VCC_q & fracX_uid26_q_uid7_block_rsrvd_fix_b;

    -- redist35_lOAdded_uid73_q_uid7_block_rsrvd_fix_q_2(DELAY,972)
    redist35_lOAdded_uid73_q_uid7_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid73_q_uid7_block_rsrvd_fix_q, xout => redist35_lOAdded_uid73_q_uid7_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- z4_uid76_q_uid7_block_rsrvd_fix(CONSTANT,75)
    z4_uid76_q_uid7_block_rsrvd_fix_q <= "0000";

    -- oFracXZ4_uid77_q_uid7_block_rsrvd_fix(BITJOIN,76)@12
    oFracXZ4_uid77_q_uid7_block_rsrvd_fix_q <= redist35_lOAdded_uid73_q_uid7_block_rsrvd_fix_q_2_q & z4_uid76_q_uid7_block_rsrvd_fix_q;

    -- rightBottomY_uid586_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,585)@10
    rightBottomY_uid586_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= lOAdded_uid73_q_uid7_block_rsrvd_fix_q(52 downto 48);

    -- yPE_uid68_q_uid7_block_rsrvd_fix(BITSELECT,67)@0
    yPE_uid68_q_uid7_block_rsrvd_fix_b <= in_1(40 downto 0);

    -- redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2(DELAY,975)
    redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 41, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid68_q_uid7_block_rsrvd_fix_b, xout => redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4(DELAY,976)
    redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 41, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2_q, xout => redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6(DELAY,977)
    redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6 : dspba_delay
    GENERIC MAP ( width => 41, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4_q, xout => redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6_q, clk => clk, aclr => areset );

    -- redist41_yPE_uid68_q_uid7_block_rsrvd_fix_b_8(DELAY,978)
    redist41_yPE_uid68_q_uid7_block_rsrvd_fix_b_8 : dspba_delay
    GENERIC MAP ( width => 41, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6_q, xout => redist41_yPE_uid68_q_uid7_block_rsrvd_fix_b_8_q, clk => clk, aclr => areset );

    -- nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval(BITJOIN,745)@8
    nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval_q <= GND_q & redist41_yPE_uid68_q_uid7_block_rsrvd_fix_b_8_q;

    -- topRangeX_uid748_pT4_uid558_invPolyEval(BITSELECT,747)@8
    topRangeX_uid748_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval_q(41 downto 15));

    -- yT3_uid551_invPolyEval(BITSELECT,550)@6
    yT3_uid551_invPolyEval_b <= redist40_yPE_uid68_q_uid7_block_rsrvd_fix_b_6_q(40 downto 3);

    -- nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval(BITJOIN,710)@6
    nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval_q <= GND_q & yT3_uid551_invPolyEval_b;

    -- aboveLeftX_uid715_pT3_uid552_invPolyEval(BITSELECT,714)@6
    aboveLeftX_uid715_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval_q(38 downto 21));

    -- yAddr_uid67_q_uid7_block_rsrvd_fix(BITSELECT,66)@0
    yAddr_uid67_q_uid7_block_rsrvd_fix_b <= fracY_uid29_q_uid7_block_rsrvd_fix_b(51 downto 41);

    -- memoryC4_uid530_invTables_lutmem(DUALMEM,908)@0 + 2
    -- in j@20000000
    memoryC4_uid530_invTables_lutmem_aa <= yAddr_uid67_q_uid7_block_rsrvd_fix_b;
    memoryC4_uid530_invTables_lutmem_reset0 <= areset;
    memoryC4_uid530_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA38ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid530_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid530_invTables_lutmem_aa,
        q_a => memoryC4_uid530_invTables_lutmem_ir
    );
    memoryC4_uid530_invTables_lutmem_r <= memoryC4_uid530_invTables_lutmem_ir(4 downto 0);

    -- memoryC4_uid529_invTables_lutmem(DUALMEM,907)@0 + 2
    -- in j@20000000
    memoryC4_uid529_invTables_lutmem_aa <= yAddr_uid67_q_uid7_block_rsrvd_fix_b;
    memoryC4_uid529_invTables_lutmem_reset0 <= areset;
    memoryC4_uid529_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA37ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid529_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid529_invTables_lutmem_aa,
        q_a => memoryC4_uid529_invTables_lutmem_ir
    );
    memoryC4_uid529_invTables_lutmem_r <= memoryC4_uid529_invTables_lutmem_ir(4 downto 0);

    -- memoryC4_uid528_invTables_lutmem(DUALMEM,906)@0 + 2
    -- in j@20000000
    memoryC4_uid528_invTables_lutmem_aa <= yAddr_uid67_q_uid7_block_rsrvd_fix_b;
    memoryC4_uid528_invTables_lutmem_reset0 <= areset;
    memoryC4_uid528_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA36ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC4_uid528_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC4_uid528_invTables_lutmem_aa,
        q_a => memoryC4_uid528_invTables_lutmem_ir
    );
    memoryC4_uid528_invTables_lutmem_r <= memoryC4_uid528_invTables_lutmem_ir(4 downto 0);

    -- os_uid532_invTables(BITJOIN,531)@2
    os_uid532_invTables_q <= GND_q & memoryC4_uid530_invTables_lutmem_r & memoryC4_uid529_invTables_lutmem_r & memoryC4_uid528_invTables_lutmem_r;

    -- yT1_uid539_invPolyEval(BITSELECT,538)@2
    yT1_uid539_invPolyEval_b <= redist38_yPE_uid68_q_uid7_block_rsrvd_fix_b_2_q(40 downto 25);

    -- prodXY_uid671_pT1_uid540_invPolyEval_cma(CHAINMULTADD,912)@2 + 2
    prodXY_uid671_pT1_uid540_invPolyEval_cma_reset <= areset;
    prodXY_uid671_pT1_uid540_invPolyEval_cma_ena0 <= '1';
    prodXY_uid671_pT1_uid540_invPolyEval_cma_ena1 <= prodXY_uid671_pT1_uid540_invPolyEval_cma_ena0;
    prodXY_uid671_pT1_uid540_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid671_pT1_uid540_invPolyEval_cma_a0(0),17));
    prodXY_uid671_pT1_uid540_invPolyEval_cma_p(0) <= prodXY_uid671_pT1_uid540_invPolyEval_cma_l(0) * prodXY_uid671_pT1_uid540_invPolyEval_cma_c0(0);
    prodXY_uid671_pT1_uid540_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid671_pT1_uid540_invPolyEval_cma_p(0),33);
    prodXY_uid671_pT1_uid540_invPolyEval_cma_w(0) <= prodXY_uid671_pT1_uid540_invPolyEval_cma_u(0);
    prodXY_uid671_pT1_uid540_invPolyEval_cma_x(0) <= prodXY_uid671_pT1_uid540_invPolyEval_cma_w(0);
    prodXY_uid671_pT1_uid540_invPolyEval_cma_y(0) <= prodXY_uid671_pT1_uid540_invPolyEval_cma_x(0);
    prodXY_uid671_pT1_uid540_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid671_pT1_uid540_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid671_pT1_uid540_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid671_pT1_uid540_invPolyEval_cma_ena0 = '1') THEN
                prodXY_uid671_pT1_uid540_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid539_invPolyEval_b),16);
                prodXY_uid671_pT1_uid540_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(os_uid532_invTables_q),16);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid671_pT1_uid540_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid671_pT1_uid540_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid671_pT1_uid540_invPolyEval_cma_ena1 = '1') THEN
                prodXY_uid671_pT1_uid540_invPolyEval_cma_s(0) <= prodXY_uid671_pT1_uid540_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid671_pT1_uid540_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid671_pT1_uid540_invPolyEval_cma_s(0)(31 downto 0)), xout => prodXY_uid671_pT1_uid540_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid671_pT1_uid540_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid671_pT1_uid540_invPolyEval_cma_qq(31 downto 0));

    -- osig_uid672_pT1_uid540_invPolyEval(BITSELECT,671)@4
    osig_uid672_pT1_uid540_invPolyEval_b <= STD_LOGIC_VECTOR(prodXY_uid671_pT1_uid540_invPolyEval_cma_q(31 downto 14));

    -- highBBits_uid542_invPolyEval(BITSELECT,541)@4
    highBBits_uid542_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid672_pT1_uid540_invPolyEval_b(17 downto 1));

    -- redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2(DELAY,979)
    redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid67_q_uid7_block_rsrvd_fix_b, xout => redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- memoryC3_uid525_invTables_lutmem(DUALMEM,905)@2 + 2
    -- in j@20000000
    memoryC3_uid525_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid525_invTables_lutmem_reset0 <= areset;
    memoryC3_uid525_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 3,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA35ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid525_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid525_invTables_lutmem_aa,
        q_a => memoryC3_uid525_invTables_lutmem_ir
    );
    memoryC3_uid525_invTables_lutmem_r <= memoryC3_uid525_invTables_lutmem_ir(2 downto 0);

    -- memoryC3_uid524_invTables_lutmem(DUALMEM,904)@2 + 2
    -- in j@20000000
    memoryC3_uid524_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid524_invTables_lutmem_reset0 <= areset;
    memoryC3_uid524_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA34ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid524_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid524_invTables_lutmem_aa,
        q_a => memoryC3_uid524_invTables_lutmem_ir
    );
    memoryC3_uid524_invTables_lutmem_r <= memoryC3_uid524_invTables_lutmem_ir(4 downto 0);

    -- memoryC3_uid523_invTables_lutmem(DUALMEM,903)@2 + 2
    -- in j@20000000
    memoryC3_uid523_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid523_invTables_lutmem_reset0 <= areset;
    memoryC3_uid523_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA33ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid523_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid523_invTables_lutmem_aa,
        q_a => memoryC3_uid523_invTables_lutmem_ir
    );
    memoryC3_uid523_invTables_lutmem_r <= memoryC3_uid523_invTables_lutmem_ir(4 downto 0);

    -- memoryC3_uid522_invTables_lutmem(DUALMEM,902)@2 + 2
    -- in j@20000000
    memoryC3_uid522_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid522_invTables_lutmem_reset0 <= areset;
    memoryC3_uid522_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA32ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid522_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid522_invTables_lutmem_aa,
        q_a => memoryC3_uid522_invTables_lutmem_ir
    );
    memoryC3_uid522_invTables_lutmem_r <= memoryC3_uid522_invTables_lutmem_ir(4 downto 0);

    -- memoryC3_uid521_invTables_lutmem(DUALMEM,901)@2 + 2
    -- in j@20000000
    memoryC3_uid521_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid521_invTables_lutmem_reset0 <= areset;
    memoryC3_uid521_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA31ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid521_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid521_invTables_lutmem_aa,
        q_a => memoryC3_uid521_invTables_lutmem_ir
    );
    memoryC3_uid521_invTables_lutmem_r <= memoryC3_uid521_invTables_lutmem_ir(4 downto 0);

    -- memoryC3_uid520_invTables_lutmem(DUALMEM,900)@2 + 2
    -- in j@20000000
    memoryC3_uid520_invTables_lutmem_aa <= redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q;
    memoryC3_uid520_invTables_lutmem_reset0 <= areset;
    memoryC3_uid520_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA30ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC3_uid520_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC3_uid520_invTables_lutmem_aa,
        q_a => memoryC3_uid520_invTables_lutmem_ir
    );
    memoryC3_uid520_invTables_lutmem_r <= memoryC3_uid520_invTables_lutmem_ir(4 downto 0);

    -- os_uid526_invTables(BITJOIN,525)@4
    os_uid526_invTables_q <= memoryC3_uid525_invTables_lutmem_r & memoryC3_uid524_invTables_lutmem_r & memoryC3_uid523_invTables_lutmem_r & memoryC3_uid522_invTables_lutmem_r & memoryC3_uid521_invTables_lutmem_r & memoryC3_uid520_invTables_lutmem_r;

    -- s1sumAHighB_uid543_invPolyEval(ADD,542)@4
    s1sumAHighB_uid543_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => os_uid526_invTables_q(27)) & os_uid526_invTables_q));
    s1sumAHighB_uid543_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 17 => highBBits_uid542_invPolyEval_b(16)) & highBBits_uid542_invPolyEval_b));
    s1sumAHighB_uid543_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid543_invPolyEval_a) + SIGNED(s1sumAHighB_uid543_invPolyEval_b));
    s1sumAHighB_uid543_invPolyEval_q <= s1sumAHighB_uid543_invPolyEval_o(28 downto 0);

    -- lowRangeB_uid541_invPolyEval(BITSELECT,540)@4
    lowRangeB_uid541_invPolyEval_in <= osig_uid672_pT1_uid540_invPolyEval_b(0 downto 0);
    lowRangeB_uid541_invPolyEval_b <= lowRangeB_uid541_invPolyEval_in(0 downto 0);

    -- s1_uid544_invPolyEval(BITJOIN,543)@4
    s1_uid544_invPolyEval_q <= s1sumAHighB_uid543_invPolyEval_q & lowRangeB_uid541_invPolyEval_b;

    -- rightBottomY_uid683_pT2_uid546_invPolyEval(BITSELECT,682)@4
    rightBottomY_uid683_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid544_invPolyEval_q(29 downto 24));

    -- yT2_uid545_invPolyEval(BITSELECT,544)@4
    yT2_uid545_invPolyEval_b <= redist39_yPE_uid68_q_uid7_block_rsrvd_fix_b_4_q(40 downto 13);

    -- rightBottomX_uid682_pT2_uid546_invPolyEval(BITSELECT,681)@4
    rightBottomX_uid682_pT2_uid546_invPolyEval_in <= yT2_uid545_invPolyEval_b(0 downto 0);
    rightBottomX_uid682_pT2_uid546_invPolyEval_b <= rightBottomX_uid682_pT2_uid546_invPolyEval_in(0 downto 0);

    -- sm0_uid688_pT2_uid546_invPolyEval(MULT,687)@4 + 2
    sm0_uid688_pT2_uid546_invPolyEval_pr <= signed(resize(UNSIGNED(sm0_uid688_pT2_uid546_invPolyEval_a0),2)) * SIGNED(sm0_uid688_pT2_uid546_invPolyEval_b0);
    sm0_uid688_pT2_uid546_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid688_pT2_uid546_invPolyEval_a0 <= (others => '0');
            sm0_uid688_pT2_uid546_invPolyEval_b0 <= (others => '0');
            sm0_uid688_pT2_uid546_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid688_pT2_uid546_invPolyEval_a0 <= rightBottomX_uid682_pT2_uid546_invPolyEval_b;
            sm0_uid688_pT2_uid546_invPolyEval_b0 <= STD_LOGIC_VECTOR(rightBottomY_uid683_pT2_uid546_invPolyEval_b);
            sm0_uid688_pT2_uid546_invPolyEval_s1 <= STD_LOGIC_VECTOR(resize(sm0_uid688_pT2_uid546_invPolyEval_pr,7));
        END IF;
    END PROCESS;
    sm0_uid688_pT2_uid546_invPolyEval_q <= sm0_uid688_pT2_uid546_invPolyEval_s1;

    -- aboveLeftY_uid681_pT2_uid546_invPolyEval(BITSELECT,680)@4
    aboveLeftY_uid681_pT2_uid546_invPolyEval_in <= s1_uid544_invPolyEval_q(2 downto 0);
    aboveLeftY_uid681_pT2_uid546_invPolyEval_b <= aboveLeftY_uid681_pT2_uid546_invPolyEval_in(2 downto 0);

    -- aboveLeftX_uid680_pT2_uid546_invPolyEval(BITSELECT,679)@4
    aboveLeftX_uid680_pT2_uid546_invPolyEval_b <= yT2_uid545_invPolyEval_b(27 downto 24);

    -- sm0_uid687_pT2_uid546_invPolyEval(MULT,686)@4 + 2
    sm0_uid687_pT2_uid546_invPolyEval_pr <= UNSIGNED(sm0_uid687_pT2_uid546_invPolyEval_a0) * UNSIGNED(sm0_uid687_pT2_uid546_invPolyEval_b0);
    sm0_uid687_pT2_uid546_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid687_pT2_uid546_invPolyEval_a0 <= (others => '0');
            sm0_uid687_pT2_uid546_invPolyEval_b0 <= (others => '0');
            sm0_uid687_pT2_uid546_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid687_pT2_uid546_invPolyEval_a0 <= aboveLeftX_uid680_pT2_uid546_invPolyEval_b;
            sm0_uid687_pT2_uid546_invPolyEval_b0 <= aboveLeftY_uid681_pT2_uid546_invPolyEval_b;
            sm0_uid687_pT2_uid546_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid687_pT2_uid546_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid687_pT2_uid546_invPolyEval_q <= sm0_uid687_pT2_uid546_invPolyEval_s1;

    -- topRangeY_uid685_pT2_uid546_invPolyEval(BITSELECT,684)@4
    topRangeY_uid685_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(s1_uid544_invPolyEval_q(29 downto 3));

    -- topRangeX_uid684_pT2_uid546_invPolyEval(BITSELECT,683)@4
    topRangeX_uid684_pT2_uid546_invPolyEval_b <= yT2_uid545_invPolyEval_b(27 downto 1);

    -- sm0_uid686_pT2_uid546_invPolyEval_cma(CHAINMULTADD,913)@4 + 2
    sm0_uid686_pT2_uid546_invPolyEval_cma_reset <= areset;
    sm0_uid686_pT2_uid546_invPolyEval_cma_ena0 <= '1';
    sm0_uid686_pT2_uid546_invPolyEval_cma_ena1 <= sm0_uid686_pT2_uid546_invPolyEval_cma_ena0;
    sm0_uid686_pT2_uid546_invPolyEval_cma_l(0) <= SIGNED(RESIZE(sm0_uid686_pT2_uid546_invPolyEval_cma_a0(0),28));
    sm0_uid686_pT2_uid546_invPolyEval_cma_p(0) <= sm0_uid686_pT2_uid546_invPolyEval_cma_l(0) * sm0_uid686_pT2_uid546_invPolyEval_cma_c0(0);
    sm0_uid686_pT2_uid546_invPolyEval_cma_u(0) <= RESIZE(sm0_uid686_pT2_uid546_invPolyEval_cma_p(0),55);
    sm0_uid686_pT2_uid546_invPolyEval_cma_w(0) <= sm0_uid686_pT2_uid546_invPolyEval_cma_u(0);
    sm0_uid686_pT2_uid546_invPolyEval_cma_x(0) <= sm0_uid686_pT2_uid546_invPolyEval_cma_w(0);
    sm0_uid686_pT2_uid546_invPolyEval_cma_y(0) <= sm0_uid686_pT2_uid546_invPolyEval_cma_x(0);
    sm0_uid686_pT2_uid546_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid686_pT2_uid546_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid686_pT2_uid546_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid686_pT2_uid546_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid686_pT2_uid546_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(topRangeX_uid684_pT2_uid546_invPolyEval_b),27);
                sm0_uid686_pT2_uid546_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid685_pT2_uid546_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid686_pT2_uid546_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid686_pT2_uid546_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid686_pT2_uid546_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid686_pT2_uid546_invPolyEval_cma_s(0) <= sm0_uid686_pT2_uid546_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid686_pT2_uid546_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid686_pT2_uid546_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid686_pT2_uid546_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid686_pT2_uid546_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid686_pT2_uid546_invPolyEval_cma_qq(53 downto 0));

    -- highABits_uid690_pT2_uid546_invPolyEval(BITSELECT,689)@6
    highABits_uid690_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(sm0_uid686_pT2_uid546_invPolyEval_cma_q(53 downto 20));

    -- lev1_a0high_uid691_pT2_uid546_invPolyEval(ADD,690)@6
    lev1_a0high_uid691_pT2_uid546_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => highABits_uid690_pT2_uid546_invPolyEval_b(33)) & highABits_uid690_pT2_uid546_invPolyEval_b));
    lev1_a0high_uid691_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000000000000000" & sm0_uid687_pT2_uid546_invPolyEval_q));
    lev1_a0high_uid691_pT2_uid546_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0high_uid691_pT2_uid546_invPolyEval_a) + SIGNED(lev1_a0high_uid691_pT2_uid546_invPolyEval_b));
    lev1_a0high_uid691_pT2_uid546_invPolyEval_q <= lev1_a0high_uid691_pT2_uid546_invPolyEval_o(34 downto 0);

    -- lowRangeA_uid689_pT2_uid546_invPolyEval(BITSELECT,688)@6
    lowRangeA_uid689_pT2_uid546_invPolyEval_in <= sm0_uid686_pT2_uid546_invPolyEval_cma_q(19 downto 0);
    lowRangeA_uid689_pT2_uid546_invPolyEval_b <= lowRangeA_uid689_pT2_uid546_invPolyEval_in(19 downto 0);

    -- lev1_a0_uid692_pT2_uid546_invPolyEval(BITJOIN,691)@6
    lev1_a0_uid692_pT2_uid546_invPolyEval_q <= lev1_a0high_uid691_pT2_uid546_invPolyEval_q & lowRangeA_uid689_pT2_uid546_invPolyEval_b;

    -- highABits_uid694_pT2_uid546_invPolyEval(BITSELECT,693)@6
    highABits_uid694_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(lev1_a0_uid692_pT2_uid546_invPolyEval_q(54 downto 20));

    -- lev2_a0high_uid695_pT2_uid546_invPolyEval(ADD,694)@6
    lev2_a0high_uid695_pT2_uid546_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 35 => highABits_uid694_pT2_uid546_invPolyEval_b(34)) & highABits_uid694_pT2_uid546_invPolyEval_b));
    lev2_a0high_uid695_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 7 => sm0_uid688_pT2_uid546_invPolyEval_q(6)) & sm0_uid688_pT2_uid546_invPolyEval_q));
    lev2_a0high_uid695_pT2_uid546_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0high_uid695_pT2_uid546_invPolyEval_a) + SIGNED(lev2_a0high_uid695_pT2_uid546_invPolyEval_b));
    lev2_a0high_uid695_pT2_uid546_invPolyEval_q <= lev2_a0high_uid695_pT2_uid546_invPolyEval_o(35 downto 0);

    -- lowRangeA_uid693_pT2_uid546_invPolyEval(BITSELECT,692)@6
    lowRangeA_uid693_pT2_uid546_invPolyEval_in <= lev1_a0_uid692_pT2_uid546_invPolyEval_q(19 downto 0);
    lowRangeA_uid693_pT2_uid546_invPolyEval_b <= lowRangeA_uid693_pT2_uid546_invPolyEval_in(19 downto 0);

    -- lev2_a0_uid696_pT2_uid546_invPolyEval(BITJOIN,695)@6
    lev2_a0_uid696_pT2_uid546_invPolyEval_q <= lev2_a0high_uid695_pT2_uid546_invPolyEval_q & lowRangeA_uid693_pT2_uid546_invPolyEval_b;

    -- os_uid697_pT2_uid546_invPolyEval(BITSELECT,696)@6
    os_uid697_pT2_uid546_invPolyEval_in <= STD_LOGIC_VECTOR(lev2_a0_uid696_pT2_uid546_invPolyEval_q(53 downto 0));
    os_uid697_pT2_uid546_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid697_pT2_uid546_invPolyEval_in(53 downto 25));

    -- highBBits_uid548_invPolyEval(BITSELECT,547)@6
    highBBits_uid548_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid697_pT2_uid546_invPolyEval_b(28 downto 1));

    -- redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4(DELAY,980)
    redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist42_yAddr_uid67_q_uid7_block_rsrvd_fix_b_2_q, xout => redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- memoryC2_uid517_invTables_lutmem(DUALMEM,899)@4 + 2
    -- in j@20000000
    memoryC2_uid517_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid517_invTables_lutmem_reset0 <= areset;
    memoryC2_uid517_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 3,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA29ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid517_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid517_invTables_lutmem_aa,
        q_a => memoryC2_uid517_invTables_lutmem_ir
    );
    memoryC2_uid517_invTables_lutmem_r <= memoryC2_uid517_invTables_lutmem_ir(2 downto 0);

    -- memoryC2_uid516_invTables_lutmem(DUALMEM,898)@4 + 2
    -- in j@20000000
    memoryC2_uid516_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid516_invTables_lutmem_reset0 <= areset;
    memoryC2_uid516_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA28ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid516_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid516_invTables_lutmem_aa,
        q_a => memoryC2_uid516_invTables_lutmem_ir
    );
    memoryC2_uid516_invTables_lutmem_r <= memoryC2_uid516_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid515_invTables_lutmem(DUALMEM,897)@4 + 2
    -- in j@20000000
    memoryC2_uid515_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid515_invTables_lutmem_reset0 <= areset;
    memoryC2_uid515_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA27ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid515_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid515_invTables_lutmem_aa,
        q_a => memoryC2_uid515_invTables_lutmem_ir
    );
    memoryC2_uid515_invTables_lutmem_r <= memoryC2_uid515_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid514_invTables_lutmem(DUALMEM,896)@4 + 2
    -- in j@20000000
    memoryC2_uid514_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid514_invTables_lutmem_reset0 <= areset;
    memoryC2_uid514_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA26ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid514_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid514_invTables_lutmem_aa,
        q_a => memoryC2_uid514_invTables_lutmem_ir
    );
    memoryC2_uid514_invTables_lutmem_r <= memoryC2_uid514_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid513_invTables_lutmem(DUALMEM,895)@4 + 2
    -- in j@20000000
    memoryC2_uid513_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid513_invTables_lutmem_reset0 <= areset;
    memoryC2_uid513_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA25ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid513_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid513_invTables_lutmem_aa,
        q_a => memoryC2_uid513_invTables_lutmem_ir
    );
    memoryC2_uid513_invTables_lutmem_r <= memoryC2_uid513_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid512_invTables_lutmem(DUALMEM,894)@4 + 2
    -- in j@20000000
    memoryC2_uid512_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid512_invTables_lutmem_reset0 <= areset;
    memoryC2_uid512_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA24ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid512_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid512_invTables_lutmem_aa,
        q_a => memoryC2_uid512_invTables_lutmem_ir
    );
    memoryC2_uid512_invTables_lutmem_r <= memoryC2_uid512_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid511_invTables_lutmem(DUALMEM,893)@4 + 2
    -- in j@20000000
    memoryC2_uid511_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid511_invTables_lutmem_reset0 <= areset;
    memoryC2_uid511_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA23ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid511_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid511_invTables_lutmem_aa,
        q_a => memoryC2_uid511_invTables_lutmem_ir
    );
    memoryC2_uid511_invTables_lutmem_r <= memoryC2_uid511_invTables_lutmem_ir(4 downto 0);

    -- memoryC2_uid510_invTables_lutmem(DUALMEM,892)@4 + 2
    -- in j@20000000
    memoryC2_uid510_invTables_lutmem_aa <= redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q;
    memoryC2_uid510_invTables_lutmem_reset0 <= areset;
    memoryC2_uid510_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA22ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid510_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid510_invTables_lutmem_aa,
        q_a => memoryC2_uid510_invTables_lutmem_ir
    );
    memoryC2_uid510_invTables_lutmem_r <= memoryC2_uid510_invTables_lutmem_ir(4 downto 0);

    -- os_uid518_invTables(BITJOIN,517)@6
    os_uid518_invTables_q <= memoryC2_uid517_invTables_lutmem_r & memoryC2_uid516_invTables_lutmem_r & memoryC2_uid515_invTables_lutmem_r & memoryC2_uid514_invTables_lutmem_r & memoryC2_uid513_invTables_lutmem_r & memoryC2_uid512_invTables_lutmem_r & memoryC2_uid511_invTables_lutmem_r & memoryC2_uid510_invTables_lutmem_r;

    -- s2sumAHighB_uid549_invPolyEval(ADD,548)@6
    s2sumAHighB_uid549_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 38 => os_uid518_invTables_q(37)) & os_uid518_invTables_q));
    s2sumAHighB_uid549_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 28 => highBBits_uid548_invPolyEval_b(27)) & highBBits_uid548_invPolyEval_b));
    s2sumAHighB_uid549_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid549_invPolyEval_a) + SIGNED(s2sumAHighB_uid549_invPolyEval_b));
    s2sumAHighB_uid549_invPolyEval_q <= s2sumAHighB_uid549_invPolyEval_o(38 downto 0);

    -- lowRangeB_uid547_invPolyEval(BITSELECT,546)@6
    lowRangeB_uid547_invPolyEval_in <= os_uid697_pT2_uid546_invPolyEval_b(0 downto 0);
    lowRangeB_uid547_invPolyEval_b <= lowRangeB_uid547_invPolyEval_in(0 downto 0);

    -- s2_uid550_invPolyEval(BITJOIN,549)@6
    s2_uid550_invPolyEval_q <= s2sumAHighB_uid549_invPolyEval_q & lowRangeB_uid547_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval(BITSELECT,716)@6
    aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_in <= STD_LOGIC_VECTOR(s2_uid550_invPolyEval_q(12 downto 0));
    aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_in(12 downto 0));

    -- aboveLeftY_bottomExtension_uid716_pT3_uid552_invPolyEval(CONSTANT,715)
    aboveLeftY_bottomExtension_uid716_pT3_uid552_invPolyEval_q <= "00000";

    -- aboveLeftY_mergedSignalTM_uid718_pT3_uid552_invPolyEval(BITJOIN,717)@6
    aboveLeftY_mergedSignalTM_uid718_pT3_uid552_invPolyEval_q <= aboveLeftY_bottomRange_uid717_pT3_uid552_invPolyEval_b & aboveLeftY_bottomExtension_uid716_pT3_uid552_invPolyEval_q;

    -- rightBottomY_uid724_pT3_uid552_invPolyEval(BITSELECT,723)@6
    rightBottomY_uid724_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid550_invPolyEval_q(39 downto 22));

    -- rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval(BITSELECT,720)@6
    rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval_q(11 downto 0));
    rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_in(11 downto 0));

    -- rightBottomX_bottomExtension_uid720_pT3_uid552_invPolyEval(CONSTANT,719)
    rightBottomX_bottomExtension_uid720_pT3_uid552_invPolyEval_q <= "000000";

    -- rightBottomX_mergedSignalTM_uid722_pT3_uid552_invPolyEval(BITJOIN,721)@6
    rightBottomX_mergedSignalTM_uid722_pT3_uid552_invPolyEval_q <= rightBottomX_bottomRange_uid721_pT3_uid552_invPolyEval_b & rightBottomX_bottomExtension_uid720_pT3_uid552_invPolyEval_q;

    -- multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma(CHAINMULTADD,920)@6 + 2
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0(0),19));
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0(1),19));
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_l(0) * multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_l(1) * multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_p(0),38);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_p(1),38);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_u(0) + multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid722_pT3_uid552_invPolyEval_q),18);
                multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid718_pT3_uid552_invPolyEval_q),18);
                multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(rightBottomY_uid724_pT3_uid552_invPolyEval_b),18);
                multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(aboveLeftX_uid715_pT3_uid552_invPolyEval_b),18);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_s(0)(36 downto 0)), xout => multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_qq(36 downto 0));

    -- highBBits_uid729_pT3_uid552_invPolyEval(BITSELECT,728)@8
    highBBits_uid729_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_q(36 downto 9));

    -- topRangeY_uid714_pT3_uid552_invPolyEval(BITSELECT,713)@6
    topRangeY_uid714_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(s2_uid550_invPolyEval_q(39 downto 13));

    -- topRangeX_uid713_pT3_uid552_invPolyEval(BITSELECT,712)@6
    topRangeX_uid713_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid711_pT3_uid552_invPolyEval_q(38 downto 12));

    -- sm0_uid725_pT3_uid552_invPolyEval_cma(CHAINMULTADD,914)@6 + 2
    sm0_uid725_pT3_uid552_invPolyEval_cma_reset <= areset;
    sm0_uid725_pT3_uid552_invPolyEval_cma_ena0 <= '1';
    sm0_uid725_pT3_uid552_invPolyEval_cma_ena1 <= sm0_uid725_pT3_uid552_invPolyEval_cma_ena0;
    sm0_uid725_pT3_uid552_invPolyEval_cma_p(0) <= sm0_uid725_pT3_uid552_invPolyEval_cma_a0(0) * sm0_uid725_pT3_uid552_invPolyEval_cma_c0(0);
    sm0_uid725_pT3_uid552_invPolyEval_cma_u(0) <= RESIZE(sm0_uid725_pT3_uid552_invPolyEval_cma_p(0),54);
    sm0_uid725_pT3_uid552_invPolyEval_cma_w(0) <= sm0_uid725_pT3_uid552_invPolyEval_cma_u(0);
    sm0_uid725_pT3_uid552_invPolyEval_cma_x(0) <= sm0_uid725_pT3_uid552_invPolyEval_cma_w(0);
    sm0_uid725_pT3_uid552_invPolyEval_cma_y(0) <= sm0_uid725_pT3_uid552_invPolyEval_cma_x(0);
    sm0_uid725_pT3_uid552_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid725_pT3_uid552_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid725_pT3_uid552_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid725_pT3_uid552_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid725_pT3_uid552_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid713_pT3_uid552_invPolyEval_b),27);
                sm0_uid725_pT3_uid552_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid714_pT3_uid552_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid725_pT3_uid552_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid725_pT3_uid552_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid725_pT3_uid552_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid725_pT3_uid552_invPolyEval_cma_s(0) <= sm0_uid725_pT3_uid552_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid725_pT3_uid552_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid725_pT3_uid552_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid725_pT3_uid552_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid725_pT3_uid552_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid725_pT3_uid552_invPolyEval_cma_qq(53 downto 0));

    -- lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval(ADD,729)@8
    lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 54 => sm0_uid725_pT3_uid552_invPolyEval_cma_q(53)) & sm0_uid725_pT3_uid552_invPolyEval_cma_q));
    lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((54 downto 28 => highBBits_uid729_pT3_uid552_invPolyEval_b(27)) & highBBits_uid729_pT3_uid552_invPolyEval_b));
    lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_b));
    lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_q <= lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_o(54 downto 0);

    -- lowRangeB_uid728_pT3_uid552_invPolyEval(BITSELECT,727)@8
    lowRangeB_uid728_pT3_uid552_invPolyEval_in <= multSumOfTwoTS_uid726_pT3_uid552_invPolyEval_cma_q(8 downto 0);
    lowRangeB_uid728_pT3_uid552_invPolyEval_b <= lowRangeB_uid728_pT3_uid552_invPolyEval_in(8 downto 0);

    -- lev1_a0_uid731_pT3_uid552_invPolyEval(BITJOIN,730)@8
    lev1_a0_uid731_pT3_uid552_invPolyEval_q <= lev1_a0sumAHighB_uid730_pT3_uid552_invPolyEval_q & lowRangeB_uid728_pT3_uid552_invPolyEval_b;

    -- os_uid732_pT3_uid552_invPolyEval(BITSELECT,731)@8
    os_uid732_pT3_uid552_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid731_pT3_uid552_invPolyEval_q(61 downto 0));
    os_uid732_pT3_uid552_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid732_pT3_uid552_invPolyEval_in(61 downto 22));

    -- highBBits_uid554_invPolyEval(BITSELECT,553)@8
    highBBits_uid554_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid732_pT3_uid552_invPolyEval_b(39 downto 1));

    -- redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6(DELAY,981)
    redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist43_yAddr_uid67_q_uid7_block_rsrvd_fix_b_4_q, xout => redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q, clk => clk, aclr => areset );

    -- memoryC1_uid507_invTables_lutmem(DUALMEM,891)@6 + 2
    -- in j@20000000
    memoryC1_uid507_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid507_invTables_lutmem_reset0 <= areset;
    memoryC1_uid507_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 4,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA21ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid507_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid507_invTables_lutmem_aa,
        q_a => memoryC1_uid507_invTables_lutmem_ir
    );
    memoryC1_uid507_invTables_lutmem_r <= memoryC1_uid507_invTables_lutmem_ir(3 downto 0);

    -- memoryC1_uid506_invTables_lutmem(DUALMEM,890)@6 + 2
    -- in j@20000000
    memoryC1_uid506_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid506_invTables_lutmem_reset0 <= areset;
    memoryC1_uid506_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA20ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid506_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid506_invTables_lutmem_aa,
        q_a => memoryC1_uid506_invTables_lutmem_ir
    );
    memoryC1_uid506_invTables_lutmem_r <= memoryC1_uid506_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid505_invTables_lutmem(DUALMEM,889)@6 + 2
    -- in j@20000000
    memoryC1_uid505_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid505_invTables_lutmem_reset0 <= areset;
    memoryC1_uid505_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA19ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid505_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid505_invTables_lutmem_aa,
        q_a => memoryC1_uid505_invTables_lutmem_ir
    );
    memoryC1_uid505_invTables_lutmem_r <= memoryC1_uid505_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid504_invTables_lutmem(DUALMEM,888)@6 + 2
    -- in j@20000000
    memoryC1_uid504_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid504_invTables_lutmem_reset0 <= areset;
    memoryC1_uid504_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA18ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid504_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid504_invTables_lutmem_aa,
        q_a => memoryC1_uid504_invTables_lutmem_ir
    );
    memoryC1_uid504_invTables_lutmem_r <= memoryC1_uid504_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid503_invTables_lutmem(DUALMEM,887)@6 + 2
    -- in j@20000000
    memoryC1_uid503_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid503_invTables_lutmem_reset0 <= areset;
    memoryC1_uid503_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA17ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid503_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid503_invTables_lutmem_aa,
        q_a => memoryC1_uid503_invTables_lutmem_ir
    );
    memoryC1_uid503_invTables_lutmem_r <= memoryC1_uid503_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid502_invTables_lutmem(DUALMEM,886)@6 + 2
    -- in j@20000000
    memoryC1_uid502_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid502_invTables_lutmem_reset0 <= areset;
    memoryC1_uid502_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA16ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid502_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid502_invTables_lutmem_aa,
        q_a => memoryC1_uid502_invTables_lutmem_ir
    );
    memoryC1_uid502_invTables_lutmem_r <= memoryC1_uid502_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid501_invTables_lutmem(DUALMEM,885)@6 + 2
    -- in j@20000000
    memoryC1_uid501_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid501_invTables_lutmem_reset0 <= areset;
    memoryC1_uid501_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA15ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid501_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid501_invTables_lutmem_aa,
        q_a => memoryC1_uid501_invTables_lutmem_ir
    );
    memoryC1_uid501_invTables_lutmem_r <= memoryC1_uid501_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid500_invTables_lutmem(DUALMEM,884)@6 + 2
    -- in j@20000000
    memoryC1_uid500_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid500_invTables_lutmem_reset0 <= areset;
    memoryC1_uid500_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA14ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid500_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid500_invTables_lutmem_aa,
        q_a => memoryC1_uid500_invTables_lutmem_ir
    );
    memoryC1_uid500_invTables_lutmem_r <= memoryC1_uid500_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid499_invTables_lutmem(DUALMEM,883)@6 + 2
    -- in j@20000000
    memoryC1_uid499_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid499_invTables_lutmem_reset0 <= areset;
    memoryC1_uid499_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA13ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid499_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid499_invTables_lutmem_aa,
        q_a => memoryC1_uid499_invTables_lutmem_ir
    );
    memoryC1_uid499_invTables_lutmem_r <= memoryC1_uid499_invTables_lutmem_ir(4 downto 0);

    -- memoryC1_uid498_invTables_lutmem(DUALMEM,882)@6 + 2
    -- in j@20000000
    memoryC1_uid498_invTables_lutmem_aa <= redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q;
    memoryC1_uid498_invTables_lutmem_reset0 <= areset;
    memoryC1_uid498_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA12ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid498_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid498_invTables_lutmem_aa,
        q_a => memoryC1_uid498_invTables_lutmem_ir
    );
    memoryC1_uid498_invTables_lutmem_r <= memoryC1_uid498_invTables_lutmem_ir(4 downto 0);

    -- os_uid508_invTables(BITJOIN,507)@8
    os_uid508_invTables_q <= memoryC1_uid507_invTables_lutmem_r & memoryC1_uid506_invTables_lutmem_r & memoryC1_uid505_invTables_lutmem_r & memoryC1_uid504_invTables_lutmem_r & memoryC1_uid503_invTables_lutmem_r & memoryC1_uid502_invTables_lutmem_r & memoryC1_uid501_invTables_lutmem_r & memoryC1_uid500_invTables_lutmem_r & memoryC1_uid499_invTables_lutmem_r & memoryC1_uid498_invTables_lutmem_r;

    -- s3sumAHighB_uid555_invPolyEval(ADD,554)@8
    s3sumAHighB_uid555_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 49 => os_uid508_invTables_q(48)) & os_uid508_invTables_q));
    s3sumAHighB_uid555_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((49 downto 39 => highBBits_uid554_invPolyEval_b(38)) & highBBits_uid554_invPolyEval_b));
    s3sumAHighB_uid555_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s3sumAHighB_uid555_invPolyEval_a) + SIGNED(s3sumAHighB_uid555_invPolyEval_b));
    s3sumAHighB_uid555_invPolyEval_q <= s3sumAHighB_uid555_invPolyEval_o(49 downto 0);

    -- lowRangeB_uid553_invPolyEval(BITSELECT,552)@8
    lowRangeB_uid553_invPolyEval_in <= os_uid732_pT3_uid552_invPolyEval_b(0 downto 0);
    lowRangeB_uid553_invPolyEval_b <= lowRangeB_uid553_invPolyEval_in(0 downto 0);

    -- s3_uid556_invPolyEval(BITJOIN,555)@8
    s3_uid556_invPolyEval_q <= s3sumAHighB_uid555_invPolyEval_q & lowRangeB_uid553_invPolyEval_b;

    -- aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval(BITSELECT,751)@8
    aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_in <= STD_LOGIC_VECTOR(s3_uid556_invPolyEval_q(23 downto 0));
    aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_in(23 downto 0));

    -- aboveLeftY_bottomExtension_uid751_pT4_uid558_invPolyEval(CONSTANT,750)
    aboveLeftY_bottomExtension_uid751_pT4_uid558_invPolyEval_q <= "000";

    -- aboveLeftY_mergedSignalTM_uid753_pT4_uid558_invPolyEval(BITJOIN,752)@8
    aboveLeftY_mergedSignalTM_uid753_pT4_uid558_invPolyEval_q <= aboveLeftY_bottomRange_uid752_pT4_uid558_invPolyEval_b & aboveLeftY_bottomExtension_uid751_pT4_uid558_invPolyEval_q;

    -- topRangeY_uid749_pT4_uid558_invPolyEval(BITSELECT,748)@8
    topRangeY_uid749_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(s3_uid556_invPolyEval_q(50 downto 24));

    -- rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval(BITSELECT,755)@8
    rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_in <= STD_LOGIC_VECTOR(nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval_q(14 downto 0));
    rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_in(14 downto 0));

    -- rightBottomX_bottomExtension_uid755_pT4_uid558_invPolyEval(CONSTANT,754)
    rightBottomX_bottomExtension_uid755_pT4_uid558_invPolyEval_q <= "000000000000";

    -- rightBottomX_mergedSignalTM_uid757_pT4_uid558_invPolyEval(BITJOIN,756)@8
    rightBottomX_mergedSignalTM_uid757_pT4_uid558_invPolyEval_q <= rightBottomX_bottomRange_uid756_pT4_uid558_invPolyEval_b & rightBottomX_bottomExtension_uid755_pT4_uid558_invPolyEval_q;

    -- multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma(CHAINMULTADD,921)@8 + 2
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_reset <= areset;
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena0 <= '1';
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena1 <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena0;
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_l(0) <= SIGNED(RESIZE(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0(0),28));
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_l(1) <= SIGNED(RESIZE(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0(1),28));
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_p(0) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_l(0) * multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0(0);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_p(1) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_l(1) * multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0(1);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_u(0) <= RESIZE(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_p(0),56);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_u(1) <= RESIZE(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_p(1),56);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_w(0) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_u(0) + multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_u(1);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_x(0) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_w(0);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_y(0) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_x(0);
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid757_pT4_uid558_invPolyEval_q),27);
                multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid753_pT4_uid558_invPolyEval_q),27);
                multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid749_pT4_uid558_invPolyEval_b),27);
                multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_c0(1) <= RESIZE(SIGNED(topRangeX_uid748_pT4_uid558_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_s(0) <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_qq(54 downto 0));

    -- highBBits_uid768_pT4_uid558_invPolyEval(BITSELECT,767)@10
    highBBits_uid768_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_q(54 downto 23));

    -- sm0_uid762_pT4_uid558_invPolyEval_cma(CHAINMULTADD,915)@8 + 2
    sm0_uid762_pT4_uid558_invPolyEval_cma_reset <= areset;
    sm0_uid762_pT4_uid558_invPolyEval_cma_ena0 <= '1';
    sm0_uid762_pT4_uid558_invPolyEval_cma_ena1 <= sm0_uid762_pT4_uid558_invPolyEval_cma_ena0;
    sm0_uid762_pT4_uid558_invPolyEval_cma_p(0) <= sm0_uid762_pT4_uid558_invPolyEval_cma_a0(0) * sm0_uid762_pT4_uid558_invPolyEval_cma_c0(0);
    sm0_uid762_pT4_uid558_invPolyEval_cma_u(0) <= RESIZE(sm0_uid762_pT4_uid558_invPolyEval_cma_p(0),54);
    sm0_uid762_pT4_uid558_invPolyEval_cma_w(0) <= sm0_uid762_pT4_uid558_invPolyEval_cma_u(0);
    sm0_uid762_pT4_uid558_invPolyEval_cma_x(0) <= sm0_uid762_pT4_uid558_invPolyEval_cma_w(0);
    sm0_uid762_pT4_uid558_invPolyEval_cma_y(0) <= sm0_uid762_pT4_uid558_invPolyEval_cma_x(0);
    sm0_uid762_pT4_uid558_invPolyEval_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid762_pT4_uid558_invPolyEval_cma_a0 <= (others => (others => '0'));
            sm0_uid762_pT4_uid558_invPolyEval_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid762_pT4_uid558_invPolyEval_cma_ena0 = '1') THEN
                sm0_uid762_pT4_uid558_invPolyEval_cma_a0(0) <= RESIZE(SIGNED(topRangeX_uid748_pT4_uid558_invPolyEval_b),27);
                sm0_uid762_pT4_uid558_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(topRangeY_uid749_pT4_uid558_invPolyEval_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid762_pT4_uid558_invPolyEval_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid762_pT4_uid558_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid762_pT4_uid558_invPolyEval_cma_ena1 = '1') THEN
                sm0_uid762_pT4_uid558_invPolyEval_cma_s(0) <= sm0_uid762_pT4_uid558_invPolyEval_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid762_pT4_uid558_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid762_pT4_uid558_invPolyEval_cma_s(0)(53 downto 0)), xout => sm0_uid762_pT4_uid558_invPolyEval_cma_qq, clk => clk, aclr => areset );
    sm0_uid762_pT4_uid558_invPolyEval_cma_q <= STD_LOGIC_VECTOR(sm0_uid762_pT4_uid558_invPolyEval_cma_qq(53 downto 0));

    -- aboveLeftY_uid761_pT4_uid558_invPolyEval(BITSELECT,760)@8
    aboveLeftY_uid761_pT4_uid558_invPolyEval_in <= s3_uid556_invPolyEval_q(23 downto 0);
    aboveLeftY_uid761_pT4_uid558_invPolyEval_b <= aboveLeftY_uid761_pT4_uid558_invPolyEval_in(23 downto 22);

    -- aboveLeftX_uid760_pT4_uid558_invPolyEval(BITSELECT,759)@8
    aboveLeftX_uid760_pT4_uid558_invPolyEval_in <= nx_mergedSignalTM_uid746_pT4_uid558_invPolyEval_q(14 downto 0);
    aboveLeftX_uid760_pT4_uid558_invPolyEval_b <= aboveLeftX_uid760_pT4_uid558_invPolyEval_in(14 downto 13);

    -- sm0_uid765_pT4_uid558_invPolyEval(MULT,764)@8 + 2
    sm0_uid765_pT4_uid558_invPolyEval_pr <= UNSIGNED(sm0_uid765_pT4_uid558_invPolyEval_a0) * UNSIGNED(sm0_uid765_pT4_uid558_invPolyEval_b0);
    sm0_uid765_pT4_uid558_invPolyEval_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid765_pT4_uid558_invPolyEval_a0 <= (others => '0');
            sm0_uid765_pT4_uid558_invPolyEval_b0 <= (others => '0');
            sm0_uid765_pT4_uid558_invPolyEval_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid765_pT4_uid558_invPolyEval_a0 <= aboveLeftX_uid760_pT4_uid558_invPolyEval_b;
            sm0_uid765_pT4_uid558_invPolyEval_b0 <= aboveLeftY_uid761_pT4_uid558_invPolyEval_b;
            sm0_uid765_pT4_uid558_invPolyEval_s1 <= STD_LOGIC_VECTOR(sm0_uid765_pT4_uid558_invPolyEval_pr);
        END IF;
    END PROCESS;
    sm0_uid765_pT4_uid558_invPolyEval_q <= sm0_uid765_pT4_uid558_invPolyEval_s1;

    -- sumAb_uid766_pT4_uid558_invPolyEval(BITJOIN,765)@10
    sumAb_uid766_pT4_uid558_invPolyEval_q <= sm0_uid762_pT4_uid558_invPolyEval_cma_q & sm0_uid765_pT4_uid558_invPolyEval_q;

    -- lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval(ADD,768)@10
    lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 58 => sumAb_uid766_pT4_uid558_invPolyEval_q(57)) & sumAb_uid766_pT4_uid558_invPolyEval_q));
    lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((58 downto 32 => highBBits_uid768_pT4_uid558_invPolyEval_b(31)) & highBBits_uid768_pT4_uid558_invPolyEval_b));
    lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_a) + SIGNED(lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_b));
    lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_q <= lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_o(58 downto 0);

    -- lowRangeB_uid767_pT4_uid558_invPolyEval(BITSELECT,766)@10
    lowRangeB_uid767_pT4_uid558_invPolyEval_in <= multSumOfTwoTS_uid763_pT4_uid558_invPolyEval_cma_q(22 downto 0);
    lowRangeB_uid767_pT4_uid558_invPolyEval_b <= lowRangeB_uid767_pT4_uid558_invPolyEval_in(22 downto 0);

    -- lev1_a0_uid770_pT4_uid558_invPolyEval(BITJOIN,769)@10
    lev1_a0_uid770_pT4_uid558_invPolyEval_q <= lev1_a0sumAHighB_uid769_pT4_uid558_invPolyEval_q & lowRangeB_uid767_pT4_uid558_invPolyEval_b;

    -- os_uid771_pT4_uid558_invPolyEval(BITSELECT,770)@10
    os_uid771_pT4_uid558_invPolyEval_in <= STD_LOGIC_VECTOR(lev1_a0_uid770_pT4_uid558_invPolyEval_q(79 downto 0));
    os_uid771_pT4_uid558_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid771_pT4_uid558_invPolyEval_in(79 downto 28));

    -- highBBits_uid560_invPolyEval(BITSELECT,559)@10
    highBBits_uid560_invPolyEval_b <= STD_LOGIC_VECTOR(os_uid771_pT4_uid558_invPolyEval_b(51 downto 2));

    -- redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8(DELAY,982)
    redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist44_yAddr_uid67_q_uid7_block_rsrvd_fix_b_6_q, xout => redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q, clk => clk, aclr => areset );

    -- memoryC0_uid494_invTables_lutmem(DUALMEM,881)@8 + 2
    -- in j@20000000
    memoryC0_uid494_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid494_invTables_lutmem_reset0 <= areset;
    memoryC0_uid494_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA11ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid494_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid494_invTables_lutmem_aa,
        q_a => memoryC0_uid494_invTables_lutmem_ir
    );
    memoryC0_uid494_invTables_lutmem_r <= memoryC0_uid494_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid493_invTables_lutmem(DUALMEM,880)@8 + 2
    -- in j@20000000
    memoryC0_uid493_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid493_invTables_lutmem_reset0 <= areset;
    memoryC0_uid493_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA10ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid493_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid493_invTables_lutmem_aa,
        q_a => memoryC0_uid493_invTables_lutmem_ir
    );
    memoryC0_uid493_invTables_lutmem_r <= memoryC0_uid493_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid492_invTables_lutmem(DUALMEM,879)@8 + 2
    -- in j@20000000
    memoryC0_uid492_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid492_invTables_lutmem_reset0 <= areset;
    memoryC0_uid492_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA9ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid492_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid492_invTables_lutmem_aa,
        q_a => memoryC0_uid492_invTables_lutmem_ir
    );
    memoryC0_uid492_invTables_lutmem_r <= memoryC0_uid492_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid491_invTables_lutmem(DUALMEM,878)@8 + 2
    -- in j@20000000
    memoryC0_uid491_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid491_invTables_lutmem_reset0 <= areset;
    memoryC0_uid491_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA8ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid491_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid491_invTables_lutmem_aa,
        q_a => memoryC0_uid491_invTables_lutmem_ir
    );
    memoryC0_uid491_invTables_lutmem_r <= memoryC0_uid491_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid490_invTables_lutmem(DUALMEM,877)@8 + 2
    -- in j@20000000
    memoryC0_uid490_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid490_invTables_lutmem_reset0 <= areset;
    memoryC0_uid490_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA7ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid490_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid490_invTables_lutmem_aa,
        q_a => memoryC0_uid490_invTables_lutmem_ir
    );
    memoryC0_uid490_invTables_lutmem_r <= memoryC0_uid490_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid489_invTables_lutmem(DUALMEM,876)@8 + 2
    -- in j@20000000
    memoryC0_uid489_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid489_invTables_lutmem_reset0 <= areset;
    memoryC0_uid489_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA6ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid489_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid489_invTables_lutmem_aa,
        q_a => memoryC0_uid489_invTables_lutmem_ir
    );
    memoryC0_uid489_invTables_lutmem_r <= memoryC0_uid489_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid488_invTables_lutmem(DUALMEM,875)@8 + 2
    -- in j@20000000
    memoryC0_uid488_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid488_invTables_lutmem_reset0 <= areset;
    memoryC0_uid488_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA5ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid488_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid488_invTables_lutmem_aa,
        q_a => memoryC0_uid488_invTables_lutmem_ir
    );
    memoryC0_uid488_invTables_lutmem_r <= memoryC0_uid488_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid487_invTables_lutmem(DUALMEM,874)@8 + 2
    -- in j@20000000
    memoryC0_uid487_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid487_invTables_lutmem_reset0 <= areset;
    memoryC0_uid487_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA4ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid487_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid487_invTables_lutmem_aa,
        q_a => memoryC0_uid487_invTables_lutmem_ir
    );
    memoryC0_uid487_invTables_lutmem_r <= memoryC0_uid487_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid486_invTables_lutmem(DUALMEM,873)@8 + 2
    -- in j@20000000
    memoryC0_uid486_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid486_invTables_lutmem_reset0 <= areset;
    memoryC0_uid486_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA3ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid486_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid486_invTables_lutmem_aa,
        q_a => memoryC0_uid486_invTables_lutmem_ir
    );
    memoryC0_uid486_invTables_lutmem_r <= memoryC0_uid486_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid485_invTables_lutmem(DUALMEM,872)@8 + 2
    -- in j@20000000
    memoryC0_uid485_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid485_invTables_lutmem_reset0 <= areset;
    memoryC0_uid485_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA2ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid485_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid485_invTables_lutmem_aa,
        q_a => memoryC0_uid485_invTables_lutmem_ir
    );
    memoryC0_uid485_invTables_lutmem_r <= memoryC0_uid485_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid484_invTables_lutmem(DUALMEM,871)@8 + 2
    -- in j@20000000
    memoryC0_uid484_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid484_invTables_lutmem_reset0 <= areset;
    memoryC0_uid484_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA1ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid484_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid484_invTables_lutmem_aa,
        q_a => memoryC0_uid484_invTables_lutmem_ir
    );
    memoryC0_uid484_invTables_lutmem_r <= memoryC0_uid484_invTables_lutmem_ir(4 downto 0);

    -- memoryC0_uid483_invTables_lutmem(DUALMEM,870)@8 + 2
    -- in j@20000000
    memoryC0_uid483_invTables_lutmem_aa <= redist45_yAddr_uid67_q_uid7_block_rsrvd_fix_b_8_q;
    memoryC0_uid483_invTables_lutmem_reset0 <= areset;
    memoryC0_uid483_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "ROM",
        width_a => 5,
        widthad_a => 11,
        numwords_a => 2048,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/final_project/floatComponent_final_project_txrx_fp_Phase_extraction_and_synchronization_modBloA0ZinvTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid483_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid483_invTables_lutmem_aa,
        q_a => memoryC0_uid483_invTables_lutmem_ir
    );
    memoryC0_uid483_invTables_lutmem_r <= memoryC0_uid483_invTables_lutmem_ir(4 downto 0);

    -- os_uid496_invTables(BITJOIN,495)@10
    os_uid496_invTables_q <= GND_q & memoryC0_uid494_invTables_lutmem_r & memoryC0_uid493_invTables_lutmem_r & memoryC0_uid492_invTables_lutmem_r & memoryC0_uid491_invTables_lutmem_r & memoryC0_uid490_invTables_lutmem_r & memoryC0_uid489_invTables_lutmem_r & memoryC0_uid488_invTables_lutmem_r & memoryC0_uid487_invTables_lutmem_r & memoryC0_uid486_invTables_lutmem_r & memoryC0_uid485_invTables_lutmem_r & memoryC0_uid484_invTables_lutmem_r & memoryC0_uid483_invTables_lutmem_r;

    -- s4sumAHighB_uid561_invPolyEval(ADD,560)@10
    s4sumAHighB_uid561_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((61 downto 61 => os_uid496_invTables_q(60)) & os_uid496_invTables_q));
    s4sumAHighB_uid561_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((61 downto 50 => highBBits_uid560_invPolyEval_b(49)) & highBBits_uid560_invPolyEval_b));
    s4sumAHighB_uid561_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s4sumAHighB_uid561_invPolyEval_a) + SIGNED(s4sumAHighB_uid561_invPolyEval_b));
    s4sumAHighB_uid561_invPolyEval_q <= s4sumAHighB_uid561_invPolyEval_o(61 downto 0);

    -- lowRangeB_uid559_invPolyEval(BITSELECT,558)@10
    lowRangeB_uid559_invPolyEval_in <= os_uid771_pT4_uid558_invPolyEval_b(1 downto 0);
    lowRangeB_uid559_invPolyEval_b <= lowRangeB_uid559_invPolyEval_in(1 downto 0);

    -- s4_uid562_invPolyEval(BITJOIN,561)@10
    s4_uid562_invPolyEval_q <= s4sumAHighB_uid561_invPolyEval_q & lowRangeB_uid559_invPolyEval_b;

    -- invY_uid70_q_uid7_block_rsrvd_fix(BITSELECT,69)@10
    invY_uid70_q_uid7_block_rsrvd_fix_in <= s4_uid562_invPolyEval_q(60 downto 0);
    invY_uid70_q_uid7_block_rsrvd_fix_b <= invY_uid70_q_uid7_block_rsrvd_fix_in(60 downto 5);

    -- rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,584)@10
    rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= invY_uid70_q_uid7_block_rsrvd_fix_b(1 downto 0);
    rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(1 downto 0);

    -- sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(MULT,590)@10 + 2
    sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr <= UNSIGNED(sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0) * UNSIGNED(sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0);
    sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 <= (others => '0');
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 <= (others => '0');
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 <= rightBottomX_uid585_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b;
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 <= rightBottomY_uid586_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b;
            sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 <= STD_LOGIC_VECTOR(sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr);
        END IF;
    END PROCESS;
    sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1;

    -- lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(ADD,598)@12
    lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c);
    lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000000000000000000000000" & sm0_uid591_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q);
    lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a) + UNSIGNED(lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b));
    lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o(62 downto 0);

    -- topRangeY_uid575_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,574)@10
    topRangeY_uid575_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= lOAdded_uid73_q_uid7_block_rsrvd_fix_q(52 downto 26);

    -- topRangeX_uid574_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,573)@10
    topRangeX_uid574_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= invY_uid70_q_uid7_block_rsrvd_fix_b(55 downto 29);

    -- sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma(CHAINMULTADD,909)@10 + 2
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_reset <= areset;
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 <= '1';
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0;
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(0) <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(0) * sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(0);
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(0) <= RESIZE(sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(0),54);
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w(0) <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(0);
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x(0) <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w(0);
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y(0) <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x(0);
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 = '1') THEN
                sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeX_uid574_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b),27);
                sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(topRangeY_uid575_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 = '1') THEN
                sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s(0) <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s(0)(53 downto 0)), xout => sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq(53 downto 0));

    -- aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,583)@10
    aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= lOAdded_uid73_q_uid7_block_rsrvd_fix_q(25 downto 0);
    aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(25 downto 19);

    -- aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,582)@10
    aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= invY_uid70_q_uid7_block_rsrvd_fix_b(28 downto 0);
    aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(28 downto 22);

    -- sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(MULT,589)@10 + 2
    sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr <= UNSIGNED(UNSIGNED(sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0) * UNSIGNED(sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0));
    sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 <= (others => '0');
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 <= (others => '0');
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a0 <= aboveLeftX_uid583_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b;
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b0 <= aboveLeftY_uid584_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b;
            sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1 <= STD_LOGIC_VECTOR(sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_pr);
        END IF;
    END PROCESS;
    sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_s1;

    -- sumAb_uid592_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITJOIN,591)@12
    sumAb_uid592_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= sm0_uid587_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q & sm0_uid590_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q;

    -- lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(ADD,594)@12
    lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & sumAb_uid592_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q);
    lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000000000000000000" & lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c);
    lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_a) + UNSIGNED(lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b));
    lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_o(68 downto 0);

    -- aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,577)@10
    aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= lOAdded_uid73_q_uid7_block_rsrvd_fix_q(25 downto 0);
    aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(25 downto 0);

    -- aboveLeftY_mergedSignalTM_uid579_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITJOIN,578)@10
    aboveLeftY_mergedSignalTM_uid579_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= aboveLeftY_bottomRange_uid578_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b & GND_q;

    -- rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,580)@10
    rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= invY_uid70_q_uid7_block_rsrvd_fix_b(28 downto 0);
    rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(28 downto 2);

    -- multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma(CHAINMULTADD,918)@10 + 2
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_reset <= areset;
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 <= '1';
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0;
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(0) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(0) * multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(0);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(1) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(1) * multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(1);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(0) <= RESIZE(multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(0),55);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(1) <= RESIZE(multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_p(1),55);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w(0) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(0) + multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_u(1);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x(0) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_w(0);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y(0) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_x(0);
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeY_uid575_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b),27);
                multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid579_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q),27);
                multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(rightBottomX_uid581_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b),27);
                multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_c0(1) <= RESIZE(UNSIGNED(topRangeX_uid574_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s(0) <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_qq(54 downto 0));

    -- lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select(BITSELECT,936)@12
    lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q(12 downto 0);
    lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c <= multSumOfTwoTS_uid588_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_cma_q(54 downto 13);

    -- lev1_a0_uid596_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITJOIN,595)@12
    lev1_a0_uid596_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= lev1_a0sumAHighB_uid595_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q & lowRangeB_uid593_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b;

    -- lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select(BITSELECT,929)@12
    lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b <= lev1_a0_uid596_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q(19 downto 0);
    lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_c <= lev1_a0_uid596_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q(81 downto 20);

    -- lev2_a0_uid600_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITJOIN,599)@12
    lev2_a0_uid600_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q <= lev2_a0high_uid599_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q & lowRangeA_uid597_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_merged_bit_select_b;

    -- os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix(BITSELECT,600)@12
    os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in <= lev2_a0_uid600_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_q(80 downto 0);
    os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b <= os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_in(80 downto 24);

    -- updatedY_uid32_q_uid7_block_rsrvd_fix(BITJOIN,31)@12
    updatedY_uid32_q_uid7_block_rsrvd_fix_q <= GND_q & paddingY_uid31_q_uid7_block_rsrvd_fix_q;

    -- fracYZero_uid31_q_uid7_block_rsrvd_fix(LOGICAL,32)@12
    fracYZero_uid31_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_q);
    fracYZero_uid31_q_uid7_block_rsrvd_fix_q <= "1" WHEN fracYZero_uid31_q_uid7_block_rsrvd_fix_a = updatedY_uid32_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix(MUX,78)@12
    divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_s <= fracYZero_uid31_q_uid7_block_rsrvd_fix_q;
    divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_combproc: PROCESS (divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_s, os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b, oFracXZ4_uid77_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q <= os_uid601_divValPreNorm_uid75_q_uid7_block_rsrvd_fix_b;
            WHEN "1" => divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q <= oFracXZ4_uid77_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid80_q_uid7_block_rsrvd_fix(BITSELECT,79)@12
    norm_uid80_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q(56 downto 56));

    -- zeroPaddingInAddition_uid90_q_uid7_block_rsrvd_fix(CONSTANT,89)
    zeroPaddingInAddition_uid90_q_uid7_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000000";

    -- expFracPostRnd_uid91_q_uid7_block_rsrvd_fix(BITJOIN,90)@12
    expFracPostRnd_uid91_q_uid7_block_rsrvd_fix_q <= norm_uid80_q_uid7_block_rsrvd_fix_b & zeroPaddingInAddition_uid90_q_uid7_block_rsrvd_fix_q & VCC_q;

    -- cstBiasM1_uid22_q_uid7_block_rsrvd_fix(CONSTANT,21)
    cstBiasM1_uid22_q_uid7_block_rsrvd_fix_q <= "01111111110";

    -- expXmY_uid63_q_uid7_block_rsrvd_fix(SUB,62)@12
    expXmY_uid63_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expX_uid25_q_uid7_block_rsrvd_fix_b);
    expXmY_uid63_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & redist54_expY_uid28_q_uid7_block_rsrvd_fix_b_12_mem_q);
    expXmY_uid63_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid63_q_uid7_block_rsrvd_fix_a) - UNSIGNED(expXmY_uid63_q_uid7_block_rsrvd_fix_b));
    expXmY_uid63_q_uid7_block_rsrvd_fix_q <= expXmY_uid63_q_uid7_block_rsrvd_fix_o(11 downto 0);

    -- expR_uid64_q_uid7_block_rsrvd_fix(ADD,63)@12
    expR_uid64_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expXmY_uid63_q_uid7_block_rsrvd_fix_q(11)) & expXmY_uid63_q_uid7_block_rsrvd_fix_q));
    expR_uid64_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & cstBiasM1_uid22_q_uid7_block_rsrvd_fix_q));
    expR_uid64_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid64_q_uid7_block_rsrvd_fix_a) + SIGNED(expR_uid64_q_uid7_block_rsrvd_fix_b));
    expR_uid64_q_uid7_block_rsrvd_fix_q <= expR_uid64_q_uid7_block_rsrvd_fix_o(12 downto 0);

    -- divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix(BITSELECT,80)@12
    divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_in <= divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q(55 downto 0);
    divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_b <= divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_in(55 downto 2);

    -- divValPreNormLow_uid82_q_uid7_block_rsrvd_fix(BITSELECT,81)@12
    divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_in <= divValPreNormYPow2Exc_uid79_q_uid7_block_rsrvd_fix_q(54 downto 0);
    divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_b <= divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_in(54 downto 1);

    -- normFracRnd_uid83_q_uid7_block_rsrvd_fix(MUX,82)@12
    normFracRnd_uid83_q_uid7_block_rsrvd_fix_s <= norm_uid80_q_uid7_block_rsrvd_fix_b;
    normFracRnd_uid83_q_uid7_block_rsrvd_fix_combproc: PROCESS (normFracRnd_uid83_q_uid7_block_rsrvd_fix_s, divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_b, divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_b)
    BEGIN
        CASE (normFracRnd_uid83_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => normFracRnd_uid83_q_uid7_block_rsrvd_fix_q <= divValPreNormLow_uid82_q_uid7_block_rsrvd_fix_b;
            WHEN "1" => normFracRnd_uid83_q_uid7_block_rsrvd_fix_q <= divValPreNormHigh_uid81_q_uid7_block_rsrvd_fix_b;
            WHEN OTHERS => normFracRnd_uid83_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid84_q_uid7_block_rsrvd_fix(BITJOIN,83)@12
    expFracRnd_uid84_q_uid7_block_rsrvd_fix_q <= expR_uid64_q_uid7_block_rsrvd_fix_q & normFracRnd_uid83_q_uid7_block_rsrvd_fix_q;

    -- expFracPostRnd_uid92_q_uid7_block_rsrvd_fix(ADD,91)@12
    expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => expFracRnd_uid84_q_uid7_block_rsrvd_fix_q(66)) & expFracRnd_uid84_q_uid7_block_rsrvd_fix_q));
    expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & expFracPostRnd_uid91_q_uid7_block_rsrvd_fix_q));
    expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_a) + SIGNED(expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_b));
    expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_q <= expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_o(67 downto 0);

    -- fracPostRndF_uid95_q_uid7_block_rsrvd_fix(BITSELECT,94)@12
    fracPostRndF_uid95_q_uid7_block_rsrvd_fix_in <= expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_q(53 downto 0);
    fracPostRndF_uid95_q_uid7_block_rsrvd_fix_b <= fracPostRndF_uid95_q_uid7_block_rsrvd_fix_in(53 downto 1);

    -- invYO_uid71_q_uid7_block_rsrvd_fix(BITSELECT,70)@10
    invYO_uid71_q_uid7_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(s4_uid562_invPolyEval_q(61 downto 0));
    invYO_uid71_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(invYO_uid71_q_uid7_block_rsrvd_fix_in(61 downto 61));

    -- redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2(DELAY,973)
    redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => invYO_uid71_q_uid7_block_rsrvd_fix_b, xout => redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- fracPostRndF_uid96_q_uid7_block_rsrvd_fix(MUX,95)@12
    fracPostRndF_uid96_q_uid7_block_rsrvd_fix_s <= redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2_q;
    fracPostRndF_uid96_q_uid7_block_rsrvd_fix_combproc: PROCESS (fracPostRndF_uid96_q_uid7_block_rsrvd_fix_s, fracPostRndF_uid95_q_uid7_block_rsrvd_fix_b, fracXExt_uid93_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (fracPostRndF_uid96_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q <= fracPostRndF_uid95_q_uid7_block_rsrvd_fix_b;
            WHEN "1" => fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q <= fracXExt_uid93_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2(DELAY,971)
    redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q, xout => redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- betweenFPwF_uid118_q_uid7_block_rsrvd_fix(BITSELECT,117)@14
    betweenFPwF_uid118_q_uid7_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2_q(0 downto 0));
    betweenFPwF_uid118_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(betweenFPwF_uid118_q_uid7_block_rsrvd_fix_in(0 downto 0));

    -- qDivProdLTX_opB_uid116_q_uid7_block_rsrvd_fix(BITJOIN,115)@14
    qDivProdLTX_opB_uid116_q_uid7_block_rsrvd_fix_q <= redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q & redist58_fracX_uid26_q_uid7_block_rsrvd_fix_b_4_q;

    -- lOAdded_uid103_q_uid7_block_rsrvd_fix(BITJOIN,102)@12
    lOAdded_uid103_q_uid7_block_rsrvd_fix_q <= VCC_q & redist53_fracY_uid29_q_uid7_block_rsrvd_fix_b_12_mem_q;

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2(BITSELECT,776)@12
    qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_in <= lOAdded_uid103_q_uid7_block_rsrvd_fix_q(26 downto 0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_b <= qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_in(26 downto 0);

    -- lOAdded_uid100_q_uid7_block_rsrvd_fix(BITJOIN,99)@12
    lOAdded_uid100_q_uid7_block_rsrvd_fix_q <= VCC_q & fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q;

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select(BITSELECT,923)@12
    qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_b <= lOAdded_uid100_q_uid7_block_rsrvd_fix_q(26 downto 0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_c <= lOAdded_uid100_q_uid7_block_rsrvd_fix_q(53 downto 27);

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_bs5(BITSELECT,779)@12
    qDivProd_uid105_q_uid7_block_rsrvd_fix_bs5_b <= lOAdded_uid103_q_uid7_block_rsrvd_fix_q(52 downto 27);

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma(CHAINMULTADD,922)@12 + 2
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_reset <= areset;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena0 <= '1';
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena1 <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena0;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_p(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0(0) * qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_p(1) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0(1) * qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0(1);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_u(0) <= RESIZE(qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_p(0),55);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_u(1) <= RESIZE(qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_p(1),55);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_w(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_u(0) + qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_u(1);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_x(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_w(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_y(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_x(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0 <= (others => (others => '0'));
            qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena0 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs5_b),27);
                qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_a0(1) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_b),27);
                qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_b),27);
                qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_c0(1) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_c),27);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_ena1 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_s(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_s(0)(54 downto 0)), xout => qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_qq, clk => clk, aclr => areset );
    qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_qq(54 downto 0));

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12(BITSHIFT,786)@14
    qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_qint <= qDivProd_uid105_q_uid7_block_rsrvd_fix_ma6_cma_q & "000000000000000000000000000";
    qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_q <= qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_qint(81 downto 0);

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma(CHAINMULTADD,917)@12 + 2
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_reset <= areset;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena0 <= '1';
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena1 <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena0;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_p(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_a0(0) * qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_u(0) <= RESIZE(qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_p(0),53);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_w(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_u(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_x(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_w(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_y(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_x(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_a0 <= (others => (others => '0'));
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena0 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_a0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_c),27);
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_c0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs5_b),26);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_ena1 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_s(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_delay : dspba_delay
    GENERIC MAP ( width => 53, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_s(0)(52 downto 0)), xout => qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_qq, clk => clk, aclr => areset );
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_qq(52 downto 0));

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma(CHAINMULTADD,916)@12 + 2
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_reset <= areset;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena0 <= '1';
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena1 <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena0;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_p(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_a0(0) * qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_c0(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_u(0) <= RESIZE(qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_p(0),54);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_w(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_u(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_x(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_w(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_y(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_x(0);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_a0 <= (others => (others => '0'));
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena0 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_a0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs1_merged_bit_select_b),27);
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_c0(0) <= RESIZE(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_bs2_b),27);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_ena1 = '1') THEN
                qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_s(0) <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_s(0)(53 downto 0)), xout => qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_qq, clk => clk, aclr => areset );
    qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_q <= STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_qq(53 downto 0));

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_join_11(BITJOIN,785)@14
    qDivProd_uid105_q_uid7_block_rsrvd_fix_join_11_q <= qDivProd_uid105_q_uid7_block_rsrvd_fix_im3_cma_q & qDivProd_uid105_q_uid7_block_rsrvd_fix_im0_cma_q;

    -- qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0(ADD,788)@14
    qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_a <= STD_LOGIC_VECTOR("0" & qDivProd_uid105_q_uid7_block_rsrvd_fix_join_11_q);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_b <= STD_LOGIC_VECTOR("00000000000000000000000000" & qDivProd_uid105_q_uid7_block_rsrvd_fix_align_12_q);
    qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_a) + UNSIGNED(qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_b));
    qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_q <= qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_o(107 downto 0);

    -- qDivProdNorm_uid106_q_uid7_block_rsrvd_fix(BITSELECT,105)@14
    qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_q(106 downto 0));
    qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_in(106 downto 106));

    -- cstBias_uid23_q_uid7_block_rsrvd_fix(CONSTANT,22)
    cstBias_uid23_q_uid7_block_rsrvd_fix_q <= "01111111111";

    -- qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix(SUB,110)@14
    qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & cstBias_uid23_q_uid7_block_rsrvd_fix_q);
    qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000000" & qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_b);
    qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_a) - UNSIGNED(qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_b));
    qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_q <= qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_o(11 downto 0);

    -- redist37_invYO_uid71_q_uid7_block_rsrvd_fix_b_4(DELAY,974)
    redist37_invYO_uid71_q_uid7_block_rsrvd_fix_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist36_invYO_uid71_q_uid7_block_rsrvd_fix_b_2_q, xout => redist37_invYO_uid71_q_uid7_block_rsrvd_fix_b_4_q, clk => clk, aclr => areset );

    -- expPostRndF_uid98_q_uid7_block_rsrvd_fix(MUX,97)@14
    expPostRndF_uid98_q_uid7_block_rsrvd_fix_s <= redist37_invYO_uid71_q_uid7_block_rsrvd_fix_b_4_q;
    expPostRndF_uid98_q_uid7_block_rsrvd_fix_combproc: PROCESS (expPostRndF_uid98_q_uid7_block_rsrvd_fix_s, redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q, redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q)
    BEGIN
        CASE (expPostRndF_uid98_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => expPostRndF_uid98_q_uid7_block_rsrvd_fix_q <= redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q;
            WHEN "1" => expPostRndF_uid98_q_uid7_block_rsrvd_fix_q <= redist59_expX_uid25_q_uid7_block_rsrvd_fix_b_2_q;
            WHEN OTHERS => expPostRndF_uid98_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix(ADD,109)@14
    qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q);
    qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & expPostRndF_uid98_q_uid7_block_rsrvd_fix_q);
    qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_a) + UNSIGNED(qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_b));
    qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_q <= qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_o(11 downto 0);

    -- qDivProdExp_uid112_q_uid7_block_rsrvd_fix(SUB,111)@14
    qDivProdExp_uid112_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & qDivProdExp_opA_uid110_q_uid7_block_rsrvd_fix_q));
    qDivProdExp_uid112_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_q(11)) & qDivProdExp_opBs_uid111_q_uid7_block_rsrvd_fix_q));
    qDivProdExp_uid112_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(qDivProdExp_uid112_q_uid7_block_rsrvd_fix_a) - SIGNED(qDivProdExp_uid112_q_uid7_block_rsrvd_fix_b));
    qDivProdExp_uid112_q_uid7_block_rsrvd_fix_q <= qDivProdExp_uid112_q_uid7_block_rsrvd_fix_o(13 downto 0);

    -- qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix(BITSELECT,113)@14
    qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_in <= qDivProdExp_uid112_q_uid7_block_rsrvd_fix_q(10 downto 0);
    qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_b <= qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_in(10 downto 0);

    -- qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix(BITSELECT,106)@14
    qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_in <= qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_q(105 downto 0);
    qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_b <= qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_in(105 downto 53);

    -- qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix(BITSELECT,107)@14
    qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_in <= qDivProd_uid105_q_uid7_block_rsrvd_fix_result_add_0_0_q(104 downto 0);
    qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_b <= qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_in(104 downto 52);

    -- qDivProdFrac_uid109_q_uid7_block_rsrvd_fix(MUX,108)@14
    qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_s <= qDivProdNorm_uid106_q_uid7_block_rsrvd_fix_b;
    qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_combproc: PROCESS (qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_s, qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_b, qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_b)
    BEGIN
        CASE (qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_q <= qDivProdFracLow_uid108_q_uid7_block_rsrvd_fix_b;
            WHEN "1" => qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_q <= qDivProdFracHigh_uid107_q_uid7_block_rsrvd_fix_b;
            WHEN OTHERS => qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- qDivProdFracWF_uid113_q_uid7_block_rsrvd_fix(BITSELECT,112)@14
    qDivProdFracWF_uid113_q_uid7_block_rsrvd_fix_b <= qDivProdFrac_uid109_q_uid7_block_rsrvd_fix_q(52 downto 1);

    -- qDivProdLTX_opA_uid115_q_uid7_block_rsrvd_fix(BITJOIN,114)@14
    qDivProdLTX_opA_uid115_q_uid7_block_rsrvd_fix_q <= qDivProdLTX_opA_uid114_q_uid7_block_rsrvd_fix_b & qDivProdFracWF_uid113_q_uid7_block_rsrvd_fix_b;

    -- qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix(COMPARE,116)@14
    qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opA_uid115_q_uid7_block_rsrvd_fix_q);
    qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & qDivProdLTX_opB_uid116_q_uid7_block_rsrvd_fix_q);
    qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_a) - UNSIGNED(qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_b));
    qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_c(0) <= qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_o(64);

    -- extraUlp_uid119_q_uid7_block_rsrvd_fix(LOGICAL,118)@14
    extraUlp_uid119_q_uid7_block_rsrvd_fix_q <= qDividerProdLTX_uid117_q_uid7_block_rsrvd_fix_c and betweenFPwF_uid118_q_uid7_block_rsrvd_fix_b;

    -- fracPostRndFT_uid120_q_uid7_block_rsrvd_fix(BITSELECT,119)@14
    fracPostRndFT_uid120_q_uid7_block_rsrvd_fix_b <= redist34_fracPostRndF_uid96_q_uid7_block_rsrvd_fix_q_2_q(52 downto 1);

    -- fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix(ADD,120)@14
    fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & fracPostRndFT_uid120_q_uid7_block_rsrvd_fix_b);
    fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000000000000000000000" & extraUlp_uid119_q_uid7_block_rsrvd_fix_q);
    fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_a) + UNSIGNED(fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_b));
    fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_q <= fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_o(52 downto 0);

    -- ovfIncRnd_uid125_q_uid7_block_rsrvd_fix(BITSELECT,124)@14
    ovfIncRnd_uid125_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_q(52 downto 52));

    -- expPostRndFR_uid97_q_uid7_block_rsrvd_fix(BITSELECT,96)@12
    expPostRndFR_uid97_q_uid7_block_rsrvd_fix_in <= expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_q(64 downto 0);
    expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b <= expPostRndFR_uid97_q_uid7_block_rsrvd_fix_in(64 downto 54);

    -- redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2(DELAY,969)
    redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b, xout => redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix(ADD,125)@14
    expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q);
    expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00000000000" & ovfIncRnd_uid125_q_uid7_block_rsrvd_fix_b);
    expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_a) + UNSIGNED(expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_b));
    expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_q <= expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_o(11 downto 0);

    -- expFracPostRndR_uid127_q_uid7_block_rsrvd_fix(BITSELECT,126)@14
    expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_in <= expFracPostRndInc_uid126_q_uid7_block_rsrvd_fix_q(10 downto 0);
    expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b <= expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_in(10 downto 0);

    -- redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1(DELAY,966)
    redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b, xout => redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3(DELAY,970)
    redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist32_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_2_q, xout => redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3_q, clk => clk, aclr => areset );

    -- redist30_extraUlp_uid119_q_uid7_block_rsrvd_fix_q_1(DELAY,967)
    redist30_extraUlp_uid119_q_uid7_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => extraUlp_uid119_q_uid7_block_rsrvd_fix_q, xout => redist30_extraUlp_uid119_q_uid7_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- expRPreExc_uid128_q_uid7_block_rsrvd_fix(MUX,127)@15
    expRPreExc_uid128_q_uid7_block_rsrvd_fix_s <= redist30_extraUlp_uid119_q_uid7_block_rsrvd_fix_q_1_q;
    expRPreExc_uid128_q_uid7_block_rsrvd_fix_combproc: PROCESS (expRPreExc_uid128_q_uid7_block_rsrvd_fix_s, redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3_q, redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1_q)
    BEGIN
        CASE (expRPreExc_uid128_q_uid7_block_rsrvd_fix_s) IS
            WHEN "0" => expRPreExc_uid128_q_uid7_block_rsrvd_fix_q <= redist33_expPostRndFR_uid97_q_uid7_block_rsrvd_fix_b_3_q;
            WHEN "1" => expRPreExc_uid128_q_uid7_block_rsrvd_fix_q <= redist29_expFracPostRndR_uid127_q_uid7_block_rsrvd_fix_b_1_q;
            WHEN OTHERS => expRPreExc_uid128_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- invExpXIsMax_uid59_q_uid7_block_rsrvd_fix(LOGICAL,58)@14
    invExpXIsMax_uid59_q_uid7_block_rsrvd_fix_q <= not (expXIsMax_uid54_q_uid7_block_rsrvd_fix_q);

    -- InvExpXIsZero_uid60_q_uid7_block_rsrvd_fix(LOGICAL,59)@14
    InvExpXIsZero_uid60_q_uid7_block_rsrvd_fix_q <= not (excZ_y_uid53_q_uid7_block_rsrvd_fix_q);

    -- excR_y_uid61_q_uid7_block_rsrvd_fix(LOGICAL,60)@14
    excR_y_uid61_q_uid7_block_rsrvd_fix_q <= InvExpXIsZero_uid60_q_uid7_block_rsrvd_fix_q and invExpXIsMax_uid59_q_uid7_block_rsrvd_fix_q;

    -- excXIYR_uid143_q_uid7_block_rsrvd_fix(LOGICAL,142)@14
    excXIYR_uid143_q_uid7_block_rsrvd_fix_q <= excI_x_uid43_q_uid7_block_rsrvd_fix_q and excR_y_uid61_q_uid7_block_rsrvd_fix_q;

    -- excXIYZ_uid142_q_uid7_block_rsrvd_fix(LOGICAL,141)@14
    excXIYZ_uid142_q_uid7_block_rsrvd_fix_q <= excI_x_uid43_q_uid7_block_rsrvd_fix_q and excZ_y_uid53_q_uid7_block_rsrvd_fix_q;

    -- expRExt_uid130_q_uid7_block_rsrvd_fix(BITSELECT,129)@12
    expRExt_uid130_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expFracPostRnd_uid92_q_uid7_block_rsrvd_fix_q(67 downto 54));

    -- expOvf_uid134_q_uid7_block_rsrvd_fix(COMPARE,133)@12 + 1
    expOvf_uid134_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid130_q_uid7_block_rsrvd_fix_b(13)) & expRExt_uid130_q_uid7_block_rsrvd_fix_b));
    expOvf_uid134_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000" & cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q));
    expOvf_uid134_q_uid7_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid134_q_uid7_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expOvf_uid134_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid134_q_uid7_block_rsrvd_fix_a) - SIGNED(expOvf_uid134_q_uid7_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expOvf_uid134_q_uid7_block_rsrvd_fix_n(0) <= not (expOvf_uid134_q_uid7_block_rsrvd_fix_o(15));

    -- redist27_expOvf_uid134_q_uid7_block_rsrvd_fix_n_2(DELAY,964)
    redist27_expOvf_uid134_q_uid7_block_rsrvd_fix_n_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOvf_uid134_q_uid7_block_rsrvd_fix_n, xout => redist27_expOvf_uid134_q_uid7_block_rsrvd_fix_n_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid45_q_uid7_block_rsrvd_fix(LOGICAL,44)@14
    invExpXIsMax_uid45_q_uid7_block_rsrvd_fix_q <= not (expXIsMax_uid40_q_uid7_block_rsrvd_fix_q);

    -- InvExpXIsZero_uid46_q_uid7_block_rsrvd_fix(LOGICAL,45)@14
    InvExpXIsZero_uid46_q_uid7_block_rsrvd_fix_q <= not (excZ_x_uid39_q_uid7_block_rsrvd_fix_q);

    -- excR_x_uid47_q_uid7_block_rsrvd_fix(LOGICAL,46)@14
    excR_x_uid47_q_uid7_block_rsrvd_fix_q <= InvExpXIsZero_uid46_q_uid7_block_rsrvd_fix_q and invExpXIsMax_uid45_q_uid7_block_rsrvd_fix_q;

    -- excXRYROvf_uid141_q_uid7_block_rsrvd_fix(LOGICAL,140)@14
    excXRYROvf_uid141_q_uid7_block_rsrvd_fix_q <= excR_x_uid47_q_uid7_block_rsrvd_fix_q and excR_y_uid61_q_uid7_block_rsrvd_fix_q and redist27_expOvf_uid134_q_uid7_block_rsrvd_fix_n_2_q;

    -- excXRYZ_uid140_q_uid7_block_rsrvd_fix(LOGICAL,139)@14
    excXRYZ_uid140_q_uid7_block_rsrvd_fix_q <= excR_x_uid47_q_uid7_block_rsrvd_fix_q and excZ_y_uid53_q_uid7_block_rsrvd_fix_q;

    -- excRInf_uid144_q_uid7_block_rsrvd_fix(LOGICAL,143)@14
    excRInf_uid144_q_uid7_block_rsrvd_fix_q <= excXRYZ_uid140_q_uid7_block_rsrvd_fix_q or excXRYROvf_uid141_q_uid7_block_rsrvd_fix_q or excXIYZ_uid142_q_uid7_block_rsrvd_fix_q or excXIYR_uid143_q_uid7_block_rsrvd_fix_q;

    -- xRegOrZero_uid137_q_uid7_block_rsrvd_fix(LOGICAL,136)@14
    xRegOrZero_uid137_q_uid7_block_rsrvd_fix_q <= excR_x_uid47_q_uid7_block_rsrvd_fix_q or excZ_x_uid39_q_uid7_block_rsrvd_fix_q;

    -- regOrZeroOverInf_uid138_q_uid7_block_rsrvd_fix(LOGICAL,137)@14
    regOrZeroOverInf_uid138_q_uid7_block_rsrvd_fix_q <= xRegOrZero_uid137_q_uid7_block_rsrvd_fix_q and excI_y_uid57_q_uid7_block_rsrvd_fix_q;

    -- expUdf_uid131_q_uid7_block_rsrvd_fix(COMPARE,130)@12 + 1
    expUdf_uid131_q_uid7_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000" & GND_q));
    expUdf_uid131_q_uid7_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => expRExt_uid130_q_uid7_block_rsrvd_fix_b(13)) & expRExt_uid130_q_uid7_block_rsrvd_fix_b));
    expUdf_uid131_q_uid7_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid131_q_uid7_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expUdf_uid131_q_uid7_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid131_q_uid7_block_rsrvd_fix_a) - SIGNED(expUdf_uid131_q_uid7_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expUdf_uid131_q_uid7_block_rsrvd_fix_n(0) <= not (expUdf_uid131_q_uid7_block_rsrvd_fix_o(15));

    -- redist28_expUdf_uid131_q_uid7_block_rsrvd_fix_n_2(DELAY,965)
    redist28_expUdf_uid131_q_uid7_block_rsrvd_fix_n_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expUdf_uid131_q_uid7_block_rsrvd_fix_n, xout => redist28_expUdf_uid131_q_uid7_block_rsrvd_fix_n_2_q, clk => clk, aclr => areset );

    -- regOverRegWithUf_uid136_q_uid7_block_rsrvd_fix(LOGICAL,135)@14
    regOverRegWithUf_uid136_q_uid7_block_rsrvd_fix_q <= redist28_expUdf_uid131_q_uid7_block_rsrvd_fix_n_2_q and excR_x_uid47_q_uid7_block_rsrvd_fix_q and excR_y_uid61_q_uid7_block_rsrvd_fix_q;

    -- zeroOverReg_uid135_q_uid7_block_rsrvd_fix(LOGICAL,134)@14
    zeroOverReg_uid135_q_uid7_block_rsrvd_fix_q <= excZ_x_uid39_q_uid7_block_rsrvd_fix_q and excR_y_uid61_q_uid7_block_rsrvd_fix_q;

    -- excRZero_uid139_q_uid7_block_rsrvd_fix(LOGICAL,138)@14
    excRZero_uid139_q_uid7_block_rsrvd_fix_q <= zeroOverReg_uid135_q_uid7_block_rsrvd_fix_q or regOverRegWithUf_uid136_q_uid7_block_rsrvd_fix_q or regOrZeroOverInf_uid138_q_uid7_block_rsrvd_fix_q;

    -- concExc_uid148_q_uid7_block_rsrvd_fix(BITJOIN,147)@14
    concExc_uid148_q_uid7_block_rsrvd_fix_q <= excRNaN_uid147_q_uid7_block_rsrvd_fix_q & excRInf_uid144_q_uid7_block_rsrvd_fix_q & excRZero_uid139_q_uid7_block_rsrvd_fix_q;

    -- excREnc_uid149_q_uid7_block_rsrvd_fix(LOOKUP,148)@14 + 1
    excREnc_uid149_q_uid7_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid148_q_uid7_block_rsrvd_fix_q) IS
                WHEN "000" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "01";
                WHEN "001" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "00";
                WHEN "010" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "10";
                WHEN "011" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "00";
                WHEN "100" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "11";
                WHEN "101" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "00";
                WHEN "110" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "00";
                WHEN "111" => excREnc_uid149_q_uid7_block_rsrvd_fix_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid149_q_uid7_block_rsrvd_fix_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- expRPostExc_uid157_q_uid7_block_rsrvd_fix(MUX,156)@15
    expRPostExc_uid157_q_uid7_block_rsrvd_fix_s <= excREnc_uid149_q_uid7_block_rsrvd_fix_q;
    expRPostExc_uid157_q_uid7_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid157_q_uid7_block_rsrvd_fix_s, cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q, expRPreExc_uid128_q_uid7_block_rsrvd_fix_q, cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid157_q_uid7_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid157_q_uid7_block_rsrvd_fix_q <= cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid157_q_uid7_block_rsrvd_fix_q <= expRPreExc_uid128_q_uid7_block_rsrvd_fix_q;
            WHEN "10" => expRPostExc_uid157_q_uid7_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid157_q_uid7_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid157_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix(CONSTANT,149)
    oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000001";

    -- fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix(BITSELECT,121)@14
    fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_in <= fracRPreExcExt_uid121_q_uid7_block_rsrvd_fix_q(51 downto 0);
    fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_b <= fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_in(51 downto 0);

    -- fracRPreExc_uid123_q_uid7_block_rsrvd_fix(MUX,122)@14 + 1
    fracRPreExc_uid123_q_uid7_block_rsrvd_fix_s <= extraUlp_uid119_q_uid7_block_rsrvd_fix_q;
    fracRPreExc_uid123_q_uid7_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracRPreExc_uid123_q_uid7_block_rsrvd_fix_s) IS
                WHEN "0" => fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q <= fracPostRndFT_uid120_q_uid7_block_rsrvd_fix_b;
                WHEN "1" => fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q <= fracPostRndFPostUlp_uid122_q_uid7_block_rsrvd_fix_b;
                WHEN OTHERS => fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- fracRPostExc_uid153_q_uid7_block_rsrvd_fix(MUX,152)@15
    fracRPostExc_uid153_q_uid7_block_rsrvd_fix_s <= excREnc_uid149_q_uid7_block_rsrvd_fix_q;
    fracRPostExc_uid153_q_uid7_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid153_q_uid7_block_rsrvd_fix_s, paddingY_uid31_q_uid7_block_rsrvd_fix_q, fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q, oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid153_q_uid7_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q <= fracRPreExc_uid123_q_uid7_block_rsrvd_fix_q;
            WHEN "10" => fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q <= oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid160_q_uid7_block_rsrvd_fix(BITJOIN,159)@15
    divR_uid160_q_uid7_block_rsrvd_fix_q <= sRPostExc_uid159_q_uid7_block_rsrvd_fix_q & expRPostExc_uid157_q_uid7_block_rsrvd_fix_q & fracRPostExc_uid153_q_uid7_block_rsrvd_fix_q;

    -- sQ_uid12_block_rsrvd_fix(BITSELECT,11)@15
    sQ_uid12_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(divR_uid160_q_uid7_block_rsrvd_fix_q(63 downto 63));

    -- expFracX_uid162_absQ_uid8_block_rsrvd_fix(BITSELECT,161)@15
    expFracX_uid162_absQ_uid8_block_rsrvd_fix_b <= divR_uid160_q_uid7_block_rsrvd_fix_q(62 downto 0);

    -- R_uid163_absQ_uid8_block_rsrvd_fix(BITJOIN,162)@15
    R_uid163_absQ_uid8_block_rsrvd_fix_q <= GND_q & expFracX_uid162_absQ_uid8_block_rsrvd_fix_b;

    -- signX_uid167_floorAbsQ_uid9_block_rsrvd_fix(BITSELECT,166)@15
    signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(R_uid163_absQ_uid8_block_rsrvd_fix_q(63 downto 63));

    -- expX_uid165_floorAbsQ_uid9_block_rsrvd_fix(BITSELECT,164)@15
    expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b <= R_uid163_absQ_uid8_block_rsrvd_fix_q(62 downto 52);

    -- excZ_x_uid173_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,172)@15
    excZ_x_uid173_floorAbsQ_uid9_block_rsrvd_fix_q <= "1" WHEN expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- invExcXZ_uid236_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,235)@15
    invExcXZ_uid236_floorAbsQ_uid9_block_rsrvd_fix_q <= not (excZ_x_uid173_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix(BITSELECT,165)@15
    fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b <= R_uid163_absQ_uid8_block_rsrvd_fix_q(51 downto 0);

    -- fracXIsZero_uid175_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,174)@15
    fracXIsZero_uid175_floorAbsQ_uid9_block_rsrvd_fix_q <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b ELSE "0";

    -- expXIsMax_uid174_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,173)@15
    expXIsMax_uid174_floorAbsQ_uid9_block_rsrvd_fix_q <= "1" WHEN expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- excI_x_uid177_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,176)@15
    excI_x_uid177_floorAbsQ_uid9_block_rsrvd_fix_q <= expXIsMax_uid174_floorAbsQ_uid9_block_rsrvd_fix_q and fracXIsZero_uid175_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- fracXIsNotZero_uid176_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,175)@15
    fracXIsNotZero_uid176_floorAbsQ_uid9_block_rsrvd_fix_q <= not (fracXIsZero_uid175_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- excN_x_uid178_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,177)@15
    excN_x_uid178_floorAbsQ_uid9_block_rsrvd_fix_q <= expXIsMax_uid174_floorAbsQ_uid9_block_rsrvd_fix_q and fracXIsNotZero_uid176_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- excXNOrI_uid234_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,233)@15
    excXNOrI_uid234_floorAbsQ_uid9_block_rsrvd_fix_q <= excN_x_uid178_floorAbsQ_uid9_block_rsrvd_fix_q or excI_x_uid177_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- biasPwF_uid187_floorAbsQ_uid9_block_rsrvd_fix(CONSTANT,186)
    biasPwF_uid187_floorAbsQ_uid9_block_rsrvd_fix_q <= "10000110011";

    -- resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix(COMPARE,187)@15
    resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b);
    resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & biasPwF_uid187_floorAbsQ_uid9_block_rsrvd_fix_q);
    resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_a) - UNSIGNED(resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_b));
    resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n(0) <= not (resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_o(12));

    -- expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix(COMPARE,182)@15
    expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b);
    expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & cstBias_uid23_q_uid7_block_rsrvd_fix_q);
    expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_a) - UNSIGNED(expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_b));
    expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_c(0) <= expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_o(12);

    -- expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,188)@15
    expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q <= not (expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_c or resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n);

    -- invSignX_uid184_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,183)@15
    invSignX_uid184_floorAbsQ_uid9_block_rsrvd_fix_q <= not (signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b);

    -- posXAndCompRange_uid213_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,212)@15
    posXAndCompRange_uid213_floorAbsQ_uid9_block_rsrvd_fix_q <= invSignX_uid184_floorAbsQ_uid9_block_rsrvd_fix_q and expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix(SUB,189)@15
    unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b);
    unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & cstBias_uid23_q_uid7_block_rsrvd_fix_q);
    unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_a) - UNSIGNED(unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_b));
    unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_q <= unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_o(11 downto 0);

    -- unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix(BITSELECT,190)@15
    unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_in <= unbiasedExp_uid190_floorAbsQ_uid9_block_rsrvd_fix_q(5 downto 0);
    unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b <= unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_in(5 downto 0);

    -- maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix(LOOKUP,191)@15
    maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_combproc: PROCESS (unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b)
    BEGIN
        -- Begin reserved scope level
        CASE (unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b) IS
            WHEN "000000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000";
            WHEN "000001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1000000000000000000000000000000000000000000000000000";
            WHEN "000010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1100000000000000000000000000000000000000000000000000";
            WHEN "000011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1110000000000000000000000000000000000000000000000000";
            WHEN "000100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111000000000000000000000000000000000000000000000000";
            WHEN "000101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111100000000000000000000000000000000000000000000000";
            WHEN "000110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111110000000000000000000000000000000000000000000000";
            WHEN "000111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111000000000000000000000000000000000000000000000";
            WHEN "001000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111100000000000000000000000000000000000000000000";
            WHEN "001001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111110000000000000000000000000000000000000000000";
            WHEN "001010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111000000000000000000000000000000000000000000";
            WHEN "001011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111100000000000000000000000000000000000000000";
            WHEN "001100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111110000000000000000000000000000000000000000";
            WHEN "001101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111000000000000000000000000000000000000000";
            WHEN "001110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111100000000000000000000000000000000000000";
            WHEN "001111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111110000000000000000000000000000000000000";
            WHEN "010000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111000000000000000000000000000000000000";
            WHEN "010001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111100000000000000000000000000000000000";
            WHEN "010010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111110000000000000000000000000000000000";
            WHEN "010011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111000000000000000000000000000000000";
            WHEN "010100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111100000000000000000000000000000000";
            WHEN "010101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111110000000000000000000000000000000";
            WHEN "010110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111000000000000000000000000000000";
            WHEN "010111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111100000000000000000000000000000";
            WHEN "011000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111110000000000000000000000000000";
            WHEN "011001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111000000000000000000000000000";
            WHEN "011010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111100000000000000000000000000";
            WHEN "011011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111110000000000000000000000000";
            WHEN "011100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111000000000000000000000000";
            WHEN "011101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111100000000000000000000000";
            WHEN "011110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111110000000000000000000000";
            WHEN "011111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111000000000000000000000";
            WHEN "100000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111100000000000000000000";
            WHEN "100001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111110000000000000000000";
            WHEN "100010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111000000000000000000";
            WHEN "100011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111100000000000000000";
            WHEN "100100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111110000000000000000";
            WHEN "100101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111000000000000000";
            WHEN "100110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111100000000000000";
            WHEN "100111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111110000000000000";
            WHEN "101000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111000000000000";
            WHEN "101001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111100000000000";
            WHEN "101010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111110000000000";
            WHEN "101011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111000000000";
            WHEN "101100" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111100000000";
            WHEN "101101" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111110000000";
            WHEN "101110" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111000000";
            WHEN "101111" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111100000";
            WHEN "110000" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111110000";
            WHEN "110001" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111111000";
            WHEN "110010" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111111100";
            WHEN "110011" => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= "1111111111111111111111111111111111111111111111111110";
            WHEN OTHERS => maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- invertedMaskBits_uid198_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,197)@15
    invertedMaskBits_uid198_floorAbsQ_uid9_block_rsrvd_fix_q <= not (maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- discardedFracBits_uid199_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,198)@15
    discardedFracBits_uid199_floorAbsQ_uid9_block_rsrvd_fix_q <= invertedMaskBits_uid198_floorAbsQ_uid9_block_rsrvd_fix_q and fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,199)@15
    discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix_q <= "1" WHEN discardedFracBits_uid199_floorAbsQ_uid9_block_rsrvd_fix_q = paddingY_uid31_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- expCompRangeNegNoDiscBits_uid230_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,229)@15
    expCompRangeNegNoDiscBits_uid230_floorAbsQ_uid9_block_rsrvd_fix_q <= expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q and signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b and discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- intCase_uid231_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,230)@15
    intCase_uid231_floorAbsQ_uid9_block_rsrvd_fix_q <= expCompRangeNegNoDiscBits_uid230_floorAbsQ_uid9_block_rsrvd_fix_q or posXAndCompRange_uid213_floorAbsQ_uid9_block_rsrvd_fix_q or resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n;

    -- expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,231)@15
    expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => intCase_uid231_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & intCase_uid231_floorAbsQ_uid9_block_rsrvd_fix_q));
    expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_q <= expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b and expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,185)@15
    resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix_q <= signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b and expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_c;

    -- expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,225)@15
    expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix_q));
    expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_q <= cstBias_uid23_q_uid7_block_rsrvd_fix_q and expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- flagDiscardedFracBits_uid201_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,200)@15
    flagDiscardedFracBits_uid201_floorAbsQ_uid9_block_rsrvd_fix_q <= not (discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,205)@15
    negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q <= signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b and flagDiscardedFracBits_uid201_floorAbsQ_uid9_block_rsrvd_fix_q and expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix(LOOKUP,193)@15
    maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_combproc: PROCESS (unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b)
    BEGIN
        -- Begin reserved scope level
        CASE (unbiasedExpLowerBits_uid191_floorAbsQ_uid9_block_rsrvd_fix_b) IS
            WHEN "000000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "10000000000000000000000000000000000000000000000000000";
            WHEN "000001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "01000000000000000000000000000000000000000000000000000";
            WHEN "000010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00100000000000000000000000000000000000000000000000000";
            WHEN "000011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00010000000000000000000000000000000000000000000000000";
            WHEN "000100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00001000000000000000000000000000000000000000000000000";
            WHEN "000101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000100000000000000000000000000000000000000000000000";
            WHEN "000110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000010000000000000000000000000000000000000000000000";
            WHEN "000111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000001000000000000000000000000000000000000000000000";
            WHEN "001000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000100000000000000000000000000000000000000000000";
            WHEN "001001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000010000000000000000000000000000000000000000000";
            WHEN "001010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000001000000000000000000000000000000000000000000";
            WHEN "001011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000100000000000000000000000000000000000000000";
            WHEN "001100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000010000000000000000000000000000000000000000";
            WHEN "001101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000001000000000000000000000000000000000000000";
            WHEN "001110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000100000000000000000000000000000000000000";
            WHEN "001111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000010000000000000000000000000000000000000";
            WHEN "010000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000001000000000000000000000000000000000000";
            WHEN "010001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000100000000000000000000000000000000000";
            WHEN "010010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000010000000000000000000000000000000000";
            WHEN "010011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000001000000000000000000000000000000000";
            WHEN "010100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000100000000000000000000000000000000";
            WHEN "010101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000010000000000000000000000000000000";
            WHEN "010110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000001000000000000000000000000000000";
            WHEN "010111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000100000000000000000000000000000";
            WHEN "011000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000010000000000000000000000000000";
            WHEN "011001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000001000000000000000000000000000";
            WHEN "011010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000100000000000000000000000000";
            WHEN "011011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000010000000000000000000000000";
            WHEN "011100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000001000000000000000000000000";
            WHEN "011101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000100000000000000000000000";
            WHEN "011110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000010000000000000000000000";
            WHEN "011111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000001000000000000000000000";
            WHEN "100000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000100000000000000000000";
            WHEN "100001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000010000000000000000000";
            WHEN "100010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000001000000000000000000";
            WHEN "100011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000100000000000000000";
            WHEN "100100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000010000000000000000";
            WHEN "100101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000001000000000000000";
            WHEN "100110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000100000000000000";
            WHEN "100111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000010000000000000";
            WHEN "101000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000001000000000000";
            WHEN "101001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000100000000000";
            WHEN "101010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000010000000000";
            WHEN "101011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000001000000000";
            WHEN "101100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000100000000";
            WHEN "101101" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000010000000";
            WHEN "101110" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000001000000";
            WHEN "101111" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000100000";
            WHEN "110000" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000010000";
            WHEN "110001" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000001000";
            WHEN "110010" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000100";
            WHEN "110011" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000010";
            WHEN "110100" => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000001";
            WHEN OTHERS => maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- fracPostMask_uid195_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,194)@15
    fracPostMask_uid195_floorAbsQ_uid9_block_rsrvd_fix_q <= fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b and maskTable_uid192_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix(MUX,196)@15
    intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_s <= resIsMOne_uid186_floorAbsQ_uid9_block_rsrvd_fix_q;
    intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_combproc: PROCESS (intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_s, fracPostMask_uid195_floorAbsQ_uid9_block_rsrvd_fix_q, paddingY_uid31_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_s) IS
            WHEN "0" => intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q <= fracPostMask_uid195_floorAbsQ_uid9_block_rsrvd_fix_q;
            WHEN "1" => intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- ovfExpFrac_uid203_floorAbsQ_uid9_block_rsrvd_fix(BITJOIN,202)@15
    ovfExpFrac_uid203_floorAbsQ_uid9_block_rsrvd_fix_q <= GND_q & expX_uid165_floorAbsQ_uid9_block_rsrvd_fix_b & intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix(ADD,203)@15
    ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & ovfExpFrac_uid203_floorAbsQ_uid9_block_rsrvd_fix_q);
    ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000" & maskIncrementTable_uid194_floorAbsQ_uid9_block_rsrvd_fix_q);
    ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_a) + UNSIGNED(ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_b));
    ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_q <= ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_o(64 downto 0);

    -- intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select(BITSELECT,924)@15
    intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_in <= ovfExpIntFracValuePostIncMask_uid204_floorAbsQ_uid9_block_rsrvd_fix_q(62 downto 0);
    intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_b <= intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_in(51 downto 0);
    intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_c <= intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_in(62 downto 52);

    -- compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,224)@15
    compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q));
    compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_q <= intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_c and compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- expRNoExc_uid233_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,232)@15
    expRNoExc_uid233_floorAbsQ_uid9_block_rsrvd_fix_q <= compNegNonZeroDiscBits_uid225_floorAbsQ_uid9_block_rsrvd_fix_q or expResIsMOne_uid226_floorAbsQ_uid9_block_rsrvd_fix_q or expIntegerOrCompNegDiscBitsZeroOrCompPos_uid232_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,234)@15
    expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => excXNOrI_uid234_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & excXNOrI_uid234_floorAbsQ_uid9_block_rsrvd_fix_q));
    expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_q <= expRNoExc_uid233_floorAbsQ_uid9_block_rsrvd_fix_q or expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- expR_uid237_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,236)@15
    expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => invExcXZ_uid236_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & invExcXZ_uid236_floorAbsQ_uid9_block_rsrvd_fix_q));
    expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_q <= expWithNaNInf_uid235_floorAbsQ_uid9_block_rsrvd_fix_q and expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- notInfOrZero_uid221_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,220)@15
    notInfOrZero_uid221_floorAbsQ_uid9_block_rsrvd_fix_q <= not (excI_x_uid177_floorAbsQ_uid9_block_rsrvd_fix_q or excZ_x_uid173_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,218)@15
    fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n(0)) & resIsInteger_uid188_floorAbsQ_uid9_block_rsrvd_fix_n));
    fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_q <= fracX_uid166_floorAbsQ_uid9_block_rsrvd_fix_b and fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- resIsZero_uid185_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,184)@15
    resIsZero_uid185_floorAbsQ_uid9_block_rsrvd_fix_q <= invSignX_uid184_floorAbsQ_uid9_block_rsrvd_fix_q and expLTBias_uid183_floorAbsQ_uid9_block_rsrvd_fix_c;

    -- invResIszero_uid215_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,214)@15
    invResIszero_uid215_floorAbsQ_uid9_block_rsrvd_fix_q <= not (resIsZero_uid185_floorAbsQ_uid9_block_rsrvd_fix_q);

    -- negXNoDiscardBits_uid210_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,209)@15
    negXNoDiscardBits_uid210_floorAbsQ_uid9_block_rsrvd_fix_q <= signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b and discardedBitsAllZeros_uid200_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- expCompRangeNegNoDiscBits_uid211_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,210)@15
    expCompRangeNegNoDiscBits_uid211_floorAbsQ_uid9_block_rsrvd_fix_q <= expCompRange_uid189_floorAbsQ_uid9_block_rsrvd_fix_q and negXNoDiscardBits_uid210_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- nCompPosOrNegWithZeroDiscBits_uid214_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,213)@15
    nCompPosOrNegWithZeroDiscBits_uid214_floorAbsQ_uid9_block_rsrvd_fix_q <= posXAndCompRange_uid213_floorAbsQ_uid9_block_rsrvd_fix_q or expCompRangeNegNoDiscBits_uid211_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- resNotZeroAndComp_uid216_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,215)@15
    resNotZeroAndComp_uid216_floorAbsQ_uid9_block_rsrvd_fix_q <= nCompPosOrNegWithZeroDiscBits_uid214_floorAbsQ_uid9_block_rsrvd_fix_q and invResIszero_uid215_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,217)@15
    fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => resNotZeroAndComp_uid216_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & resNotZeroAndComp_uid216_floorAbsQ_uid9_block_rsrvd_fix_q));
    fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_q <= intFracValue_uid197_floorAbsQ_uid9_block_rsrvd_fix_q and fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,207)@15
    fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & negDiscBitsCompRange_uid206_floorAbsQ_uid9_block_rsrvd_fix_q));
    fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_q <= intFracNegWNonZeroDiscardedBits_uid205_floorAbsQ_uid9_block_rsrvd_fix_merged_bit_select_b and fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- fracRNoExc_uid220_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,219)@15
    fracRNoExc_uid220_floorAbsQ_uid9_block_rsrvd_fix_q <= fracNegAndFracBits_uid208_floorAbsQ_uid9_block_rsrvd_fix_q or fracPosOrNegWithZeroDisBitsComp_uid218_floorAbsQ_uid9_block_rsrvd_fix_q or fracAndExpandedFlagResInt_uid219_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix(LOGICAL,221)@15
    fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((51 downto 1 => notInfOrZero_uid221_floorAbsQ_uid9_block_rsrvd_fix_q(0)) & notInfOrZero_uid221_floorAbsQ_uid9_block_rsrvd_fix_q));
    fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_q <= fracRNoExc_uid220_floorAbsQ_uid9_block_rsrvd_fix_q and fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_b;

    -- floorX_uid238_floorAbsQ_uid9_block_rsrvd_fix(BITJOIN,237)@15
    floorX_uid238_floorAbsQ_uid9_block_rsrvd_fix_q <= signX_uid167_floorAbsQ_uid9_block_rsrvd_fix_b & expR_uid237_floorAbsQ_uid9_block_rsrvd_fix_q & fracR_uid222_floorAbsQ_uid9_block_rsrvd_fix_q;

    -- fracFAQ_uid10_block_rsrvd_fix_merged_bit_select(BITSELECT,925)@15
    fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_in <= floorX_uid238_floorAbsQ_uid9_block_rsrvd_fix_q(62 downto 0);
    fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_b <= fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_in(51 downto 0);
    fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_c <= fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_in(62 downto 52);

    -- sFloorAbsQ_uid13_block_rsrvd_fix(BITJOIN,12)@15
    sFloorAbsQ_uid13_block_rsrvd_fix_q <= sQ_uid12_block_rsrvd_fix_b & fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_c & fracFAQ_uid10_block_rsrvd_fix_merged_bit_select_b;

    -- frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,247)@15
    frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_in <= sFloorAbsQ_uid13_block_rsrvd_fix_q(51 downto 0);
    frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b <= frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_in(51 downto 0);

    -- redist25_frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b_1(DELAY,962)
    redist25_frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b, xout => redist25_frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- paddingY_uid31_q_uid7_block_rsrvd_fix(CONSTANT,30)
    paddingY_uid31_q_uid7_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000";

    -- fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,250)@16 + 1
    fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_qi <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = redist25_frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b_1_q ELSE "0";
    fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_qi, xout => fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- expX_uid240_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,239)@15
    expX_uid240_multFloorByY_uid14_block_rsrvd_fix_in <= sFloorAbsQ_uid13_block_rsrvd_fix_q(62 downto 0);
    expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b <= expX_uid240_multFloorByY_uid14_block_rsrvd_fix_in(62 downto 52);

    -- redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1(DELAY,963)
    redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b, xout => redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,249)@16 + 1
    expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_qi <= "1" WHEN redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1_q = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_qi, xout => expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,252)@17
    excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix_q <= expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_q and fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_q;

    -- redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3(DELAY,987)
    redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid53_q_uid7_block_rsrvd_fix_q, xout => redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- excYZAndExcXI_uid320_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,319)@17
    excYZAndExcXI_uid320_multFloorByY_uid14_block_rsrvd_fix_q <= redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3_q and excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix_q;

    -- redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3(DELAY,985)
    redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid57_q_uid7_block_rsrvd_fix_q, xout => redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,248)@16 + 1
    excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_qi <= "1" WHEN redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1_q = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";
    excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_qi, xout => excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excXZAndExcYI_uid321_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,320)@17
    excXZAndExcYI_uid321_multFloorByY_uid14_block_rsrvd_fix_q <= excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q and redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3_q;

    -- ZeroTimesInf_uid322_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,321)@17
    ZeroTimesInf_uid322_multFloorByY_uid14_block_rsrvd_fix_q <= excXZAndExcYI_uid321_multFloorByY_uid14_block_rsrvd_fix_q or excYZAndExcXI_uid320_multFloorByY_uid14_block_rsrvd_fix_q;

    -- redist47_excN_y_uid58_q_uid7_block_rsrvd_fix_q_3(DELAY,984)
    redist47_excN_y_uid58_q_uid7_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid58_q_uid7_block_rsrvd_fix_q, xout => redist47_excN_y_uid58_q_uid7_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid252_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,251)@17
    fracXIsNotZero_uid252_multFloorByY_uid14_block_rsrvd_fix_q <= not (fracXIsZero_uid251_multFloorByY_uid14_block_rsrvd_fix_q);

    -- excN_x_uid254_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,253)@17
    excN_x_uid254_multFloorByY_uid14_block_rsrvd_fix_q <= expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_q and fracXIsNotZero_uid252_multFloorByY_uid14_block_rsrvd_fix_q;

    -- excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,322)@17 + 1
    excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_qi <= excN_x_uid254_multFloorByY_uid14_block_rsrvd_fix_q or redist47_excN_y_uid58_q_uid7_block_rsrvd_fix_q_3_q or ZeroTimesInf_uid322_multFloorByY_uid14_block_rsrvd_fix_q;
    excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_qi, xout => excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- invExcRNaN_uid335_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,334)@18
    invExcRNaN_uid335_multFloorByY_uid14_block_rsrvd_fix_q <= not (excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_q);

    -- redist52_signY_uid30_q_uid7_block_rsrvd_fix_b_15(DELAY,989)
    redist52_signY_uid30_q_uid7_block_rsrvd_fix_b_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist51_signY_uid30_q_uid7_block_rsrvd_fix_b_14_q, xout => redist52_signY_uid30_q_uid7_block_rsrvd_fix_b_15_q, clk => clk, aclr => areset );

    -- signX_uid242_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,241)@15
    signX_uid242_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(sFloorAbsQ_uid13_block_rsrvd_fix_q(63 downto 63));

    -- signR_uid282_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,281)@15 + 1
    signR_uid282_multFloorByY_uid14_block_rsrvd_fix_qi <= signX_uid242_multFloorByY_uid14_block_rsrvd_fix_b xor redist52_signY_uid30_q_uid7_block_rsrvd_fix_b_15_q;
    signR_uid282_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid282_multFloorByY_uid14_block_rsrvd_fix_qi, xout => signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist24_signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q_3(DELAY,961)
    redist24_signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q, xout => redist24_signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- signRPostExc_uid336_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,335)@18
    signRPostExc_uid336_multFloorByY_uid14_block_rsrvd_fix_q <= redist24_signR_uid282_multFloorByY_uid14_block_rsrvd_fix_q_3_q and invExcRNaN_uid335_multFloorByY_uid14_block_rsrvd_fix_q;

    -- ofracX_uid274_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,273)@15
    ofracX_uid274_multFloorByY_uid14_block_rsrvd_fix_q <= VCC_q & frac_x_uid248_multFloorByY_uid14_block_rsrvd_fix_b;

    -- topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select(BITSELECT,926)@15
    topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b <= ofracX_uid274_multFloorByY_uid14_block_rsrvd_fix_q(52 downto 26);
    topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c <= ofracX_uid274_multFloorByY_uid14_block_rsrvd_fix_q(25 downto 0);

    -- redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3(DELAY,968)
    redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 53, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid103_q_uid7_block_rsrvd_fix_q, xout => redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg(DELAY,1000)
    redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg : dspba_delay
    GENERIC MAP ( width => 53, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_q, xout => redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg_q, clk => clk, aclr => areset );

    -- aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,607)@15
    aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in <= redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg_q(25 downto 0);
    aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b <= aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in(25 downto 0);

    -- aboveLeftY_mergedSignalTM_uid609_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,608)@15
    aboveLeftY_mergedSignalTM_uid609_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q <= aboveLeftY_bottomRange_uid608_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b & GND_q;

    -- rightBottomX_mergedSignalTM_uid613_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,612)@15
    rightBottomX_mergedSignalTM_uid613_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q <= topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c & GND_q;

    -- topRangeY_uid604_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,603)@15
    topRangeY_uid604_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b <= redist31_lOAdded_uid103_q_uid7_block_rsrvd_fix_q_3_outputreg_q(52 downto 26);

    -- multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma(CHAINMULTADD,919)@15 + 2
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset <= areset;
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 <= '1';
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0;
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) * multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(1) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(1) * multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(1);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0) <= RESIZE(multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0),55);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(1) <= RESIZE(multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(1),55);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0) + multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(1);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0);
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 = '1') THEN
                multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeY_uid604_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b),27);
                multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(1) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid609_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q),27);
                multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid613_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q),27);
                multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(1) <= RESIZE(UNSIGNED(topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b),27);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 = '1') THEN
                multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0) <= multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 55, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0)(54 downto 0)), xout => multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq(54 downto 0));

    -- add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(ADD,629)@17
    add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("000000000000000000000000000" & multSumOfTwoTS_uid616_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q);
    add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c);
    add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_a) + UNSIGNED(add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b));
    add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q <= add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_o(81 downto 0);

    -- topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma(CHAINMULTADD,910)@15 + 2
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset <= areset;
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 <= '1';
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0;
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0) <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) * topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0);
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0) <= RESIZE(topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0),54);
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0) <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0);
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0) <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0);
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0) <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0);
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 = '1') THEN
                topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(topRangeX_uid603_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b),27);
                topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(topRangeY_uid604_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b),27);
            END IF;
        END IF;
    END PROCESS;
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 = '1') THEN
                topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0) <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0)(53 downto 0)), xout => topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq(53 downto 0));

    -- sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma(CHAINMULTADD,911)@15 + 2
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_reset <= areset;
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 <= '1';
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0;
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0) <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) * sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0);
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0) <= RESIZE(sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_p(0),54);
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0) <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_u(0);
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0) <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_w(0);
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0) <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_x(0);
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0 <= (others => (others => '0'));
            sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena0 = '1') THEN
                sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_a0(0) <= RESIZE(UNSIGNED(rightBottomX_mergedSignalTM_uid613_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q),27);
                sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_c0(0) <= RESIZE(UNSIGNED(aboveLeftY_mergedSignalTM_uid609_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q),27);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_ena1 = '1') THEN
                sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0) <= sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_delay : dspba_delay
    GENERIC MAP ( width => 54, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_s(0)(53 downto 0)), xout => sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq, clk => clk, aclr => areset );
    sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q <= STD_LOGIC_VECTOR(sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_qq(53 downto 0));

    -- add0_uid627_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,626)@17
    add0_uid627_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q <= topProd_uid605_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q & sm0_uid626_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_cma_q;

    -- lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select(BITSELECT,930)@17
    lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b <= add0_uid627_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q(26 downto 0);
    lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_c <= add0_uid627_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q(107 downto 27);

    -- add1_uid631_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,630)@17
    add1_uid631_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q <= add1sumAHighB_uid630_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q & lowRangeB_uid628_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_merged_bit_select_b;

    -- osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,631)@17
    osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in <= add1_uid631_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_q(107 downto 0);
    osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b <= osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_in(107 downto 2);

    -- normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,282)@17
    normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b(105 downto 105));

    -- roundBitDetectionConstant_uid297_multFloorByY_uid14_block_rsrvd_fix(CONSTANT,296)
    roundBitDetectionConstant_uid297_multFloorByY_uid14_block_rsrvd_fix_q <= "010";

    -- fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,284)@17
    fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_in <= osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b(104 downto 0);
    fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_b <= fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_in(104 downto 52);

    -- fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,285)@17
    fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_in <= osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b(103 downto 0);
    fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_b <= fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_in(103 downto 51);

    -- fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix(MUX,286)@17
    fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_s <= normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix_b;
    fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_combproc: PROCESS (fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_s, fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_b, fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_b)
    BEGIN
        CASE (fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_s) IS
            WHEN "0" => fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q <= fracRPostNormLow_uid286_multFloorByY_uid14_block_rsrvd_fix_b;
            WHEN "1" => fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q <= fracRPostNormHigh_uid285_multFloorByY_uid14_block_rsrvd_fix_b;
            WHEN OTHERS => fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,294)@17
    fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_in <= fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q(1 downto 0);
    fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_b <= fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_in(1 downto 0);

    -- extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,288)@17
    extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b(51 downto 0));
    extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_in(51 downto 51));

    -- extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix(MUX,289)@17
    extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_s <= normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix_b;
    extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_combproc: PROCESS (extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_s, GND_q, extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_b)
    BEGIN
        CASE (extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_s) IS
            WHEN "0" => extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_q <= GND_q;
            WHEN "1" => extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_q <= extraStickyBitOfProd_uid289_multFloorByY_uid14_block_rsrvd_fix_b;
            WHEN OTHERS => extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,287)@17
    stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_in <= osig_uid632_prod_uid281_multFloorByY_uid14_block_rsrvd_fix_b(50 downto 0);
    stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_b <= stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_in(50 downto 0);

    -- stickyExtendedRange_uid291_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,290)@17
    stickyExtendedRange_uid291_multFloorByY_uid14_block_rsrvd_fix_q <= extraStickyBit_uid290_multFloorByY_uid14_block_rsrvd_fix_q & stickyRange_uid288_multFloorByY_uid14_block_rsrvd_fix_b;

    -- stickyRangeComparator_uid293_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,292)@17
    stickyRangeComparator_uid293_multFloorByY_uid14_block_rsrvd_fix_q <= "1" WHEN stickyExtendedRange_uid291_multFloorByY_uid14_block_rsrvd_fix_q = paddingY_uid31_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- sticky_uid294_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,293)@17
    sticky_uid294_multFloorByY_uid14_block_rsrvd_fix_q <= not (stickyRangeComparator_uid293_multFloorByY_uid14_block_rsrvd_fix_q);

    -- lrs_uid296_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,295)@17
    lrs_uid296_multFloorByY_uid14_block_rsrvd_fix_q <= fracRPostNorm1dto0_uid295_multFloorByY_uid14_block_rsrvd_fix_b & sticky_uid294_multFloorByY_uid14_block_rsrvd_fix_q;

    -- roundBitDetectionPattern_uid298_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,297)@17
    roundBitDetectionPattern_uid298_multFloorByY_uid14_block_rsrvd_fix_q <= "1" WHEN lrs_uid296_multFloorByY_uid14_block_rsrvd_fix_q = roundBitDetectionConstant_uid297_multFloorByY_uid14_block_rsrvd_fix_q ELSE "0";

    -- roundBit_uid299_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,298)@17
    roundBit_uid299_multFloorByY_uid14_block_rsrvd_fix_q <= not (roundBitDetectionPattern_uid298_multFloorByY_uid14_block_rsrvd_fix_q);

    -- roundBitAndNormalizationOp_uid302_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,301)@17
    roundBitAndNormalizationOp_uid302_multFloorByY_uid14_block_rsrvd_fix_q <= GND_q & normalizeBit_uid283_multFloorByY_uid14_block_rsrvd_fix_b & paddingY_uid31_q_uid7_block_rsrvd_fix_q & roundBit_uid299_multFloorByY_uid14_block_rsrvd_fix_q;

    -- biasInc_uid279_multFloorByY_uid14_block_rsrvd_fix(CONSTANT,278)
    biasInc_uid279_multFloorByY_uid14_block_rsrvd_fix_q <= "0001111111111";

    -- redist56_expY_uid28_q_uid7_block_rsrvd_fix_b_16(DELAY,993)
    redist56_expY_uid28_q_uid7_block_rsrvd_fix_b_16 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist55_expY_uid28_q_uid7_block_rsrvd_fix_b_14_q, xout => redist56_expY_uid28_q_uid7_block_rsrvd_fix_b_16_q, clk => clk, aclr => areset );

    -- expSum_uid278_multFloorByY_uid14_block_rsrvd_fix(ADD,277)@16 + 1
    expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist26_expX_uid240_multFloorByY_uid14_block_rsrvd_fix_b_1_q);
    expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & redist56_expY_uid28_q_uid7_block_rsrvd_fix_b_16_q);
    expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_a) + UNSIGNED(expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_q <= expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_o(11 downto 0);

    -- expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix(SUB,279)@17
    expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & expSum_uid278_multFloorByY_uid14_block_rsrvd_fix_q));
    expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => biasInc_uid279_multFloorByY_uid14_block_rsrvd_fix_q(12)) & biasInc_uid279_multFloorByY_uid14_block_rsrvd_fix_q));
    expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_a) - SIGNED(expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_b));
    expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_q <= expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_o(13 downto 0);

    -- expFracPreRound_uid300_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,299)@17
    expFracPreRound_uid300_multFloorByY_uid14_block_rsrvd_fix_q <= expSumMBias_uid280_multFloorByY_uid14_block_rsrvd_fix_q & fracRPostNorm_uid287_multFloorByY_uid14_block_rsrvd_fix_q;

    -- expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix(ADD,302)@17
    expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => expFracPreRound_uid300_multFloorByY_uid14_block_rsrvd_fix_q(66)) & expFracPreRound_uid300_multFloorByY_uid14_block_rsrvd_fix_q));
    expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000" & roundBitAndNormalizationOp_uid302_multFloorByY_uid14_block_rsrvd_fix_q));
    expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_a) + SIGNED(expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_b));
    expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_q <= expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_o(67 downto 0);

    -- expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,304)@17
    expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_q(67 downto 53));

    -- expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,305)@17
    expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_in <= expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b(10 downto 0);
    expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b <= expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_in(10 downto 0);

    -- redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1(DELAY,959)
    redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b, xout => redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix(COMPARE,308)@17
    expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b(14)) & expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b));
    expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000" & cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q));
    expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_a) - SIGNED(expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_b));
    expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_n(0) <= not (expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_o(16));

    -- redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3(DELAY,983)
    redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_y_uid61_q_uid7_block_rsrvd_fix_q, xout => redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid255_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,254)@17
    invExpXIsMax_uid255_multFloorByY_uid14_block_rsrvd_fix_q <= not (expXIsMax_uid250_multFloorByY_uid14_block_rsrvd_fix_q);

    -- InvExpXIsZero_uid256_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,255)@17
    InvExpXIsZero_uid256_multFloorByY_uid14_block_rsrvd_fix_q <= not (excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q);

    -- excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,256)@17
    excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q <= InvExpXIsZero_uid256_multFloorByY_uid14_block_rsrvd_fix_q and invExpXIsMax_uid255_multFloorByY_uid14_block_rsrvd_fix_q;

    -- ExcROvfAndInReg_uid318_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,317)@17
    ExcROvfAndInReg_uid318_multFloorByY_uid14_block_rsrvd_fix_q <= excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q and redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q and expOvf_uid309_multFloorByY_uid14_block_rsrvd_fix_n;

    -- excYRAndExcXI_uid317_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,316)@17
    excYRAndExcXI_uid317_multFloorByY_uid14_block_rsrvd_fix_q <= redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q and excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix_q;

    -- excXRAndExcYI_uid316_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,315)@17
    excXRAndExcYI_uid316_multFloorByY_uid14_block_rsrvd_fix_q <= excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q and redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3_q;

    -- excXIAndExcYI_uid315_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,314)@17
    excXIAndExcYI_uid315_multFloorByY_uid14_block_rsrvd_fix_q <= excI_x_uid253_multFloorByY_uid14_block_rsrvd_fix_q and redist48_excI_y_uid57_q_uid7_block_rsrvd_fix_q_3_q;

    -- excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,318)@17 + 1
    excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_qi <= excXIAndExcYI_uid315_multFloorByY_uid14_block_rsrvd_fix_q or excXRAndExcYI_uid316_multFloorByY_uid14_block_rsrvd_fix_q or excYRAndExcXI_uid317_multFloorByY_uid14_block_rsrvd_fix_q or ExcROvfAndInReg_uid318_multFloorByY_uid14_block_rsrvd_fix_q;
    excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_qi, xout => excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix(COMPARE,306)@17
    expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000" & GND_q));
    expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b(14)) & expRPreExcExt_uid305_multFloorByY_uid14_block_rsrvd_fix_b));
    expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_a) - SIGNED(expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_b));
    expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_n(0) <= not (expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_o(16));

    -- excZC3_uid313_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,312)@17
    excZC3_uid313_multFloorByY_uid14_block_rsrvd_fix_q <= excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q and redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q and expUdf_uid307_multFloorByY_uid14_block_rsrvd_fix_n;

    -- excYZAndExcXR_uid312_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,311)@17
    excYZAndExcXR_uid312_multFloorByY_uid14_block_rsrvd_fix_q <= redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3_q and excR_x_uid257_multFloorByY_uid14_block_rsrvd_fix_q;

    -- excXZAndExcYR_uid311_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,310)@17
    excXZAndExcYR_uid311_multFloorByY_uid14_block_rsrvd_fix_q <= excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q and redist46_excR_y_uid61_q_uid7_block_rsrvd_fix_q_3_q;

    -- excXZAndExcYZ_uid310_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,309)@17
    excXZAndExcYZ_uid310_multFloorByY_uid14_block_rsrvd_fix_q <= excZ_x_uid249_multFloorByY_uid14_block_rsrvd_fix_q and redist50_excZ_y_uid53_q_uid7_block_rsrvd_fix_q_3_q;

    -- excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix(LOGICAL,313)@17 + 1
    excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_qi <= excXZAndExcYZ_uid310_multFloorByY_uid14_block_rsrvd_fix_q or excXZAndExcYR_uid311_multFloorByY_uid14_block_rsrvd_fix_q or excYZAndExcXR_uid312_multFloorByY_uid14_block_rsrvd_fix_q or excZC3_uid313_multFloorByY_uid14_block_rsrvd_fix_q;
    excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_qi, xout => excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- concExc_uid324_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,323)@18
    concExc_uid324_multFloorByY_uid14_block_rsrvd_fix_q <= excRNaN_uid323_multFloorByY_uid14_block_rsrvd_fix_q & excRInf_uid319_multFloorByY_uid14_block_rsrvd_fix_q & excRZero_uid314_multFloorByY_uid14_block_rsrvd_fix_q;

    -- excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix(LOOKUP,324)@18
    excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_combproc: PROCESS (concExc_uid324_multFloorByY_uid14_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid324_multFloorByY_uid14_block_rsrvd_fix_q) IS
            WHEN "000" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "01";
            WHEN "001" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "00";
            WHEN "010" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "10";
            WHEN "011" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "00";
            WHEN "100" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "11";
            WHEN "101" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "00";
            WHEN "110" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "00";
            WHEN "111" => excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix(MUX,333)@18
    expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_s <= excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q;
    expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_s, cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q, redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1_q, cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q <= cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q <= redist22_expRPreExc_uid306_multFloorByY_uid14_block_rsrvd_fix_b_1_q;
            WHEN "10" => expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix(BITSELECT,303)@17
    fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_in <= expFracRPostRounding_uid303_multFloorByY_uid14_block_rsrvd_fix_q(52 downto 0);
    fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b <= fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_in(52 downto 1);

    -- redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1(DELAY,960)
    redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b, xout => redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix(MUX,328)@18
    fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_s <= excREnc_uid325_multFloorByY_uid14_block_rsrvd_fix_q;
    fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_s, paddingY_uid31_q_uid7_block_rsrvd_fix_q, redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1_q, oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q <= redist23_fracRPreExc_uid304_multFloorByY_uid14_block_rsrvd_fix_b_1_q;
            WHEN "10" => fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q <= oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid337_multFloorByY_uid14_block_rsrvd_fix(BITJOIN,336)@18
    R_uid337_multFloorByY_uid14_block_rsrvd_fix_q <= signRPostExc_uid336_multFloorByY_uid14_block_rsrvd_fix_q & expRPostExc_uid334_multFloorByY_uid14_block_rsrvd_fix_q & fracRPostExc_uid329_multFloorByY_uid14_block_rsrvd_fix_q;

    -- ySign_uid15_block_rsrvd_fix(BITSELECT,14)@18
    ySign_uid15_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(R_uid337_multFloorByY_uid14_block_rsrvd_fix_q(63 downto 63));

    -- invYSign_uid18_block_rsrvd_fix(LOGICAL,17)@18
    invYSign_uid18_block_rsrvd_fix_q <= not (ySign_uid15_block_rsrvd_fix_b);

    -- exp_uid17_block_rsrvd_fix(BITSELECT,16)@18
    exp_uid17_block_rsrvd_fix_b <= R_uid337_multFloorByY_uid14_block_rsrvd_fix_q(62 downto 52);

    -- fraction_uid16_block_rsrvd_fix(BITSELECT,15)@18
    fraction_uid16_block_rsrvd_fix_b <= R_uid337_multFloorByY_uid14_block_rsrvd_fix_q(51 downto 0);

    -- minusY_uid19_block_rsrvd_fix(BITJOIN,18)@18
    minusY_uid19_block_rsrvd_fix_q <= invYSign_uid18_block_rsrvd_fix_q & exp_uid17_block_rsrvd_fix_b & fraction_uid16_block_rsrvd_fix_b;

    -- sigY_uid342_modRes_uid20_block_rsrvd_fix(BITSELECT,341)@18
    sigY_uid342_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(minusY_uid19_block_rsrvd_fix_q(63 downto 63));

    -- expY_uid344_modRes_uid20_block_rsrvd_fix(BITSELECT,343)@18
    expY_uid344_modRes_uid20_block_rsrvd_fix_in <= minusY_uid19_block_rsrvd_fix_q(62 downto 0);
    expY_uid344_modRes_uid20_block_rsrvd_fix_b <= expY_uid344_modRes_uid20_block_rsrvd_fix_in(62 downto 52);

    -- fracY_uid343_modRes_uid20_block_rsrvd_fix(BITSELECT,342)@18
    fracY_uid343_modRes_uid20_block_rsrvd_fix_in <= minusY_uid19_block_rsrvd_fix_q(51 downto 0);
    fracY_uid343_modRes_uid20_block_rsrvd_fix_b <= fracY_uid343_modRes_uid20_block_rsrvd_fix_in(51 downto 0);

    -- ypn_uid345_modRes_uid20_block_rsrvd_fix(BITJOIN,344)@18
    ypn_uid345_modRes_uid20_block_rsrvd_fix_q <= sigY_uid342_modRes_uid20_block_rsrvd_fix_b & expY_uid344_modRes_uid20_block_rsrvd_fix_b & fracY_uid343_modRes_uid20_block_rsrvd_fix_b;

    -- redist62_in_0_in_0_8_notEnable(LOGICAL,1027)
    redist62_in_0_in_0_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist62_in_0_in_0_8_nor(LOGICAL,1028)
    redist62_in_0_in_0_8_nor_q <= not (redist62_in_0_in_0_8_notEnable_q or redist62_in_0_in_0_8_sticky_ena_q);

    -- redist62_in_0_in_0_8_mem_last(CONSTANT,1024)
    redist62_in_0_in_0_8_mem_last_q <= "01";

    -- redist62_in_0_in_0_8_cmp(LOGICAL,1025)
    redist62_in_0_in_0_8_cmp_q <= "1" WHEN redist62_in_0_in_0_8_mem_last_q = redist62_in_0_in_0_8_rdcnt_q ELSE "0";

    -- redist62_in_0_in_0_8_cmpReg(REG,1026)
    redist62_in_0_in_0_8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_in_0_in_0_8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist62_in_0_in_0_8_cmpReg_q <= STD_LOGIC_VECTOR(redist62_in_0_in_0_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist62_in_0_in_0_8_sticky_ena(REG,1029)
    redist62_in_0_in_0_8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_in_0_in_0_8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist62_in_0_in_0_8_nor_q = "1") THEN
                redist62_in_0_in_0_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist62_in_0_in_0_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist62_in_0_in_0_8_enaAnd(LOGICAL,1030)
    redist62_in_0_in_0_8_enaAnd_q <= redist62_in_0_in_0_8_sticky_ena_q and VCC_q;

    -- redist62_in_0_in_0_8_rdcnt(COUNTER,1022)
    -- low=0, high=2, step=1, init=0
    redist62_in_0_in_0_8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_in_0_in_0_8_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist62_in_0_in_0_8_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist62_in_0_in_0_8_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist62_in_0_in_0_8_rdcnt_eq <= '1';
            ELSE
                redist62_in_0_in_0_8_rdcnt_eq <= '0';
            END IF;
            IF (redist62_in_0_in_0_8_rdcnt_eq = '1') THEN
                redist62_in_0_in_0_8_rdcnt_i <= redist62_in_0_in_0_8_rdcnt_i + 2;
            ELSE
                redist62_in_0_in_0_8_rdcnt_i <= redist62_in_0_in_0_8_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist62_in_0_in_0_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist62_in_0_in_0_8_rdcnt_i, 2)));

    -- redist62_in_0_in_0_8_wraddr(REG,1023)
    redist62_in_0_in_0_8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist62_in_0_in_0_8_wraddr_q <= "10";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist62_in_0_in_0_8_wraddr_q <= STD_LOGIC_VECTOR(redist62_in_0_in_0_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist62_in_0_in_0_8_mem(DUALMEM,1021)
    redist62_in_0_in_0_8_mem_ia <= STD_LOGIC_VECTOR(redist61_in_0_in_0_4_q);
    redist62_in_0_in_0_8_mem_aa <= redist62_in_0_in_0_8_wraddr_q;
    redist62_in_0_in_0_8_mem_ab <= redist62_in_0_in_0_8_rdcnt_q;
    redist62_in_0_in_0_8_mem_reset0 <= areset;
    redist62_in_0_in_0_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => redist62_in_0_in_0_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist62_in_0_in_0_8_mem_reset0,
        clock1 => clk,
        address_a => redist62_in_0_in_0_8_mem_aa,
        data_a => redist62_in_0_in_0_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist62_in_0_in_0_8_mem_ab,
        q_b => redist62_in_0_in_0_8_mem_iq
    );
    redist62_in_0_in_0_8_mem_q <= redist62_in_0_in_0_8_mem_iq(63 downto 0);

    -- expFracY_uid340_modRes_uid20_block_rsrvd_fix(BITSELECT,339)@18
    expFracY_uid340_modRes_uid20_block_rsrvd_fix_in <= minusY_uid19_block_rsrvd_fix_q(62 downto 0);
    expFracY_uid340_modRes_uid20_block_rsrvd_fix_b <= expFracY_uid340_modRes_uid20_block_rsrvd_fix_in(62 downto 0);

    -- expFracX_uid339_modRes_uid20_block_rsrvd_fix(BITSELECT,338)@18
    expFracX_uid339_modRes_uid20_block_rsrvd_fix_b <= redist62_in_0_in_0_8_mem_q(62 downto 0);

    -- xGTEy_uid341_modRes_uid20_block_rsrvd_fix(COMPARE,340)@18
    xGTEy_uid341_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expFracX_uid339_modRes_uid20_block_rsrvd_fix_b);
    xGTEy_uid341_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expFracY_uid340_modRes_uid20_block_rsrvd_fix_b);
    xGTEy_uid341_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid341_modRes_uid20_block_rsrvd_fix_a) - UNSIGNED(xGTEy_uid341_modRes_uid20_block_rsrvd_fix_b));
    xGTEy_uid341_modRes_uid20_block_rsrvd_fix_n(0) <= not (xGTEy_uid341_modRes_uid20_block_rsrvd_fix_o(64));

    -- bSig_uid350_modRes_uid20_block_rsrvd_fix(MUX,349)@18
    bSig_uid350_modRes_uid20_block_rsrvd_fix_s <= xGTEy_uid341_modRes_uid20_block_rsrvd_fix_n;
    bSig_uid350_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (bSig_uid350_modRes_uid20_block_rsrvd_fix_s, redist62_in_0_in_0_8_mem_q, ypn_uid345_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (bSig_uid350_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => bSig_uid350_modRes_uid20_block_rsrvd_fix_q <= redist62_in_0_in_0_8_mem_q;
            WHEN "1" => bSig_uid350_modRes_uid20_block_rsrvd_fix_q <= ypn_uid345_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => bSig_uid350_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid384_modRes_uid20_block_rsrvd_fix(BITSELECT,383)@18
    sigB_uid384_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(bSig_uid350_modRes_uid20_block_rsrvd_fix_q(63 downto 63));

    -- redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1(DELAY,944)
    redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid384_modRes_uid20_block_rsrvd_fix_b, xout => redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- aSig_uid349_modRes_uid20_block_rsrvd_fix(MUX,348)@18
    aSig_uid349_modRes_uid20_block_rsrvd_fix_s <= xGTEy_uid341_modRes_uid20_block_rsrvd_fix_n;
    aSig_uid349_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (aSig_uid349_modRes_uid20_block_rsrvd_fix_s, ypn_uid345_modRes_uid20_block_rsrvd_fix_q, redist62_in_0_in_0_8_mem_q)
    BEGIN
        CASE (aSig_uid349_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => aSig_uid349_modRes_uid20_block_rsrvd_fix_q <= ypn_uid345_modRes_uid20_block_rsrvd_fix_q;
            WHEN "1" => aSig_uid349_modRes_uid20_block_rsrvd_fix_q <= redist62_in_0_in_0_8_mem_q;
            WHEN OTHERS => aSig_uid349_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid383_modRes_uid20_block_rsrvd_fix(BITSELECT,382)@18
    sigA_uid383_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(aSig_uid349_modRes_uid20_block_rsrvd_fix_q(63 downto 63));

    -- redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1(DELAY,946)
    redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid383_modRes_uid20_block_rsrvd_fix_b, xout => redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- effSub_uid385_modRes_uid20_block_rsrvd_fix(LOGICAL,384)@19
    effSub_uid385_modRes_uid20_block_rsrvd_fix_q <= redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1_q xor redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1_q;

    -- exp_bSig_uid368_modRes_uid20_block_rsrvd_fix(BITSELECT,367)@18
    exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_in <= bSig_uid350_modRes_uid20_block_rsrvd_fix_q(62 downto 0);
    exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_b <= exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_in(62 downto 52);

    -- exp_aSig_uid354_modRes_uid20_block_rsrvd_fix(BITSELECT,353)@18
    exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_in <= aSig_uid349_modRes_uid20_block_rsrvd_fix_q(62 downto 0);
    exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b <= exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_in(62 downto 52);

    -- expAmExpB_uid393_modRes_uid20_block_rsrvd_fix(SUB,392)@18
    expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b);
    expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_b);
    expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_a) - UNSIGNED(expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_b));
    expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_q <= expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_o(11 downto 0);

    -- cWFP2_uid394_modRes_uid20_block_rsrvd_fix(CONSTANT,393)
    cWFP2_uid394_modRes_uid20_block_rsrvd_fix_q <= "110110";

    -- shiftedOut_uid396_modRes_uid20_block_rsrvd_fix(COMPARE,395)@18 + 1
    shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00000000" & cWFP2_uid394_modRes_uid20_block_rsrvd_fix_q);
    shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_q);
    shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_c(0) <= shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_o(13);

    -- iShiftedOut_uid400_modRes_uid20_block_rsrvd_fix(LOGICAL,399)@19
    iShiftedOut_uid400_modRes_uid20_block_rsrvd_fix_q <= not (shiftedOut_uid396_modRes_uid20_block_rsrvd_fix_c);

    -- zeroOutCst_uid832_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,831)
    zeroOutCst_uid832_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage3Idx1Rng1_uid827_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,826)@19
    rightShiftStage3Idx1Rng1_uid827_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 1);

    -- rightShiftStage3Idx1_uid829_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,828)@19
    rightShiftStage3Idx1_uid829_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= GND_q & rightShiftStage3Idx1Rng1_uid827_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage2Idx3Rng6_uid822_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,821)@19
    rightShiftStage2Idx3Rng6_uid822_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 6);

    -- rightShiftStage2Idx3_uid824_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,823)@19
    rightShiftStage2Idx3_uid824_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightBottomX_bottomExtension_uid720_pT3_uid552_invPolyEval_q & rightShiftStage2Idx3Rng6_uid822_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage2Idx2Rng4_uid819_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,818)@19
    rightShiftStage2Idx2Rng4_uid819_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 4);

    -- rightShiftStage2Idx2_uid821_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,820)@19
    rightShiftStage2Idx2_uid821_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= z4_uid76_q_uid7_block_rsrvd_fix_q & rightShiftStage2Idx2Rng4_uid819_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(CONSTANT,659)
    zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "00";

    -- rightShiftStage2Idx1Rng2_uid816_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,815)@19
    rightShiftStage2Idx1Rng2_uid816_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 2);

    -- rightShiftStage2Idx1_uid818_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,817)@19
    rightShiftStage2Idx1_uid818_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & rightShiftStage2Idx1Rng2_uid816_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage1Idx3Pad24_uid812_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,811)
    rightShiftStage1Idx3Pad24_uid812_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= "000000000000000000000000";

    -- rightShiftStage1Idx3Rng24_uid811_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,810)@19
    rightShiftStage1Idx3Rng24_uid811_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 24);

    -- rightShiftStage1Idx3_uid813_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,812)@19
    rightShiftStage1Idx3_uid813_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage1Idx3Pad24_uid812_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q & rightShiftStage1Idx3Rng24_uid811_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(CONSTANT,641)
    zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "0000000000000000";

    -- rightShiftStage1Idx2Rng16_uid808_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,807)@19
    rightShiftStage1Idx2Rng16_uid808_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 16);

    -- rightShiftStage1Idx2_uid810_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,809)@19
    rightShiftStage1Idx2_uid810_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & rightShiftStage1Idx2Rng16_uid808_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(CONSTANT,647)
    zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "00000000";

    -- rightShiftStage1Idx1Rng8_uid805_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,804)@19
    rightShiftStage1Idx1Rng8_uid805_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q(106 downto 8);

    -- rightShiftStage1Idx1_uid807_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,806)@19
    rightShiftStage1Idx1_uid807_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & rightShiftStage1Idx1Rng8_uid805_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage0Idx3Pad96_uid801_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,800)
    rightShiftStage0Idx3Pad96_uid801_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx3Rng96_uid800_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,799)@19
    rightShiftStage0Idx3Rng96_uid800_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q(106 downto 96);

    -- rightShiftStage0Idx3_uid802_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,801)@19
    rightShiftStage0Idx3_uid802_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0Idx3Pad96_uid801_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q & rightShiftStage0Idx3Rng96_uid800_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage0Idx2Pad64_uid798_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,797)
    rightShiftStage0Idx2Pad64_uid798_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- rightShiftStage0Idx2Rng64_uid797_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,796)@19
    rightShiftStage0Idx2Rng64_uid797_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q(106 downto 64);

    -- rightShiftStage0Idx2_uid799_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,798)@19
    rightShiftStage0Idx2_uid799_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0Idx2Pad64_uid798_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q & rightShiftStage0Idx2Rng64_uid797_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- rightShiftStage0Idx1Rng32_uid794_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITSELECT,793)@19
    rightShiftStage0Idx1Rng32_uid794_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q(106 downto 32);

    -- rightShiftStage0Idx1_uid796_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(BITJOIN,795)@19
    rightShiftStage0Idx1_uid796_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & rightShiftStage0Idx1Rng32_uid794_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b;

    -- excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix(LOGICAL,369)@18
    excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_b = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1(DELAY,952)
    redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q, xout => redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix(LOGICAL,376)@19
    InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q <= not (redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1_q);

    -- frac_bSig_uid369_modRes_uid20_block_rsrvd_fix(BITSELECT,368)@18
    frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_in <= bSig_uid350_modRes_uid20_block_rsrvd_fix_q(51 downto 0);
    frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_b <= frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_in(51 downto 0);

    -- fracBz_uid389_modRes_uid20_block_rsrvd_fix(MUX,388)@18 + 1
    fracBz_uid389_modRes_uid20_block_rsrvd_fix_s <= excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q;
    fracBz_uid389_modRes_uid20_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracBz_uid389_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (fracBz_uid389_modRes_uid20_block_rsrvd_fix_s) IS
                WHEN "0" => fracBz_uid389_modRes_uid20_block_rsrvd_fix_q <= frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_b;
                WHEN "1" => fracBz_uid389_modRes_uid20_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
                WHEN OTHERS => fracBz_uid389_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- oFracB_uid392_modRes_uid20_block_rsrvd_fix(BITJOIN,391)@19
    oFracB_uid392_modRes_uid20_block_rsrvd_fix_q <= InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q & fracBz_uid389_modRes_uid20_block_rsrvd_fix_q;

    -- padConst_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,396)
    padConst_uid397_modRes_uid20_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000000000";

    -- rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix(BITJOIN,397)@19
    rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q <= oFracB_uid392_modRes_uid20_block_rsrvd_fix_q & padConst_uid397_modRes_uid20_block_rsrvd_fix_q;

    -- rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,927)@18
    rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in <= expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_q(6 downto 0);
    rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in(6 downto 5);
    rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in(4 downto 3);
    rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d <= rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in(2 downto 1);
    rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e <= rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_in(0 downto 0);

    -- redist0_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b_1(DELAY,937)
    redist0_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b, xout => redist0_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b_1_q, clk => clk, aclr => areset );

    -- rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(MUX,803)@19
    rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s <= redist0_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_b_1_q;
    rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s, rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q, rightShiftStage0Idx1_uid796_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage0Idx2_uid799_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage0Idx3_uid802_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightPaddedIn_uid398_modRes_uid20_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0Idx1_uid796_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0Idx2_uid799_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0Idx3_uid802_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c_1(DELAY,938)
    redist1_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c, xout => redist1_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(MUX,814)@19
    rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s <= redist1_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_c_1_q;
    rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s, rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage1Idx1_uid807_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage1Idx2_uid810_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage1Idx3_uid813_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage0_uid804_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage1Idx1_uid807_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage1Idx2_uid810_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage1Idx3_uid813_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d_1(DELAY,939)
    redist2_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d_1 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d, xout => redist2_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d_1_q, clk => clk, aclr => areset );

    -- rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(MUX,825)@19
    rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s <= redist2_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_d_1_q;
    rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s, rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage2Idx1_uid818_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage2Idx2_uid821_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage2Idx3_uid824_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage1_uid815_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "01" => rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage2Idx1_uid818_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "10" => rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage2Idx2_uid821_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "11" => rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage2Idx3_uid824_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e_1(DELAY,940)
    redist3_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e, xout => redist3_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e_1_q, clk => clk, aclr => areset );

    -- rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(MUX,830)@19
    rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s <= redist3_rightShiftStageSel6Dto5_uid803_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_merged_bit_select_e_1_q;
    rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s, rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, rightShiftStage3Idx1_uid829_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage2_uid826_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "1" => rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage3Idx1_uid829_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid792_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(CONSTANT,791)
    wIntCst_uid792_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= "1101011";

    -- shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(COMPARE,792)@18 + 1
    shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid393_modRes_uid20_block_rsrvd_fix_q);
    shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000" & wIntCst_uid792_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q);
    shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_a) - UNSIGNED(shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_n(0) <= not (shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_o(13));

    -- r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix(MUX,832)@19
    r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s <= shiftedOut_uid793_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_n;
    r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s, rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q, zeroOutCst_uid832_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= rightShiftStage3_uid831_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN "1" => r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= zeroOutCst_uid832_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix(LOGICAL,400)@19
    alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((106 downto 1 => iShiftedOut_uid400_modRes_uid20_block_rsrvd_fix_q(0)) & iShiftedOut_uid400_modRes_uid20_block_rsrvd_fix_q));
    alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_q <= r_uid833_alignmentShifter_uid397_modRes_uid20_block_rsrvd_fix_q and alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_b;

    -- stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,928)@19
    stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_q(51 downto 0);
    stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= alignFracBPostShiftOut_uid401_modRes_uid20_block_rsrvd_fix_q(106 downto 52);

    -- fracBAddOp_uid413_modRes_uid20_block_rsrvd_fix(BITJOIN,412)@19
    fracBAddOp_uid413_modRes_uid20_block_rsrvd_fix_q <= GND_q & stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;

    -- fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix(LOGICAL,413)@19
    fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((55 downto 1 => effSub_uid385_modRes_uid20_block_rsrvd_fix_q(0)) & effSub_uid385_modRes_uid20_block_rsrvd_fix_q));
    fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_q <= fracBAddOp_uid413_modRes_uid20_block_rsrvd_fix_q xor fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_b;

    -- zocst_uid409_modRes_uid20_block_rsrvd_fix(CONSTANT,408)
    zocst_uid409_modRes_uid20_block_rsrvd_fix_q <= "01";

    -- frac_aSig_uid355_modRes_uid20_block_rsrvd_fix(BITSELECT,354)@18
    frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_in <= aSig_uid349_modRes_uid20_block_rsrvd_fix_q(51 downto 0);
    frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b <= frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_in(51 downto 0);

    -- redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1(DELAY,957)
    redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 52, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b, xout => redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid404_modRes_uid20_block_rsrvd_fix(LOGICAL,403)@19
    cmpEQ_stickyBits_cZwF_uid404_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN stickyBits_uid402_modRes_uid20_block_rsrvd_fix_merged_bit_select_b = paddingY_uid31_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- effSubInvSticky_uid407_modRes_uid20_block_rsrvd_fix(LOGICAL,406)@19
    effSubInvSticky_uid407_modRes_uid20_block_rsrvd_fix_q <= effSub_uid385_modRes_uid20_block_rsrvd_fix_q and cmpEQ_stickyBits_cZwF_uid404_modRes_uid20_block_rsrvd_fix_q;

    -- fracAAddOp_uid410_modRes_uid20_block_rsrvd_fix(BITJOIN,409)@19
    fracAAddOp_uid410_modRes_uid20_block_rsrvd_fix_q <= zocst_uid409_modRes_uid20_block_rsrvd_fix_q & redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1_q & GND_q & effSubInvSticky_uid407_modRes_uid20_block_rsrvd_fix_q;

    -- fracAddResult_uid415_modRes_uid20_block_rsrvd_fix(ADD,414)@19
    fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid410_modRes_uid20_block_rsrvd_fix_q);
    fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid414_modRes_uid20_block_rsrvd_fix_q);
    fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_a) + UNSIGNED(fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_b));
    fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_q <= fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_o(56 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix(BITSELECT,415)@19
    rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_in <= fracAddResult_uid415_modRes_uid20_block_rsrvd_fix_q(55 downto 0);
    rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b <= rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_in(55 downto 0);

    -- redist5_rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b_1(DELAY,942)
    redist5_rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b_1 : dspba_delay
    GENERIC MAP ( width => 56, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b, xout => redist5_rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b_1_q, clk => clk, aclr => areset );

    -- invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix(LOGICAL,404)@19 + 1
    invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_qi <= not (cmpEQ_stickyBits_cZwF_uid404_modRes_uid20_block_rsrvd_fix_q);
    invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_qi, xout => invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracGRS_uid417_modRes_uid20_block_rsrvd_fix(BITJOIN,416)@20
    fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q <= redist5_rangeFracAddResultMwfp3Dto0_uid416_modRes_uid20_block_rsrvd_fix_b_1_q & invCmpEQ_stickyBits_cZwF_uid405_modRes_uid20_block_rsrvd_fix_q;

    -- rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(BITSELECT,634)@20
    rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b <= fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q(56 downto 25);

    -- vCount_uid636_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,635)@20
    vCount_uid636_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b = zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(BITSELECT,637)@20
    vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_in <= fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q(24 downto 0);
    vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b <= vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_in(24 downto 0);

    -- mO_uid637_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(CONSTANT,636)
    mO_uid637_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1111111";

    -- cStage_uid639_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(BITJOIN,638)@20
    cStage_uid639_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b & mO_uid637_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(MUX,640)@20
    vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s <= vCount_uid636_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
    vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s, rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b, cStage_uid639_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid635_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b;
            WHEN "1" => vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= cStage_uid639_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,931)@20
    rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(31 downto 16);
    rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid641_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(15 downto 0);

    -- vCount_uid644_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,643)@20
    vCount_uid644_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b = zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(MUX,646)@20
    vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s <= vCount_uid644_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
    vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s, rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b, rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid643_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,932)@20
    rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(15 downto 8);
    rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid647_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(7 downto 0);

    -- vCount_uid650_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,649)@20
    vCount_uid650_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b = zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(MUX,652)@20
    vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s <= vCount_uid650_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
    vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s, rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b, rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid649_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,933)@20
    rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(7 downto 4);
    rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid653_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(3 downto 0);

    -- vCount_uid656_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,655)@20
    vCount_uid656_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b = z4_uid76_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(MUX,658)@20
    vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s <= vCount_uid656_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
    vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s, rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b, rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid655_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,934)@20
    rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(3 downto 2);
    rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= vStagei_uid659_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(1 downto 0);

    -- vCount_uid662_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,661)@20
    vCount_uid662_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b = zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(MUX,664)@20
    vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s <= vCount_uid662_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;
    vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s, rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b, rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "0" => vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_b;
            WHEN "1" => vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= rVStage_uid661_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid667_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(BITSELECT,666)@20
    rVStage_uid667_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b <= vStagei_uid665_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(1 downto 1);

    -- vCount_uid668_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(LOGICAL,667)@20
    vCount_uid668_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rVStage_uid667_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b = GND_q ELSE "0";

    -- r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix(BITJOIN,668)@20
    r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q <= vCount_uid636_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & vCount_uid644_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & vCount_uid650_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & vCount_uid656_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & vCount_uid662_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q & vCount_uid668_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- aMinusA_uid420_modRes_uid20_block_rsrvd_fix(LOGICAL,419)@20
    aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q = cAmA_uid419_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- invAMinusA_uid462_modRes_uid20_block_rsrvd_fix(LOGICAL,461)@20
    invAMinusA_uid462_modRes_uid20_block_rsrvd_fix_q <= not (aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q);

    -- redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2(DELAY,947)
    redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_1_q, xout => redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid371_modRes_uid20_block_rsrvd_fix(LOGICAL,370)@18 + 1
    expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_qi <= "1" WHEN exp_bSig_uid368_modRes_uid20_block_rsrvd_fix_b = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";
    expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_qi, xout => expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2(DELAY,951)
    redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q, xout => redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid376_modRes_uid20_block_rsrvd_fix(LOGICAL,375)@20
    invExpXIsMax_uid376_modRes_uid20_block_rsrvd_fix_q <= not (redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2_q);

    -- redist11_InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q_1(DELAY,948)
    redist11_InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q, xout => redist11_InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid378_modRes_uid20_block_rsrvd_fix(LOGICAL,377)@20
    excR_bSig_uid378_modRes_uid20_block_rsrvd_fix_q <= redist11_InvExpXIsZero_uid377_modRes_uid20_block_rsrvd_fix_q_1_q and invExpXIsMax_uid376_modRes_uid20_block_rsrvd_fix_q;

    -- redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2(DELAY,958)
    redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b, xout => redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- expXIsMax_uid357_modRes_uid20_block_rsrvd_fix(LOGICAL,356)@20
    expXIsMax_uid357_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2_q = cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- invExpXIsMax_uid362_modRes_uid20_block_rsrvd_fix(LOGICAL,361)@20
    invExpXIsMax_uid362_modRes_uid20_block_rsrvd_fix_q <= not (expXIsMax_uid357_modRes_uid20_block_rsrvd_fix_q);

    -- excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix(LOGICAL,355)@20
    excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2_q = cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q ELSE "0";

    -- InvExpXIsZero_uid363_modRes_uid20_block_rsrvd_fix(LOGICAL,362)@20
    InvExpXIsZero_uid363_modRes_uid20_block_rsrvd_fix_q <= not (excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q);

    -- excR_aSig_uid364_modRes_uid20_block_rsrvd_fix(LOGICAL,363)@20
    excR_aSig_uid364_modRes_uid20_block_rsrvd_fix_q <= InvExpXIsZero_uid363_modRes_uid20_block_rsrvd_fix_q and invExpXIsMax_uid362_modRes_uid20_block_rsrvd_fix_q;

    -- signRReg_uid463_modRes_uid20_block_rsrvd_fix(LOGICAL,462)@20
    signRReg_uid463_modRes_uid20_block_rsrvd_fix_q <= excR_aSig_uid364_modRes_uid20_block_rsrvd_fix_q and excR_bSig_uid378_modRes_uid20_block_rsrvd_fix_q and redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q and invAMinusA_uid462_modRes_uid20_block_rsrvd_fix_q;

    -- redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2(DELAY,945)
    redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist7_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_1_q, xout => redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2_q, clk => clk, aclr => areset );

    -- redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2(DELAY,953)
    redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_1_q, xout => redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid467_modRes_uid20_block_rsrvd_fix(LOGICAL,466)@20
    excAZBZSigASigB_uid467_modRes_uid20_block_rsrvd_fix_q <= excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q and redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2_q and redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q and redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2_q;

    -- excBZARSigA_uid468_modRes_uid20_block_rsrvd_fix(LOGICAL,467)@20
    excBZARSigA_uid468_modRes_uid20_block_rsrvd_fix_q <= redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2_q and excR_aSig_uid364_modRes_uid20_block_rsrvd_fix_q and redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q;

    -- signRZero_uid469_modRes_uid20_block_rsrvd_fix(LOGICAL,468)@20
    signRZero_uid469_modRes_uid20_block_rsrvd_fix_q <= excBZARSigA_uid468_modRes_uid20_block_rsrvd_fix_q or excAZBZSigASigB_uid467_modRes_uid20_block_rsrvd_fix_q;

    -- fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix(LOGICAL,371)@18 + 1
    fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_qi <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = frac_bSig_uid369_modRes_uid20_block_rsrvd_fix_b ELSE "0";
    fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_qi, xout => fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2(DELAY,950)
    redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q, xout => redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- excI_bSig_uid374_modRes_uid20_block_rsrvd_fix(LOGICAL,373)@20
    excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q <= redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2_q and redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2_q;

    -- sigBBInf_uid464_modRes_uid20_block_rsrvd_fix(LOGICAL,463)@20
    sigBBInf_uid464_modRes_uid20_block_rsrvd_fix_q <= redist8_sigB_uid384_modRes_uid20_block_rsrvd_fix_b_2_q and excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q;

    -- fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix(LOGICAL,357)@19 + 1
    fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_qi <= "1" WHEN paddingY_uid31_q_uid7_block_rsrvd_fix_q = redist20_frac_aSig_uid355_modRes_uid20_block_rsrvd_fix_b_1_q ELSE "0";
    fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_qi, xout => fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excI_aSig_uid360_modRes_uid20_block_rsrvd_fix(LOGICAL,359)@20
    excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q <= expXIsMax_uid357_modRes_uid20_block_rsrvd_fix_q and fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_q;

    -- sigAAInf_uid465_modRes_uid20_block_rsrvd_fix(LOGICAL,464)@20
    sigAAInf_uid465_modRes_uid20_block_rsrvd_fix_q <= redist10_sigA_uid383_modRes_uid20_block_rsrvd_fix_b_2_q and excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q;

    -- signRInf_uid466_modRes_uid20_block_rsrvd_fix(LOGICAL,465)@20
    signRInf_uid466_modRes_uid20_block_rsrvd_fix_q <= sigAAInf_uid465_modRes_uid20_block_rsrvd_fix_q or sigBBInf_uid464_modRes_uid20_block_rsrvd_fix_q;

    -- signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix(LOGICAL,469)@20 + 1
    signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_qi <= signRInf_uid466_modRes_uid20_block_rsrvd_fix_q or signRZero_uid469_modRes_uid20_block_rsrvd_fix_q or signRReg_uid463_modRes_uid20_block_rsrvd_fix_q;
    signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_qi, xout => signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid373_modRes_uid20_block_rsrvd_fix(LOGICAL,372)@20
    fracXIsNotZero_uid373_modRes_uid20_block_rsrvd_fix_q <= not (redist13_fracXIsZero_uid372_modRes_uid20_block_rsrvd_fix_q_2_q);

    -- excN_bSig_uid375_modRes_uid20_block_rsrvd_fix(LOGICAL,374)@20 + 1
    excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_qi <= redist14_expXIsMax_uid371_modRes_uid20_block_rsrvd_fix_q_2_q and fracXIsNotZero_uid373_modRes_uid20_block_rsrvd_fix_q;
    excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_qi, xout => excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid359_modRes_uid20_block_rsrvd_fix(LOGICAL,358)@20
    fracXIsNotZero_uid359_modRes_uid20_block_rsrvd_fix_q <= not (fracXIsZero_uid358_modRes_uid20_block_rsrvd_fix_q);

    -- excN_aSig_uid361_modRes_uid20_block_rsrvd_fix(LOGICAL,360)@20 + 1
    excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_qi <= expXIsMax_uid357_modRes_uid20_block_rsrvd_fix_q and fracXIsNotZero_uid359_modRes_uid20_block_rsrvd_fix_q;
    excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_qi, xout => excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- excRNaN2_uid457_modRes_uid20_block_rsrvd_fix(LOGICAL,456)@21
    excRNaN2_uid457_modRes_uid20_block_rsrvd_fix_q <= excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_q or excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_q;

    -- redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2(DELAY,943)
    redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid385_modRes_uid20_block_rsrvd_fix_q, xout => redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2_q, clk => clk, aclr => areset );

    -- redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1(DELAY,949)
    redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q, xout => redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1(DELAY,955)
    redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q, xout => redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid458_modRes_uid20_block_rsrvd_fix(LOGICAL,457)@21
    excAIBISub_uid458_modRes_uid20_block_rsrvd_fix_q <= redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1_q and redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1_q and redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2_q;

    -- excRNaN_uid459_modRes_uid20_block_rsrvd_fix(LOGICAL,458)@21
    excRNaN_uid459_modRes_uid20_block_rsrvd_fix_q <= excAIBISub_uid458_modRes_uid20_block_rsrvd_fix_q or excRNaN2_uid457_modRes_uid20_block_rsrvd_fix_q;

    -- invExcRNaN_uid471_modRes_uid20_block_rsrvd_fix(LOGICAL,470)@21
    invExcRNaN_uid471_modRes_uid20_block_rsrvd_fix_q <= not (excRNaN_uid459_modRes_uid20_block_rsrvd_fix_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid472_modRes_uid20_block_rsrvd_fix(LOGICAL,471)@21
    signRPostExc_uid472_modRes_uid20_block_rsrvd_fix_q <= invExcRNaN_uid471_modRes_uid20_block_rsrvd_fix_q and signRInfRZRReg_uid470_modRes_uid20_block_rsrvd_fix_q;

    -- cRBit_uid432_modRes_uid20_block_rsrvd_fix(CONSTANT,431)
    cRBit_uid432_modRes_uid20_block_rsrvd_fix_q <= "01000";

    -- leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,865)@20
    leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(53 downto 0);
    leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(53 downto 0);

    -- leftShiftStage2Idx3_uid867_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,866)@20
    leftShiftStage2Idx3_uid867_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx3Rng3_uid866_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & aboveLeftY_bottomExtension_uid751_pT4_uid558_invPolyEval_q;

    -- leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,862)@20
    leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(54 downto 0);
    leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(54 downto 0);

    -- leftShiftStage2Idx2_uid864_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,863)@20
    leftShiftStage2Idx2_uid864_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx2Rng2_uid863_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & zs_uid660_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,859)@20
    leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(55 downto 0);
    leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(55 downto 0);

    -- leftShiftStage2Idx1_uid861_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,860)@20
    leftShiftStage2Idx1_uid861_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx1Rng1_uid860_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & GND_q;

    -- leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,854)@20
    leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(44 downto 0);
    leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(44 downto 0);

    -- leftShiftStage1Idx3_uid856_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,855)@20
    leftShiftStage1Idx3_uid856_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx3Rng12_uid855_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & rightBottomX_bottomExtension_uid755_pT4_uid558_invPolyEval_q;

    -- leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,851)@20
    leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(48 downto 0);
    leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(48 downto 0);

    -- leftShiftStage1Idx2_uid853_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,852)@20
    leftShiftStage1Idx2_uid853_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx2Rng8_uid852_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & zs_uid648_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,848)@20
    leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(52 downto 0);
    leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(52 downto 0);

    -- leftShiftStage1Idx1_uid850_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,849)@20
    leftShiftStage1Idx1_uid850_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx1Rng4_uid849_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & z4_uid76_q_uid7_block_rsrvd_fix_q;

    -- leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,843)@20
    leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q(8 downto 0);
    leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(8 downto 0);

    -- leftShiftStage0Idx3Pad48_uid843_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(CONSTANT,842)
    leftShiftStage0Idx3Pad48_uid843_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= "000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx3_uid845_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,844)@20
    leftShiftStage0Idx3_uid845_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0Idx3Rng48_uid844_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & leftShiftStage0Idx3Pad48_uid843_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;

    -- leftShiftStage0Idx2_uid842_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,841)@20
    leftShiftStage0Idx2_uid842_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= vStage_uid638_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_b & zs_uid634_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITSELECT,837)@20
    leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in <= fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q(40 downto 0);
    leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_in(40 downto 0);

    -- leftShiftStage0Idx1_uid839_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(BITJOIN,838)@20
    leftShiftStage0Idx1_uid839_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0Idx1Rng16_uid838_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_b & zs_uid642_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q;

    -- leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(MUX,846)@20
    leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_b;
    leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s, fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q, leftShiftStage0Idx1_uid839_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q, leftShiftStage0Idx2_uid842_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q, leftShiftStage0Idx3_uid845_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= fracGRS_uid417_modRes_uid20_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0Idx1_uid839_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0Idx2_uid842_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0Idx3_uid845_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(MUX,857)@20
    leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_c;
    leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s, leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q, leftShiftStage1Idx1_uid850_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q, leftShiftStage1Idx2_uid853_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q, leftShiftStage1Idx3_uid856_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        CASE (leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage0_uid847_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN "01" => leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx1_uid850_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN "10" => leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx2_uid853_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN "11" => leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1Idx3_uid856_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
            WHEN OTHERS => leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select(BITSELECT,935)@20
    leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_b <= r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(5 downto 4);
    leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_c <= r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(3 downto 2);
    leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_d <= r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q(1 downto 0);

    -- leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix(MUX,868)@20 + 1
    leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s <= leftShiftStageSel5Dto4_uid846_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_merged_bit_select_d;
    leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_s) IS
                WHEN "00" => leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage1_uid858_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
                WHEN "01" => leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx1_uid861_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
                WHEN "10" => leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx2_uid864_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
                WHEN "11" => leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= leftShiftStage2Idx3_uid867_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q;
                WHEN OTHERS => leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- LSB_uid430_modRes_uid20_block_rsrvd_fix(BITSELECT,429)@21
    LSB_uid430_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(4 downto 0));
    LSB_uid430_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(LSB_uid430_modRes_uid20_block_rsrvd_fix_in(4 downto 4));

    -- Guard_uid429_modRes_uid20_block_rsrvd_fix(BITSELECT,428)@21
    Guard_uid429_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(3 downto 0));
    Guard_uid429_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Guard_uid429_modRes_uid20_block_rsrvd_fix_in(3 downto 3));

    -- Round_uid428_modRes_uid20_block_rsrvd_fix(BITSELECT,427)@21
    Round_uid428_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(2 downto 0));
    Round_uid428_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Round_uid428_modRes_uid20_block_rsrvd_fix_in(2 downto 2));

    -- Sticky1_uid427_modRes_uid20_block_rsrvd_fix(BITSELECT,426)@21
    Sticky1_uid427_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(1 downto 0));
    Sticky1_uid427_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Sticky1_uid427_modRes_uid20_block_rsrvd_fix_in(1 downto 1));

    -- Sticky0_uid426_modRes_uid20_block_rsrvd_fix(BITSELECT,425)@21
    Sticky0_uid426_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(0 downto 0));
    Sticky0_uid426_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(Sticky0_uid426_modRes_uid20_block_rsrvd_fix_in(0 downto 0));

    -- rndBitCond_uid431_modRes_uid20_block_rsrvd_fix(BITJOIN,430)@21
    rndBitCond_uid431_modRes_uid20_block_rsrvd_fix_q <= LSB_uid430_modRes_uid20_block_rsrvd_fix_b & Guard_uid429_modRes_uid20_block_rsrvd_fix_b & Round_uid428_modRes_uid20_block_rsrvd_fix_b & Sticky1_uid427_modRes_uid20_block_rsrvd_fix_b & Sticky0_uid426_modRes_uid20_block_rsrvd_fix_b;

    -- rBi_uid433_modRes_uid20_block_rsrvd_fix(LOGICAL,432)@21
    rBi_uid433_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rndBitCond_uid431_modRes_uid20_block_rsrvd_fix_q = cRBit_uid432_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- roundBit_uid434_modRes_uid20_block_rsrvd_fix(LOGICAL,433)@21
    roundBit_uid434_modRes_uid20_block_rsrvd_fix_q <= not (rBi_uid433_modRes_uid20_block_rsrvd_fix_q);

    -- oneCST_uid423_modRes_uid20_block_rsrvd_fix(CONSTANT,422)
    oneCST_uid423_modRes_uid20_block_rsrvd_fix_q <= "00000000001";

    -- expInc_uid424_modRes_uid20_block_rsrvd_fix(ADD,423)@20
    expInc_uid424_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & redist21_exp_aSig_uid354_modRes_uid20_block_rsrvd_fix_b_2_q);
    expInc_uid424_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0" & oneCST_uid423_modRes_uid20_block_rsrvd_fix_q);
    expInc_uid424_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid424_modRes_uid20_block_rsrvd_fix_a) + UNSIGNED(expInc_uid424_modRes_uid20_block_rsrvd_fix_b));
    expInc_uid424_modRes_uid20_block_rsrvd_fix_q <= expInc_uid424_modRes_uid20_block_rsrvd_fix_o(11 downto 0);

    -- expPostNorm_uid425_modRes_uid20_block_rsrvd_fix(SUB,424)@20 + 1
    expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expInc_uid424_modRes_uid20_block_rsrvd_fix_q);
    expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("0000000" & r_uid669_lzCountVal_uid418_modRes_uid20_block_rsrvd_fix_q);
    expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_a) - UNSIGNED(expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_b));
        END IF;
    END PROCESS;
    expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_q <= expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_o(12 downto 0);

    -- fracPostNorm_uid422_modRes_uid20_block_rsrvd_fix(BITSELECT,421)@21
    fracPostNorm_uid422_modRes_uid20_block_rsrvd_fix_b <= leftShiftStage2_uid869_fracPostNormExt_uid421_modRes_uid20_block_rsrvd_fix_q(56 downto 1);

    -- fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix(BITSELECT,434)@21
    fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_in <= fracPostNorm_uid422_modRes_uid20_block_rsrvd_fix_b(54 downto 0);
    fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_b <= fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_in(54 downto 2);

    -- expFracR_uid436_modRes_uid20_block_rsrvd_fix(BITJOIN,435)@21
    expFracR_uid436_modRes_uid20_block_rsrvd_fix_q <= expPostNorm_uid425_modRes_uid20_block_rsrvd_fix_q & fracPostNormRndRange_uid435_modRes_uid20_block_rsrvd_fix_b;

    -- rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix(ADD,436)@21
    rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_a <= STD_LOGIC_VECTOR("0" & expFracR_uid436_modRes_uid20_block_rsrvd_fix_q);
    rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000000000000000000000" & roundBit_uid434_modRes_uid20_block_rsrvd_fix_q);
    rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_a) + UNSIGNED(rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_b));
    rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q <= rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_o(66 downto 0);

    -- expRPreExc_uid450_modRes_uid20_block_rsrvd_fix(BITSELECT,449)@21
    expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_in <= rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q(63 downto 0);
    expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_b <= expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_in(63 downto 53);

    -- rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix(BITSELECT,441)@21
    rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_in <= rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q(65 downto 0);
    rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_b <= rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_in(65 downto 64);

    -- rOvfExtraBits_uid443_modRes_uid20_block_rsrvd_fix(LOGICAL,442)@21
    rOvfExtraBits_uid443_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rndExpFracOvfBits_uid442_modRes_uid20_block_rsrvd_fix_b = zocst_uid409_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- wEP2AllOwE_uid438_modRes_uid20_block_rsrvd_fix(CONSTANT,437)
    wEP2AllOwE_uid438_modRes_uid20_block_rsrvd_fix_q <= "0011111111111";

    -- rndExp_uid439_modRes_uid20_block_rsrvd_fix(BITSELECT,438)@21
    rndExp_uid439_modRes_uid20_block_rsrvd_fix_in <= rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q(65 downto 0);
    rndExp_uid439_modRes_uid20_block_rsrvd_fix_b <= rndExp_uid439_modRes_uid20_block_rsrvd_fix_in(65 downto 53);

    -- rOvfEQMax_uid440_modRes_uid20_block_rsrvd_fix(LOGICAL,439)@21
    rOvfEQMax_uid440_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rndExp_uid439_modRes_uid20_block_rsrvd_fix_b = wEP2AllOwE_uid438_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- rOvf_uid444_modRes_uid20_block_rsrvd_fix(LOGICAL,443)@21
    rOvf_uid444_modRes_uid20_block_rsrvd_fix_q <= rOvfEQMax_uid440_modRes_uid20_block_rsrvd_fix_q or rOvfExtraBits_uid443_modRes_uid20_block_rsrvd_fix_q;

    -- regInputs_uid451_modRes_uid20_block_rsrvd_fix(LOGICAL,450)@20 + 1
    regInputs_uid451_modRes_uid20_block_rsrvd_fix_qi <= excR_aSig_uid364_modRes_uid20_block_rsrvd_fix_q and excR_bSig_uid378_modRes_uid20_block_rsrvd_fix_q;
    regInputs_uid451_modRes_uid20_block_rsrvd_fix_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid451_modRes_uid20_block_rsrvd_fix_qi, xout => regInputs_uid451_modRes_uid20_block_rsrvd_fix_q, clk => clk, aclr => areset );

    -- rInfOvf_uid454_modRes_uid20_block_rsrvd_fix(LOGICAL,453)@21
    rInfOvf_uid454_modRes_uid20_block_rsrvd_fix_q <= regInputs_uid451_modRes_uid20_block_rsrvd_fix_q and rOvf_uid444_modRes_uid20_block_rsrvd_fix_q;

    -- excRInfVInC_uid455_modRes_uid20_block_rsrvd_fix(BITJOIN,454)@21
    excRInfVInC_uid455_modRes_uid20_block_rsrvd_fix_q <= rInfOvf_uid454_modRes_uid20_block_rsrvd_fix_q & excN_bSig_uid375_modRes_uid20_block_rsrvd_fix_q & excN_aSig_uid361_modRes_uid20_block_rsrvd_fix_q & redist12_excI_bSig_uid374_modRes_uid20_block_rsrvd_fix_q_1_q & redist18_excI_aSig_uid360_modRes_uid20_block_rsrvd_fix_q_1_q & redist6_effSub_uid385_modRes_uid20_block_rsrvd_fix_q_2_q;

    -- excRInf_uid456_modRes_uid20_block_rsrvd_fix(LOOKUP,455)@21
    excRInf_uid456_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (excRInfVInC_uid455_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid455_modRes_uid20_block_rsrvd_fix_q) IS
            WHEN "000000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "000001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "000010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "000011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "000100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "000101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "000110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "000111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "001111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "010111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "011111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "100001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "100111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "101111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "110111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111000" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111001" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111010" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111011" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111100" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111101" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111110" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "111111" => excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid456_modRes_uid20_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist4_aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q_1(DELAY,941)
    redist4_aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q, xout => redist4_aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix(BITSELECT,446)@21
    rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_in <= STD_LOGIC_VECTOR(rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q(65 downto 0));
    rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_in(65 downto 65));

    -- wEP2AllZ_uid445_modRes_uid20_block_rsrvd_fix(CONSTANT,444)
    wEP2AllZ_uid445_modRes_uid20_block_rsrvd_fix_q <= "0000000000000";

    -- rUdfEQMin_uid446_modRes_uid20_block_rsrvd_fix(LOGICAL,445)@21
    rUdfEQMin_uid446_modRes_uid20_block_rsrvd_fix_q <= "1" WHEN rndExp_uid439_modRes_uid20_block_rsrvd_fix_b = wEP2AllZ_uid445_modRes_uid20_block_rsrvd_fix_q ELSE "0";

    -- rUdf_uid448_modRes_uid20_block_rsrvd_fix(LOGICAL,447)@21
    rUdf_uid448_modRes_uid20_block_rsrvd_fix_q <= rUdfEQMin_uid446_modRes_uid20_block_rsrvd_fix_q or rUdfExtraBit_uid447_modRes_uid20_block_rsrvd_fix_b;

    -- redist17_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_3(DELAY,954)
    redist17_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist16_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_2_q, xout => redist17_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_3_q, clk => clk, aclr => areset );

    -- redist19_excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q_1(DELAY,956)
    redist19_excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q, xout => redist19_excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid452_modRes_uid20_block_rsrvd_fix(BITJOIN,451)@21
    excRZeroVInC_uid452_modRes_uid20_block_rsrvd_fix_q <= redist4_aMinusA_uid420_modRes_uid20_block_rsrvd_fix_q_1_q & rUdf_uid448_modRes_uid20_block_rsrvd_fix_q & regInputs_uid451_modRes_uid20_block_rsrvd_fix_q & redist17_excZ_bSig_uid350_uid370_modRes_uid20_block_rsrvd_fix_q_3_q & redist19_excZ_aSig_uid349_uid356_modRes_uid20_block_rsrvd_fix_q_1_q;

    -- excRZero_uid453_modRes_uid20_block_rsrvd_fix(LOOKUP,452)@21
    excRZero_uid453_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (excRZeroVInC_uid452_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid452_modRes_uid20_block_rsrvd_fix_q) IS
            WHEN "00000" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00001" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00010" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00011" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "00100" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00101" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00110" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "00111" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01000" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01001" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01010" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01011" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "01100" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "01101" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01110" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "01111" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10000" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10001" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10010" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10011" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "10100" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "10101" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10110" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "10111" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11000" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11001" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11010" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11011" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "11100" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "1";
            WHEN "11101" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11110" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN "11111" => excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid453_modRes_uid20_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid460_modRes_uid20_block_rsrvd_fix(BITJOIN,459)@21
    concExc_uid460_modRes_uid20_block_rsrvd_fix_q <= excRNaN_uid459_modRes_uid20_block_rsrvd_fix_q & excRInf_uid456_modRes_uid20_block_rsrvd_fix_q & excRZero_uid453_modRes_uid20_block_rsrvd_fix_q;

    -- excREnc_uid461_modRes_uid20_block_rsrvd_fix(LOOKUP,460)@21
    excREnc_uid461_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (concExc_uid460_modRes_uid20_block_rsrvd_fix_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid460_modRes_uid20_block_rsrvd_fix_q) IS
            WHEN "000" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "01";
            WHEN "001" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "00";
            WHEN "010" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "10";
            WHEN "011" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "10";
            WHEN "100" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "11";
            WHEN "101" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "11";
            WHEN "110" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "11";
            WHEN "111" => excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid461_modRes_uid20_block_rsrvd_fix_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid480_modRes_uid20_block_rsrvd_fix(MUX,479)@21
    expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_s <= excREnc_uid461_modRes_uid20_block_rsrvd_fix_q;
    expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_s, cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q, expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_b, cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q <= cstAllZWE_uid36_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q <= expRPreExc_uid450_modRes_uid20_block_rsrvd_fix_b;
            WHEN "10" => expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q <= cstAllOWE_uid34_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix(BITSELECT,448)@21
    fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_in <= rndExpFrac_uid437_modRes_uid20_block_rsrvd_fix_q(52 downto 0);
    fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_b <= fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_in(52 downto 1);

    -- fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix(MUX,475)@21
    fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_s <= excREnc_uid461_modRes_uid20_block_rsrvd_fix_q;
    fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_combproc: PROCESS (fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_s, paddingY_uid31_q_uid7_block_rsrvd_fix_q, fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_b, oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q)
    BEGIN
        CASE (fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_s) IS
            WHEN "00" => fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "01" => fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q <= fracRPreExc_uid449_modRes_uid20_block_rsrvd_fix_b;
            WHEN "10" => fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q <= paddingY_uid31_q_uid7_block_rsrvd_fix_q;
            WHEN "11" => fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q <= oneFracRPostExc2_uid150_q_uid7_block_rsrvd_fix_q;
            WHEN OTHERS => fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid481_modRes_uid20_block_rsrvd_fix(BITJOIN,480)@21
    R_uid481_modRes_uid20_block_rsrvd_fix_q <= signRPostExc_uid472_modRes_uid20_block_rsrvd_fix_q & expRPostExc_uid480_modRes_uid20_block_rsrvd_fix_q & fracRPostExc_uid476_modRes_uid20_block_rsrvd_fix_q;

    -- out_primWireOut(GPOUT,5)@21
    out_primWireOut <= R_uid481_modRes_uid20_block_rsrvd_fix_q;

END normal;
