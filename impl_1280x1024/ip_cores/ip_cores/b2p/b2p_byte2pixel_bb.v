//===========================================================================
// Verilog file generated by Clarity Designer    09/03/2024    12:48:25  
// Filename  : b2p_byte2pixel_bb.v                                                
// IP package: Byte to Pixel Converter 1.3                           
// Copyright(c) 2017 Lattice Semiconductor Corporation. All rights reserved. 
//===========================================================================

module b2p_byte2pixel (
    input  wire	                             reset_byte_n_i,
    input  wire	                             clk_byte_i,
    input  wire                              sp_en_i,	      // Short Packet Enable
    input  wire [5:0]                        dt_i,	          // Data Type
    input  wire                              lp_av_en_i,      // Long Packet of Active Video Enable
    input  wire	                             payload_en_i,    // paload enable
    input  wire [4*8-1:0]    payload_i,       // payload
    input  wire [15:0]                       wc_i,            // payload byte count

    input  wire	                             reset_pixel_n_i,
    input  wire	                             clk_pixel_i,
    output wire                              de_o,            // picture data enable
    output wire                              vsync_o,         // Vsync in clk_pixel domain
    output wire                              hsync_o,         // Hsync in clk_pixel domain
    output wire [24*1-1:0] pd_o,            // picture data
    output wire [1:0]                        p_odd_o         // odd pixel indicator
);

endmodule
