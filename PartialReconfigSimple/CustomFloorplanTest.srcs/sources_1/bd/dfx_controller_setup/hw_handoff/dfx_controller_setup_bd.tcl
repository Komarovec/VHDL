
################################################################
# This is a generated script based on design: dfx_controller_setup
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source dfx_controller_setup_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a200tsbg484-1
   set_property BOARD_PART digilentinc.com:nexys_video:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name dfx_controller_setup

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set icap [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:icap_rtl:1.0 icap ]


  # Create ports
  set dfx_status [ create_bd_port -dir O dfx_status ]
  set dfx_tdata [ create_bd_port -dir O -from 31 -to 0 dfx_tdata ]
  set hw_trig [ create_bd_port -dir I -from 1 -to 0 hw_trig ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset
  set sys_clock [ create_bd_port -dir I -type clk -freq_hz 50000000 sys_clock ]
  set_property -dict [ list \
   CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.S00_HAS_DATA_FIFO {1} \
 ] $axi_interconnect_0

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Algorithm {Minimum_Area} \
   CONFIG.Byte_Size {8} \
   CONFIG.Coe_File {../../../../../../CustomFloorplanTest.runs/bram_init.coe} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Fill_Remaining_Memory_Locations {true} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_RAM} \
   CONFIG.Port_A_Write_Rate {50} \
   CONFIG.Primitive {8kx2} \
   CONFIG.Read_Width_A {32} \
   CONFIG.Read_Width_B {32} \
   CONFIG.Register_PortA_Output_of_Memory_Core {false} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Remaining_Memory_Locations {1} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Write_Width_A {32} \
   CONFIG.Write_Width_B {32} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_0

  # Create instance: dfx_controller_0, and set properties
  set dfx_controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:dfx_controller:1.0 dfx_controller_0 ]
  set_property -dict [ list \
   CONFIG.ALL_PARAMS {HAS_AXI_LITE_IF 0 RESET_ACTIVE_LEVEL 0 CP_FIFO_DEPTH 32 CP_FIFO_TYPE lutram CDC_STAGES 6 VS {VS_0 {ID 0 NAME VS_0 RM {count {ID 0 NAME count BS {0 {ID 0 ADDR 0 SIZE 17876 CLEAR 0}}} shift {ID 1 NAME shift BS {0 {ID 0 ADDR 0 SIZE 17876 CLEAR 0}}}} POR_RM count NUM_HW_TRIGGERS 2 HAS_AXIS_STATUS 1 SHUTDOWN_ON_ERROR 0 TRIGGER_TO_RM {}}} CP_FAMILY 7series DIRTY 0 CP_COMPRESSION 1} \
   CONFIG.GUI_BS_ADDRESS_0 {0x00000000} \
   CONFIG.GUI_BS_SIZE_0 {17876} \
   CONFIG.GUI_CP_COMPRESSION {1} \
   CONFIG.GUI_CP_FIFO_TYPE {lutram} \
   CONFIG.GUI_HAS_AXI_LITE {false} \
   CONFIG.GUI_LOCK_TRIGGER_0 {false} \
   CONFIG.GUI_RM_NEW_NAME {count} \
   CONFIG.GUI_SELECT_RM {0} \
   CONFIG.GUI_SELECT_TRIGGER_0 {0} \
   CONFIG.GUI_SELECT_TRIGGER_1 {1} \
   CONFIG.GUI_SELECT_TRIGGER_3 {1} \
   CONFIG.GUI_VS_HAS_AXIS_STATUS {true} \
   CONFIG.GUI_VS_NUM_HW_TRIGGERS {2} \
   CONFIG.GUI_VS_SHUTDOWN_ON_ERROR {false} \
 ] $dfx_controller_0

  # Create instance: ila_1, and set properties
  set ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_1 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {1} \
   CONFIG.C_DATA_DEPTH {2048} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {2} \
   CONFIG.C_PROBE0_MU_CNT {1} \
   CONFIG.C_PROBE0_WIDTH {1} \
   CONFIG.C_PROBE10_MU_CNT {1} \
   CONFIG.C_PROBE11_MU_CNT {1} \
   CONFIG.C_PROBE12_MU_CNT {1} \
   CONFIG.C_PROBE13_MU_CNT {1} \
   CONFIG.C_PROBE14_MU_CNT {1} \
   CONFIG.C_PROBE15_MU_CNT {1} \
   CONFIG.C_PROBE16_MU_CNT {1} \
   CONFIG.C_PROBE17_MU_CNT {1} \
   CONFIG.C_PROBE18_MU_CNT {1} \
   CONFIG.C_PROBE19_MU_CNT {1} \
   CONFIG.C_PROBE1_MU_CNT {1} \
   CONFIG.C_PROBE1_WIDTH {32} \
   CONFIG.C_PROBE20_MU_CNT {1} \
   CONFIG.C_PROBE21_MU_CNT {1} \
   CONFIG.C_PROBE22_MU_CNT {1} \
   CONFIG.C_PROBE23_MU_CNT {1} \
   CONFIG.C_PROBE24_MU_CNT {1} \
   CONFIG.C_PROBE25_MU_CNT {1} \
   CONFIG.C_PROBE26_MU_CNT {1} \
   CONFIG.C_PROBE27_MU_CNT {1} \
   CONFIG.C_PROBE28_MU_CNT {1} \
   CONFIG.C_PROBE29_MU_CNT {1} \
   CONFIG.C_PROBE2_MU_CNT {1} \
   CONFIG.C_PROBE2_WIDTH {1} \
   CONFIG.C_PROBE30_MU_CNT {1} \
   CONFIG.C_PROBE31_MU_CNT {1} \
   CONFIG.C_PROBE32_MU_CNT {1} \
   CONFIG.C_PROBE33_MU_CNT {1} \
   CONFIG.C_PROBE34_MU_CNT {1} \
   CONFIG.C_PROBE35_MU_CNT {1} \
   CONFIG.C_PROBE36_MU_CNT {1} \
   CONFIG.C_PROBE37_MU_CNT {1} \
   CONFIG.C_PROBE38_MU_CNT {1} \
   CONFIG.C_PROBE39_MU_CNT {1} \
   CONFIG.C_PROBE3_MU_CNT {1} \
   CONFIG.C_PROBE40_MU_CNT {1} \
   CONFIG.C_PROBE41_MU_CNT {1} \
   CONFIG.C_PROBE42_MU_CNT {1} \
   CONFIG.C_PROBE43_MU_CNT {1} \
   CONFIG.C_PROBE4_MU_CNT {1} \
   CONFIG.C_PROBE5_MU_CNT {1} \
   CONFIG.C_PROBE6_MU_CNT {1} \
   CONFIG.C_PROBE7_MU_CNT {1} \
   CONFIG.C_PROBE8_MU_CNT {1} \
   CONFIG.C_PROBE9_MU_CNT {1} \
 ] $ila_1

  # Create instance: ila_2, and set properties
  set ila_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_2 ]
  set_property -dict [ list \
   CONFIG.ALL_PROBE_SAME_MU_CNT {1} \
   CONFIG.C_DATA_DEPTH {2048} \
   CONFIG.C_ENABLE_ILA_AXI_MON {true} \
   CONFIG.C_MONITOR_TYPE {AXI} \
   CONFIG.C_NUM_OF_PROBES {44} \
   CONFIG.C_PROBE0_MU_CNT {1} \
   CONFIG.C_PROBE0_WIDTH {1} \
   CONFIG.C_PROBE10_MU_CNT {1} \
   CONFIG.C_PROBE11_MU_CNT {1} \
   CONFIG.C_PROBE12_MU_CNT {1} \
   CONFIG.C_PROBE13_MU_CNT {1} \
   CONFIG.C_PROBE14_MU_CNT {1} \
   CONFIG.C_PROBE15_MU_CNT {1} \
   CONFIG.C_PROBE16_MU_CNT {1} \
   CONFIG.C_PROBE17_MU_CNT {1} \
   CONFIG.C_PROBE18_MU_CNT {1} \
   CONFIG.C_PROBE19_MU_CNT {1} \
   CONFIG.C_PROBE1_MU_CNT {1} \
   CONFIG.C_PROBE1_WIDTH {1} \
   CONFIG.C_PROBE20_MU_CNT {1} \
   CONFIG.C_PROBE21_MU_CNT {1} \
   CONFIG.C_PROBE22_MU_CNT {1} \
   CONFIG.C_PROBE23_MU_CNT {1} \
   CONFIG.C_PROBE24_MU_CNT {1} \
   CONFIG.C_PROBE25_MU_CNT {1} \
   CONFIG.C_PROBE26_MU_CNT {1} \
   CONFIG.C_PROBE27_MU_CNT {1} \
   CONFIG.C_PROBE28_MU_CNT {1} \
   CONFIG.C_PROBE29_MU_CNT {1} \
   CONFIG.C_PROBE2_MU_CNT {1} \
   CONFIG.C_PROBE2_WIDTH {1} \
   CONFIG.C_PROBE30_MU_CNT {1} \
   CONFIG.C_PROBE31_MU_CNT {1} \
   CONFIG.C_PROBE32_MU_CNT {1} \
   CONFIG.C_PROBE33_MU_CNT {1} \
   CONFIG.C_PROBE34_MU_CNT {1} \
   CONFIG.C_PROBE35_MU_CNT {1} \
   CONFIG.C_PROBE36_MU_CNT {1} \
   CONFIG.C_PROBE37_MU_CNT {1} \
   CONFIG.C_PROBE38_MU_CNT {1} \
   CONFIG.C_PROBE39_MU_CNT {1} \
   CONFIG.C_PROBE3_MU_CNT {1} \
   CONFIG.C_PROBE40_MU_CNT {1} \
   CONFIG.C_PROBE41_MU_CNT {1} \
   CONFIG.C_PROBE42_MU_CNT {1} \
   CONFIG.C_PROBE43_MU_CNT {1} \
   CONFIG.C_PROBE4_MU_CNT {1} \
   CONFIG.C_PROBE5_MU_CNT {1} \
   CONFIG.C_PROBE6_MU_CNT {1} \
   CONFIG.C_PROBE7_MU_CNT {1} \
   CONFIG.C_PROBE8_MU_CNT {1} \
   CONFIG.C_PROBE9_MU_CNT {1} \
 ] $ila_2

  # Create instance: rst_sys_clock_50M, and set properties
  set rst_sys_clock_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_sys_clock_50M ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net dfx_controller_0_ICAP [get_bd_intf_ports icap] [get_bd_intf_pins dfx_controller_0/ICAP]
  connect_bd_intf_net -intf_net dfx_controller_0_M_AXI_MEM [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins dfx_controller_0/M_AXI_MEM]
