$AXFUN
devmode=false
export time=$(date "+%a %b %d %Y %H:%M %Z")
export wr="\e[38;2;188;61;0m"
export nwr="\e[0m"
export war="[?]"
export in="[!]"
export pr="[-]"
export su="[√]"

printer() {
text="$1"
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "${text:$i:1}"
 sleep 0.02
   i=$((i + 1))
 done
echo
}

load() {
   sleep $1
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
   }
   echo "$game" | while IFS= read -r line; do
       if [ -n "$line" ]; then
           if echo "$package_list" | grep -qx "$line"; then
             gameName=$(pkglist -L "$line")
               echo "        ｜Game Boosted : $gameName"
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
     echo "          $su High performance supported"
     axprop $file_update sperfor -s true
     sperfor=true
   else
     echo "          $war High performance not support"
     axprop $file_update sperfor -s false
     sperfor=false
   fi
}

install_perff() {
   reso="/data/local/tmp/nxver/.noxUp"
   engine_system="/data/local/tmp/engine_core"
   source $reso
   if [[ -f $engine_system ]]; then
      source $engine_system
   fi
   sleep 1
   if [[ -z "$perfIns" ]]; then
      axprop $reso perfIns -s "$time"
      rm "$engine_system"
    fi
}

install_ai() {
   status=$(pgrep -f noxAI)
   if [ ! "$status" ]; then
       storm -rP "$bin" -s "${url_ai}" -fn "noxAI" "$@"
       nohup /data/local/tmp/noxAI >/dev/null 2>&1 &
       printer "$in Instalation Program Succesfuly"
   fi
   sleep 2
   status=$(pgrep -f noxAI)
   if [ -z $insAI ]; then
     axprop $file_update insAi -s "$status"
     insAi=$status
   fi
   if [ "$status" ]; then
       echo "${ORANGE}$su Program berhasil terpasang${END}"
       am broadcast -a axeron.show.TOAST --es title "NOXVER.AI Instaled" --es msg "Developer : Reii" --ei duration "4000" >/dev/null 2>&1
   else
       echo "$war Program failed: gagal"
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
   echo 
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
   echo "                - SCAN GAMES API NOXVER -"
   echo
   gameRun
   echo
   echo "$su successfully added all games"
   status=$(pgrep -f noxAI)
   if [[ ! $status ]]; then
      echo "$pr booting system ai, please wait..."
      install_ai
      echo "$su reboot system successfully"
   else 
      echo "gagal"
   fi
   echo
}