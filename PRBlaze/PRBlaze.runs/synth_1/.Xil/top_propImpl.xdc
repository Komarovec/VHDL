set_property SRC_FILE_INFO {cfile:D:/Entertaiment/Programy/VHDL/PRBlaze/PRBlaze.srcs/constrs_1/imports/VHDL/Nexys-Video-Master.xdc rfile:../../../PRBlaze.srcs/constrs_1/imports/VHDL/Nexys-Video-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS25} [get_ports {ld[0]}]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS25} [get_ports {ld[1]}]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS25} [get_ports {ld[2]}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS25} [get_ports {ld[3]}]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS25} [get_ports {ld[4]}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS25} [get_ports {ld[5]}]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS25} [get_ports {ld[6]}]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN Y13 IOSTANDARD LVCMOS25} [get_ports {ld[7]}]
set_property src_info {type:XDC file:1 line:153 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AA19  IOSTANDARD LVCMOS33 } [get_ports { usb_uart_txd }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=uart_rx_out
set_property src_info {type:XDC file:1 line:154 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { usb_uart_rxd }]; #IO_L14P_T2_SRCC_14 Sch=uart_tx_in
set_property src_info {type:XDC file:1 line:314 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_light_count
add_cells_to_pblock [get_pblocks pblock_light_count] [get_cells -quiet [list light_count]]
resize_pblock [get_pblocks pblock_light_count] -add {SLICE_X114Y101:SLICE_X163Y149}
resize_pblock [get_pblocks pblock_light_count] -add {DSP48_X7Y42:DSP48_X8Y59}
resize_pblock [get_pblocks pblock_light_count] -add {RAMB18_X7Y42:RAMB18_X8Y59}
resize_pblock [get_pblocks pblock_light_count] -add {RAMB36_X7Y21:RAMB36_X8Y29}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_light_count]
set_property SNAPPING_MODE ON [get_pblocks pblock_light_count]