connect_bd_intf_net -intf_net [get_bd_intf_nets dfx_controller_0_M_AXI_MEM] [get_bd_intf_pins dfx_controller_0/M_AXI_MEM] [get_bd_intf_pins ila_2/SLOT_0_AXI]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_ports sys_clock] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins dfx_controller_0/clk] [get_bd_pins dfx_controller_0/icap_clk] [get_bd_pins ila_1/clk] [get_bd_pins ila_2/clk] [get_bd_pins rst_sys_clock_50M/slowest_sync_clk]
  connect_bd_net -net dfx_controller_0_vsm_VS_0_m_axis_status_tdata [get_bd_ports dfx_tdata] [get_bd_pins dfx_controller_0/vsm_VS_0_m_axis_status_tdata] [get_bd_pins ila_1/probe1]
  connect_bd_net -net dfx_controller_0_vsm_VS_0_m_axis_status_tvalid [get_bd_ports dfx_status] [get_bd_pins dfx_controller_0/vsm_VS_0_m_axis_status_tvalid] [get_bd_pins ila_1/probe0]
  connect_bd_net -net hw_trig_1 [get_bd_ports hw_trig] [get_bd_pins dfx_controller_0/vsm_VS_0_hw_triggers]
  connect_bd_net -net rst_clk_wiz_0_100M_peripheral_aresetn [get_bd_ports reset] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins dfx_controller_0/icap_reset] [get_bd_pins dfx_controller_0/reset] [get_bd_pins rst_sys_clock_50M/ext_reset_in]
  connect_bd_net -net rst_sys_clock_50M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins rst_sys_clock_50M/peripheral_aresetn]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces dfx_controller_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


