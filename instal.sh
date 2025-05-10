# == SOURCE GLOBAL ==
$AXFUN
local data="/data/local/tmp/nxver"
local url="https://reiii3.github.io/NOXVER/engine/noxen.sh"
local bin="/data/local/tmp"
local cashup="/data/local/tmp/nxver"
local nox_bin="$bin/nvxer"
local url_detect="https://reiii3.github.io/Center-Module/update/nox-update.sh"
local url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
local run_update="https://reiii3.github.io/NOXVER/engine/ui-system/ui-maintenance.sh"
local url_prop="https://reiii3.github.io/NOXVER/engine/prop.sh"
local url_ui="https://reiii3.github.io/NOXVER/engine/ui-system/ui-v1.sh"
local url_ai="https://reiii3.github.io/NOXVER/engine/engine-core/nox-ai.sh"
local url_info="https://reiii3.github.io/NOXVER/engine/ui-system/info.sh"
local engine_system="https://reiii3.github.io/NOXVER/engine/engine-core/system-performance.sh"
local url_core="https://reiii3.github.io/NOXVER/user/developer.txt"
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
import axeron.prop
local update="$bin/.detecUpdate"
local file_update="$cashup/.noxUp"
local fun="$nox_bin/function"
local engine="$data/engine"
local engine_core="$data/engine_system"
local bin_dev="$bin/debug/nox-control"
local stor_ax="$bin/axeron_cash/Vex/response"
local stor_ins="$bin/axeron_cash/Vex/instal"
local u_ver="$bin/prop"

# // FUNGSI : Menambahkan file penting seperti engine san yang lain
setup_file_awal() {
   if [ ! -d $data ]; then
     mkdir -p "$data"
   fi
   if [[ ! -f $engine ]]; then
     storm -rP "$data" -s "${url}" -fn "engine"
   fi
   source $engine
   [[ -f "$bin_dev" ]] && source $bin_dev;
   if [[ ! -f $file_update ]]; then
     echo "# Dont Change It" > "$file_update"
     axprop $file_update ver -s "null"
     axprop $file_update verc -s "null"
     axprop $file_update nameEngine -s "null"
     axprop $file_update packageRun -s ""
     axprop $file_update nameGame -s ""
     axprop $file_update status -s "maintenance"
     axprop $file_update notif false
     axprop $file_update sperfor -s "null"
     axprop $file_update waktuUp -s "null"
     axprop $file_update waktuIn -s "null"
     axprop $file_update insUp true
     axprop $file_update perfIns -s ""
     axprop $file_update insAi -s ""
   fi
}

dev_selection() {
   case $1 in 
      -debug )
        axprop $bin_dev nox_debug true
        nox_debug=true
        if [[ "$nox_debug" == true ]]; then
           echo "Welcome Developer Debug mode On"
          else
           echo "See you Developer Debug mode off"
        fi
      ;;
      -user )
        axprop $bin_dev nox_debug false
        nox_debug=false
        if [[ "$nox_debug" == true ]]; then
           echo "Welcome Developer Debug mode On"
          else
           echo "See you Developer Debug mode off"
        fi

      ;;
   esac
}

# // url_detect ini adalah fungsi utama dari fungsi maintenance di dalam nya ada variabel bernama noxUpdate jika isi variabel adala true maka syatem maintenance akan berkerja dan juga sebaliknya jika variabel berisi false maka system maintenance akan mati
detected_update() {
   storm -rP "$bin" -s "${url_detect}" -fn ".detecUpdate"
   . $update
   . $file_update
   
   if [[ "$noxUpdate" == true ]]; then
      axprop $file_update status -s "maintenance"
      axprop $file_update notif -s false
      axprop $file_update insUp -s false
   fi
}

# FUNGSI : digunakan untuk par developer untuk debugger pada saat system sedang maintenance
developer_mode() {
   if [[ "$nox_debug" == true ]]; then
     id_dev=$(storm "$url_core")
   fi
   akses_awal=$(echo "$id_dev" | grep -q "$AXERONID" && echo true || echo false)
   if [[ -f "$bin_dev" ]]; then
      if [[ $akses_awal = true ]]; then
        echo "DEBUG : developer_mode sedang di jalankan"
      else
        echo "DEBUG : developer_mode sedang tidak di jalankan"
      fi
   fi
}

panel_info() {
   case $1 in
   --info | -i )
      storm -x "${url_info}" "ui"
      [ -f "$stor_ax" ] && rm "$stor_ax"
      exit 0
   ;;
   --reboot_ai | -aR )
      reboot_ai
      exit 0
   ;;
   esac
}

