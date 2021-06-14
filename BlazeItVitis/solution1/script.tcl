############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project BlazeItVitis
open_solution "solution1" -flow_target vivado
set_part {xc7a200tsbg484-1}
create_clock -period 10 -name default
#source "./BlazeItVitis/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
