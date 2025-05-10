bin="/data/local/tmp"
engine="/data/local/tmp/nxver/engine"
local url_system_update="https://reiii3.github.io/NOXVER/engine/ui-system/update.sh"
prop_update="$bin/prop"
prop_stable="$bin/nxver/.noxUp"

. $engine

systenUp() {
   storm -rP "$bin" -s "${url_system_update}" -fn "prop" "$@"
   source $prop_update
   source $prop_stable
   
   if [[ $engineName == $nameEngine ]]; then
      echo "ini adalah versi yang paling baru"
   else
      echo "tersedia versi terbaru yaitu : $verU"
   fi
   rm $u_ver
   exit 0
}

main() {
   systenUp
}

main "$@"
