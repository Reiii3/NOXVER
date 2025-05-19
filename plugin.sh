bin="/data/local/tmmp"
module_engine="$bin/nxver/engine"
module_prop="$bin/nxver/.noxUp"

source $module_engine
source $module_prop

case $1 in 
   downscale | -down )
      echo "$pr Instalasi Downscale Game, please wait..."
      if [[ -z "$packageRun" ]]; then
           axprop $module_prop plugins -s "downscalePL"
       else
          axprop $module_prop plugins -s "$plugins | downscalePL"
       fi
   ;;
   * )
     echo
     echo "list pluginz : "
     echo " [1] Downscale : ax vex -down"
     echo " [2] Javex (sensi FF) : ax vex -jsvex"
     echo " [3] No Referensi : ...."
     echo 
     echo "notes : install satu-satu"
   ;;
esac