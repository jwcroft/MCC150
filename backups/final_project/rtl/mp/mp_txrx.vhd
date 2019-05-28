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

-- VHDL created from mp_txrx
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

entity mp_txrx is
    port (
        busIn_writedata : in std_logic_vector(15 downto 0);  -- ufix16
        busIn_address : in std_logic_vector(9 downto 0);  -- ufix10
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(15 downto 0);  -- ufix16
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        fromADC_I : in std_logic_vector(11 downto 0);  -- sfix12
        fromADC_Q : in std_logic_vector(11 downto 0);  -- sfix12
        toDAC_I : out std_logic_vector(11 downto 0);  -- sfix12
        toDAC_Q : out std_logic_vector(11 downto 0);  -- sfix12
        BBI : out std_logic_vector(29 downto 0);  -- sfix30_en11
        BBQ : out std_logic_vector(29 downto 0);  -- sfix30_en11
        mem_o : out std_logic_vector(11 downto 0);  -- sfix12
        clk : in std_logic;
        areset : in std_logic;
        h_areset : in std_logic
    );
end mp_txrx;

architecture normal of mp_txrx is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component mp_txrx_ChanView is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(11 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_ChanView1 is
        port (
            xIn_0 : in std_logic_vector(29 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(29 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_ChanView2 is
        port (
            xIn_0 : in std_logic_vector(29 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(29 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_ChanView3 is
        port (
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            c0_o : out std_logic_vector(11 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_InterpolatingFIR is
        port (
            xIn_0 : in std_logic_vector(1 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(14 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_Memory is
        port (
            in_1_dv : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_2_dc : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_3_trigger : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_4_dc1 : in std_logic_vector(7 downto 0);  -- Fixed Point
            out_1_m2 : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_2_qv : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_3_qc : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_4_m1 : out std_logic_vector(11 downto 0);  -- Fixed Point
            out_5_qv1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_6_qc1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_Scale is
        port (
            xIn_0 : in std_logic_vector(14 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            qOut_0 : out std_logic_vector(11 downto 0);  -- Fixed Point
            qOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            qOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            eOut_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic
        );
    end component;


    component mp_txrx_SingleRateFIR1_Q is
        port (
            busIn_writedata : in std_logic_vector(15 downto 0);  -- Fixed Point
            busIn_address : in std_logic_vector(9 downto 0);  -- Fixed Point
            busIn_write : in std_logic_vector(0 downto 0);  -- Fixed Point
            busIn_read : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            busOut_readdata : out std_logic_vector(15 downto 0);  -- Fixed Point
            busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(29 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic;
            h_areset : in std_logic
        );
    end component;


    component mp_txrx_SingleRateFIR_I is
        port (
            busIn_writedata : in std_logic_vector(15 downto 0);  -- Fixed Point
            busIn_address : in std_logic_vector(9 downto 0);  -- Fixed Point
            busIn_write : in std_logic_vector(0 downto 0);  -- Fixed Point
            busIn_read : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_0 : in std_logic_vector(11 downto 0);  -- Fixed Point
            xIn_v : in std_logic_vector(0 downto 0);  -- Fixed Point
            xIn_c : in std_logic_vector(7 downto 0);  -- Fixed Point
            busOut_readdata : out std_logic_vector(15 downto 0);  -- Fixed Point
            busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_0 : out std_logic_vector(29 downto 0);  -- Fixed Point
            xOut_v : out std_logic_vector(0 downto 0);  -- Fixed Point
            xOut_c : out std_logic_vector(7 downto 0);  -- Fixed Point
            clk : in std_logic;
            areset : in std_logic;
            h_areset : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ChanView_c0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ChanView1_c0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal ChanView2_c0_o : STD_LOGIC_VECTOR (29 downto 0);
    signal ChanView3_c0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal Channel_q : STD_LOGIC_VECTOR (7 downto 0);
    signal InterpolatingFIR_xOut_0 : STD_LOGIC_VECTOR (14 downto 0);
    signal InterpolatingFIR_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal InterpolatingFIR_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal Memory_out_1_m2 : STD_LOGIC_VECTOR (1 downto 0);
    signal Memory_out_2_qv : STD_LOGIC_VECTOR (0 downto 0);
    signal Memory_out_3_qc : STD_LOGIC_VECTOR (7 downto 0);
    signal Memory_out_4_m1 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale_qOut_0 : STD_LOGIC_VECTOR (11 downto 0);
    signal Scale_qOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal Scale_qOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR1_Q_busOut_readdata : STD_LOGIC_VECTOR (15 downto 0);
    signal SingleRateFIR1_Q_busOut_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR1_Q_xOut_0 : STD_LOGIC_VECTOR (29 downto 0);
    signal SingleRateFIR1_Q_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR1_Q_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal SingleRateFIR_I_busOut_readdata : STD_LOGIC_VECTOR (15 downto 0);
    signal SingleRateFIR_I_busOut_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_I_xOut_0 : STD_LOGIC_VECTOR (29 downto 0);
    signal SingleRateFIR_I_xOut_v : STD_LOGIC_VECTOR (0 downto 0);
    signal SingleRateFIR_I_xOut_c : STD_LOGIC_VECTOR (7 downto 0);
    signal bus_selector_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bus_selector_v : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_readDelayed_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mp_txrx_readDataValid_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- Channel(CONSTANT,10)
    Channel_q <= "00000000";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- SingleRateFIR_I(BLACKBOX,15)
    theSingleRateFIR_I : mp_txrx_SingleRateFIR_I
    PORT MAP (
        busIn_writedata => busIn_writedata,
        busIn_address => busIn_address,
        busIn_write => busIn_write,
        busIn_read => busIn_read,
        xIn_0 => fromADC_I,
        xIn_v => VCC_q,
        xIn_c => Channel_q,
        busOut_readdata => SingleRateFIR_I_busOut_readdata,
        busOut_readdatavalid => SingleRateFIR_I_busOut_readdatavalid,
        xOut_0 => SingleRateFIR_I_xOut_0,
        xOut_v => SingleRateFIR_I_xOut_v,
        xOut_c => SingleRateFIR_I_xOut_c,
        clk => clk,
        areset => areset,
        h_areset => h_areset
    );

    -- SingleRateFIR1_Q(BLACKBOX,14)
    theSingleRateFIR1_Q : mp_txrx_SingleRateFIR1_Q
    PORT MAP (
        busIn_writedata => busIn_writedata,
        busIn_address => busIn_address,
        busIn_write => busIn_write,
        busIn_read => busIn_read,
        xIn_0 => fromADC_Q,
        xIn_v => VCC_q,
        xIn_c => Channel_q,
        busOut_readdata => SingleRateFIR1_Q_busOut_readdata,
        busOut_readdatavalid => SingleRateFIR1_Q_busOut_readdatavalid,
        xOut_0 => SingleRateFIR1_Q_xOut_0,
        xOut_v => SingleRateFIR1_Q_xOut_v,
        xOut_c => SingleRateFIR1_Q_xOut_c,
        clk => clk,
        areset => areset,
        h_areset => h_areset
    );

    -- bus_selector(SELECTOR,20)
    bus_selector_clkproc: PROCESS (clk, h_areset)
    BEGIN
        IF (h_areset = '1') THEN
            bus_selector_q <= (others => '0');
            bus_selector_v <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            bus_selector_q <= STD_LOGIC_VECTOR("000000000000000" & GND_q);
            bus_selector_v <= "0";
            IF (SingleRateFIR_I_busOut_readdatavalid = "1") THEN
                bus_selector_q <= SingleRateFIR_I_busOut_readdata;
                bus_selector_v <= "1";
            END IF;
            IF (SingleRateFIR1_Q_busOut_readdatavalid = "1") THEN
                bus_selector_q <= SingleRateFIR1_Q_busOut_readdata;
                bus_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;

    -- mp_txrx_readDelayed(DELAY,38)
    mp_txrx_readDelayed : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => busIn_read, xout => mp_txrx_readDelayed_q, clk => clk, aclr => h_areset );

    -- mp_txrx_readDataValid(LOGICAL,39)
    mp_txrx_readDataValid_q <= bus_selector_v or mp_txrx_readDelayed_q;

    -- busOut(BUSOUT,19)
    busOut_readdatavalid <= mp_txrx_readDataValid_q;
    busOut_readdata <= bus_selector_q;
    busOut_waitrequest <= GND_q;

    -- Memory(BLACKBOX,12)
    theMemory : mp_txrx_Memory
    PORT MAP (
        in_1_dv => VCC_q,
        in_2_dc => Channel_q,
        in_3_trigger => GND_q,
        in_4_dc1 => Channel_q,
        out_1_m2 => Memory_out_1_m2,
        out_2_qv => Memory_out_2_qv,
        out_3_qc => Memory_out_3_qc,
        out_4_m1 => Memory_out_4_m1,
        clk => clk,
        areset => areset
    );

    -- InterpolatingFIR(BLACKBOX,11)
    theInterpolatingFIR : mp_txrx_InterpolatingFIR
    PORT MAP (
        xIn_0 => Memory_out_1_m2,
        xIn_v => Memory_out_2_qv,
        xIn_c => Memory_out_3_qc,
        xOut_0 => InterpolatingFIR_xOut_0,
        xOut_v => InterpolatingFIR_xOut_v,
        xOut_c => InterpolatingFIR_xOut_c,
        clk => clk,
        areset => areset
    );

    -- Scale(BLACKBOX,13)
    theScale : mp_txrx_Scale
    PORT MAP (
        xIn_0 => InterpolatingFIR_xOut_0,
        xIn_v => InterpolatingFIR_xOut_v,
        xIn_c => InterpolatingFIR_xOut_c,
        qOut_0 => Scale_qOut_0,
        qOut_v => Scale_qOut_v,
        qOut_c => Scale_qOut_c,
        clk => clk,
        areset => areset
    );

    -- ChanView(BLACKBOX,6)
    theChanView : mp_txrx_ChanView
    PORT MAP (
        xIn_0 => Scale_qOut_0,
        xIn_v => Scale_qOut_v,
        xIn_c => Scale_qOut_c,
        c0_o => ChanView_c0_o,
        clk => clk,
        areset => areset
    );

    -- toDAC_I(GPOUT,24)
    toDAC_I <= ChanView_c0_o;

    -- toDAC_Q(GPOUT,25)
    toDAC_Q <= ChanView_c0_o;

    -- ChanView1(BLACKBOX,7)
    theChanView1 : mp_txrx_ChanView1
    PORT MAP (
        xIn_0 => SingleRateFIR_I_xOut_0,
        xIn_v => SingleRateFIR_I_xOut_v,
        xIn_c => SingleRateFIR_I_xOut_c,
        c0_o => ChanView1_c0_o,
        clk => clk,
        areset => areset
    );

    -- BBI(GPOUT,26)
    BBI <= ChanView1_c0_o;

    -- ChanView2(BLACKBOX,8)
    theChanView2 : mp_txrx_ChanView2
    PORT MAP (
        xIn_0 => SingleRateFIR1_Q_xOut_0,
        xIn_v => SingleRateFIR1_Q_xOut_v,
        xIn_c => SingleRateFIR1_Q_xOut_c,
        c0_o => ChanView2_c0_o,
        clk => clk,
        areset => areset
    );

    -- BBQ(GPOUT,27)
    BBQ <= ChanView2_c0_o;

    -- ChanView3(BLACKBOX,9)
    theChanView3 : mp_txrx_ChanView3
    PORT MAP (
        xIn_0 => Memory_out_4_m1,
        xIn_v => VCC_q,
        xIn_c => Channel_q,
        c0_o => ChanView3_c0_o,
        clk => clk,
        areset => areset
    );

    -- mem_o(GPOUT,28)
    mem_o <= ChanView3_c0_o;

END normal;
