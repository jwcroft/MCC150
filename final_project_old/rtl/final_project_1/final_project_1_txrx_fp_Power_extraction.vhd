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

-- VHDL created from final_project_1_txrx_fp_Power_extraction
-- VHDL created on Fri May 24 15:19:48 2019


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

entity final_project_1_txrx_fp_Power_extraction is
    port (
        in_7_v : in std_logic_vector(0 downto 0);  -- ufix1
        in_8_c : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_left_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_2_left_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_3_main_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_4_main_Q : in std_logic_vector(11 downto 0);  -- sfix12
        in_5_right_I : in std_logic_vector(11 downto 0);  -- sfix12
        in_6_right_Q : in std_logic_vector(11 downto 0);  -- sfix12
        out_1_qv : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_left_power : out std_logic_vector(24 downto 0);  -- sfix25
        out_4_main_power : out std_logic_vector(24 downto 0);  -- sfix25
        out_5_right_power : out std_logic_vector(24 downto 0);  -- sfix25
        clk : in std_logic;
        areset : in std_logic
    );
end final_project_1_txrx_fp_Power_extraction;

architecture normal of final_project_1_txrx_fp_Power_extraction is

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
    signal Mult3_Add1_Mult4_merged_cma_reset : std_logic;
    signal Mult3_Add1_Mult4_merged_cma_a0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve of Mult3_Add1_Mult4_merged_cma_a0 : signal is true;
    signal Mult3_Add1_Mult4_merged_cma_c0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve of Mult3_Add1_Mult4_merged_cma_c0 : signal is true;
    signal Mult3_Add1_Mult4_merged_cma_p : Mult1_Add_Mult2_merged_cma_ptype(0 to 1);
    signal Mult3_Add1_Mult4_merged_cma_u : Mult1_Add_Mult2_merged_cma_utype(0 to 1);
    signal Mult3_Add1_Mult4_merged_cma_w : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_x : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_y : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_s : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult3_Add1_Mult4_merged_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult3_Add1_Mult4_merged_cma_ena0 : std_logic;
    signal Mult3_Add1_Mult4_merged_cma_ena1 : std_logic;
    signal Mult5_Add2_Mult6_merged_cma_reset : std_logic;
    signal Mult5_Add2_Mult6_merged_cma_a0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve of Mult5_Add2_Mult6_merged_cma_a0 : signal is true;
    signal Mult5_Add2_Mult6_merged_cma_c0 : Mult1_Add_Mult2_merged_cma_a0type(0 to 1);
    attribute preserve of Mult5_Add2_Mult6_merged_cma_c0 : signal is true;
    signal Mult5_Add2_Mult6_merged_cma_p : Mult1_Add_Mult2_merged_cma_ptype(0 to 1);
    signal Mult5_Add2_Mult6_merged_cma_u : Mult1_Add_Mult2_merged_cma_utype(0 to 1);
    signal Mult5_Add2_Mult6_merged_cma_w : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult5_Add2_Mult6_merged_cma_x : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult5_Add2_Mult6_merged_cma_y : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult5_Add2_Mult6_merged_cma_s : Mult1_Add_Mult2_merged_cma_utype(0 to 0);
    signal Mult5_Add2_Mult6_merged_cma_qq : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult5_Add2_Mult6_merged_cma_q : STD_LOGIC_VECTOR (24 downto 0);
    signal Mult5_Add2_Mult6_merged_cma_ena0 : std_logic;
    signal Mult5_Add2_Mult6_merged_cma_ena1 : std_logic;
    signal redist0_Mult5_Add2_Mult6_merged_cma_q_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist1_Mult3_Add1_Mult4_merged_cma_q_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist2_Mult1_Add_Mult2_merged_cma_q_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist3_ChannelIn_in_7_v_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_ChannelIn_in_8_c_3_q : STD_LOGIC_VECTOR (7 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Mult3_Add1_Mult4_merged_cma(CHAINMULTADD,17)@0 + 2
    Mult3_Add1_Mult4_merged_cma_reset <= areset;
    Mult3_Add1_Mult4_merged_cma_ena0 <= '1';
    Mult3_Add1_Mult4_merged_cma_ena1 <= Mult3_Add1_Mult4_merged_cma_ena0;
    Mult3_Add1_Mult4_merged_cma_p(0) <= Mult3_Add1_Mult4_merged_cma_a0(0) * Mult3_Add1_Mult4_merged_cma_c0(0);
    Mult3_Add1_Mult4_merged_cma_p(1) <= Mult3_Add1_Mult4_merged_cma_a0(1) * Mult3_Add1_Mult4_merged_cma_c0(1);
    Mult3_Add1_Mult4_merged_cma_u(0) <= RESIZE(Mult3_Add1_Mult4_merged_cma_p(0),25);
    Mult3_Add1_Mult4_merged_cma_u(1) <= RESIZE(Mult3_Add1_Mult4_merged_cma_p(1),25);
    Mult3_Add1_Mult4_merged_cma_w(0) <= Mult3_Add1_Mult4_merged_cma_u(0) + Mult3_Add1_Mult4_merged_cma_u(1);
    Mult3_Add1_Mult4_merged_cma_x(0) <= Mult3_Add1_Mult4_merged_cma_w(0);
    Mult3_Add1_Mult4_merged_cma_y(0) <= Mult3_Add1_Mult4_merged_cma_x(0);
    Mult3_Add1_Mult4_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult3_Add1_Mult4_merged_cma_a0 <= (others => (others => '0'));
            Mult3_Add1_Mult4_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult3_Add1_Mult4_merged_cma_ena0 = '1') THEN
                Mult3_Add1_Mult4_merged_cma_a0(0) <= RESIZE(SIGNED(in_6_right_Q),12);
                Mult3_Add1_Mult4_merged_cma_a0(1) <= RESIZE(SIGNED(in_5_right_I),12);
                Mult3_Add1_Mult4_merged_cma_c0(0) <= RESIZE(SIGNED(in_6_right_Q),12);
                Mult3_Add1_Mult4_merged_cma_c0(1) <= RESIZE(SIGNED(in_5_right_I),12);
            END IF;
        END IF;
    END PROCESS;
    Mult3_Add1_Mult4_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult3_Add1_Mult4_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult3_Add1_Mult4_merged_cma_ena1 = '1') THEN
                Mult3_Add1_Mult4_merged_cma_s(0) <= Mult3_Add1_Mult4_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    Mult3_Add1_Mult4_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(Mult3_Add1_Mult4_merged_cma_s(0)(24 downto 0)), xout => Mult3_Add1_Mult4_merged_cma_qq, clk => clk, aclr => areset );
    Mult3_Add1_Mult4_merged_cma_q <= STD_LOGIC_VECTOR(Mult3_Add1_Mult4_merged_cma_qq(24 downto 0));

    -- redist1_Mult3_Add1_Mult4_merged_cma_q_1(DELAY,20)
    redist1_Mult3_Add1_Mult4_merged_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Mult3_Add1_Mult4_merged_cma_q, xout => redist1_Mult3_Add1_Mult4_merged_cma_q_1_q, clk => clk, aclr => areset );

    -- Mult1_Add_Mult2_merged_cma(CHAINMULTADD,16)@0 + 2
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
                Mult1_Add_Mult2_merged_cma_a0(0) <= RESIZE(SIGNED(in_4_main_Q),12);
                Mult1_Add_Mult2_merged_cma_a0(1) <= RESIZE(SIGNED(in_3_main_I),12);
                Mult1_Add_Mult2_merged_cma_c0(0) <= RESIZE(SIGNED(in_4_main_Q),12);
                Mult1_Add_Mult2_merged_cma_c0(1) <= RESIZE(SIGNED(in_3_main_I),12);
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

    -- redist2_Mult1_Add_Mult2_merged_cma_q_1(DELAY,21)
    redist2_Mult1_Add_Mult2_merged_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Mult1_Add_Mult2_merged_cma_q, xout => redist2_Mult1_Add_Mult2_merged_cma_q_1_q, clk => clk, aclr => areset );

    -- Mult5_Add2_Mult6_merged_cma(CHAINMULTADD,18)@0 + 2
    Mult5_Add2_Mult6_merged_cma_reset <= areset;
    Mult5_Add2_Mult6_merged_cma_ena0 <= '1';
    Mult5_Add2_Mult6_merged_cma_ena1 <= Mult5_Add2_Mult6_merged_cma_ena0;
    Mult5_Add2_Mult6_merged_cma_p(0) <= Mult5_Add2_Mult6_merged_cma_a0(0) * Mult5_Add2_Mult6_merged_cma_c0(0);
    Mult5_Add2_Mult6_merged_cma_p(1) <= Mult5_Add2_Mult6_merged_cma_a0(1) * Mult5_Add2_Mult6_merged_cma_c0(1);
    Mult5_Add2_Mult6_merged_cma_u(0) <= RESIZE(Mult5_Add2_Mult6_merged_cma_p(0),25);
    Mult5_Add2_Mult6_merged_cma_u(1) <= RESIZE(Mult5_Add2_Mult6_merged_cma_p(1),25);
    Mult5_Add2_Mult6_merged_cma_w(0) <= Mult5_Add2_Mult6_merged_cma_u(0) + Mult5_Add2_Mult6_merged_cma_u(1);
    Mult5_Add2_Mult6_merged_cma_x(0) <= Mult5_Add2_Mult6_merged_cma_w(0);
    Mult5_Add2_Mult6_merged_cma_y(0) <= Mult5_Add2_Mult6_merged_cma_x(0);
    Mult5_Add2_Mult6_merged_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult5_Add2_Mult6_merged_cma_a0 <= (others => (others => '0'));
            Mult5_Add2_Mult6_merged_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult5_Add2_Mult6_merged_cma_ena0 = '1') THEN
                Mult5_Add2_Mult6_merged_cma_a0(0) <= RESIZE(SIGNED(in_2_left_Q),12);
                Mult5_Add2_Mult6_merged_cma_a0(1) <= RESIZE(SIGNED(in_1_left_I),12);
                Mult5_Add2_Mult6_merged_cma_c0(0) <= RESIZE(SIGNED(in_2_left_Q),12);
                Mult5_Add2_Mult6_merged_cma_c0(1) <= RESIZE(SIGNED(in_1_left_I),12);
            END IF;
        END IF;
    END PROCESS;
    Mult5_Add2_Mult6_merged_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Mult5_Add2_Mult6_merged_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (Mult5_Add2_Mult6_merged_cma_ena1 = '1') THEN
                Mult5_Add2_Mult6_merged_cma_s(0) <= Mult5_Add2_Mult6_merged_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    Mult5_Add2_Mult6_merged_cma_delay : dspba_delay
    GENERIC MAP ( width => 25, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(Mult5_Add2_Mult6_merged_cma_s(0)(24 downto 0)), xout => Mult5_Add2_Mult6_merged_cma_qq, clk => clk, aclr => areset );
    Mult5_Add2_Mult6_merged_cma_q <= STD_LOGIC_VECTOR(Mult5_Add2_Mult6_merged_cma_qq(24 downto 0));

    -- redist0_Mult5_Add2_Mult6_merged_cma_q_1(DELAY,19)
    redist0_Mult5_Add2_Mult6_merged_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => Mult5_Add2_Mult6_merged_cma_q, xout => redist0_Mult5_Add2_Mult6_merged_cma_q_1_q, clk => clk, aclr => areset );

    -- redist4_ChannelIn_in_8_c_3(DELAY,23)
    redist4_ChannelIn_in_8_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_8_c, xout => redist4_ChannelIn_in_8_c_3_q, clk => clk, aclr => areset );

    -- redist3_ChannelIn_in_7_v_3(DELAY,22)
    redist3_ChannelIn_in_7_v_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => in_7_v, xout => redist3_ChannelIn_in_7_v_3_q, clk => clk, aclr => areset );

    -- ChannelOut(PORTOUT,6)@3 + 1
    out_1_qv <= redist3_ChannelIn_in_7_v_3_q;
    out_2_qc <= redist4_ChannelIn_in_8_c_3_q;
    out_3_left_power <= redist0_Mult5_Add2_Mult6_merged_cma_q_1_q;
    out_4_main_power <= redist2_Mult1_Add_Mult2_merged_cma_q_1_q;
    out_5_right_power <= redist1_Mult3_Add1_Mult4_merged_cma_q_1_q;

END normal;
