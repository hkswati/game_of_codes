# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/imports/Ready_Modules/stepmotor.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/imports/Ready_Modules/steppermotor_wrapper.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/imports/Ready_Modules/SevSeg_4digit.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/new/key_map.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/imports/Ready_Modules/keypad4X4.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/new/flopenr.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/new/code_gen.sv}
  {C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/sources_1/new/game_logic.sv}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/constrs_1/new/pins.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Hamza K Swati/DigitalDesign/game_of_codes/game_of_codes.srcs/constrs_1/new/pins.xdc}}]


synth_design -top game_logic -part xc7a35tcpg236-1


write_checkpoint -force -noxdef game_logic.dcp

catch { report_utilization -file game_logic_utilization_synth.rpt -pb game_logic_utilization_synth.pb }
