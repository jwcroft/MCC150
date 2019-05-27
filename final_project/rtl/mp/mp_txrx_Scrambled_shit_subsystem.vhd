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

-- VHDL created from mp_txrx_Scrambled_shit_subsystem
-- VHDL created on Wed May 15 10:15:07 2019


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

entity mp_txrx_Scrambled_shit_subsystem is
    port (
        in_4_dv : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_dc : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_In1 : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_In2 : in std_logic_vector(11 downto 0);  -- sfix12
        out_5_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_Out1 : out std_logic_vector(11 downto 0);  -- sfix12
        out_2_Out2 : out std_logic_vector(11 downto 0);  -- sfix12
        out_3_pwr : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic
    );
end mp_txrx_Scrambled_shit_subsystem;

architecture normal of mp_txrx_Scrambled_shit_subsystem is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Mult1_Add_Mult2_merged_cma_reset : std_logic;
    type Mult1_Add_Mult2_merged_cma_a0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal Mult1_Add_Mult2_merged_cma_a0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve : boolean;
    attribute preserve of Mult1_Add_Mult2_merged_cma_a0 : signal is true;
    signal Mult1_Add_Mult2_merged_cma_c0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve of Mult1_Add_Mult2_merged_cma_c0 : signal is true;
    type Mult1_Add_Mult2_merged_cma_ptype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal Mult1_Add_Mult2_merged_cma_p : Mult1_Add_Mult2_merged_cma_ptype(0 to 1);
    type Mult1_Add_Mult2_merged_cma_utype is array(NATURAL range <>) of SIGNED(24 downto 0);
    signal Mult1_Add_Mult2_merged_cma_u : Mult1_Add_Mult2_merged_cma_utype(0 to 1);
    signal Mult1_Add_Mult2_merged_cma_w : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult1_Add_Mult2_merged_cma_x : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult1_Add_Mult2_merged_cma_y : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult1_Add_Mult2_merged_cma_s : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult1_Add_Mult2_merged_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult1_Add_Mult2_merged_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult1_Add_Mult2_merged_cma_ena0 : std_logic;
    signal Mult1_Add_Mult2_merged_cma_ena1 : std_logic;
    signal redist0_Mult1_Add_Mult2_merged_cma_q_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist1_ChannelIn_in_4_dv_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ChannelIn_in_3_dc_3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist3_ChannelIn_in_1_In1_3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist4_ChannelIn_in_2_In2_3_q : STD_LOGIC_VECTOR (11 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Mult1_Add_Mult2_merged_cma(CHAINMULTADD,8)@0 + 2
    Mult1_Add_Mult2_merged_cma_reset <= areset;
    Mult1_Add_Mult2_merged_cma_ena0 <= '1';
    Mult1_Add_Mult2_merged_cma_ena1 <= Mult1_Add_Mult2_merged_cma_ena0;
    Mult1_Add_Mult2_merged_cma_p(0) <= Mult1_Add_Mult2_merged_cma_a0(0) * Mult1_Add_Mult2_merged_cma_c0(0);
    Mult1_Add_Mult2_merged_cma_p(1) <= Mult1_Add_Mult2_merged_cma_a0(1) * Mult1_Add_Mult2_merged_cma_c0(1);
    Mult1_Add_Mult2_merged_cma_u(0) <= RESIZE(Mult1_Add_Mult2_merged_cma_p(0),25);
    Mult1_Add_Mult2_merged_cma_u(1) <= RESIZE(Mult1_Add_Mult2_merged_cma_p(1),25);
    Mult1_Add_Mult2_merged_cma_w(0) <= Mult1_Add_Mult2_merged_cma_u(0) + Mult1_Add_Mult2_merged_cma_u(1);
    Mult1_Add_Mult2_merged_cma_x(0) <= Mult1_Add_Mult2_merged_cma_w(0);
    Mult1_Add_Mult2_merged_cma_y(0) <= Mult1_Add_Mult2_merged_cma_x(0);
    Mult1_Add_Mult2_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult1_Add_Mult2_merged_cma_a0 <= (others => (others => '0'));
            Mult1_Add_Mult2_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult1_Add_Mult2_merged_cma_ena0 = '1') THEN
                Mult1_Add_Mult2_merged_cma_a0(0) <= RESIZE(SIGNED(in_2_In2),12);
                Mult1_Add_Mult2_merged_cma_a0(1) <= RESIZE(SIGNED(in_1_In1),12);
                Mult1_Add_Mult2_merged_cma_c0(0) <= RESIZE(SIGNED(in_2_In2),12);
                Mult1_Add_Mult2_merged_cma_c0(1) <= RESIZE(SIGNED(in_1_In1),12);
            END IF;
        END IF;
    END PROCESS;
    Mult1_Add_Mult2_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult1_Add_Mult2_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult1_Add_Mult2_merged_cma_ena1 = '1') THEN
                Mult1_Add_Mult2_merged_cma_s(0) <= Mult1_Add_Mult2_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    Mult1_Add_Mult2_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(Mult1_Add_Mult2_merged_cma_s(0)(24 downto 0)), xout => Mult1_Add_Mult2_merged_cma_qq, clk => clk, aclr => areset );
    Mult1_Add_Mult2_merged_cma_q <= STD_LOGIC_VECTOR(Mult1_Add_Mult2_merged_cma_qq(24 downto 0));

    -- redist0_Mult1_Add_Mult2_merged_cma_q_1(DELAY,9)
    redist0_Mult1_Add_Mult2_merged_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Mult1_Add_Mult2_merged_cma_q, xout => redist0_Mult1_Add_Mult2_merged_cma_q_1_q, clk => clk, aclr => areset );

    -- redist4_ChannelIn_in_2_In2_3(DELAY,13)
    redist4_ChannelIn_in_2_In2_3 : dspba_delay
    GENERIC MAP ( width => 12, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_2_In2, xout => redist4_ChannelIn_in_2_In2_3_q, clk => clk, aclr => areset );

    -- redist3_ChannelIn_in_1_In1_3(DELAY,12)
    redist3_ChannelIn_in_1_In1_3 : dspba_delay
    GENERIC MAP ( width => 12, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_1_In1, xout => redist3_ChannelIn_in_1_In1_3_q, clk => clk, aclr => areset );

    -- redist2_ChannelIn_in_3_dc_3(DELAY,11)
    redist2_ChannelIn_in_3_dc_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_3_dc, xout => redist2_ChannelIn_in_3_dc_3_q, clk => clk, aclr => areset );

    -- redist1_ChannelIn_in_4_dv_3(DELAY,10)
    redist1_ChannelIn_in_4_dv_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_4_dv, xout => redist1_ChannelIn_in_4_dv_3_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,4)@3 + 1
    out_5_qv <= redist1_ChannelIn_in_4_dv_3_q;
    out_4_qc <= redist2_ChannelIn_in_3_dc_3_q;
    out_1_Out1 <= redist3_ChannelIn_in_1_In1_3_q;
    out_2_Out2 <= redist4_ChannelIn_in_2_In2_3_q;
    out_3_pwr <= redist0_Mult1_Add_Mult2_merged_cma_q_1_q;

END normal;
