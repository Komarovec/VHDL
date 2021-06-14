set_property SRC_FILE_INFO {cfile:D:/Entertaiment/Programy/VHDL/BlazeIt/BlazeIt.srcs/constrs_1/imports/VHDL/Nexys-Video-Master.xdc rfile:../../../BlazeIt.srcs/constrs_1/imports/VHDL/Nexys-Video-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R4    IOSTANDARD LVCMOS33 } [get_ports { sys_clk_i }]; #IO_L13P_T2_MRCC_34 Sch=sysclk
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports sys_clk_i]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G4  IOSTANDARD LVCMOS15 } [get_ports { reset_0 }]; #IO_L12N_T1_MRCC_35 Sch=cpu_resetn
