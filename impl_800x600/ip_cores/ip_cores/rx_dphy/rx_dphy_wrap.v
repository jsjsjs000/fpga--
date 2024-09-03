//===========================================================================
// Verilog file generated by Clarity Designer    09/03/2024    10:19:46  
// Filename  : rx_dphy_wrap.v                                                
// IP package: CSI-2/DSI D-PHY Receiver 1.6                           
// Copyright(c) 2016 Lattice Semiconductor Corporation. All rights reserved. 
//===========================================================================

module rx_dphy_wrap (
inout                                   clk_n_i,
inout                                   clk_p_i,
inout                                   d0_n_io,
inout                                   d0_p_io,
inout                                   d1_n_i,
inout                                   d1_p_i,
inout                                   d2_n_i,
inout                                   d2_p_i,
inout                                   d3_n_i,
inout                                   d3_p_i,
input                                   clk_byte_fr_i,
input                                   clk_lp_ctrl_i,
///
input                                   reset_byte_fr_n_i,
input                                   reset_byte_n_i,
input                                   reset_lp_n_i,
input                                   reset_n_i,
input                                   pll_lock_i,
input                                   pd_dphy_i,
// output clocks
output wire                             clk_byte_o,
output wire                             clk_byte_hs_o,
///// outputs to fabric. for low power signalling
output wire                             cd_d0_o,
output wire                             lp_d0_rx_p_o,
output wire                             lp_d0_rx_n_o,
// start of parser_on -------
output wire                             payload_en_o,
output wire                             sp_en_o,
output wire                             lp_en_o,
output wire                             lp_av_en_o,
// second set of header
// end of parser_on ---------
// debug/misc signals
output wire                             hs_d_en_o,
output wire                             hs_sync_o,
output wire                             term_clk_en_o,
output reg                        [7:0] data_o,
input  wire                       [3:0] data_sel_i
);

parameter PARSER       = "ON";

parameter RX_TYPE      = "DSI";
parameter DPHY_RX_IP   = "MIXEL";
parameter WORD_ALIGN   = "ON";
parameter RX_CLK_MODE = "HS_ONLY";
parameter LANE_ALIGN = "ON";
// byte clock frequency used to compute HS-SETTLE
parameter BYTECLK_MHZ = 10;
// Lane aligner FIFO type for all lanes
parameter FIFO_TYPE    = "LUT";
parameter SETTLE_CYC   = 0;

//-----------------------------------------------------------------------------
//  WIRE DECLARATION
//-----------------------------------------------------------------------------
wire                [8-1:0] bd0_o;
wire                [8-1:0] bd1_o;
wire                [8-1:0] bd2_o;
wire                [8-1:0] bd3_o;
wire          [4*8-1:0] bd_o;
wire                                 payload_en_o;
wire [4*8-1:0] payload_o;
wire                                 sp_en_o;
wire                                 lp_en_o;
wire                                 lp_av_en_o;
wire                           [5:0] dt_o;
wire                           [1:0] vc_o;
wire                          [15:0] wc_o;
wire                           [7:0] ecc_o;
wire                                 sp2_en_o;
wire                                 lp2_en_o;
wire                                 lp2_av_en_o;
wire                           [5:0] dt2_o;
wire                           [1:0] vc2_o;
wire                          [15:0] wc2_o;
wire                           [7:0] ecc2_o;

