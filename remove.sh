$AXFUN
bin="/data/local/tmp"
data="/data/local/tmp/nxver/engine"
local data_source="/storage/emulated/0/Android/data/com.fhrz.axeron/files/noxs"
data_res="/data/local/tmp/nxver/.noxUp"
data_ai="/data/local/tmp/noxAI"
local engine_system="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/engine-core/system-performance.sh"
local engine_core="/data/local/tmp/engine_system"
source "$data"
source "$data_res"
if [[ ! -z "$perfIns" ]]; then
    storm -rP "$bin" -s "${engine_system}" -fn "engine_system" "$@"
    dePL "[DEBUG] instalasi engine_system"
fi
sleep 1
[[ -f "$engine_core" ]] && source $engine_core || dePL '$engine_core not detected'


#---------------- main ui modules-----------------
echo
brand_noxver ice
load "1"
echo "           ================================="
echo "           │ Remove performance && AI api  │"
echo "           ================================="
echo
new_core_engine_r "$@"
gameRem
load 1
axprop "$data_res" perfIns -s ""
axprop "$data_res" packageRun -s ""
axprop "$data_res" insAi -s ""
axprop $data_res nameGame -s ""
load 1.5
rm -rf $data
rm $data_ai
rm $engine_core
rm $data_source
load 1
status=$(pgrep -f noxAI)
if [[ "$status" ]]; then
   pkill -f "/data/local/tmp/noxAI"
fi
load 1 
echo -n "       $su "
printer "Uninstall system modules succesfuly"
echo

