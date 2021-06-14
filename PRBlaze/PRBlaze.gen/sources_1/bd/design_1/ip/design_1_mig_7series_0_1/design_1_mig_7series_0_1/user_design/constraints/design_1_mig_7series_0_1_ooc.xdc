###################################################################################################
## This constraints file contains default clock frequencies to be used during creation of a 
## Synthesis Design Checkpoint (DCP). For best results the frequencies should be modified 
## to match the target frequencies. 
## This constraints file is not used in top-down/global synthesis (not the default flow of Vivado).
###################################################################################################


##################################################################################################
## 
##  Xilinx, Inc. 2010            www.xilinx.com 
##  Sun Jun  6 17:15:48 2021

##  Generated by MIG Version 4.2
##  
##################################################################################################
##  File name :       design_1_mig_7series_0_1.xdc
##  Details :     Constraints file
##                    FPGA Family:       ARTIX7
##                    FPGA Part:         XC7A200T-SBG484
##                    Speedgrade:        -1
##                    Design Entry:      VERILOG
##                    Frequency:         400 MHz
##                    Time Period:       2500 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR3_SDRAM->Components->MT41K256M16XX-125
## Data Width: 16
## Time Period: 2500
## Data Mask: 1
##################################################################################################

create_clock -period 5 [get_ports sys_clk_i]
          