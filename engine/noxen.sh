$AXFUN
url_prop="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/prop.sh"
bin_dev="/data/local/tmp/debug/nox-control"
export time=$(date "+%a %b %d %Y %H:%M %Z")
export orange="\e[38;2;188;61;0m" # AXERON - deffault color axeron
succes="\e[38;2;0;200;0m" # SUCCESS - Hijau Terang
error="\e[38;2;255;0;0m" # ERROR - Merah Terang
warning="\e[38;2;255;215;0m" # WARNING - Kuning Emas
info="\e[38;2;0;180;255m" # INFO - Biru Cerah
pending="\e[38;2;255;140;0m" # PENDING - Oranye Terang
debug="\e[38;2;160;160;160m" # DEBUG - Abu-abu Netral
notice="\e[38;2;153;50;204m" # NOTICE - Ungu Lembut
clean="\e[38;2;255;255;255m" # CLEAN - Putih Cerah
color_version="\e[38;2;100;180;255m" # Version
color_versionC="\e[38;2;70;130;180m" # VersionCode - Biru Netral
color_engine="\e[38;2;0;255;255m" # EngineName - Cyan/Aqua
color_dev="\e[38;2;180;100;255m" # Developer - Ungu Muda
export nwr="\e[0m"
export war="$warning[?]$nwr"
export in="$notice[!]$nwr"
export pr="$pending[-]$nwr"
export su="$succes[√]$nwr"
export ga="$warning[•]$nwr"

printer() {
text="$1"
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "${text:$i:1}"
 sleep 0.02
   i=$((i + 1))
 done
echo
echo
}
load() {
   sleep $1
}

devPL() {
   [[ -f "$bin_dev" ]] && source $bin_dev;
   [[ "$nox_debug" == true ]] && echo "$1"
}

brand_noxver() {
  local style="${1:-default}"

  case "$style" in
    cyber)
      echo -e "                     - \e[38;2;200;0;255mN\e[38;2;150;0;255mO\e[38;2;100;50;255mX\e[38;2;50;100;255mV\e[38;2;0;150;255mE\e[38;2;0;200;255mR\e[38;2;0;255;200m.\e[38;2;0;255;150mA\e[38;2;0;255;100mI\e[0m -"
      ;;
    aurora)
      echo -e "                     - \e[38;2;50;255;150mN\e[38;2;50;230;180mO\e[38;2;50;200;210mX\e[38;2;50;180;230mV\e[38;2;50;160;250mE\e[38;2;50;140;255mR\e[38;2;100;200;255m.\e[38;2;130;230;255mA\e[38;2;160;255;255mI\e[0m -"
      ;;
    monokrom)
      echo -e "                     - \e[38;2;160;160;160mN\e[38;2;170;170;170mO\e[38;2;180;180;180mX\e[38;2;190;190;190mV\e[38;2;200;200;200mE\e[38;2;210;210;210mR\e[38;2;220;220;220m.\e[38;2;230;230;230mA\e[38;2;240;240;240mI\e[0m -"
      ;;
    gold)
      echo -e "                     - \e[38;2;255;140;0mN\e[38;2;255;160;0mO\e[38;2;255;180;0mX\e[38;2;255;200;0mV\e[38;2;255;215;0mE\e[38;2;255;230;0mR\e[38;2;255;240;100m.\e[38;2;255;250;150mA\e[38;2;255;255;200mI\e[0m -"
      ;;
    dark)
      echo -e "                     - \e[38;2;80;0;80mN\e[38;2;60;0;100mO\e[38;2;50;0;120mX\e[38;2;40;0;140mV\e[38;2;30;0;160mE\e[38;2;20;0;180mR\e[38;2;10;0;200m.\e[38;2;0;0;220mA\e[38;2;0;0;240mI\e[0m -"
      ;;
    greenai)
      echo -e "                     - \e[38;2;0;255;100mN\e[38;2;0;230;120mO\e[38;2;0;200;140mX\e[38;2;0;170;160mV\e[38;2;0;140;180mE\e[38;2;0;110;200mR\e[38;2;0;80;220m.\e[38;2;0;60;240mA\e[38;2;0;40;255mI\e[0m -"
      ;;
    retro)
      echo -e "                     - \e[38;2;255;0;102mN\e[38;2;255;51;153mO\e[38;2;255;102;204mX\e[38;2;255;153;255mV\e[38;2;204;153;255mE\e[38;2;153;102;255mR\e[38;2;102;51;255m.\e[38;2;51;0;255mA\e[38;2;0;0;255mI\e[0m -"
      ;;
    ice)
      echo -e "                     - \e[38;2;180;255;255mN\e[38;2;160;240;255mO\e[38;2;140;220;255mX\e[38;2;120;200;255mV\e[38;2;100;180;255mE\e[38;2;80;160;255mR\e[38;2;60;140;255m.\e[38;2;40;120;255mA\e[38;2;20;100;255mI\e[0m -"
      ;;
    default|*)
      echo -e "                     - \e[38;2;0;255;255mNOX\e[38;2;0;150;255mVER.AI\e[0m -"
      ;;
  esac
}

