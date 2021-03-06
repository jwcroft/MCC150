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

-- VHDL created from final_project_1_txrx_fp
-- VHDL created on Fri May 24 15:19:49 2019


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;

entity final_project_1_txrx_fp_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(15 downto 0);
        busIn_address_stm : out std_logic_vector(9 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(15 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        ADC_I_stm : out std_logic_vector(11 downto 0);
        ADC_Q_stm : out std_logic_vector(11 downto 0);
        Reset_stm : out std_logic_vector(63 downto 0);
        DAC_I_stm : out std_logic_vector(11 downto 0);
        DAC_Q_stm : out std_logic_vector(11 downto 0);
        mem_o_stm : out std_logic_vector(0 downto 0);
        BBI_stm : out std_logic_vector(27 downto 0);
        BBQ_stm : out std_logic_vector(27 downto 0);
        ma_0_stm : out std_logic_vector(11 downto 0);
        ma_1_stm : out std_logic_vector(11 downto 0);
        ma_2_stm : out std_logic_vector(11 downto 0);
        ma_3_stm : out std_logic_vector(24 downto 0);
        ma_4_stm : out std_logic_vector(24 downto 0);
        ma_5_stm : out std_logic_vector(24 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        h_areset : out std_logic
    );
end final_project_1_txrx_fp_stm;

architecture normal of final_project_1_txrx_fp_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal h_areset_stm_sig : std_logic := '1';
    signal clk_ADC_I_stm_sig_stop : std_logic := '0';
    signal clk_ADC_Q_stm_sig_stop : std_logic := '0';
    signal clk_DAC_I_stm_sig_stop : std_logic := '0';
    signal clk_DAC_Q_stm_sig_stop : std_logic := '0';
    signal clk_mem_o_stm_sig_stop : std_logic := '0';
    signal clk_BBI_stm_sig_stop : std_logic := '0';
    signal clk_BBQ_stm_sig_stop : std_logic := '0';
    signal clk_ma_0_stm_sig_stop : std_logic := '0';
    signal clk_ma_1_stm_sig_stop : std_logic := '0';
    signal clk_ma_2_stm_sig_stop : std_logic := '0';
    signal clk_ma_3_stm_sig_stop : std_logic := '0';
    signal clk_ma_4_stm_sig_stop : std_logic := '0';
    signal clk_ma_5_stm_sig_stop : std_logic := '0';

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
        -- Generating stimulus for ADC_I
        ADC_I_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "final_project_1/final_project_1_txrx_fp_SingleRateFIR_I_xIn.stm";
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ADC_I_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ADC_I)
                IF (endfile(data_file_xIn)) THEN
                    clk_ADC_I_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_0_int_0);
                    xIn_0_temp(11 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 12));
                    ADC_I_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ADC_Q
        ADC_Q_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is "final_project_1/final_project_1_txrx_fp_SingleRateFIR_Q_xIn.stm";
            variable xIn_0_int_0 : Integer;
            variable xIn_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ADC_Q_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ADC_Q)
                IF (endfile(data_file_xIn)) THEN
                    clk_ADC_Q_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, xIn_0_int_0);
                    xIn_0_temp(11 downto 0) := std_logic_vector(to_unsigned(xIn_0_int_0, 12));
                    ADC_Q_stm <= xIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Driving gnd for Reset signals

        Reset_stm <= (others => '0');
        -- Generating stimulus for DAC_I
        DAC_I_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "final_project_1/final_project_1_txrx_fp_ChanView_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            DAC_I_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to DAC_I)
                IF (endfile(data_file_c0)) THEN
                    clk_DAC_I_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    DAC_I_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for DAC_Q
        DAC_Q_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_c0 : text open read_mode is "final_project_1/final_project_1_txrx_fp_ChanView1_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            DAC_Q_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to DAC_Q)
                IF (endfile(data_file_c0)) THEN
                    clk_DAC_Q_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_c0, L);
                    
                    read(L, c0_o_int_0);
                    c0_o_temp(11 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 12));
                    DAC_Q_stm <= c0_o_temp;

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
            file data_file_c0 : text open read_mode is "final_project_1/final_project_1_txrx_fp_ChanView3_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(0 downto 0);

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
                    c0_o_temp(0 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 1));
                    mem_o_stm <= c0_o_temp;

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
            file data_file_c0 : text open read_mode is "final_project_1/final_project_1_txrx_fp_ChanView2_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(27 downto 0);

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
                    c0_o_temp(27 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 28));
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
            file data_file_c0 : text open read_mode is "final_project_1/final_project_1_txrx_fp_ChanView4_c0.stm";
            variable c0_o_int_0 : Integer;
            variable c0_o_temp : std_logic_vector(27 downto 0);

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
                    c0_o_temp(27 downto 0) := std_logic_vector(to_unsigned(c0_o_int_0, 28));
                    BBQ_stm <= c0_o_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ma_0
        ma_0_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Scale3_I1_qOut.stm";
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ma_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_0)
                IF (endfile(data_file_qOut)) THEN
                    clk_ma_0_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(11 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 12));
                    ma_0_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ma_1
        ma_1_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Scale3_I2_qOut.stm";
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ma_1_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_1)
                IF (endfile(data_file_qOut)) THEN
                    clk_ma_1_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(11 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 12));
                    ma_1_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ma_2
        ma_2_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Scale3_I3_qOut.stm";
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            ma_2_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_2)
                IF (endfile(data_file_qOut)) THEN
                    clk_ma_2_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(11 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 12));
                    ma_2_stm <= qOut_0_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ma_3
        ma_3_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Power_extraction_ChannelOut.stm";
            variable out_3_left_power_int_0 : Integer;
            variable out_3_left_power_temp : std_logic_vector(24 downto 0);

        begin
            -- initialize all outputs to 0
            ma_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_3)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_ma_3_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_3_left_power_int_0);
                    out_3_left_power_temp(24 downto 0) := std_logic_vector(to_unsigned(out_3_left_power_int_0, 25));
                    ma_3_stm <= out_3_left_power_temp;
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
        -- Generating stimulus for ma_4
        ma_4_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Power_extraction_ChannelOut.stm";
            variable out_4_main_power_int_0 : Integer;
            variable out_4_main_power_temp : std_logic_vector(24 downto 0);

        begin
            -- initialize all outputs to 0
            ma_4_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_4)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_ma_4_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_main_power_int_0);
                    out_4_main_power_temp(24 downto 0) := std_logic_vector(to_unsigned(out_4_main_power_int_0, 25));
                    ma_4_stm <= out_4_main_power_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Generating stimulus for ma_5
        ma_5_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut : text open read_mode is "final_project_1/final_project_1_txrx_fp_Power_extraction_ChannelOut.stm";
            variable out_5_right_power_int_0 : Integer;
            variable out_5_right_power_temp : std_logic_vector(24 downto 0);

        begin
            -- initialize all outputs to 0
            ma_5_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            while true loop
            
                -- (ports connected to ma_5)
                IF (endfile(data_file_ChannelOut)) THEN
                    clk_ma_5_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_right_power_int_0);
                    out_5_right_power_temp(24 downto 0) := std_logic_vector(to_unsigned(out_5_right_power_int_0, 25));
                    ma_5_stm <= out_5_right_power_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_ADC_I_stm_sig_stop OR clk_ADC_Q_stm_sig_stop OR clk_DAC_I_stm_sig_stop OR clk_DAC_Q_stm_sig_stop OR clk_mem_o_stm_sig_stop OR clk_BBI_stm_sig_stop OR clk_BBQ_stm_sig_stop OR clk_ma_0_stm_sig_stop OR clk_ma_1_stm_sig_stop OR clk_ma_2_stm_sig_stop OR clk_ma_3_stm_sig_stop OR clk_ma_4_stm_sig_stop OR clk_ma_5_stm_sig_stop OR '0';


    END normal;
