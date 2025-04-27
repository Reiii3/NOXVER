   IDLE_TIME=5
   bin="/data/local/tmp/nxver"
   engine="$bin/engine"
   gamerun=""
   notif_run=""
   
   . $engine
   
   ai_start() {
       setprop debug.hwui.renderer skiavk
       setprop debug.hwui.shadow.renderer skiavk
       cmd thermalservice override-status 0
       settings put global low_power 0
       cmd power set-adaptive-power-saver-enabled false
       cmd power set-fixed-performance-mode-enabled true
       cmd power set-mode 0
       setprop debug.renderengine.backend skiavk
       setprop debug.composition.type dyn
       setprop debug.hwui.render_dirty_regions false
       setprop debug.hwui.skia_atrace_enabled false
       setprop debug.qsg_renderer 0
       setprop debug.vulkan.layers ""
       setprop debug.cpurend.vsync false
       setprop debug.gpurend.vsync true
       dumpsys deviceidle force-idle
       dumpsys deviceidle step deep
       sleep 0.5
   }
   ai_op() {
     cmd settings put system high_performance_mode_on 0
     sleep 0.5
     cmd settings put system high_performance_mode_on 1
     cmd settings put system high_performance_mode_on_when_shutdown 1
   }
   ai_op_r() {
     cmd settings put system high_performance_mode_on 0
     cmd settings put system high_performance_mode_on_when_shutdown 0
   }
   ai_end() {
       setprop debug.hwui.renderer opengl
       setprop debug.hwui.shadow.renderer opengl
       cmd thermalservice override-status 1
       setprop debug.renderengine.backend opengl
       setprop debug.composition.type gpu
       setprop debug.hwui.render_dirty_regions true
       setprop debug.hwui.skia_atrace_enabled true
       setprop debug.qsg_renderer 0
       setprop debug.vulkan.layers ""
       setprop debug.cpurend.vsync true
       setprop debug.gpurend.vsync false
       dumpsys deviceidle unforce
       dumpsys deviceidle step active
       sleep 1
   }
   check_game() {
      game=$(storm "https://reiii3.github.io/Center-Module/core-system/Game.txt")
      file_update="/data/local/tmp/axeron_cash/update/noxUp"
      source "$file_update"
      detected_apps=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -o "$packageRun")
      render_detected=$(getprop debug.hwui.renderer)
      perfo1=$(echo "$tes_up" | grep -q "cmd settings put global high_performance_mode_on=1|0" && echo "$tes_up" grep -q "cmd settings put global high_performance_mode_on_when_shutdown=1|0")
         if [ -n "$detected_apps" ]; then
             if [ "$gamerun" != "running" ] || [ "$render_detected" != "skiavk" ]; then
                  ai_start
                  echo "DEBUG : Performance By Noxver Active"
                  if [ "$perfo" = true ]; then
                    ai_op
                    echo "DEBUG : Performance By oppo Active"
                  fi
                  gamerun="running"
             fi
             if [ "$notif_run" != "run" ]; then
               cmd notification post -S bigtext -t "NOXVER.AI RESPONSE" "nox_ai_status" \
                  "Game Mode : ON  Engine : v$ver.$nameEngine │ Status : Conected │ Developer : ReiiEja"
               am broadcast -a gvr.service.TOAST --es title "FOXVER AI" --es message "Performance Actived" --ei duration "3000"
               echo "DEBUG : Notif Performance Active"
                  notif_run="run"
             fi
              echo
              echo "DEBUG : Game sedang dimainkan: $detected_apps"
              echo "DEBUG : Render saat berada di dalam game: $(getprop debug.hwui.renderer)"
              echo "DEBUG : Status sekarang adalah : $gamerun"
              echo
              IDLE_TIME=3
          else
             if [ "$gamerun" != "stopped" ] || [ "$render_detected" != "opengl" ]; then
                  ai_end
                  echo "DEBUG : Performance By Noxver deactived"
                 if [ "$perfo" = true ]; then
                    ai_op_r
                    echo "DEBUG : Performance By oppo deactived"
                 fi
                  gamerun="stopped"
             fi
              if [ "$notif_run" != "stop" ]; then
               cmd notification post -S bigtext -t "NOXVER.AI RESPONSE" "nox_ai_status" \
               "Game Mode : OFF  Engine : v1.1.XIO │ Status : Conected │ Developer : ReiiEja"
                  am broadcast -a gvr.service.TOAST --es title "FOXVER AI" --es message "Performance Deactived" --ei duration "3000"
                  notif_run="stop"
               echo "DEBUG : Notif Performance deactive"
              fi
              echo
              echo "DEBUG : Tidak ada game yang berjalan"
              echo "DEBUG : Render saat berada di luar game: $(getprop debug.hwui.renderer)"
              echo "DEBUG : Status sekarang adalah : $gamerun"
              echo
              IDLE_TIME=5
         fi
   }
   
   while true; do
       echo 
       echo "DEBUG by looping : Loop berhasil dijalankan"
       check_game
       echo "DEBUG by looping : Loop akan berulang setiap ${IDLE_TIME} detik"
       echo "DEBUG by looping : status noti : $notif_run"
       echo "DEBUG by looping : status game : $gamerun"
       echo
       sleep "$IDLE_TIME"
   done
