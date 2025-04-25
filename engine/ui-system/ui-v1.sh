$AXFUN
engine="/data/local/tmp/nxver/engine"
engine_system="/data/local/tmp/engine_core"
source $engine
source $engine_system
echo "Test ui v1 debug engine"
printer "selamat datang di ui v1"

if [[ -z "$perfIns" ]]; then
   core_1
   core_2
   axprop $engine perfIns -s "$time"
   rm "$engine_system"
   echo "DEBUG : Test setprop terinstall"
else
   echo "DEBUG : Setprop sudah terinstall"
fi
