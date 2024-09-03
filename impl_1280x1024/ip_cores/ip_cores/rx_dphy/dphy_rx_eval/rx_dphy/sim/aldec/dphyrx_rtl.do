//===========================================================================
// Verilog file generated by Clarity Designer    09/03/2024    12:46:09  
// Filename  : dphyrx_rtl.do                                                
// IP package: CSI-2/DSI D-PHY Receiver 1.6                           
// Copyright(c) 2016 Lattice Semiconductor Corporation. All rights reserved. 
//===========================================================================

set design_inst rx_dphy

vlog -v2k5 $diamond_dir/cae_library/simulation/blackbox/lifmd_black_boxes-aldec.vp $diamond_dir/cae_library/simulation/verilog/lifmd/*.v $diamond_dir/cae_library/simulation/verilog/pmi/*.v ../../src/beh_rtl/capture_ctrl_beh.v ../../src/beh_rtl/dphy_rx_wrap_beh.v ../../src/beh_rtl/rx_global_ctrl_beh.v ../../src/beh_rtl/soft_dphy_rx_beh.v ../../../../${design_inst}_capture_ctrl.v ../../../../${design_inst}_dphy_rx_wrap.v ../../../../${design_inst}_rx_global_ctrl.v ../../../../${design_inst}_soft_dphy_rx.v ../../../../${design_inst}_dphy_wrapper.v ../../../../${design_inst}_dphy_rx.v ../../../../${design_inst}.v ../../../testbench/${design_inst}_tb.v

# Start the simulator #
vsim +access +r tb 

# adding the signals to wave window #########
wave /tb/${design_inst}_inst/*

# run simulation cycles
run -all
