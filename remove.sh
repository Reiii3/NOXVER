$AXFUN
import axeron.prop
data="/data/local/tmp/nxver/engine"
data_res="//data/local/tmp/nxver/.noxUp"
data_ai="/data/local/tmp/noxAI"
source "$data"
source "$data_res"


echo
echo "========================================="
echo "   Test Removed && Debug Engine System"
echo "========================================="

printer "DEBUG : Test Function [printer]"
echo "DEBUG : Test Function [time] $time"
echo "DEBUG : Tes Function [gameRem]"
gameRem
axprop "$data_res" perfIns -s ""
axprop "$data_res" packageRun -s ""
rm -rf $data
rm $data_ai
status=$(pgrep -f noxAI)
if [[ "$status" ]]; then
   pkill -f "/data/local/tmp/noxAI"
fi
