$AXFUN
res="/data/local/tmp/axeron_cash/update/noxUp"
engine="/data/local/tmp/nxver/engine"
engine_system="/data/local/tmp/engine_core"
source $engine
if [[ -f $engine_system ]]; then
   source $engine_system
fi
source $res
echo "Test ui v1 debug engine"
printer "selamat datang di ui v1"
echo
echo "=============================="
echo "   TEST UI && PERF FUNCTION"
echo "=============================="
echo
if [[ -z "$perfIns" ]]; then
   axprop $res perfIns -s "$time"
   rm "$engine_system"
   echo "DEBUG : Test setprop terinstall"
else
   echo "DEBUG : Setprop sudah terinstall"
fi
