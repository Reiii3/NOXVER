$AXFUN
data="/data/local/tmp/nxver"
source_module="$data/.noxUp"
engine_module="$data/engine"

source $source_module
source $engine_module

echo
echo "   ┌══════════════════════════════════════┐"
echo "      information modules && new update"
echo "   └══════════════════════════════════════┘"
printer "                   ↓↓"
echo "==========================================="
echo -n "   version       : "
printer "$ver"
load 0.5
echo -n "   versionCode   : "
printer "$verc"
load 0.5
echo -n "   versionEngine : "
printer "$nameEngine"
load 0.5
echo "==========================================="
echo