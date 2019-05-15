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
-- VHDL created on Wed May 15 10:15:08 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;

entity mp_txrx_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        fromADC_I_stm : out std_logic_vector(11 downto 0);
        fromADC_Q_stm : out std_logic_vector(11 downto 0);
        toDAC_I_stm : out std_logic_vector(11 downto 0);
        toDAC_Q_stm : out std_logic_vector(11 downto 0);
        sym_phase_stm : out std_logic_vector(27 downto 0);
        BER_stm : out std_logic_vector(0 downto 0);
        bit_error_stm : out std_logic_vector(0 downto 0);
        sym_pwr_stm : out std_logic_vector(11 downto 0);
        BBI_stm : out std_logic_vector(29 downto 0);
        BBQ_stm : out std_logic_vector(29 downto 0);
        mem_o_stm : out std_logic_vector(11 downto 0);
        bit_o_stm : out std_logic_vector(0 downto 0);
        pow_rx_stm : out std_logic_vector(11 downto 0);
        pow_rx_preshift_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end mp_txrx_stm;

architecture normal of mp_txrx_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal h_areset_stm_sig : std_logic := '1';
    signal clk_fromADC_I_stm_sig_stop : std_logic := '0';
    signal clk_fromADC_Q_stm_sig_stop : std_logic := '0';
    signal clk_toDAC_I_stm_sig_stop : std_logic := '0';
    signal clk_toDAC_Q_stm_sig_stop : std_logic := '0';
    signal clk_sym_phase_stm_sig_stop : std_logic := '0';
    signal clk_BER_stm_sig_stop : std_logic := '0';
    signal clk_bit_error_stm_sig_stop : std_logic := '0';
    signal clk_sym_pwr_stm_sig_stop : std_logic := '0';
    signal clk_BBI_stm_sig_stop : std_logic := '0';
    signal clk_BBQ_stm_sig_stop : std_logic := '0';
    signal clk_mem_o_stm_sig_stop : std_logic := '0';
    signal clk_bit_o_stm_sig_stop : std_logic := '0';
    signal clk_pow_rx_stm_sig_stop : std_logic := '0';
    signal clk_pow_rx_preshift_stm_sig_stop : std_logic := '0';

    function str_to_stdvec(inp: string) return std_logic_vector is
        variable temp: std_logic_vector(inp'range) := (others => 'X');
    begin
        for i in inp'range loop
            IF ((inp(i) = '1')) THEN
                temp(i) := '1';
            elsif (inp(i) = '0') then
                temp(i) := '0';
            END IF;
            end loop;
            return temp;
        end function str_to_stdvec;
        

    begin

    clk <= clk_stm_sig;
    clk_process: process 
    begin
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 12300 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 12300 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
    end process;

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 18750 ps;
        areset_stm_sig <= '0';
        wait;
    end process;

    h_areset <= h_areset_stm_sig;
    h_areset_process: process begin
        h_areset_stm_sig <= '1';
        wait for 18750 ps;
        h_areset_stm_sig <= '0';
        wait;
    end process;

        -- Driving gnd for busIn signals

        busIn_writedata_stm <= (others => '0');
        busIn_address_stm <= (others => '0');
        busIn_write_stm <= (others => '0');
        busIn_read_stm <= (others => '0');
        -- Driving gnd for busOut signals

        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        busOut_waitrequest_stm <= (others => '0');
        -- Generating stimulus for fromADC_I
        fromADC_I_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "mp/mp_txrx_SingleRateFIR_I_xIn.stm";
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            fromADC_I_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to fromADC_I)
                IF (endfile(data_file_xIn)) THEN
                    clk_fromADC_I_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_0_int_0);
                    xIn_0_temp(11 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 12));
                    fromADC_I_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for fromADC_Q
        fromADC_Q_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "mp/mp_txrx_SingleRateFIR1_Q_xIn.stm";
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            fromADC_Q_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to fromADC_Q)
                IF (endfile(data_file_xIn)) THEN
                    clk_fromADC_Q_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_0_int_0);
                    xIn_0_temp(11 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 12));
                    fromADC_Q_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for toDAC_I
        toDAC_I_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            toDAC_I_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to toDAC_I)
                IF (endfile(data_file_c0)) THEN
                    clk_toDAC_I_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    toDAC_I_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for toDAC_Q
        toDAC_Q_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            toDAC_Q_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to toDAC_Q)
                IF (endfile(data_file_c0)) THEN
                    clk_toDAC_Q_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    toDAC_Q_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for sym_phase
        sym_phase_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "mp/mp_txrx_Symbol_Recovery_ChannelOut.stm";
            variable out_4_phase_int_0 : Integer;
            variable out_4_phase_temp : std_logic_vector(27 downto 0);

        begin
            -- initialize all outputs to 0
            sym_phase_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to sym_phase)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_sym_phase_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_phase_int_0);
                    out_4_phase_temp(27 downto 0) := std_logic_vector(to_unsigned(out_4_phase_int_0, 28));
                    sym_phase_stm <= out_4_phase_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for BER
        BER_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "mp/mp_txrx_BER_Extraction_ChannelOut.stm";
            variable out_1_BER_int_0 : Integer;
            variable out_1_BER_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            BER_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to BER)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_BER_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_BER_int_0);
                    out_1_BER_temp(0 downto 0) := std_logic_vector(to_unsigned(out_1_BER_int_0, 1));
                    BER_stm <= out_1_BER_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for bit_error
        bit_error_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "mp/mp_txrx_BER_Extraction_ChannelOut.stm";
            variable out_4_bit_error_int_0 : Integer;
            variable out_4_bit_error_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            bit_error_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to bit_error)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_bit_error_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_bit_error_int_0);
                    out_4_bit_error_temp(0 downto 0) := std_logic_vector(to_unsigned(out_4_bit_error_int_0, 1));
                    bit_error_stm <= out_4_bit_error_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for sym_pwr
        sym_pwr_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "mp/mp_txrx_Symbol_Recovery_ChannelOut.stm";
            variable out_6_sym_pwr_int_0 : Integer;
            variable out_6_sym_pwr_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            sym_pwr_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to sym_pwr)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_sym_pwr_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_6_sym_pwr_int_0);
                    out_6_sym_pwr_temp(11 downto 0) := std_logic_vector(to_unsigned(out_6_sym_pwr_int_0, 12));
                    sym_pwr_stm <= out_6_sym_pwr_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for BBI
        BBI_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView1_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(29 downto 0);

        begin
            -- initialize all outputs to 0
            BBI_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to BBI)
                IF (endfile(data_file_c0)) THEN
                    clk_BBI_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(29 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 30));
                    BBI_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for BBQ
        BBQ_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView2_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(29 downto 0);

        begin
            -- initialize all outputs to 0
            BBQ_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to BBQ)
                IF (endfile(data_file_c0)) THEN
                    clk_BBQ_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(29 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 30));
                    BBQ_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for mem_o
        mem_o_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView3_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            mem_o_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to mem_o)
                IF (endfile(data_file_c0)) THEN
                    clk_mem_o_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    mem_o_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for bit_o
        bit_o_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView4_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            bit_o_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to bit_o)
                IF (endfile(data_file_c0)) THEN
                    clk_bit_o_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(0 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 1));
                    bit_o_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for pow_rx
        pow_rx_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView5_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            pow_rx_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to pow_rx)
                IF (endfile(data_file_c0)) THEN
                    clk_pow_rx_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    pow_rx_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for pow_rx_preshift
        pow_rx_preshift_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "mp/mp_txrx_ChanView6_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(24 downto 0);

        begin
            -- initialize all outputs to 0
            pow_rx_preshift_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to pow_rx_preshift)
                IF (endfile(data_file_c0)) THEN
                    clk_pow_rx_preshift_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(24 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 25));
                    pow_rx_preshift_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_fromADC_I_stm_sig_stop OR clk_fromADC_Q_stm_sig_stop OR clk_toDAC_I_stm_sig_stop OR clk_toDAC_Q_stm_sig_stop OR clk_sym_phase_stm_sig_stop OR clk_BER_stm_sig_stop OR clk_bit_error_stm_sig_stop OR clk_sym_pwr_stm_sig_stop OR clk_BBI_stm_sig_stop OR clk_BBQ_stm_sig_stop OR clk_mem_o_stm_sig_stop OR clk_bit_o_stm_sig_stop OR clk_pow_rx_stm_sig_stop OR clk_pow_rx_preshift_stm_sig_stop OR '0';


    END normal;
