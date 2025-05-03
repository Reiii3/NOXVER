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
echo -n "   versionCode   : "
printer "$verc"
echo -n "   versionEngine : "
printer "$nameEngine"
echo "==========================================="
echo