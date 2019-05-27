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

-- VHDL created from final_project_txrx_fp_SingleRateFIR_I
-- VHDL created on Fri May 24 15:27:34 2019


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

entity final_project_txrx_fp_SingleRateFIR_I is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(11 downto 0);  -- sfix12
        busIn_writedata : in std_logic_vector(15 downto 0);  -- sfix16
        busIn_address : in std_logic_vector(9 downto 0);  -- sfix10
        busIn_write : in std_logic_vector(0 downto 0);  -- sfix1
        busIn_read : in std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- sfix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(27 downto 0);  -- sfix28
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end final_project_txrx_fp_SingleRateFIR_I;

architecture normal of final_project_txrx_fp_SingleRateFIR_I is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_read_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_busIn_writedata_11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rblookup_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rblookup_h : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_e : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_c : STD_LOGIC_VECTOR (0 downto 0);
    signal d_rblookup_h_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rm_reset0 : std_logic;
    signal rm_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal rm_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal rm_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal rm_iq : STD_LOGIC_VECTOR (9 downto 0);
    signal rm_q : STD_LOGIC_VECTOR (9 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_dec0_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec0_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec1_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec1_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec2_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec3_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec3_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec4_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec5_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec5_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec6_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec6_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec7_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec7_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec8_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec8_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec9_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec9_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec10_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec10_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec11_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec11_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec12_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec12_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec13_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec13_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm13_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec14_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec14_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec15_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec15_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec16_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec16_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec17_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec17_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec18_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec18_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec19_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec19_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec20_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec20_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec21_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec21_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm21_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec22_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec22_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm22_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec23_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec23_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm23_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec24_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec24_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm24_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec25_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec25_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm25_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec26_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec26_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm26_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec27_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec27_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm27_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec28_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec28_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm28_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec29_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec29_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm29_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_dec30_e : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_dec30_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm30_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    signal u0_m0_wo0_cma0_b0 : u0_m0_wo0_cma0_a0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_b0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of SIGNED(10 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 31);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    signal u0_m0_wo0_cma0_d : u0_m0_wo0_cma0_a0type(0 to 30);
    attribute preserve of u0_m0_wo0_cma0_d : signal is true;
    type u0_m0_wo0_cma0_ltype is array(NATURAL range <>) of SIGNED(12 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_ltype(0 to 31);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(23 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 31);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 31);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rblookup_read_hit_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rmPad_sel_b : STD_LOGIC_VECTOR (15 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- d_busIn_writedata_11(DELAY,224)@10 + 1
    d_busIn_writedata_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_writedata, xout => d_busIn_writedata_11_q, clk => clk, aclr => h_areset );

    -- rblookup(LOOKUP,4)@10 + 1
    rblookup_c <= STD_LOGIC_VECTOR(busIn_write);
    rblookup_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_q <= "00000";
            rblookup_h <= "0";
            rblookup_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => rblookup_q <= (others => '-');
                               rblookup_h <= "0";
                               rblookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- rm(DUALMEM,7)@11 + 2
    rm_ia <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
    rm_aa <= rblookup_q;
    rm_ab <= rblookup_q;
    rm_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 10,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 10,
        widthad_b => 5,
        numwords_b => 31,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "C:/git_projects/MCC150/final_project/./rtl/final_project/final_project_txrx_fp_SingleRateFIR_I_rm.hex",
        init_file_layout => "PORT_B",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => rm_aa,
        data_a => rm_ia,
        wren_a => rblookup_e(0),
        address_b => rm_ab,
        q_b => rm_iq
    );
    rm_q <= rm_iq(9 downto 0);

    -- rmPad_sel(BITSELECT,222)@13
    rmPad_sel_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(rm_q(9 downto 0)), 16)));

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_busIn_read_12(DELAY,225)@10 + 2
    d_busIn_read_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_read, xout => d_busIn_read_12_q, clk => clk, aclr => h_areset );

    -- d_rblookup_h_12(DELAY,226)@11 + 1
    d_rblookup_h_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rblookup_h, xout => d_rblookup_h_12_q, clk => clk, aclr => h_areset );

    -- rblookup_read_hit(LOGICAL,5)@12
    rblookup_read_hit_q <= d_rblookup_h_12_q and d_busIn_read_12_q;

    -- rblookup_valid(REG,6)@12 + 1
    rblookup_valid_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            rblookup_valid_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            rblookup_valid_q <= STD_LOGIC_VECTOR(rblookup_read_hit_q);
        END IF;
    END PROCESS;

    -- busOut(BUSOUT,9)@13
    busOut_readdatavalid <= rblookup_valid_q;
    busOut_readdata <= rmPad_sel_b;

    -- u0_m0_wo0_dec30(LOOKUP,181)@10 + 1
    u0_m0_wo0_dec30_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec30_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec30_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec30_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm30(REG,182)@11 + 1
    u0_m0_wo0_cm30_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm30_q <= "0101101000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec30_e = "1") THEN
                u0_m0_wo0_cm30_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec29(LOOKUP,178)@10 + 1
    u0_m0_wo0_dec29_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec29_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec29_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec29_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm29(REG,179)@11 + 1
    u0_m0_wo0_cm29_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm29_q <= "0101100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec29_e = "1") THEN
                u0_m0_wo0_cm29_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr32(DELAY,58)@10
    u0_m0_wo0_wi0_r0_delayr32 : dspba_delay
    GENERIC MAP ( width => 12, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_dec28(LOOKUP,175)@10 + 1
    u0_m0_wo0_dec28_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec28_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec28_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec28_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm28(REG,176)@11 + 1
    u0_m0_wo0_cm28_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm28_q <= "0101001010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec28_e = "1") THEN
                u0_m0_wo0_cm28_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec27(LOOKUP,172)@10 + 1
    u0_m0_wo0_dec27_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec27_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec27_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec27_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm27(REG,173)@11 + 1
    u0_m0_wo0_cm27_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm27_q <= "0100100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec27_e = "1") THEN
                u0_m0_wo0_cm27_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec26(LOOKUP,169)@10 + 1
    u0_m0_wo0_dec26_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec26_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec26_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec26_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm26(REG,170)@11 + 1
    u0_m0_wo0_cm26_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm26_q <= "0011111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec26_e = "1") THEN
                u0_m0_wo0_cm26_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec25(LOOKUP,166)@10 + 1
    u0_m0_wo0_dec25_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec25_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec25_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec25_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm25(REG,167)@11 + 1
    u0_m0_wo0_cm25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm25_q <= "0011000111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec25_e = "1") THEN
                u0_m0_wo0_cm25_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec24(LOOKUP,163)@10 + 1
    u0_m0_wo0_dec24_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec24_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec24_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec24_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm24(REG,164)@11 + 1
    u0_m0_wo0_cm24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm24_q <= "0010010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec24_e = "1") THEN
                u0_m0_wo0_cm24_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec23(LOOKUP,160)@10 + 1
    u0_m0_wo0_dec23_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec23_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec23_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec23_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm23(REG,161)@11 + 1
    u0_m0_wo0_cm23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm23_q <= "0001100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec23_e = "1") THEN
                u0_m0_wo0_cm23_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec22(LOOKUP,157)@10 + 1
    u0_m0_wo0_dec22_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec22_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec22_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec22_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm22(REG,158)@11 + 1
    u0_m0_wo0_cm22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm22_q <= "0000110100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec22_e = "1") THEN
                u0_m0_wo0_cm22_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec21(LOOKUP,154)@10 + 1
    u0_m0_wo0_dec21_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec21_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec21_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec21_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm21(REG,155)@11 + 1
    u0_m0_wo0_cm21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm21_q <= "0000010001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec21_e = "1") THEN
                u0_m0_wo0_cm21_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec20(LOOKUP,151)@10 + 1
    u0_m0_wo0_dec20_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec20_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec20_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec20_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm20(REG,152)@11 + 1
    u0_m0_wo0_cm20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm20_q <= "1111110111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec20_e = "1") THEN
                u0_m0_wo0_cm20_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec19(LOOKUP,148)@10 + 1
    u0_m0_wo0_dec19_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec19_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec19_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec19_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm19(REG,149)@11 + 1
    u0_m0_wo0_cm19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm19_q <= "1111100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec19_e = "1") THEN
                u0_m0_wo0_cm19_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec18(LOOKUP,145)@10 + 1
    u0_m0_wo0_dec18_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec18_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec18_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec18_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm18(REG,146)@11 + 1
    u0_m0_wo0_cm18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm18_q <= "1111100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec18_e = "1") THEN
                u0_m0_wo0_cm18_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec17(LOOKUP,142)@10 + 1
    u0_m0_wo0_dec17_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec17_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec17_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec17_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm17(REG,143)@11 + 1
    u0_m0_wo0_cm17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm17_q <= "1111100000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec17_e = "1") THEN
                u0_m0_wo0_cm17_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec16(LOOKUP,139)@10 + 1
    u0_m0_wo0_dec16_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec16_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec16_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec16_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm16(REG,140)@11 + 1
    u0_m0_wo0_cm16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm16_q <= "1111100110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec16_e = "1") THEN
                u0_m0_wo0_cm16_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec15(LOOKUP,136)@10 + 1
    u0_m0_wo0_dec15_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec15_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec15_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec15_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm15(REG,137)@11 + 1
    u0_m0_wo0_cm15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm15_q <= "1111101110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec15_e = "1") THEN
                u0_m0_wo0_cm15_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec14(LOOKUP,133)@10 + 1
    u0_m0_wo0_dec14_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec14_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec14_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec14_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm14(REG,134)@11 + 1
    u0_m0_wo0_cm14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm14_q <= "1111111000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec14_e = "1") THEN
                u0_m0_wo0_cm14_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec13(LOOKUP,130)@10 + 1
    u0_m0_wo0_dec13_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec13_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec13_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec13_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm13(REG,131)@11 + 1
    u0_m0_wo0_cm13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm13_q <= "0000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec13_e = "1") THEN
                u0_m0_wo0_cm13_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec12(LOOKUP,127)@10 + 1
    u0_m0_wo0_dec12_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec12_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec12_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec12_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm12(REG,128)@11 + 1
    u0_m0_wo0_cm12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm12_q <= "0000000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec12_e = "1") THEN
                u0_m0_wo0_cm12_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec11(LOOKUP,124)@10 + 1
    u0_m0_wo0_dec11_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec11_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec11_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec11_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm11(REG,125)@11 + 1
    u0_m0_wo0_cm11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm11_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec11_e = "1") THEN
                u0_m0_wo0_cm11_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec10(LOOKUP,121)@10 + 1
    u0_m0_wo0_dec10_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec10_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec10_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec10_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm10(REG,122)@11 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "0000001001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec10_e = "1") THEN
                u0_m0_wo0_cm10_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec9(LOOKUP,118)@10 + 1
    u0_m0_wo0_dec9_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec9_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec9_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec9_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm9(REG,119)@11 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "0000000111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec9_e = "1") THEN
                u0_m0_wo0_cm9_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec8(LOOKUP,115)@10 + 1
    u0_m0_wo0_dec8_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec8_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec8_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec8_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm8(REG,116)@11 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "0000000100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec8_e = "1") THEN
                u0_m0_wo0_cm8_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec7(LOOKUP,112)@10 + 1
    u0_m0_wo0_dec7_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec7_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec7_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec7_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm7(REG,113)@11 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "0000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec7_e = "1") THEN
                u0_m0_wo0_cm7_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec6(LOOKUP,109)@10 + 1
    u0_m0_wo0_dec6_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec6_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec6_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec6_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm6(REG,110)@11 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "1111111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec6_e = "1") THEN
                u0_m0_wo0_cm6_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec5(LOOKUP,106)@10 + 1
    u0_m0_wo0_dec5_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec5_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec5_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec5_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm5(REG,107)@11 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "1111111010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec5_e = "1") THEN
                u0_m0_wo0_cm5_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec4(LOOKUP,103)@10 + 1
    u0_m0_wo0_dec4_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec4_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec4_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec4_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm4(REG,104)@11 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "1111111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec4_e = "1") THEN
                u0_m0_wo0_cm4_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec3(LOOKUP,100)@10 + 1
    u0_m0_wo0_dec3_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec3_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec3_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec3_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm3(REG,101)@11 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "1111111001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec3_e = "1") THEN
                u0_m0_wo0_cm3_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec2(LOOKUP,97)@10 + 1
    u0_m0_wo0_dec2_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec2_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec2_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec2_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm2(REG,98)@11 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "1111111011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec2_e = "1") THEN
                u0_m0_wo0_cm2_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec1(LOOKUP,94)@10 + 1
    u0_m0_wo0_dec1_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec1_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec1_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec1_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm1(REG,95)@11 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "1111111101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec1_e = "1") THEN
                u0_m0_wo0_cm1_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_dec0(LOOKUP,91)@10 + 1
    u0_m0_wo0_dec0_c <= STD_LOGIC_VECTOR(busIn_write);
    u0_m0_wo0_dec0_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            u0_m0_wo0_dec0_e <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (busIn_address) IS
                WHEN OTHERS => u0_m0_wo0_dec0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_cm0(REG,92)@11 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "1111111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_dec0_e = "1") THEN
                u0_m0_wo0_cm0_q <= STD_LOGIC_VECTOR(d_busIn_writedata_11_q(9 downto 0));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_11(DELAY,227)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma0(CHAINMULTADD,215)@10 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= xIn_v(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_11_q(0);
    u0_m0_wo0_cma0_l(0) <= RESIZE(u0_m0_wo0_cma0_a0(0),13) + RESIZE(u0_m0_wo0_cma0_b0(0),13);
    u0_m0_wo0_cma0_l(1) <= RESIZE(u0_m0_wo0_cma0_a0(1),13) + RESIZE(u0_m0_wo0_cma0_b0(1),13);
    u0_m0_wo0_cma0_l(2) <= RESIZE(u0_m0_wo0_cma0_a0(2),13) + RESIZE(u0_m0_wo0_cma0_b0(2),13);
    u0_m0_wo0_cma0_l(3) <= RESIZE(u0_m0_wo0_cma0_a0(3),13) + RESIZE(u0_m0_wo0_cma0_b0(3),13);
    u0_m0_wo0_cma0_l(4) <= RESIZE(u0_m0_wo0_cma0_a0(4),13) + RESIZE(u0_m0_wo0_cma0_b0(4),13);
    u0_m0_wo0_cma0_l(5) <= RESIZE(u0_m0_wo0_cma0_a0(5),13) + RESIZE(u0_m0_wo0_cma0_b0(5),13);
    u0_m0_wo0_cma0_l(6) <= RESIZE(u0_m0_wo0_cma0_a0(6),13) + RESIZE(u0_m0_wo0_cma0_b0(6),13);
    u0_m0_wo0_cma0_l(7) <= RESIZE(u0_m0_wo0_cma0_a0(7),13) + RESIZE(u0_m0_wo0_cma0_b0(7),13);
    u0_m0_wo0_cma0_l(8) <= RESIZE(u0_m0_wo0_cma0_a0(8),13) + RESIZE(u0_m0_wo0_cma0_b0(8),13);
    u0_m0_wo0_cma0_l(9) <= RESIZE(u0_m0_wo0_cma0_a0(9),13) + RESIZE(u0_m0_wo0_cma0_b0(9),13);
    u0_m0_wo0_cma0_l(10) <= RESIZE(u0_m0_wo0_cma0_a0(10),13) + RESIZE(u0_m0_wo0_cma0_b0(10),13);
    u0_m0_wo0_cma0_l(11) <= RESIZE(u0_m0_wo0_cma0_a0(11),13) + RESIZE(u0_m0_wo0_cma0_b0(11),13);
    u0_m0_wo0_cma0_l(12) <= RESIZE(u0_m0_wo0_cma0_a0(12),13) + RESIZE(u0_m0_wo0_cma0_b0(12),13);
    u0_m0_wo0_cma0_l(13) <= RESIZE(u0_m0_wo0_cma0_a0(13),13) + RESIZE(u0_m0_wo0_cma0_b0(13),13);
    u0_m0_wo0_cma0_l(14) <= RESIZE(u0_m0_wo0_cma0_a0(14),13) + RESIZE(u0_m0_wo0_cma0_b0(14),13);
    u0_m0_wo0_cma0_l(15) <= RESIZE(u0_m0_wo0_cma0_a0(15),13) + RESIZE(u0_m0_wo0_cma0_b0(15),13);
    u0_m0_wo0_cma0_l(16) <= RESIZE(u0_m0_wo0_cma0_a0(16),13) + RESIZE(u0_m0_wo0_cma0_b0(16),13);
    u0_m0_wo0_cma0_l(17) <= RESIZE(u0_m0_wo0_cma0_a0(17),13) + RESIZE(u0_m0_wo0_cma0_b0(17),13);
    u0_m0_wo0_cma0_l(18) <= RESIZE(u0_m0_wo0_cma0_a0(18),13) + RESIZE(u0_m0_wo0_cma0_b0(18),13);
    u0_m0_wo0_cma0_l(19) <= RESIZE(u0_m0_wo0_cma0_a0(19),13) + RESIZE(u0_m0_wo0_cma0_b0(19),13);
    u0_m0_wo0_cma0_l(20) <= RESIZE(u0_m0_wo0_cma0_a0(20),13) + RESIZE(u0_m0_wo0_cma0_b0(20),13);
    u0_m0_wo0_cma0_l(21) <= RESIZE(u0_m0_wo0_cma0_a0(21),13) + RESIZE(u0_m0_wo0_cma0_b0(21),13);
    u0_m0_wo0_cma0_l(22) <= RESIZE(u0_m0_wo0_cma0_a0(22),13) + RESIZE(u0_m0_wo0_cma0_b0(22),13);
    u0_m0_wo0_cma0_l(23) <= RESIZE(u0_m0_wo0_cma0_a0(23),13) + RESIZE(u0_m0_wo0_cma0_b0(23),13);
    u0_m0_wo0_cma0_l(24) <= RESIZE(u0_m0_wo0_cma0_a0(24),13) + RESIZE(u0_m0_wo0_cma0_b0(24),13);
    u0_m0_wo0_cma0_l(25) <= RESIZE(u0_m0_wo0_cma0_a0(25),13) + RESIZE(u0_m0_wo0_cma0_b0(25),13);
    u0_m0_wo0_cma0_l(26) <= RESIZE(u0_m0_wo0_cma0_a0(26),13) + RESIZE(u0_m0_wo0_cma0_b0(26),13);
    u0_m0_wo0_cma0_l(27) <= RESIZE(u0_m0_wo0_cma0_a0(27),13) + RESIZE(u0_m0_wo0_cma0_b0(27),13);
    u0_m0_wo0_cma0_l(28) <= RESIZE(u0_m0_wo0_cma0_a0(28),13) + RESIZE(u0_m0_wo0_cma0_b0(28),13);
    u0_m0_wo0_cma0_l(29) <= RESIZE(u0_m0_wo0_cma0_a0(29),13) + RESIZE(u0_m0_wo0_cma0_b0(29),13);
    u0_m0_wo0_cma0_l(30) <= RESIZE(u0_m0_wo0_cma0_a0(30),13) + RESIZE(u0_m0_wo0_cma0_b0(30),13);
    u0_m0_wo0_cma0_l(31) <= RESIZE(u0_m0_wo0_cma0_a0(31),13) + RESIZE(u0_m0_wo0_cma0_b0(31),13);
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_l(0) * u0_m0_wo0_cma0_c0(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_l(1) * u0_m0_wo0_cma0_c0(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_l(2) * u0_m0_wo0_cma0_c0(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_l(3) * u0_m0_wo0_cma0_c0(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_l(4) * u0_m0_wo0_cma0_c0(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_l(5) * u0_m0_wo0_cma0_c0(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_l(6) * u0_m0_wo0_cma0_c0(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_l(7) * u0_m0_wo0_cma0_c0(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_l(8) * u0_m0_wo0_cma0_c0(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_l(9) * u0_m0_wo0_cma0_c0(9);
    u0_m0_wo0_cma0_p(10) <= u0_m0_wo0_cma0_l(10) * u0_m0_wo0_cma0_c0(10);
    u0_m0_wo0_cma0_p(11) <= u0_m0_wo0_cma0_l(11) * u0_m0_wo0_cma0_c0(11);
    u0_m0_wo0_cma0_p(12) <= u0_m0_wo0_cma0_l(12) * u0_m0_wo0_cma0_c0(12);
    u0_m0_wo0_cma0_p(13) <= u0_m0_wo0_cma0_l(13) * u0_m0_wo0_cma0_c0(13);
    u0_m0_wo0_cma0_p(14) <= u0_m0_wo0_cma0_l(14) * u0_m0_wo0_cma0_c0(14);
    u0_m0_wo0_cma0_p(15) <= u0_m0_wo0_cma0_l(15) * u0_m0_wo0_cma0_c0(15);
    u0_m0_wo0_cma0_p(16) <= u0_m0_wo0_cma0_l(16) * u0_m0_wo0_cma0_c0(16);
    u0_m0_wo0_cma0_p(17) <= u0_m0_wo0_cma0_l(17) * u0_m0_wo0_cma0_c0(17);
    u0_m0_wo0_cma0_p(18) <= u0_m0_wo0_cma0_l(18) * u0_m0_wo0_cma0_c0(18);
    u0_m0_wo0_cma0_p(19) <= u0_m0_wo0_cma0_l(19) * u0_m0_wo0_cma0_c0(19);
    u0_m0_wo0_cma0_p(20) <= u0_m0_wo0_cma0_l(20) * u0_m0_wo0_cma0_c0(20);
    u0_m0_wo0_cma0_p(21) <= u0_m0_wo0_cma0_l(21) * u0_m0_wo0_cma0_c0(21);
    u0_m0_wo0_cma0_p(22) <= u0_m0_wo0_cma0_l(22) * u0_m0_wo0_cma0_c0(22);
    u0_m0_wo0_cma0_p(23) <= u0_m0_wo0_cma0_l(23) * u0_m0_wo0_cma0_c0(23);
    u0_m0_wo0_cma0_p(24) <= u0_m0_wo0_cma0_l(24) * u0_m0_wo0_cma0_c0(24);
    u0_m0_wo0_cma0_p(25) <= u0_m0_wo0_cma0_l(25) * u0_m0_wo0_cma0_c0(25);
    u0_m0_wo0_cma0_p(26) <= u0_m0_wo0_cma0_l(26) * u0_m0_wo0_cma0_c0(26);
    u0_m0_wo0_cma0_p(27) <= u0_m0_wo0_cma0_l(27) * u0_m0_wo0_cma0_c0(27);
    u0_m0_wo0_cma0_p(28) <= u0_m0_wo0_cma0_l(28) * u0_m0_wo0_cma0_c0(28);
    u0_m0_wo0_cma0_p(29) <= u0_m0_wo0_cma0_l(29) * u0_m0_wo0_cma0_c0(29);
    u0_m0_wo0_cma0_p(30) <= u0_m0_wo0_cma0_l(30) * u0_m0_wo0_cma0_c0(30);
    u0_m0_wo0_cma0_p(31) <= u0_m0_wo0_cma0_l(31) * u0_m0_wo0_cma0_c0(31);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),29);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),29);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),29);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),29);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),29);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),29);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),29);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),29);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),29);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),29);
    u0_m0_wo0_cma0_u(10) <= RESIZE(u0_m0_wo0_cma0_p(10),29);
    u0_m0_wo0_cma0_u(11) <= RESIZE(u0_m0_wo0_cma0_p(11),29);
    u0_m0_wo0_cma0_u(12) <= RESIZE(u0_m0_wo0_cma0_p(12),29);
    u0_m0_wo0_cma0_u(13) <= RESIZE(u0_m0_wo0_cma0_p(13),29);
    u0_m0_wo0_cma0_u(14) <= RESIZE(u0_m0_wo0_cma0_p(14),29);
    u0_m0_wo0_cma0_u(15) <= RESIZE(u0_m0_wo0_cma0_p(15),29);
    u0_m0_wo0_cma0_u(16) <= RESIZE(u0_m0_wo0_cma0_p(16),29);
    u0_m0_wo0_cma0_u(17) <= RESIZE(u0_m0_wo0_cma0_p(17),29);
    u0_m0_wo0_cma0_u(18) <= RESIZE(u0_m0_wo0_cma0_p(18),29);
    u0_m0_wo0_cma0_u(19) <= RESIZE(u0_m0_wo0_cma0_p(19),29);
    u0_m0_wo0_cma0_u(20) <= RESIZE(u0_m0_wo0_cma0_p(20),29);
    u0_m0_wo0_cma0_u(21) <= RESIZE(u0_m0_wo0_cma0_p(21),29);
    u0_m0_wo0_cma0_u(22) <= RESIZE(u0_m0_wo0_cma0_p(22),29);
    u0_m0_wo0_cma0_u(23) <= RESIZE(u0_m0_wo0_cma0_p(23),29);
    u0_m0_wo0_cma0_u(24) <= RESIZE(u0_m0_wo0_cma0_p(24),29);
    u0_m0_wo0_cma0_u(25) <= RESIZE(u0_m0_wo0_cma0_p(25),29);
    u0_m0_wo0_cma0_u(26) <= RESIZE(u0_m0_wo0_cma0_p(26),29);
    u0_m0_wo0_cma0_u(27) <= RESIZE(u0_m0_wo0_cma0_p(27),29);
    u0_m0_wo0_cma0_u(28) <= RESIZE(u0_m0_wo0_cma0_p(28),29);
    u0_m0_wo0_cma0_u(29) <= RESIZE(u0_m0_wo0_cma0_p(29),29);
    u0_m0_wo0_cma0_u(30) <= RESIZE(u0_m0_wo0_cma0_p(30),29);
    u0_m0_wo0_cma0_u(31) <= RESIZE(u0_m0_wo0_cma0_p(31),29);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_w(6) <= u0_m0_wo0_cma0_u(6);
    u0_m0_wo0_cma0_w(7) <= u0_m0_wo0_cma0_u(7);
    u0_m0_wo0_cma0_w(8) <= u0_m0_wo0_cma0_u(8);
    u0_m0_wo0_cma0_w(9) <= u0_m0_wo0_cma0_u(9);
    u0_m0_wo0_cma0_w(10) <= u0_m0_wo0_cma0_u(10);
    u0_m0_wo0_cma0_w(11) <= u0_m0_wo0_cma0_u(11);
    u0_m0_wo0_cma0_w(12) <= u0_m0_wo0_cma0_u(12);
    u0_m0_wo0_cma0_w(13) <= u0_m0_wo0_cma0_u(13);
    u0_m0_wo0_cma0_w(14) <= u0_m0_wo0_cma0_u(14);
    u0_m0_wo0_cma0_w(15) <= u0_m0_wo0_cma0_u(15);
    u0_m0_wo0_cma0_w(16) <= u0_m0_wo0_cma0_u(16);
    u0_m0_wo0_cma0_w(17) <= u0_m0_wo0_cma0_u(17);
    u0_m0_wo0_cma0_w(18) <= u0_m0_wo0_cma0_u(18);
    u0_m0_wo0_cma0_w(19) <= u0_m0_wo0_cma0_u(19);
    u0_m0_wo0_cma0_w(20) <= u0_m0_wo0_cma0_u(20);
    u0_m0_wo0_cma0_w(21) <= u0_m0_wo0_cma0_u(21);
    u0_m0_wo0_cma0_w(22) <= u0_m0_wo0_cma0_u(22);
    u0_m0_wo0_cma0_w(23) <= u0_m0_wo0_cma0_u(23);
    u0_m0_wo0_cma0_w(24) <= u0_m0_wo0_cma0_u(24);
    u0_m0_wo0_cma0_w(25) <= u0_m0_wo0_cma0_u(25);
    u0_m0_wo0_cma0_w(26) <= u0_m0_wo0_cma0_u(26);
    u0_m0_wo0_cma0_w(27) <= u0_m0_wo0_cma0_u(27);
    u0_m0_wo0_cma0_w(28) <= u0_m0_wo0_cma0_u(28);
    u0_m0_wo0_cma0_w(29) <= u0_m0_wo0_cma0_u(29);
    u0_m0_wo0_cma0_w(30) <= u0_m0_wo0_cma0_u(30);
    u0_m0_wo0_cma0_w(31) <= u0_m0_wo0_cma0_u(31);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_x(6) <= u0_m0_wo0_cma0_w(6);
    u0_m0_wo0_cma0_x(7) <= u0_m0_wo0_cma0_w(7);
    u0_m0_wo0_cma0_x(8) <= u0_m0_wo0_cma0_w(8);
    u0_m0_wo0_cma0_x(9) <= u0_m0_wo0_cma0_w(9);
    u0_m0_wo0_cma0_x(10) <= u0_m0_wo0_cma0_w(10);
    u0_m0_wo0_cma0_x(11) <= u0_m0_wo0_cma0_w(11);
    u0_m0_wo0_cma0_x(12) <= u0_m0_wo0_cma0_w(12);
    u0_m0_wo0_cma0_x(13) <= u0_m0_wo0_cma0_w(13);
    u0_m0_wo0_cma0_x(14) <= u0_m0_wo0_cma0_w(14);
    u0_m0_wo0_cma0_x(15) <= u0_m0_wo0_cma0_w(15);
    u0_m0_wo0_cma0_x(16) <= u0_m0_wo0_cma0_w(16);
    u0_m0_wo0_cma0_x(17) <= u0_m0_wo0_cma0_w(17);
    u0_m0_wo0_cma0_x(18) <= u0_m0_wo0_cma0_w(18);
    u0_m0_wo0_cma0_x(19) <= u0_m0_wo0_cma0_w(19);
    u0_m0_wo0_cma0_x(20) <= u0_m0_wo0_cma0_w(20);
    u0_m0_wo0_cma0_x(21) <= u0_m0_wo0_cma0_w(21);
    u0_m0_wo0_cma0_x(22) <= u0_m0_wo0_cma0_w(22);
    u0_m0_wo0_cma0_x(23) <= u0_m0_wo0_cma0_w(23);
    u0_m0_wo0_cma0_x(24) <= u0_m0_wo0_cma0_w(24);
    u0_m0_wo0_cma0_x(25) <= u0_m0_wo0_cma0_w(25);
    u0_m0_wo0_cma0_x(26) <= u0_m0_wo0_cma0_w(26);
    u0_m0_wo0_cma0_x(27) <= u0_m0_wo0_cma0_w(27);
    u0_m0_wo0_cma0_x(28) <= u0_m0_wo0_cma0_w(28);
    u0_m0_wo0_cma0_x(29) <= u0_m0_wo0_cma0_w(29);
    u0_m0_wo0_cma0_x(30) <= u0_m0_wo0_cma0_w(30);
    u0_m0_wo0_cma0_x(31) <= u0_m0_wo0_cma0_w(31);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_s(6) + u0_m0_wo0_cma0_x(5);
    u0_m0_wo0_cma0_y(6) <= u0_m0_wo0_cma0_s(7) + u0_m0_wo0_cma0_x(6);
    u0_m0_wo0_cma0_y(7) <= u0_m0_wo0_cma0_s(8) + u0_m0_wo0_cma0_x(7);
    u0_m0_wo0_cma0_y(8) <= u0_m0_wo0_cma0_s(9) + u0_m0_wo0_cma0_x(8);
    u0_m0_wo0_cma0_y(9) <= u0_m0_wo0_cma0_s(10) + u0_m0_wo0_cma0_x(9);
    u0_m0_wo0_cma0_y(10) <= u0_m0_wo0_cma0_s(11) + u0_m0_wo0_cma0_x(10);
    u0_m0_wo0_cma0_y(11) <= u0_m0_wo0_cma0_s(12) + u0_m0_wo0_cma0_x(11);
    u0_m0_wo0_cma0_y(12) <= u0_m0_wo0_cma0_s(13) + u0_m0_wo0_cma0_x(12);
    u0_m0_wo0_cma0_y(13) <= u0_m0_wo0_cma0_s(14) + u0_m0_wo0_cma0_x(13);
    u0_m0_wo0_cma0_y(14) <= u0_m0_wo0_cma0_s(15) + u0_m0_wo0_cma0_x(14);
    u0_m0_wo0_cma0_y(15) <= u0_m0_wo0_cma0_s(16) + u0_m0_wo0_cma0_x(15);
    u0_m0_wo0_cma0_y(16) <= u0_m0_wo0_cma0_s(17) + u0_m0_wo0_cma0_x(16);
    u0_m0_wo0_cma0_y(17) <= u0_m0_wo0_cma0_s(18) + u0_m0_wo0_cma0_x(17);
    u0_m0_wo0_cma0_y(18) <= u0_m0_wo0_cma0_s(19) + u0_m0_wo0_cma0_x(18);
    u0_m0_wo0_cma0_y(19) <= u0_m0_wo0_cma0_s(20) + u0_m0_wo0_cma0_x(19);
    u0_m0_wo0_cma0_y(20) <= u0_m0_wo0_cma0_s(21) + u0_m0_wo0_cma0_x(20);
    u0_m0_wo0_cma0_y(21) <= u0_m0_wo0_cma0_s(22) + u0_m0_wo0_cma0_x(21);
    u0_m0_wo0_cma0_y(22) <= u0_m0_wo0_cma0_s(23) + u0_m0_wo0_cma0_x(22);
    u0_m0_wo0_cma0_y(23) <= u0_m0_wo0_cma0_s(24) + u0_m0_wo0_cma0_x(23);
    u0_m0_wo0_cma0_y(24) <= u0_m0_wo0_cma0_s(25) + u0_m0_wo0_cma0_x(24);
    u0_m0_wo0_cma0_y(25) <= u0_m0_wo0_cma0_s(26) + u0_m0_wo0_cma0_x(25);
    u0_m0_wo0_cma0_y(26) <= u0_m0_wo0_cma0_s(27) + u0_m0_wo0_cma0_x(26);
    u0_m0_wo0_cma0_y(27) <= u0_m0_wo0_cma0_s(28) + u0_m0_wo0_cma0_x(27);
    u0_m0_wo0_cma0_y(28) <= u0_m0_wo0_cma0_s(29) + u0_m0_wo0_cma0_x(28);
    u0_m0_wo0_cma0_y(29) <= u0_m0_wo0_cma0_s(30) + u0_m0_wo0_cma0_x(29);
    u0_m0_wo0_cma0_y(30) <= u0_m0_wo0_cma0_s(31) + u0_m0_wo0_cma0_x(30);
    u0_m0_wo0_cma0_y(31) <= u0_m0_wo0_cma0_x(31);
    u0_m0_wo0_cma0_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_b0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_d <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena0 = '1') THEN
                u0_m0_wo0_cma0_a0(0) <= u0_m0_wo0_cma0_d(1);
                u0_m0_wo0_cma0_a0(1) <= u0_m0_wo0_cma0_d(2);
                u0_m0_wo0_cma0_a0(2) <= u0_m0_wo0_cma0_d(3);
                u0_m0_wo0_cma0_a0(3) <= u0_m0_wo0_cma0_d(4);
                u0_m0_wo0_cma0_a0(4) <= u0_m0_wo0_cma0_d(5);
                u0_m0_wo0_cma0_a0(5) <= u0_m0_wo0_cma0_d(6);
                u0_m0_wo0_cma0_a0(6) <= u0_m0_wo0_cma0_d(7);
                u0_m0_wo0_cma0_a0(7) <= u0_m0_wo0_cma0_d(8);
                u0_m0_wo0_cma0_a0(8) <= u0_m0_wo0_cma0_d(9);
                u0_m0_wo0_cma0_a0(9) <= u0_m0_wo0_cma0_d(10);
                u0_m0_wo0_cma0_a0(10) <= u0_m0_wo0_cma0_d(11);
                u0_m0_wo0_cma0_a0(11) <= u0_m0_wo0_cma0_d(12);
                u0_m0_wo0_cma0_a0(12) <= u0_m0_wo0_cma0_d(13);
                u0_m0_wo0_cma0_a0(13) <= u0_m0_wo0_cma0_d(14);
                u0_m0_wo0_cma0_a0(14) <= u0_m0_wo0_cma0_d(15);
                u0_m0_wo0_cma0_a0(15) <= u0_m0_wo0_cma0_d(16);
                u0_m0_wo0_cma0_a0(16) <= u0_m0_wo0_cma0_d(17);
                u0_m0_wo0_cma0_a0(17) <= u0_m0_wo0_cma0_d(18);
                u0_m0_wo0_cma0_a0(18) <= u0_m0_wo0_cma0_d(19);
                u0_m0_wo0_cma0_a0(19) <= u0_m0_wo0_cma0_d(20);
                u0_m0_wo0_cma0_a0(20) <= u0_m0_wo0_cma0_d(21);
                u0_m0_wo0_cma0_a0(21) <= u0_m0_wo0_cma0_d(22);
                u0_m0_wo0_cma0_a0(22) <= u0_m0_wo0_cma0_d(23);
                u0_m0_wo0_cma0_a0(23) <= u0_m0_wo0_cma0_d(24);
                u0_m0_wo0_cma0_a0(24) <= u0_m0_wo0_cma0_d(25);
                u0_m0_wo0_cma0_a0(25) <= u0_m0_wo0_cma0_d(26);
                u0_m0_wo0_cma0_a0(26) <= u0_m0_wo0_cma0_d(27);
                u0_m0_wo0_cma0_a0(27) <= u0_m0_wo0_cma0_d(28);
                u0_m0_wo0_cma0_a0(28) <= u0_m0_wo0_cma0_d(29);
                u0_m0_wo0_cma0_a0(29) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_delayr32_q),12);
                u0_m0_wo0_cma0_a0(30) <= SIGNED(RESIZE(UNSIGNED(GND_q),12));
                u0_m0_wo0_cma0_a0(31) <= (others => '0');
                u0_m0_wo0_cma0_b0(0) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(1) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(2) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(3) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(4) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(5) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(6) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(7) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(8) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(9) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(10) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(11) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(12) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(13) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(14) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(15) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(16) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(17) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(18) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(19) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(20) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(21) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(22) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(23) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(24) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(25) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(26) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(27) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(28) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(29) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(30) <= RESIZE(SIGNED(xIn_0),12);
                u0_m0_wo0_cma0_b0(31) <= (others => '0');
                u0_m0_wo0_cma0_c0(0) <= RESIZE(SIGNED(u0_m0_wo0_cm0_q),11);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(SIGNED(u0_m0_wo0_cm1_q),11);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(SIGNED(u0_m0_wo0_cm2_q),11);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(SIGNED(u0_m0_wo0_cm3_q),11);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(SIGNED(u0_m0_wo0_cm4_q),11);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(SIGNED(u0_m0_wo0_cm5_q),11);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(SIGNED(u0_m0_wo0_cm6_q),11);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(SIGNED(u0_m0_wo0_cm7_q),11);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(SIGNED(u0_m0_wo0_cm8_q),11);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(SIGNED(u0_m0_wo0_cm9_q),11);
                u0_m0_wo0_cma0_c0(10) <= RESIZE(SIGNED(u0_m0_wo0_cm10_q),11);
                u0_m0_wo0_cma0_c0(11) <= RESIZE(SIGNED(u0_m0_wo0_cm11_q),11);
                u0_m0_wo0_cma0_c0(12) <= RESIZE(SIGNED(u0_m0_wo0_cm12_q),11);
                u0_m0_wo0_cma0_c0(13) <= RESIZE(SIGNED(u0_m0_wo0_cm13_q),11);
                u0_m0_wo0_cma0_c0(14) <= RESIZE(SIGNED(u0_m0_wo0_cm14_q),11);
                u0_m0_wo0_cma0_c0(15) <= RESIZE(SIGNED(u0_m0_wo0_cm15_q),11);
                u0_m0_wo0_cma0_c0(16) <= RESIZE(SIGNED(u0_m0_wo0_cm16_q),11);
                u0_m0_wo0_cma0_c0(17) <= RESIZE(SIGNED(u0_m0_wo0_cm17_q),11);
                u0_m0_wo0_cma0_c0(18) <= RESIZE(SIGNED(u0_m0_wo0_cm18_q),11);
                u0_m0_wo0_cma0_c0(19) <= RESIZE(SIGNED(u0_m0_wo0_cm19_q),11);
                u0_m0_wo0_cma0_c0(20) <= RESIZE(SIGNED(u0_m0_wo0_cm20_q),11);
                u0_m0_wo0_cma0_c0(21) <= RESIZE(SIGNED(u0_m0_wo0_cm21_q),11);
                u0_m0_wo0_cma0_c0(22) <= RESIZE(SIGNED(u0_m0_wo0_cm22_q),11);
                u0_m0_wo0_cma0_c0(23) <= RESIZE(SIGNED(u0_m0_wo0_cm23_q),11);
                u0_m0_wo0_cma0_c0(24) <= RESIZE(SIGNED(u0_m0_wo0_cm24_q),11);
                u0_m0_wo0_cma0_c0(25) <= RESIZE(SIGNED(u0_m0_wo0_cm25_q),11);
                u0_m0_wo0_cma0_c0(26) <= RESIZE(SIGNED(u0_m0_wo0_cm26_q),11);
                u0_m0_wo0_cma0_c0(27) <= RESIZE(SIGNED(u0_m0_wo0_cm27_q),11);
                u0_m0_wo0_cma0_c0(28) <= RESIZE(SIGNED(u0_m0_wo0_cm28_q),11);
                u0_m0_wo0_cma0_c0(29) <= RESIZE(SIGNED(u0_m0_wo0_cm29_q),11);
                u0_m0_wo0_cma0_c0(30) <= RESIZE(SIGNED(u0_m0_wo0_cm30_q),11);
                u0_m0_wo0_cma0_c0(31) <= (others => '0');
                u0_m0_wo0_cma0_d(0) <= u0_m0_wo0_cma0_a0(0);
                u0_m0_wo0_cma0_d(1) <= u0_m0_wo0_cma0_a0(1);
                u0_m0_wo0_cma0_d(2) <= u0_m0_wo0_cma0_a0(2);
                u0_m0_wo0_cma0_d(3) <= u0_m0_wo0_cma0_a0(3);
                u0_m0_wo0_cma0_d(4) <= u0_m0_wo0_cma0_a0(4);
                u0_m0_wo0_cma0_d(5) <= u0_m0_wo0_cma0_a0(5);
                u0_m0_wo0_cma0_d(6) <= u0_m0_wo0_cma0_a0(6);
                u0_m0_wo0_cma0_d(7) <= u0_m0_wo0_cma0_a0(7);
                u0_m0_wo0_cma0_d(8) <= u0_m0_wo0_cma0_a0(8);
                u0_m0_wo0_cma0_d(9) <= u0_m0_wo0_cma0_a0(9);
                u0_m0_wo0_cma0_d(10) <= u0_m0_wo0_cma0_a0(10);
                u0_m0_wo0_cma0_d(11) <= u0_m0_wo0_cma0_a0(11);
                u0_m0_wo0_cma0_d(12) <= u0_m0_wo0_cma0_a0(12);
                u0_m0_wo0_cma0_d(13) <= u0_m0_wo0_cma0_a0(13);
                u0_m0_wo0_cma0_d(14) <= u0_m0_wo0_cma0_a0(14);
                u0_m0_wo0_cma0_d(15) <= u0_m0_wo0_cma0_a0(15);
                u0_m0_wo0_cma0_d(16) <= u0_m0_wo0_cma0_a0(16);
                u0_m0_wo0_cma0_d(17) <= u0_m0_wo0_cma0_a0(17);
                u0_m0_wo0_cma0_d(18) <= u0_m0_wo0_cma0_a0(18);
                u0_m0_wo0_cma0_d(19) <= u0_m0_wo0_cma0_a0(19);
                u0_m0_wo0_cma0_d(20) <= u0_m0_wo0_cma0_a0(20);
                u0_m0_wo0_cma0_d(21) <= u0_m0_wo0_cma0_a0(21);
                u0_m0_wo0_cma0_d(22) <= u0_m0_wo0_cma0_a0(22);
                u0_m0_wo0_cma0_d(23) <= u0_m0_wo0_cma0_a0(23);
                u0_m0_wo0_cma0_d(24) <= u0_m0_wo0_cma0_a0(24);
                u0_m0_wo0_cma0_d(25) <= u0_m0_wo0_cma0_a0(25);
                u0_m0_wo0_cma0_d(26) <= u0_m0_wo0_cma0_a0(26);
                u0_m0_wo0_cma0_d(27) <= u0_m0_wo0_cma0_a0(27);
                u0_m0_wo0_cma0_d(28) <= u0_m0_wo0_cma0_a0(28);
                u0_m0_wo0_cma0_d(29) <= u0_m0_wo0_cma0_a0(29);
                u0_m0_wo0_cma0_d(30) <= u0_m0_wo0_cma0_a0(30);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena1 = '1') THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
                u0_m0_wo0_cma0_s(4) <= u0_m0_wo0_cma0_y(4);
                u0_m0_wo0_cma0_s(5) <= u0_m0_wo0_cma0_y(5);
                u0_m0_wo0_cma0_s(6) <= u0_m0_wo0_cma0_y(6);
                u0_m0_wo0_cma0_s(7) <= u0_m0_wo0_cma0_y(7);
                u0_m0_wo0_cma0_s(8) <= u0_m0_wo0_cma0_y(8);
                u0_m0_wo0_cma0_s(9) <= u0_m0_wo0_cma0_y(9);
                u0_m0_wo0_cma0_s(10) <= u0_m0_wo0_cma0_y(10);
                u0_m0_wo0_cma0_s(11) <= u0_m0_wo0_cma0_y(11);
                u0_m0_wo0_cma0_s(12) <= u0_m0_wo0_cma0_y(12);
                u0_m0_wo0_cma0_s(13) <= u0_m0_wo0_cma0_y(13);
                u0_m0_wo0_cma0_s(14) <= u0_m0_wo0_cma0_y(14);
                u0_m0_wo0_cma0_s(15) <= u0_m0_wo0_cma0_y(15);
                u0_m0_wo0_cma0_s(16) <= u0_m0_wo0_cma0_y(16);
                u0_m0_wo0_cma0_s(17) <= u0_m0_wo0_cma0_y(17);
                u0_m0_wo0_cma0_s(18) <= u0_m0_wo0_cma0_y(18);
                u0_m0_wo0_cma0_s(19) <= u0_m0_wo0_cma0_y(19);
                u0_m0_wo0_cma0_s(20) <= u0_m0_wo0_cma0_y(20);
                u0_m0_wo0_cma0_s(21) <= u0_m0_wo0_cma0_y(21);
                u0_m0_wo0_cma0_s(22) <= u0_m0_wo0_cma0_y(22);
                u0_m0_wo0_cma0_s(23) <= u0_m0_wo0_cma0_y(23);
                u0_m0_wo0_cma0_s(24) <= u0_m0_wo0_cma0_y(24);
                u0_m0_wo0_cma0_s(25) <= u0_m0_wo0_cma0_y(25);
                u0_m0_wo0_cma0_s(26) <= u0_m0_wo0_cma0_y(26);
                u0_m0_wo0_cma0_s(27) <= u0_m0_wo0_cma0_y(27);
                u0_m0_wo0_cma0_s(28) <= u0_m0_wo0_cma0_y(28);
                u0_m0_wo0_cma0_s(29) <= u0_m0_wo0_cma0_y(29);
                u0_m0_wo0_cma0_s(30) <= u0_m0_wo0_cma0_y(30);
                u0_m0_wo0_cma0_s(31) <= u0_m0_wo0_cma0_y(31);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 29, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(28 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(28 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq_gated_reg(REG,216)@11 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_11_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,218)@12
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,220)@12
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,221)@12 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_cma0_q(27 downto 0);

END normal;
