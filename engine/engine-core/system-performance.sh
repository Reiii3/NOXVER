new_core_engine() {
   case $ver in
      1.0 )
        core_1() {
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
         cmd settings put system air_motion_engine 0
         cmd settings put system master_motion 0
         cmd settings put system motion_engine 0
         devPL "[DEBUG] mode perdorma v1 succes actived"
        } # core 1 di gunakana untuk resource setprop
        core_1
      ;;
      1.2 )
        echo "mengaktifkan  mode performa pada version 1.2"
      ;;
      1.3 )
        echo "mengaktifkan  mode performa pada version 1.3"
      ;;
      1.4 )
        echo "mengaktifkan  mode performa pada version 1.4"
      ;;
   esac
}

new_core_engine_r() {
   case $ver in
      1.0 | 1.1 )
         core_1_r() {
            setprop debug.hwui.use_hint_manager ""
            setprop debug.hwui.disable_vsync ""
            setprop debug.hwui.disable_scissor_opt ""
            setprop debug.sf.disable_client_composition_cache ""
            setprop debug.sf.lag_adj ""
            setprop debug.sf.early_phase_offset_ns ""
            setprop debug.sf.early_app_phase_offset_ns ""
            setprop debug.hwui.use_buffer_age ""
            setprop debug.hwui.show_dirty_regions ""
            setprop debug.hwui.skip_empty_damage ""
            setprop debug.hwui.target_cpu_time_percent ""
            setprop debug.hwui.target_gpu_time_percent ""
            cmd settings put system air_motion_engine 1
            cmd settings put system master_motion 1
            cmd settings put system motion_engine 1
            devPL "[DEBUG] mode removed tweak v1 succes"
         }
         core_1_r
      ;;
      1.2 )
        echo "mengaktifkan  mode performa pada version 1.2"
      ;;
      1.3 )
        echo "mengaktifkan  mode performa pada version 1.3"
      ;;
      1.4 )
        echo "mengaktifkan  mode performa pada version 1.4"
      ;;
   esac
}