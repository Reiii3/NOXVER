core_1() {
   cmd package compile -m everything-profile -f "$line"
   cmd package compile -m quicken -f "$line"
   cmd package compile -m speed --secondary-dex -f "$line"
}

core_2() {
   setprop debug.hwui.use_hint_manager 1
   setprop debug.hwui.disable_vsync true
   setprop debug.hwui.disable_scissor_opt true
   setprop debug.sf.disable_client_composition_cache 1
   setprop debug.sf.lag_adj 0
   setprop debug.sf.early_phase_offset_ns 500000
   setprop debug.sf.early_app_phase_offset_ns 500000
   setprop debug.hwui.use_buffer_age false
   setprop debug.hwui.show_dirty_regions false
   setprop debug.hwui.skip_empty_damage true
   setprop debug.hwui.target_cpu_time_percent 100
   setprop debug.hwui.target_gpu_time_percent 100
} # core 1 di gunakana untuk resource setprop

