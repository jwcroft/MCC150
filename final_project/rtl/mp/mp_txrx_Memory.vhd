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

-- VHDL created from mp_txrx_Memory
-- VHDL created on Wed May 22 14:10:30 2019


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

entity mp_txrx_Memory is
    port (
        in_1_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_trigger : in std_logic_vector(0 downto 0);  -- ufix1
        in_4_dc1 : in std_logic_vector(7 downto 0);  -- ufix8
        out_2_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_m2 : out std_logic_vector(1 downto 0);  -- sfix2
        out_5_qv1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_qc1 : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_m1 : out std_logic_vector(11 downto 0);  -- ufix12
        clk : in std_logic;
        areset : in std_logic
    );
end mp_txrx_Memory;

architecture normal of mp_txrx_Memory is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal And3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal And3_qi : STD_LOGIC_VECTOR (11 downto 0);
    signal And3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal Counter_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Counter_i : UNSIGNED (9 downto 0);
    attribute preserve : boolean;
    attribute preserve of Counter_i : signal is true;
    signal Counter1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal Counter1_i : UNSIGNED (9 downto 0);
    attribute preserve of Counter1_i : signal is true;
    signal DualMem_reset0 : std_logic;
    signal DualMem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal DualMem_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal DualMem_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal DualMem_iq : STD_LOGIC_VECTOR (11 downto 0);
    signal DualMem_q : STD_LOGIC_VECTOR (11 downto 0);
    signal DualMem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal DualMem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal Mapper_1_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal Not_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Not1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence_rsrvd_fix_eq : std_logic;
    signal Sequence1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Sequence1_eq : std_logic;
    signal redist0_Not_rsrvd_fix_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_ChannelIn1_in_3_trigger_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ChannelIn1_in_3_trigger_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_ChannelIn1_in_4_dc1_4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist4_ChannelIn_in_2_dc_5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist5_And1_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ChannelIn_in_2_dc_5_outputreg_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- Sequence_rsrvd_fix(SEQUENCE,20)@0 + 1
    Sequence_rsrvd_fix_clkproc: PROCESS (clk, areset)
        variable Sequence_rsrvd_fix_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence_rsrvd_fix_c := "00000000";
            Sequence_rsrvd_fix_q <= "0";
            Sequence_rsrvd_fix_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (in_1_dv = "1") THEN
                IF (Sequence_rsrvd_fix_c = "11011010") THEN
                    Sequence_rsrvd_fix_eq <= '1';
                ELSE
                    Sequence_rsrvd_fix_eq <= '0';
                END IF;
                IF (Sequence_rsrvd_fix_eq = '1') THEN
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c + 39;
                ELSE
                    Sequence_rsrvd_fix_c := Sequence_rsrvd_fix_c - 1;
                END IF;
                Sequence_rsrvd_fix_q <= STD_LOGIC_VECTOR(Sequence_rsrvd_fix_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- Not_rsrvd_fix(LOGICAL,17)@1
    Not_rsrvd_fix_q <= not (Sequence_rsrvd_fix_q);

    -- Counter(COUNTER,11)@1 + 1
    -- low=0, high=1023, step=1, init=0
    Counter_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter_i <= TO_UNSIGNED(0, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Not_rsrvd_fix_q = "1") THEN
                Counter_i <= Counter_i + 1;
            END IF;
        END IF;
    END PROCESS;
    Counter_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter_i, 10)));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Sequence1(SEQUENCE,21)@1 + 1
    Sequence1_clkproc: PROCESS (clk, areset)
        variable Sequence1_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            Sequence1_c := "11011101";
            Sequence1_q <= "1";
            Sequence1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (in_3_trigger = "1") THEN
                IF (Sequence1_c = "11011010") THEN
                    Sequence1_eq <= '1';
                ELSE
                    Sequence1_eq <= '0';
                END IF;
                IF (Sequence1_eq = '1') THEN
                    Sequence1_c := Sequence1_c + 39;
                ELSE
                    Sequence1_c := Sequence1_c - 1;
                END IF;
                Sequence1_q <= STD_LOGIC_VECTOR(Sequence1_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- Not1(LOGICAL,18)@2
    Not1_q <= not (Sequence1_q);

    -- redist1_ChannelIn1_in_3_trigger_1(DELAY,25)
    redist1_ChannelIn1_in_3_trigger_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_3_trigger, xout => redist1_ChannelIn1_in_3_trigger_1_q, clk => clk, aclr => areset );

    -- And1(LOGICAL,4)@2
    And1_q <= redist1_ChannelIn1_in_3_trigger_1_q and Not1_q;

    -- Counter1(COUNTER,12)@1 + 1
    -- low=0, high=1023, step=1, init=0
    Counter1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Counter1_i <= TO_UNSIGNED(0, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (And1_q = "1") THEN
                Counter1_i <= Counter1_i + 1;
            END IF;
        END IF;
    END PROCESS;
    Counter1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(Counter1_i, 10)));

    -- DualMem(DUALMEM,15)@2 + 2
    DualMem_aa <= Counter1_q;
    DualMem_ab <= Counter_q;
    DualMem_reset0 <= areset;
    DualMem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M10K",
        operation_mode => "BIDIR_DUAL_PORT",
        width_a => 12,
        widthad_a => 10,
        numwords_a => 1024,
        width_b => 12,
        widthad_b => 10,
        numwords_b => 1024,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/./rtl/mp/mp_txrx_Memory_DualMem.hex",
        init_file_layout => "PORT_B",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => DualMem_reset0,
        clock0 => clk,
        address_a => DualMem_aa,
        wren_a => '0',
        q_a => DualMem_ir,
        address_b => DualMem_ab,
        wren_b => '0',
        q_b => DualMem_iq
    );
    DualMem_q <= DualMem_iq(11 downto 0);
    DualMem_r <= DualMem_ir(11 downto 0);

    -- Mapper_1_x(LOOKUP,16)@4 + 1
    Mapper_1_x_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mapper_1_x_q <= "11";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (DualMem_q) IS
                WHEN "000000000000" => Mapper_1_x_q <= "11";
                WHEN "000000000001" => Mapper_1_x_q <= "01";
                WHEN OTHERS => Mapper_1_x_q <= "11";
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_ChannelIn_in_2_dc_5(DELAY,28)
    redist4_ChannelIn_in_2_dc_5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_2_dc, xout => redist4_ChannelIn_in_2_dc_5_q, clk => clk, aclr => areset );

    -- redist4_ChannelIn_in_2_dc_5_outputreg(DELAY,30)
    redist4_ChannelIn_in_2_dc_5_outputreg : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_ChannelIn_in_2_dc_5_q, xout => redist4_ChannelIn_in_2_dc_5_outputreg_q, clk => clk, aclr => areset );

    -- redist0_Not_rsrvd_fix_q_4(DELAY,24)
    redist0_Not_rsrvd_fix_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => Not_rsrvd_fix_q, xout => redist0_Not_rsrvd_fix_q_4_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,8)@5 + 1
    out_2_qv <= redist0_Not_rsrvd_fix_q_4_q;
    out_3_qc <= redist4_ChannelIn_in_2_dc_5_outputreg_q;
    out_1_m2 <= Mapper_1_x_q;

    -- redist2_ChannelIn1_in_3_trigger_3(DELAY,26)
    redist2_ChannelIn1_in_3_trigger_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist1_ChannelIn1_in_3_trigger_1_q, xout => redist2_ChannelIn1_in_3_trigger_3_q, clk => clk, aclr => areset );

    -- And3(LOGICAL,5)@4 + 1
    And3_b <= STD_LOGIC_VECTOR("00000000000" & redist2_ChannelIn1_in_3_trigger_3_q);
    And3_qi <= DualMem_r and And3_b;
    And3_delay : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => And3_qi, xout => And3_q, clk => clk, aclr => areset );

    -- redist3_ChannelIn1_in_4_dc1_4(DELAY,27)
    redist3_ChannelIn1_in_4_dc1_4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_4_dc1, xout => redist3_ChannelIn1_in_4_dc1_4_q, clk => clk, aclr => areset );

    -- redist5_And1_q_3(DELAY,29)
    redist5_And1_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => And1_q, xout => redist5_And1_q_3_q, clk => clk, aclr => areset );

    -- ChannelOut1(PORTOUT,9)@5 + 1
    out_5_qv1 <= redist5_And1_q_3_q;
    out_6_qc1 <= redist3_ChannelIn1_in_4_dc1_4_q;
    out_4_m1 <= And3_q;

END normal;
