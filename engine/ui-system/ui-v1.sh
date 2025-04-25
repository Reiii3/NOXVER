engine="/data/local/tmp/nxver/engine"
engine_core="/data/local/tmp/nxver/engine_system"
source $engine
source $engine_core
echo "Test ui v1 debug engine"
printer "selamat datang di ui v1"

if [[ -z "$perfIns" ]]; then
   core_1
   core_2
   axprop $engine perfIns -s "$time"
   rm "$engine_core"
   echo "DEBUG : Test setprop terinstall"
else
   echo "DEBUG : Setprop sudah terinstall"
fi
