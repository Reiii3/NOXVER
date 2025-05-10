bin="/data/local/tmp"
engine="/data/local/tmp/nxver/engine"
url_prop="https://reiii3.github.io/NOXVER/engine/prop.sh"
prop_update="$bin/prop"
prop_stable="$bin/nxver/.noxUp"

. $engine

systenUp() {
   storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
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
