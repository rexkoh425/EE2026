# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.cache/wt} [current_project]
set_property parent.project_path {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/AnimateDeath.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/BlockColourPixel.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/BlockIsImmutable.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/Bomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/BombCounter.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/ButtonDebouncing.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/CentreConcreteBlock.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/CollisionCheck.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/ConcreteBlocks.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/Counter_100MHZ.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/ExplodeBomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/FreeBomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/GameReset.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/Oled_Display.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/PixelControl.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/PixelDataControl.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/PlayerDeath.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/PlayerMovement.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/SevenSegDisplay.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/SquareTracker.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/StartingScreen.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/TriggerExplosion.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/Walls.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/WithinXY.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/buttonGate.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/endGame.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/flickerBomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/isColourPixel.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/master_tx.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderBomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderJones.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderJones0.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderJones1.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderJones2.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderJones3.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderWiz.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderWiz0.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderWiz1.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderWiz2.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/renderWiz3.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/slave_tx.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/staticBomb.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/uart_rx_new.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/uart_tx_new.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/var_clock.v}
  {C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/sources_1/new/BomberGameTopLevel.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/constrs_1/new/my_constraints.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/ASUS/OneDrive - National University of Singapore/Documents/EE2026/BomberMan.xpr/BomberMan/BomberMan.srcs/constrs_1/new/my_constraints.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top BomberGameTopLevel -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef BomberGameTopLevel.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file BomberGameTopLevel_utilization_synth.rpt -pb BomberGameTopLevel_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
