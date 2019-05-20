// This is the memory map header file for 'mp'
// Generated by High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614) on Mon May 20 17:18:10 2019

// This file contains the address of each register in the design, with the block name, 
// read/write mode, and description in the block parameters as comments for each.

// Each section denotes one ModelIP/ModelBus block and is laid out as follows:
// <block name> : <description from block>
// <REGISTER_NAME>_BIT_WIDTH <bit width from block>
// <REGISTER_NAME>_FRAC_WIDTH <frac width from block>
// <REGISTER_NAME>_PRIVATE_SPACE <is the private register space box checked?>
// Then, for each addressable word of the block:
// <REGISTER_NAME>_LSB <LSB of word>
// <REGISTER_NAME>_MSB <MSB of word>
// <REGISTER_NAME>_WIDTH <width of word>
// <REGISTER_NAME> <word address in hex format> <read/write mode>

#define AVALON_BUS_WIDTH 16
#define AVALON_ADDRESS_WIDTH 10
// mp_txrx_SingleRateFIR1_Q : FIR Coefficient Registers
#define MP_TXRX_SINGLERATEFIR1_Q_BIT_WIDTH 10
#define MP_TXRX_SINGLERATEFIR1_Q_FRAC_WIDTH 11
#define MP_TXRX_SINGLERATEFIR1_Q_PRIVATE_SPACE false
#define MP_TXRX_SINGLERATEFIR1_Q_LSB 0
#define MP_TXRX_SINGLERATEFIR1_Q_MSB 9
#define MP_TXRX_SINGLERATEFIR1_Q_WIDTH 10
#define MP_TXRX_SINGLERATEFIR1_Q_STARTADDR 0x200 // Read/Write 
#define MP_TXRX_SINGLERATEFIR1_Q_LENGTH 81 

// mp_txrx_SingleRateFIR_I : FIR Coefficient Registers
#define MP_TXRX_SINGLERATEFIR_I_BIT_WIDTH 10
#define MP_TXRX_SINGLERATEFIR_I_FRAC_WIDTH 11
#define MP_TXRX_SINGLERATEFIR_I_PRIVATE_SPACE false
#define MP_TXRX_SINGLERATEFIR_I_LSB 0
#define MP_TXRX_SINGLERATEFIR_I_MSB 9
#define MP_TXRX_SINGLERATEFIR_I_WIDTH 10
#define MP_TXRX_SINGLERATEFIR_I_STARTADDR 0x400 // Read/Write 
#define MP_TXRX_SINGLERATEFIR_I_LENGTH 81 

