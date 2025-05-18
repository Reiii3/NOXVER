$AXFUN
data="/data/local/tmp/nxver"
source_module="$data/.noxUp"
engine_module="$data/engine"
source_update="/data/local/tmp/.detecUpdate"
status=$(pgrep -f noxAI)
source $source_module
source $engine_module

echo -n "┌$pr " && printer "Information NOXVER.AI - v1.0"
echo -n "├$pr " && printer "version : ${ver:-null}"
echo -n "├$pr " && printer "version-code : $verc"
echo -n "├$pr " && printer "version-engine : $nameEngine"
echo -n "├$pr " && printer "developer : @ReiiEja - Telegram"
echo -n "└┬$pr " && printer "build-date : $buildDate"
echo -n " ├$pr " && printer "last install : ${perfIns:-null}"
echo -n " ├$pr " && printer "last update : $waktuUp"
echo -n " ├$pr " && printer "plugin install : ${plugins:-null}"
if pgrep -f noxAI >/dev/null 2>&1; then
   echo -n " └$pr " && printer "status AI : actived"
else
   echo -n " └$pr " && printer "status AI : deactived"
fi
echo