gameRun() {
   reso="/data/local/tmp/nxver/.noxUp"
   game=$(storm "https://reiii3.github.io/Center-Module/core-system/Game.txt")
   package_list=$(cmd package list packages | cut -f 2 -d ":")
   source $reso
   compile() {
      cmd package compile -m everything-profile -f "$line"
      cmd package compile -m quicken -f "$line"
      cmd package compile -m speed --secondary-dex -f "$line"
      cmd package reconcile-secondary-dex-files "$line"
      cmd package compile --compile-layouts --secondary-dex -f "$line"
   }
   echo "$game" | while IFS= read -r line; do
       if [ -n "$line" ]; then
           if echo "$package_list" | grep -qx "$line"; then
             gameName=$(pkglist -L "$line")
               echo "           ｜Game Boosted : $gameName"
               compile >/dev/null 2>&1
               source $reso
             if [[ -z "$packageRun" ]]; then
                 axprop $reso packageRun -s "$line"
             else
                 axprop $reso packageRun -s "$packageRun|$line"
             fi
           fi
       fi
   done
}

gameRem() {
   game=$(storm "https://reiii3.github.io/Center-Module/core-system/Game.txt")
   package_list=$(cmd package list packages | cut -f 2 -d ":")
   compile() {
      cmd package compile -m verify -f "$line"
   }
   echo "$game" | while IFS= read -r line; do
       if [ -n "$line" ]; then
           if echo "$package_list" | grep -qx "$line"; then
            gameName=$(pkglist -L "$line")
               echo "           ｜Game Reboosted : $gameName"
               compile >/dev/null 2>&1
           fi
       fi
   done
}

cek_oppo_boost() {
   cek_oppo=$(settings list system | grep -qE "high_performance_mode_on|high_performance_mode_on_when_shutdown" && echo true || echo false)
   if "$cek_oppo"; then
     echo "            $su High performance supported"
     axprop $file_update sperfor true
     sperfor=true
   else
     echo "            $war High performance not support"
     axprop $file_update sperfor false
     sperfor=false
   fi
}

install_ai() {
   status=$(pgrep -f noxAI)
   if [ ! "$status" ]; then
       storm -rP "$bin" -s "${url_ai}" -fn "noxAI" "$@"
       nohup /data/local/tmp/noxAI >/dev/null 2>&1 &
       echo -n "     $in "
       printer "Instalation Program Succesfuly"
   fi
   sleep 2
   status=$(pgrep -f noxAI)
   if [ -z $insAI ]; then
     axprop $file_update insAi -s "$status"
     insAi=$status
   fi
   if [ "$status" ]; then
       echo "     $su ${ORANGE}Program berhasil terpasang${END}"
       am broadcast -a axeron.show.TOAST --es title "NOXVER.AI Instaled" --es msg "Developer : Reii" --ei duration "4000" >/dev/null 2>&1
   else
       echo "     $war Program failed: gagal"
   fi
}