# FUNGSI : untuk mengupdate system ke version terbaru
run_update_versiom() {
   if [[ "$noxUpdate" == false ]]; then
     if [[ "$insUp" == false ]]; then
         . $u_ver
         sleep 1
         echo "  $pr update system starting"
         axprop $file_update ver -s "$verU"
         axprop $file_update verc -s $vercU
         axprop $file_update nameEngine -s "$engineName"
         axprop $file_update waktuIn -s "$time"
         axprop $file_update status -s "done"
         axprop $file_update insUp -s true
         sleep 1
         echo "  $su update succesfully"
         
         echo
         sleep 0.03
         echo " - New Information Modules -"
         echo "   - version : $verU New"
         echo "   - versionCode : $vercU New"
         echo "   - nameEngine : $engineName New"
         echo
         rm $u_ver
         rm $update
         exit 0
      else
         echo
         echo " - modules ini sudah terupdate ke versi terbaru sejak -"
         echo "             $waktuIn"
         echo
         exit 0
      fi
   else 
      echo
      echo "  - silahkan tunggu maintenance selesai -"
      echo
      exit 0
   fi
}

# FUNGSI : berfungsi untuk Menginstall versi terbaru pada saat pertama kali menggunakan modules
first_run() {
   if [[ "$ver" = "null" ]] && [[ "$verc" = "null" ]]; then
    if [[ "$noxUpdate" == false ]]; then
      storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
      sleep 1 
      . $u_ver
      echo "       - [initializing system] -"
      sleep 1.5
      echo "      Welcome to NOXVER.AI Modules"
      echo
      echo "  $in Menginstall system modules.."
      sleep 1 
      axprop $file_update ver -s "$verU"
      axprop $file_update verc -s $vercU
      axprop $file_update status -s "done"
      axprop $file_update waktuIn -s "$time"
      axprop $file_update nameEngine -s "$engineName"
      sleep 1 
      echo "  $su Instalation succesfully"
      echo 
      echo "==============================="
      echo "    Information Instalation"
      echo "==============================="
      echo "  version : $verU"
      echo "  versionCode : $vercU"
      echo "  engine : $engineName"
      echo "==============================="
      echo
      rm $u_ver
      exit 0
      else
      echo 
      echo " [system sedang maintenance silahkan tunggu sampai selesai]"
      echo 
      axprop $file_update ver -s "1.0"
      axprop $file_update verc -s 11
      exit 0
    fi
   fi
}

# fungsi : digunakan untuk menampilkan info bahwa syatem sudah di update keversion terbaru
run_notif() {
   if [[ "$status" == "done" ]]; then
      if [[ "$notif" = false ]]; then
         echo
         echo "    [update ke version $ver | $verc | $nameEngine New]"
         echo "    [Di install pada $waktuIn]"
         axprop $file_update notif -s true
         echo
      fi
   fi
}

# fungsi ; ini adalah system maintenance
run_maintrnance() {
   if [[ "$akses_awal" == false ]]; then
     if [[ "$status" == "maintenance" ]]; then
        storm -x "${run_update}" "maintenance"
        rm $stor_ax
        if [[ "$noxUpdate" == true ]]; then
           echo "info : $info"
         else
           echo "info : update terbaru sudah siap, silahkan update"
           echo "exec : ax vex -update"
           storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
        fi
        rm $update
        exit 0
     fi
   fi
}

# FUNGSI : running all system && performa fitures
run_ui() {
   echo
   if [[ -z "$perfIns" ]]; then
      storm -rP "$bin" -s "${engine_system}" -fn "engine_core" "$@"
   fi
   sleep 1
   storm -x "${url_ui}" "ui"
   if [[ -z "$perfIns" ]]; then
      install_perff
      cek_oppo_boost
      echo
      echo "          =================================="
      echo "             Auto Scan Game For AI NOXVER"
      echo "          =================================="
      gameRun
      echo "          =================================="
      install_ai
   else
      printer "           - system sudah terinstall -"
      printer "                    - Reii -"
   fi
   [ -f "$stor_ax" ] && rm "$stor_ax"
   rm $stor_ins
   echo
}


#--------------MAIN MODULES INSTALATION-------------
main() {
   setup_file_awal
   dev_selection "$@"
   detected_update
   developer_mode 
   panel_info "$@"
   
   case $1 in 
     -update )
      run_update_versiom
      ;;
   esac
   
   first_run
   run_notif
   run_maintrnance
   run_ui
  
}

main "$@"