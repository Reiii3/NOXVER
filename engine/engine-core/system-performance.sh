new_core_engine() {
   case $ver in
      1.0 | 1.1 ) # versi 1.0 - 1.1
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
         devPL "[DEBUG] mode performa v1 succes actived"
        } # core 1 di gunakana untuk resource setprop
        core_1
      ;;
      1.2 ) # versi 1.2
       core_1() {
            # configurasi system versi 1.0 - 1.1
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
            
          #-------------------New Update------------------- # v1.2
         
          # power hint cpu cluster by (@reljawa)
           setprop debug.cluster_little-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_min_freq)
           setprop debug.cluster_big-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq)
           setprop debug.powehint.cluster_little-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_min_freq)
           setprop debug.powehint.cluster_big-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq)
           am memory-factor set CRITICAL
           cmd shortcut reset-throttling
           cmd shortcut reset-all-throttling
         # high priority & disable loogging
            settings put global activity_starts_logging_enabled 1
            settings put secure high_priority 0
         # clear cache 
            cmd stats clear-puller-cache
            cmd activity clear-debug-app
            cmd activity clear-watch-heap -a
            cmd stats print-logs 0 # <- root required
            cmd display ab-logging-disable
            cmd display dwb-logging-disable
            cmd display dmd-logging-disable
            cmd looper_stats disable
           
           devPL "[DEBUG] mode performa v1.2 succes actived"
       }
      ;;
      1.3 ) # versi 1.3
       core_1() {
         # configurasi system versi 1.0 - 1.1
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
            
         #-------------------New Update------------------- # v1.2
          
         # power hint cpu cluster by (@reljawa)
           setprop debug.cluster_little-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_min_freq)
           setprop debug.cluster_big-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq)
           setprop debug.powehint.cluster_little-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_min_freq)
           setprop debug.powehint.cluster_big-set_his_speed $(cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq)
           am memory-factor set CRITICAL
           cmd shortcut reset-throttling
           cmd shortcut reset-all-throttling
         # high priority & disable loogging
            settings put global activity_starts_logging_enabled 1
            settings put secure high_priority 0
         # clear cache 
            cmd stats clear-puller-cache
            cmd activity clear-debug-app
            cmd activity clear-watch-heap -a
            cmd stats print-logs 0 # <- root required
            cmd display ab-logging-disable
            cmd display dwb-logging-disable
            cmd display dmd-logging-disable
            cmd looper_stats disabl
            
         #--------------------New Update-------------------- # v1.3
          
           setprop persist.log.tag "" 
          
           devPL "[DEBUG] mode performa v1.3 succes actived"
       }
      ;;
      1.4 )
        devPL "mengaktifkan  mode performa pada version 1.4"
      ;;
      * ) # cek kompotibel version
       devPL "    [DEBUG] version anda tidak kompotibel : v$ver"
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
        core_1_r() {
           # configurasi versi 1.0 - 1.1 
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
           #--------------------New Update--------------------- # v1.2
            settings put global activity_starts_logging_enabled 1
            settings put secure high_priority 0
            cmd display ab-logging-enable
            cmd display dwb-logging-enable
            cmd display dmd-logging-enable
            cmd looper_stats reset
            am memory-factor reset
            devPL "[DEBUG] mode removed tweak v1.2 succes"
        }

      ;;
      1.3 )
        core_1_r() {
           # configurasi versi 1.0 - 1.1 
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
           #--------------------New Update--------------------- # v1.2
            settings put global activity_starts_logging_enabled 1
            settings put secure high_priority 0
            cmd display ab-logging-enable
            cmd display dwb-logging-enable
            cmd display dmd-logging-enable
            cmd looper_stats reset
            am memory-factor reset
           #--------------------New Update--------------------- # v1.3
            
            devPL "[DEBUG] mode removed tweak v1.3 succes"
        }
      ;;
      1.4 )
        devPL "mengaktifkan  mode performa pada version 1.4"
      ;;
      * ) # cek kompotibel version
       devPL "    [DEBUG] version anda tidak kompotibel : v$ver"
      ;;
   esac
}