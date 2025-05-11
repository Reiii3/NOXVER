bin="/data/local/tmp"
engine="/data/local/tmp/nxver/engine"
url_prop="https://reiii3.github.io/NOXVER/engine/prop.sh"
prop_update="$bin/prop"
prop_stable="$bin/nxver/.noxUp"

. $engine

systemCecking() {
   storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
   source $prop_update
   source $prop_stable
   
   if [[ $engineName == $nameEngine ]]; then
      echo
      echo "[Information] sudah menggunakan versi yang paling baru"
      echo
   else
      echo
      echo "[Information] tersedia versi terbaru yaitu : $verU"
      echo
   fi
   rm $prop_update
}

main() {
   systemCecking
}

main "$@"
