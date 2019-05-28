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

-- VHDL created from final_project_txrx_fp_8_PSK_Mapper
-- VHDL created on Tue May 28 09:12:41 2019


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

entity final_project_txrx_fp_8_PSK_Mapper is
    port (
        in_2_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_bit_stream : in std_logic_vector(0 downto 0);  -- ufix1
        out_3_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_symbol_I : out std_logic_vector(11 downto 0);  -- sfix12
        out_2_symbol_Q : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_txrx_fp_8_PSK_Mapper;

architecture normal of final_project_txrx_fp_8_PSK_Mapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_SRlatch_Not_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_SRlatch_Or_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q : STD_LOGIC_VECTOR (11 downto 0);
    signal And_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal BitCombine1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal Mapper_I_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Mapper_Q_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal redist0_ChannelIn_in_3_dc_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_ChannelIn_in_1_bit_stream_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_And_rsrvd_fix_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist1_ChannelIn_in_1_bit_stream_1(DELAY,30)
    redist1_ChannelIn_in_1_bit_stream_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_1_bit_stream, xout => redist1_ChannelIn_in_1_bit_stream_1_q, clk => clk, aclr => areset );

    -- redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1(DELAY,33)
    redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q, xout => redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x(MUX,7)@1
    final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_s <= in_2_dv;
    final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_combproc: PROCESS (final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_s, redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q, redist1_ChannelIn_in_1_bit_stream_1_q)
    BEGIN
        CASE (final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q <= redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q <= redist1_ChannelIn_in_1_bit_stream_1_q;
            WHEN OTHERS => final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1(DELAY,32)
    redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q, xout => redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1_q, clk => clk, aclr => areset );

    -- final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x(MUX,11)@1
    final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_s <= in_2_dv;
    final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_combproc: PROCESS (final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_s, redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1_q, redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q)
    BEGIN
        CASE (final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_s) IS
            WHEN "0" => final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q <= redist3_final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q_1_q;
            WHEN "1" => final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q <= redist4_final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q_1_q;
            WHEN OTHERS => final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- BitCombine1(BITJOIN,18)@1
    BitCombine1_q <= in_1_bit_stream & final_project_txrx_fp_8_PSK_Mapper_latch_0L_Mux_x_q & final_project_txrx_fp_8_PSK_Mapper_latch_0L2_Mux_x_q;

    -- Mapper_Q(LOOKUP,23)@1
    Mapper_Q_combproc: PROCESS (BitCombine1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (BitCombine1_q) IS
            WHEN "000" => Mapper_Q_q <= "000000000000";
            WHEN "001" => Mapper_Q_q <= "010110101000";
            WHEN "010" => Mapper_Q_q <= "101001011000";
            WHEN "011" => Mapper_Q_q <= "100000000000";
            WHEN "100" => Mapper_Q_q <= "010110101000";
            WHEN "101" => Mapper_Q_q <= "011111111111";
            WHEN "110" => Mapper_Q_q <= "000000000000";
            WHEN "111" => Mapper_Q_q <= "101001011000";
            WHEN OTHERS => -- unreachable
                           Mapper_Q_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- final_project_txrx_fp_8_PSK_Mapper_SRlatch_Not_x(LOGICAL,3)@1
    final_project_txrx_fp_8_PSK_Mapper_SRlatch_Not_x_q <= not (GND_q);

    -- final_project_txrx_fp_8_PSK_Mapper_SRlatch_Or_x(LOGICAL,4)@1
    final_project_txrx_fp_8_PSK_Mapper_SRlatch_Or_x_q <= redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1_q or in_2_dv;

    -- final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x(LOGICAL,2)@1
    final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q <= final_project_txrx_fp_8_PSK_Mapper_SRlatch_Or_x_q and final_project_txrx_fp_8_PSK_Mapper_SRlatch_Not_x_q;

    -- Sequence_rsrvd_fix(SEQUENCE,28)@0 + 1
    Sequence_rsrvd_fix_clkproc: PROCESS (clk, areset)
        variable Sequence_rsrvd_fix_c : SIGNED(5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence_rsrvd_fix_c := "000000";
            Sequence_rsrvd_fix_q <= "0";
            Sequence_rsrvd_fix_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q = "1") THEN
                IF (Sequence_rsrvd_fix_c = "110110") THEN
                    Sequence_rsrvd_fix_eq <= '1';
                ELSE
                    Sequence_rsrvd_fix_eq <= '0';
                END IF;
                IF (Sequence_rsrvd_fix_eq = '1') THEN
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c + 11;
                ELSE
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c - 1;
                END IF;
                Sequence_rsrvd_fix_q <= STD_LOGIC_VECTOR(Sequence_rsrvd_fix_c(5 downto 5));
            END IF;
        END IF;
    END PROCESS;

    -- Not_rsrvd_fix(LOGICAL,24)@1
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1(DELAY,34)
    redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q, xout => redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1_q, clk => clk, aclr => areset );

    -- And_rsrvd_fix(LOGICAL,17)@1
    And_rsrvd_fix_q <= redist5_final_project_txrx_fp_8_PSK_Mapper_SRlatch_And_x_q_1_q and Not_rsrvd_fix_q;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x(MUX,15)@1 + 1
    final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_s <= And_rsrvd_fix_q;
    final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q <= final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q <= Mapper_Q_q;
                WHEN OTHERS => final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Mapper_I(LOOKUP,22)@1
    Mapper_I_combproc: PROCESS (BitCombine1_q)
    BEGIN
        -- Begin reserved scope level
        CASE (BitCombine1_q) IS
            WHEN "000" => Mapper_I_q <= "011111111111";
            WHEN "001" => Mapper_I_q <= "010110101000";
            WHEN "010" => Mapper_I_q <= "010110101000";
            WHEN "011" => Mapper_I_q <= "000000000000";
            WHEN "100" => Mapper_I_q <= "101001011000";
            WHEN "101" => Mapper_I_q <= "000000000000";
            WHEN "110" => Mapper_I_q <= "100000000000";
            WHEN "111" => Mapper_I_q <= "101001011000";
            WHEN OTHERS => -- unreachable
                           Mapper_I_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x(MUX,13)@1 + 1
    final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_s <= And_rsrvd_fix_q;
    final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_s) IS
                WHEN "0" => final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q <= final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q;
                WHEN "1" => final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q <= Mapper_I_q;
                WHEN OTHERS => final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- redist0_ChannelIn_in_3_dc_1(DELAY,29)
    redist0_ChannelIn_in_3_dc_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_3_dc, xout => redist0_ChannelIn_in_3_dc_1_q, clk => clk, aclr => areset );

    -- redist2_And_rsrvd_fix_q_1(DELAY,31)
    redist2_And_rsrvd_fix_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => And_rsrvd_fix_q, xout => redist2_And_rsrvd_fix_q_1_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,20)@2 + 1
    out_3_qv <= redist2_And_rsrvd_fix_q_1_q;
    out_4_qc <= redist0_ChannelIn_in_3_dc_1_q;
    out_1_symbol_I <= final_project_txrx_fp_8_PSK_Mapper_latch_0L3_Mux_x_q;
    out_2_symbol_Q <= final_project_txrx_fp_8_PSK_Mapper_latch_0L4_Mux_x_q;

END normal;