reboot_ai() {
   reso="/data/local/tmp/nxver/.noxUp"
   echo
   echo "                 - REBOOT SYSTEM -"
   echo "$in menonaktifkan system ai"
   status=$(pgrep -f noxAI)
   if [[ $status ]]; then
      pkill -9 -f noxAI
      while pgrep -f noxAI >/dev/null; do
        echo "Menonaktifkan System AI"
        sleep 1
      done
   else
      echo "[DEBUG] gagal menonaktifkan system ai"
      exit 0
   fi
   load 2
   status=$(pgrep -f noxAI)
   if [[ ! $status ]]; then
      echo "$su system ai non-actived"
   else
      echo "$war system ai is actived"
      exit 0
   fi
   load 1
   echo "$in memulai ulang scan game"
   echo "$in menghapus terlebih dahulu daftar game lama, please wait.."
   echo
   gameRem
   if [[ ! -z $packageRun ]]; then
      axprop $reso packageRun ""
      axprop $reso insAi ""
   fi
   load 1
   echo
   echo "               - SCAN GAMES API NOXVER -"
   echo
   gameRun
   echo
   echo "$su successfully added all games"
   status=$(pgrep -f noxAI)
   if [[ ! $status ]]; then
      echo "$pr booting system ai, please wait..."
      install_ai
      echo "     $su reboot system successfully"
   else 
      echo "$war booting system failed"
   fi
   echo
}

installationUp() {
   storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
   bin="/data/local/tmp"
   engine_mcine="$bin/nxver/engine"
   prop_update="$bin/prop"
   prop_stable="$bin/nxver/.noxUp"

   source $prop_update
   source $prop_stable
   echo
   echo "[Online Update] connected"
   echo
   if [[ "$ver" != "$verU" ]] && [[ "$verc" != "$vercU" ]] && [[ "$nameEngine" != "$engineName" ]]; then
      if [[ "$version_release" = "R" ]] || [[ "$version_release" = "B" ]]; then
         sleep 1
         echo "  $pr update system starting"
         axprop $file_update ver -s "$verU"
         axprop $file_update verc -s $vercU
         axprop $file_update nameEngine -s "$engineName"
         axprop $file_update waktuUp -s "$time"
         axprop $file_update buildDate -s "$build"
         axprop $file_update notif_update false
         rm $engine
         sleep 1
         echo "  $su update succesfully"
         
         echo
         sleep 0.03
         echo " - New Information Modules -"
         echo "   - version : $verU New"
         echo "   - versionCode : $vercU New"
         echo "   - nameEngine : $engineName New"
         echo
         rm $prop_update
         [[ -f $engine_mcine ]] && rm $engine_mcine;
         exit 0
      elif [[ "$version_release" = "X" ]]; then
         if [[ "$akses_awal" = true ]]; then
            echo "  $pr update system starting"
            axprop $file_update ver -s "$verU"
            axprop $file_update verc -s $vercU
            axprop $file_update nameEngine -s "$engineName"
            axprop $file_update waktuUp -s "$time"
            axprop $file_update notif_update false
            sleep 1
            echo "  $su update succesfully"
            
            echo
            sleep 0.03
            echo " - New Information Modules -"
            echo "   - version : $verU Experimental"
            echo "   - versionCode : $vercU Experimental"
            echo "   - nameEngine : $engineName Experimental"
            echo
            rm $prop_update
            rm $engine_mcine
            exit 0
          else
            echo
            echo "           - Version Release Masih Experimental -"
            echo "            Hanya Developer Yang Mempunyai Akses"
            echo "         silahkan tunggu Version Release Stable/Beta"
            echo
            rm $prop_update
         fi
      fi
   else
      echo
      echo " - modules ini sudah terupdate ke versi terbaru sejak -"
      echo "               $waktuIn"
      echo
      rm $prop_update
      exit 0
   fi
}