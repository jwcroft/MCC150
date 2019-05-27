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

-- VHDL created from final_project_txrx_fp_Decode_symbols_into_bitstream
-- VHDL created on Mon May 27 19:21:12 2019


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

USE work.final_project_txrx_fp_safe_path.all;
entity final_project_txrx_fp_Decode_symbols_into_bitstream is
    port (
        in_1_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_symbols_x : in std_logic_vector(62 downto 0);  -- sfix63_en47
        in_4_packet_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_memory_bitstream : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_v_bits : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_bits : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_out4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_out5 : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_Decode_symbols_into_bitstream;

architecture normal of final_project_txrx_fp_Decode_symbols_into_bitstream is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (2 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE1_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE1_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE1_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE1_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE3_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE3_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE3_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE3_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE4_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE4_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE4_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE4_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE5_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE5_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE5_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE5_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE6_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE6_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE6_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE6_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE7_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE7_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE7_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE7_n : STD_LOGIC_VECTOR (0 downto 0);
    signal CmpGE8_a : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE8_b : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE8_o : STD_LOGIC_VECTOR (68 downto 0);
    signal CmpGE8_n : STD_LOGIC_VECTOR (0 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Counter_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter_eq : std_logic;
    attribute preserve of Counter_eq : signal is true;
    signal Lut_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Mode_Meas10_x_q : STD_LOGIC_VECTOR (53 downto 0);
    signal Mode_Meas3_x_q : STD_LOGIC_VECTOR (51 downto 0);
    signal Mode_Meas4_x_q : STD_LOGIC_VECTOR (50 downto 0);
    signal Mode_Meas5_x_q : STD_LOGIC_VECTOR (51 downto 0);
    signal Mode_Meas6_x_q : STD_LOGIC_VECTOR (51 downto 0);
    signal Mode_Meas7_x_q : STD_LOGIC_VECTOR (52 downto 0);
    signal Mode_Meas8_x_q : STD_LOGIC_VECTOR (52 downto 0);
    signal Mode_Meas9_x_q : STD_LOGIC_VECTOR (52 downto 0);
    signal Mux_s : STD_LOGIC_VECTOR (1 downto 0);
    signal Mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal CmpGE_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE1_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE1_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE3_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE3_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE4_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE4_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE5_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE5_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE6_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE6_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE7_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE7_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE8_PreShift_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal CmpGE8_PreShift_0_qint : STD_LOGIC_VECTOR (66 downto 0);
    signal Add2_re_add_0_0_a : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_0_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_0_o : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_1_a : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_1_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_1_o : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_1_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_2_a : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_2_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_2_o : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_3_a : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_3_b : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_3_o : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_0_3_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Add2_re_add_1_0_a : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_0_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_0_o : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_1_a : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_1_b : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_1_o : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_1_1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Add2_re_add_2_0_a : STD_LOGIC_VECTOR (3 downto 0);
    signal Add2_re_add_2_0_b : STD_LOGIC_VECTOR (3 downto 0);
    signal Add2_re_add_2_0_o : STD_LOGIC_VECTOR (3 downto 0);
    signal Add2_re_add_2_0_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bit_0_x_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bit_0_x_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bit_0_x_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_Not_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ChannelIn_in_2_c_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Mode_Meas10_x(CONSTANT,44)
    Mode_Meas10_x_q <= "101010000000100100010000010110010001000101100010001011";

    -- CmpGE8_PreShift_0(BITSHIFT,65)@1
    CmpGE8_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE8_PreShift_0_q <= CmpGE8_PreShift_0_qint(66 downto 0);

    -- CmpGE8(COMPARE,36)@1
    CmpGE8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE8_PreShift_0_q(66)) & CmpGE8_PreShift_0_q));
    CmpGE8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 54 => Mode_Meas10_x_q(53)) & Mode_Meas10_x_q));
    CmpGE8_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE8_a) - SIGNED(CmpGE8_b));
    CmpGE8_n(0) <= not (CmpGE8_o(68));

    -- Mode_Meas9_x(CONSTANT,51)
    Mode_Meas9_x_q <= "10000010010101100001011101011010101010110001111010001";

    -- CmpGE7_PreShift_0(BITSHIFT,64)@1
    CmpGE7_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE7_PreShift_0_q <= CmpGE7_PreShift_0_qint(66 downto 0);

    -- CmpGE7(COMPARE,34)@1
    CmpGE7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE7_PreShift_0_q(66)) & CmpGE7_PreShift_0_q));
    CmpGE7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 53 => Mode_Meas9_x_q(52)) & Mode_Meas9_x_q));
    CmpGE7_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE7_a) - SIGNED(CmpGE7_b));
    CmpGE7_n(0) <= not (CmpGE7_o(68));

    -- Add2_re_add_0_3(ADD,69)@1
    Add2_re_add_0_3_a <= STD_LOGIC_VECTOR("0" & CmpGE7_n);
    Add2_re_add_0_3_b <= STD_LOGIC_VECTOR("0" & CmpGE8_n);
    Add2_re_add_0_3_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_0_3_a) + UNSIGNED(Add2_re_add_0_3_b));
    Add2_re_add_0_3_q <= Add2_re_add_0_3_o(1 downto 0);

    -- Mode_Meas8_x(CONSTANT,50)
    Mode_Meas8_x_q <= "10110100100110100000111000000011001100110111100010111";

    -- CmpGE6_PreShift_0(BITSHIFT,63)@1
    CmpGE6_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE6_PreShift_0_q <= CmpGE6_PreShift_0_qint(66 downto 0);

    -- CmpGE6(COMPARE,32)@1
    CmpGE6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE6_PreShift_0_q(66)) & CmpGE6_PreShift_0_q));
    CmpGE6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 53 => Mode_Meas8_x_q(52)) & Mode_Meas8_x_q));
    CmpGE6_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE6_a) - SIGNED(CmpGE6_b));
    CmpGE6_n(0) <= not (CmpGE6_o(68));

    -- Mode_Meas3_x(CONSTANT,45)
    Mode_Meas3_x_q <= "1100110110111100000010010101011101110111101001011101";

    -- CmpGE_PreShift_0(BITSHIFT,58)@1
    CmpGE_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE_PreShift_0_q <= CmpGE_PreShift_0_qint(66 downto 0);

    -- CmpGE(COMPARE,23)@1
    CmpGE_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE_PreShift_0_q(66)) & CmpGE_PreShift_0_q));
    CmpGE_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 52 => Mode_Meas3_x_q(51)) & Mode_Meas3_x_q));
    CmpGE_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE_a) - SIGNED(CmpGE_b));
    CmpGE_n(0) <= not (CmpGE_o(68));

    -- Add2_re_add_0_2(ADD,68)@1
    Add2_re_add_0_2_a <= STD_LOGIC_VECTOR("0" & CmpGE_n);
    Add2_re_add_0_2_b <= STD_LOGIC_VECTOR("0" & CmpGE6_n);
    Add2_re_add_0_2_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_0_2_a) + UNSIGNED(Add2_re_add_0_2_b));
    Add2_re_add_0_2_q <= Add2_re_add_0_2_o(1 downto 0);

    -- Add2_re_add_1_1(ADD,71)@1
    Add2_re_add_1_1_a <= STD_LOGIC_VECTOR("0" & Add2_re_add_0_2_q);
    Add2_re_add_1_1_b <= STD_LOGIC_VECTOR("0" & Add2_re_add_0_3_q);
    Add2_re_add_1_1_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_1_1_a) + UNSIGNED(Add2_re_add_1_1_b));
    Add2_re_add_1_1_q <= Add2_re_add_1_1_o(2 downto 0);

    -- Mode_Meas4_x(CONSTANT,46)
    Mode_Meas4_x_q <= "011001001000011111101101010100010001000010110100011";

    -- CmpGE1_PreShift_0(BITSHIFT,59)@1
    CmpGE1_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE1_PreShift_0_q <= CmpGE1_PreShift_0_qint(66 downto 0);

    -- CmpGE1(COMPARE,24)@1
    CmpGE1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE1_PreShift_0_q(66)) & CmpGE1_PreShift_0_q));
    CmpGE1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000000000000000000" & Mode_Meas4_x_q));
    CmpGE1_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE1_a) - SIGNED(CmpGE1_b));
    CmpGE1_n(0) <= not (CmpGE1_o(68));

    -- Mode_Meas5_x(CONSTANT,47)
    Mode_Meas5_x_q <= "1001011011001011111000111111100110011001000011101001";

    -- CmpGE3_PreShift_0(BITSHIFT,60)@1
    CmpGE3_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE3_PreShift_0_q <= CmpGE3_PreShift_0_qint(66 downto 0);

    -- CmpGE3(COMPARE,26)@1
    CmpGE3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE3_PreShift_0_q(66)) & CmpGE3_PreShift_0_q));
    CmpGE3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000" & Mode_Meas5_x_q));
    CmpGE3_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE3_a) - SIGNED(CmpGE3_b));
    CmpGE3_n(0) <= not (CmpGE3_o(68));

    -- Add2_re_add_0_1(ADD,67)@1
    Add2_re_add_0_1_a <= STD_LOGIC_VECTOR("0" & CmpGE3_n);
    Add2_re_add_0_1_b <= STD_LOGIC_VECTOR("0" & CmpGE1_n);
    Add2_re_add_0_1_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_0_1_a) + UNSIGNED(Add2_re_add_0_1_b));
    Add2_re_add_0_1_q <= Add2_re_add_0_1_o(1 downto 0);

    -- Mode_Meas6_x(CONSTANT,48)
    Mode_Meas6_x_q <= "1111101101010011110100010100101010101001110000101111";

    -- CmpGE4_PreShift_0(BITSHIFT,61)@1
    CmpGE4_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE4_PreShift_0_q <= CmpGE4_PreShift_0_qint(66 downto 0);

    -- CmpGE4(COMPARE,28)@1
    CmpGE4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE4_PreShift_0_q(66)) & CmpGE4_PreShift_0_q));
    CmpGE4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("00000000000000000" & Mode_Meas6_x_q));
    CmpGE4_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE4_a) - SIGNED(CmpGE4_b));
    CmpGE4_n(0) <= not (CmpGE4_o(68));

    -- Mode_Meas7_x(CONSTANT,49)
    Mode_Meas7_x_q <= "10101111111011011101111101001101110111010011101110101";

    -- CmpGE5_PreShift_0(BITSHIFT,62)@1
    CmpGE5_PreShift_0_qint <= in_3_symbols_x & "0000";
    CmpGE5_PreShift_0_q <= CmpGE5_PreShift_0_qint(66 downto 0);

    -- CmpGE5(COMPARE,30)@1
    CmpGE5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((68 downto 67 => CmpGE5_PreShift_0_q(66)) & CmpGE5_PreShift_0_q));
    CmpGE5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0000000000000000" & Mode_Meas7_x_q));
    CmpGE5_o <= STD_LOGIC_VECTOR(SIGNED(CmpGE5_a) - SIGNED(CmpGE5_b));
    CmpGE5_n(0) <= not (CmpGE5_o(68));

    -- Add2_re_add_0_0(ADD,66)@1
    Add2_re_add_0_0_a <= STD_LOGIC_VECTOR("0" & CmpGE5_n);
    Add2_re_add_0_0_b <= STD_LOGIC_VECTOR("0" & CmpGE4_n);
    Add2_re_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_0_0_a) + UNSIGNED(Add2_re_add_0_0_b));
    Add2_re_add_0_0_q <= Add2_re_add_0_0_o(1 downto 0);

    -- Add2_re_add_1_0(ADD,70)@1
    Add2_re_add_1_0_a <= STD_LOGIC_VECTOR("0" & Add2_re_add_0_0_q);
    Add2_re_add_1_0_b <= STD_LOGIC_VECTOR("0" & Add2_re_add_0_1_q);
    Add2_re_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_1_0_a) + UNSIGNED(Add2_re_add_1_0_b));
    Add2_re_add_1_0_q <= Add2_re_add_1_0_o(2 downto 0);

    -- Add2_re_add_2_0(ADD,72)@1
    Add2_re_add_2_0_a <= STD_LOGIC_VECTOR("0" & Add2_re_add_1_0_q);
    Add2_re_add_2_0_b <= STD_LOGIC_VECTOR("0" & Add2_re_add_1_1_q);
    Add2_re_add_2_0_o <= STD_LOGIC_VECTOR(UNSIGNED(Add2_re_add_2_0_a) + UNSIGNED(Add2_re_add_2_0_b));
    Add2_re_add_2_0_q <= Add2_re_add_2_0_o(3 downto 0);

    -- Lut(LOOKUP,43)@1
    Lut_combproc: PROCESS (Add2_re_add_2_0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (Add2_re_add_2_0_q) IS
            WHEN "0000" => Lut_q <= "110";
            WHEN "0001" => Lut_q <= "111";
            WHEN "0010" => Lut_q <= "011";
            WHEN "0011" => Lut_q <= "010";
            WHEN "0100" => Lut_q <= "000";
            WHEN "0101" => Lut_q <= "001";
            WHEN "0110" => Lut_q <= "101";
            WHEN "0111" => Lut_q <= "100";
            WHEN "1000" => Lut_q <= "110";
            WHEN OTHERS => Lut_q <= "110";
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x(MUX,15)@1 + 1
    final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_s <= in_1_v;
    final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q <= final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q <= Lut_q;
                WHEN OTHERS => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- bit_0_x_merged_bit_select(BITSELECT,81)@2
    bit_0_x_merged_bit_select_b <= final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q(0 downto 0);
    bit_0_x_merged_bit_select_c <= final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q(1 downto 1);
    bit_0_x_merged_bit_select_d <= final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L_Mux_x_q(2 downto 2);

    -- final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Not_x(LOGICAL,11)@1
    final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Not_x_q <= not (GND_q);

    -- final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Or_x(LOGICAL,12)@1
    final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Or_x_q <= redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1_q or in_1_v;

    -- final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x(LOGICAL,10)@1
    final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q <= final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Or_x_q and final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_Not_x_q;

    -- redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1(DELAY,85)
    redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q, xout => redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1_q, clk => clk, aclr => areset );

    -- Sequence_rsrvd_fix(SEQUENCE,54)@0 + 1
    Sequence_rsrvd_fix_clkproc: PROCESS (clk, areset)
        variable Sequence_rsrvd_fix_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence_rsrvd_fix_c := "00000";
            Sequence_rsrvd_fix_q <= "0";
            Sequence_rsrvd_fix_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q = "1") THEN
                IF (Sequence_rsrvd_fix_c = "11110") THEN
                    Sequence_rsrvd_fix_eq <= '1';
                ELSE
                    Sequence_rsrvd_fix_eq <= '0';
                END IF;
                IF (Sequence_rsrvd_fix_eq = '1') THEN
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c + 3;
                ELSE
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c - 1;
                END IF;
                Sequence_rsrvd_fix_q <= STD_LOGIC_VECTOR(Sequence_rsrvd_fix_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- Not_rsrvd_fix(LOGICAL,53)@1
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- And_rsrvd_fix(LOGICAL,20)@1
    And_rsrvd_fix_q <= Not_rsrvd_fix_q and redist3_final_project_txrx_fp_Decode_symbols_into_bitstream_SRlatch_And_x_q_1_q;

    -- Counter(COUNTER,42)@1 + 1
    -- low=0, high=2, step=1, init=0
    Counter_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter_i <= TO_UNSIGNED(0, 2);
            Counter_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (And_rsrvd_fix_q = "1") THEN
                IF (Counter_i = TO_UNSIGNED(1, 2)) THEN
                    Counter_eq <= '1';
                ELSE
                    Counter_eq <= '0';
                END IF;
                IF (Counter_eq = '1') THEN
                    Counter_i <= Counter_i + 2;
                ELSE
                    Counter_i <= Counter_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    Counter_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter_i, 2)));

    -- Mux(MUX,52)@2
    Mux_s <= Counter_q;
    Mux_combproc: PROCESS (Mux_s, bit_0_x_merged_bit_select_b, bit_0_x_merged_bit_select_c, bit_0_x_merged_bit_select_d)
    BEGIN
        CASE (Mux_s) IS
            WHEN "00" => Mux_q <= bit_0_x_merged_bit_select_b;
            WHEN "01" => Mux_q <= bit_0_x_merged_bit_select_c;
            WHEN "10" => Mux_q <= bit_0_x_merged_bit_select_d;
            WHEN OTHERS => Mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1(DELAY,84)
    redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q, xout => redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x(MUX,17)@2
    final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_s <= redist0_Not_rsrvd_fix_q_1_q;
    final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_combproc: PROCESS (final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_s, redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1_q, Mux_q)
    BEGIN
        CASE (final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q <= redist2_final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q <= Mux_q;
            WHEN OTHERS => final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist1_ChannelIn_in_2_c_1(DELAY,83)
    redist1_ChannelIn_in_2_c_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_2_c, xout => redist1_ChannelIn_in_2_c_1_q, clk => clk, aclr => areset );

    -- redist0_Not_rsrvd_fix_q_1(DELAY,82)
    redist0_Not_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not_rsrvd_fix_q, xout => redist0_Not_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,22)@2 + 1
    out_1_v_bits <= redist0_Not_rsrvd_fix_q_1_q;
    out_2_qc <= redist1_ChannelIn_in_2_c_1_q;
    out_3_bits <= final_project_txrx_fp_Decode_symbols_into_bitstream_latch_0L1_Mux_x_q;
    out_4_out4 <= GND_q;
    out_5_out5 <= GND_q;

END normal;
