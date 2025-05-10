$AXFUN
bin="/data/local/tmp/"
data="/data/local/tmp/nxver/engine"
data_res="/data/local/tmp/nxver/.noxUp"
data_ai="/data/local/tmp/noxAI"
local engine_system="https://reiii3.github.io/NOXVER/engine/engine-core/system-performance.sh"
local engine_core="/data/local/tmp/engine_system"
storm -rP "$bin" -s "${engine_system}" -fn "engine_system" "$@"

source "$engine_core"
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
core_1_r
gameRem
load 1
axprop "$data_res" perfIns -s ""
axprop "$data_res" packageRun -s ""
axprop "$data_res" insAi -s ""
load 1.5
rm -rf $data
rm $data_ai
rm $engine_core
load 1
status=$(pgrep -f noxAI)
if [[ "$status" ]]; then
   pkill -f "/data/local/tmp/noxAI"
fi
load 1 

printer "       $su Uninstall system modules succesfuly"
echo

