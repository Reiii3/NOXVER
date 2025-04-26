$AXFUN
import axeron.prop
data="/data/local/tmp/nxver/engine"
data_res="/data/local/tmp/axeron_cash/update/nosUp"
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
rm -rf $data
