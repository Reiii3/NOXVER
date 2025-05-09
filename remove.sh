$AXFUN
import axeron.prop
data="/data/local/tmp/nxver/engine"
data_res="//data/local/tmp/nxver/.noxUp"
data_ai="/data/local/tmp/noxAI"
source "$data"
source "$data_res"


#---------------- main ui modules-----------------
echo
printer "                  - NOXVER.AI -"
load "1"
echo "         ================================="
echo "         │ Remove performance && AI api  │"
echo "         ================================="
echo 
gameRem
axprop "$data_res" perfIns -s ""
axprop "$data_res" packageRun -s ""
axprop "$data_res" insAi -s ""
rm -rf $data
rm $data_ai
status=$(pgrep -f noxAI)
if [[ "$status" ]]; then
   pkill -f "/data/local/tmp/noxAI"
fi