always @(posedge clk_byte_fr_i) begin
  if (reset_byte_fr_n_i == 1'd0) begin
    data_o <= 8'd0;
  end
  else begin
    case (data_sel_i)
       4'd0   : data_o <= payload_o[ 7: 0];
       4'd1   : data_o <= payload_o[15: 8];
       4'd2   : data_o <= payload_o[23:16];
       4'd3   : data_o <= payload_o[31:24];
       4'd4   : data_o <= {dt_o,vc_o};
       4'd5   : data_o <= {ecc_o};
       4'd6   : data_o <= wc_o[7:0]; 
       default: data_o <= wc_o[15:8];
    endcase
  end
end

//-----------------------------------------------------------------------------
//  MODULE INSTANTIATION
//-----------------------------------------------------------------------------


/*synthesis translate_off*/
// for simulation purposes only. GSR is assigned or instantiated outside
// this IP
  GSR GSR_INST (.GSR (reset_n_i));

// for compile check only
/*synthesis translate_on*/

///// DPHY RX module /////
rx_dphy_dphy_rx  # (
  .PARSER       (PARSER),
  .RX_TYPE      (RX_TYPE),
  .NUM_RX_LANE  (4),
  .RX_GEAR      (8),
  .DPHY_RX_IP   (DPHY_RX_IP),
  // .DATA_TYPE    (DATA_TYPE),
  .RX_CLK_MODE  (RX_CLK_MODE),
  // .TX_WAIT_TIME (TX_WAIT_TIME),
  .LANE_ALIGN   (LANE_ALIGN),
  .WORD_ALIGN   (WORD_ALIGN),
  .BYTECLK_MHZ  (BYTECLK_MHZ),
  .SETTLE_CYC   (0),
  .FIFO_TYPE    (FIFO_TYPE)
)
dphy_rx_inst (
  // Outputs
  .clk_byte_o                          (clk_byte_o),
  .clk_byte_hs_o                       (clk_byte_hs_o),
  .lp_d0_rx_p_o                        (lp_d0_rx_p_o),
  .lp_d0_rx_n_o                        (lp_d0_rx_n_o),
  .lp_d1_rx_p_o                        (lp_d1_rx_p_o),
  .lp_d1_rx_n_o                        (lp_d1_rx_n_o),
  .lp_d2_rx_p_o                        (lp_d2_rx_p_o),
  .lp_d2_rx_n_o                        (lp_d2_rx_n_o),
  .lp_d3_rx_p_o                        (lp_d3_rx_p_o),
  .lp_d3_rx_n_o                        (lp_d3_rx_n_o),
  .cd_d0_o                             (cd_d0_o),
  .bd0_o                               (bd0_o[8-1:0]),
  .bd1_o                               (bd1_o[8-1:0]),
  .bd2_o                               (bd2_o[8-1:0]),
  .bd3_o                               (bd3_o[8-1:0]),
  .capture_en_o                        (capture_en_o),
  .sp_en_o                             (sp_en_o),
  .lp_en_o                             (lp_en_o),
  .lp_av_en_o                          (lp_av_en_o),
  .dt_o                                (dt_o[5:0]),
  .vc_o                                (vc_o[1:0]),
  .wc_o                                (wc_o[15:0]),
  .ecc_o                               (ecc_o[7:0]),
  .bd_o                                (bd_o[4*8-1:0]),
  
  .pd_dphy_i                           (pd_dphy_i),
  
  
  .payload_en_o                        (payload_en_o),
  .payload_o                           (payload_o[4*8-1:0]),
  .term_clk_en_o                       (term_clk_en_o),
  .hs_d_en_o                           (hs_d_en_o),
  .lp_hs_state_clk_o                   (),
  .lp_hs_state_d_o                     (),
  .hs_sync_o                           (hs_sync_o),
  // Inouts
  .clk_p_i                             (clk_p_i),
  .clk_n_i                             (clk_n_i),
  .d3_p_i                              (d3_p_i),
  .d3_n_i                              (d3_n_i),
  .d2_p_i                              (d2_p_i),
  .d2_n_i                              (d2_n_i),
  .d1_p_i                              (d1_p_i),
  .d1_n_i                              (d1_n_i),

  .d0_p_io                             (d0_p_io),
  .d0_n_io                             (d0_n_io),

  // Inputs
  .clk_lp_ctrl_i                       (clk_lp_ctrl_i),
  .clk_byte_fr_i                       (clk_byte_fr_i),
  .reset_n_i                           (reset_n_i),
  .reset_lp_n_i                        (reset_lp_n_i),
  .reset_byte_n_i                      (reset_byte_n_i),
  .reset_byte_fr_n_i                   (reset_byte_fr_n_i),
  .pll_lock_i                          (pll_lock_i),
  .lp_d0_tx_en_i                       (1'd0),
  .lp_d0_tx_p_i                        (1'd0),
  .lp_d0_tx_n_i                        (1'd0)
);


endmodule
