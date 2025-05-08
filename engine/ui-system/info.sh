$AXFUN
data="/data/local/tmp/nxver"
source_module="$data/.noxUp"
engine_module="$data/engine"
source_update="$data/.detecUpdate"

source $source_module
source $engine_module
source $source_update

echo
echo "     ┌══════════════════════════════════════┐"
printer "        information modules && new update"
echo "     └══════════════════════════════════════┘"
printer "                        ↓↓"
echo "   ==========================================="
echo -n "      version       : "
printer "$ver"
load 0.5
echo -n "      versionCode   : "
printer "$verc"
load 0.5
echo -n "      versionEngine : "
printer "$nameEngine"
load 0.5
if [[ "$noxUpdate" == true ]]; then
   echo -n "     AI-stats      : "
   printer "maintenance-server"
elif pgrep -f noxAI >/dev/null 2>&1; then
   echo -n "      AI-stats      : "
   printer "actived"
else
   echo -n "      AI-stats      : "
   printer "non-active"
fi
echo "   ==========================================="
echo