export devmode=true
export time=$(date "+%a %b %d %Y %H:%M %Z")
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
   status=$(pgrep -f ai-system)
   if [ ! "$status" ]; then
       storm -rP "$bin" -s "${url_ai}" -fn "ai-system" "$@"
       nohup sh /data/local/tmp/ai-system >/dev/null 2>&1 &
       printer "$in Instalation Program Succesfuly"
   fi
   sleep 2
   status=$(pgrep -f ai-system)
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