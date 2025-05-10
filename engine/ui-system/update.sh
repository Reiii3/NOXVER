engine="/data/local/tmp/nxver/engine"
. $engine

systenUp() {
   storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
   source $u_ver
   source $file_update
   
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
