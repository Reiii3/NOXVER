module_engine="/data/local/tmp/nxver/engine"
module_prop="/data/local/tmp/nxver/.noxUp"
soc=$(getprop ro.soc.manufacturer)

source $module_prop
source $module_engine

new_core_engine() {
  dePL "[DEBUG] function new_core_engine"
  dePL "[DEBUG] version : $ver"
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
         dePL "[DEBUG] mode performa v1 succes actived"
        } # core 1 di gunakana untuk resource setprop
        core_1 >/dev/null 2>&1
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
            cmd display ab-logging-disable
            cmd display dwb-logging-disable
            cmd display dmd-logging-disable
            cmd looper_stats disable
           
           dePL "[DEBUG] mode performa v1.2 succes actived"
       }
        core_1 >/dev/null 2>&1
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
            cmd display ab-logging-disable
            cmd display dwb-logging-disable
            cmd display dmd-logging-disable
            cmd looper_stats disable
            
         #--------------------New Update-------------------- # v1.3
          
           setprop persist.log.tag "" 
           logcat -c
           logcat --wrap
           setprop debug.cpuprio 7
           setprop debug.gpuprio 7
           setprop debug.ioprio 7
           setprop debug.sf.gpu_freq_index 7
           setprop debug.sf.cpu_freq_index 7
           setprop debug.sf.mem_freq_index 7
           setprop debug.performance_schema 1
           setprop debug.performance.force true
           setprop debug.performance.tuning 1
           if [[ "$soc" == "Mediatek" ]]; then
             setprop debug.mediatek.appgamepq_compress 1
             setprop debug.mediatek.disp_decompress 1
             setprop debug.mediatek.appgamepq 2
             setprop debug.mediatek.game_pq_enable 1
             setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 119
             dePL "[DEBUG] Chipset terdeteksi $soc"
           elif [[ "$soc" == "Qualcom" ]]; then
             setprop debug.qti.am.resource.type "super-large"
             setprop debug.qc.hardware "true"
             setprop debug.qctwa.statusbar "1"
             setprop debug.qctwa.preservebuf "1"
             dePL "[DEBUG] Chipset terdeteksi $soc"
           fi
           dePL "[DEBUG] CPU : $soc"
           dePL "[DEBUG] mode performa v1.3 succes actived"
       }
       core_1 >/dev/null 2>&1
      ;;
      1.4 )
        dePL "mengaktifkan  mode performa pada version 1.4"
      ;;
      * ) # cek kompotibel version
       dePL "    [DEBUG] version anda tidak kompotibel : v$ver"
      ;;
   esac
}

new_core_engine_r() {
   dePL "[DEBUG] function new_core_engine"
   dePL "[DEBUG] version : $ver"
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
            dePL "[DEBUG] mode removed tweak v1 succes"
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
            dePL "[DEBUG] mode removed tweak v1.2 succes"
        }
       core_1_r
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
            setprop debug.gpuprio 5
           setprop debug.ioprio 5
           setprop debug.sf.gpu_freq_index 5
           setprop debug.sf.cpu_freq_index 5
           setprop debug.sf.mem_freq_index 5
           setprop debug.performance_schema 0
           setprop debug.performance.force false
           setprop debug.performance.tuning 0
           if [[ "$soc" == "Mediatek" ]]; then
             setprop debug.mediatek.appgamepq_compress 0
             setprop debug.mediatek.disp_decompress 0
             setprop debug.mediatek.appgamepq 0
             setprop debug.mediatek.game_pq_enable 0
             setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 60
             dePL "[DEBUG] Chipset terdeteksi $soc"
           elif [[ "$soc" == "Qualcom" ]]; then
             setprop debug.qti.am.resource.type super-large
             setprop debug.qc.hardware false
             setprop debug.qctwa.statusbar 0
             setprop debug.qctwa.preservebuf 0
             
             dePL "[DEBUG] Chipset terdeteksi $soc"
           fi
            dePL "[DEBUG] mode removed tweak v1.3 succes"
        }
        core_1_r
      ;;
      1.4 )
        dePL "mengaktifkan  mode performa pada version 1.4"
      ;;
      * ) # cek kompotibel version
       dePL "    [DEBUG] version anda tidak kompotibel : v$ver"
      ;;
   esac
}