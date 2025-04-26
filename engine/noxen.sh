$AXFUN
export devmode=true
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

gameRun() {
   reso="/data/local/tmp/axeron_cash/update/noxUP"
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
               echo "｜Game Boosted : $gameName"
               compile >/dev/null 2>&1
               add_package() {
                   if [ -z "$packageRun" ]; then
                       axprop $reso packageRun -s "$line"
                   else
                       axprop $reso packageRun -s "$pakageRun|$line"
                   fi
               }
              add_package
           fi
       fi
   done
}

gameRem() {
   game=$(storm "https://reiii3.github.io/Center-Module/core-system/Game.txt")
   package_list=$(cmd package list packages | cut -f 2 -d ":")
   compile() {
      cmd package compile --reset "$line"
   }
   echo "$game" | while IFS= read -r line; do
       if [ -n "$line" ]; then
           if echo "$package_list" | grep -qx "$line"; then
            gameName=$(pkglist -L "$line")
               echo "｜Game Reboosted : $gameName"
               compile >/dev/null 2>&1
           fi
       fi
   done
}

install_perff() {
   reso="/data/local/tmp/axeron_cash/update/noxUp"
   engine_system="/data/local/tmp/engine_core"
   source $reso
   if [[ -f $engine_system ]]; then
      source $engine_system
   fi
   sleep 1
   if [[ -z "$perfIns" ]]; then
      axprop $reso perfIns -s "$time"
      rm "$engine_system"
      echo "DEBUG : Test setprop terinstall"
   else
      echo "DEBUG : Setprop sudah terinstall"
    fi
}

install_ai() {
   status=$(pgrep -f noxAI)
   if [ ! "$status" ]; then
       storm -rP "$bin" -s "${url_ai}" -fn "noxAI" "$@"
       nohup sh /data/local/tmp/noxAI > /sdcard/log.txt
       printer "$in Instalation Program Succesfuly"
   fi
   sleep 2
   status=$(pgrep -f noxAI)
   if [ -z $pid_ins ]; then
     axprop $file_update insAi -s "$status"
     insAi=$status
   fi
   if [ "$status" ]; then
       echo "${ORANGE}$su Program berhasil terpasang${END}"
       am broadcast -a axeron.show.TOAST --es title "FOXVER Instaled" --es msg "Developer : Reii" --ei duration "4000" >/dev/null 2>&1
   else
       echo "$war Program failed: gagal"
   fi
}