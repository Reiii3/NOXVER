$AXFUN
data="/data/local/tmp/nxver"
source_module="$data/.noxUp"
engine_module="$data/engine"
source_update="/data/local/tmp/.detecUpdate"

os=$(getprop ro.build.version.release)
gpu=$(dumpsys SurfaceFlinger|grep GLES:|cut -f2 -d,)
chip=$(getprop ro.soc.manufacturer)
model=$(getprop ro.product.manufacturer)

status=$(pgrep -f noxAI)
source $source_module
source $engine_module

echo -n "┌$pr " && printer "Information NOXVER.AI - v1.0"
echo -n "├$pr " && printer "version        : ${ver:-null}"
echo -n "├$pr " && printer "version-code   : $verc"
echo -n "├$pr " && printer "version-engine : $nameEngine"
echo -n "├$pr " && printer "developer      : @ReiiEja - Telegram"
echo -n "└─┬$pr " && printer "build-date     : $buildDate"
echo -n "  ├$pr " && printer "last install   : ${perfIns:-null}"
echo -n "  ├$pr " && printer "last update    : ${waktuUp:-null}"
echo -n "  ├$pr " && printer "plugin install : ${plugins:-null}"
if pgrep -f noxAI >/dev/null 2>&1; then
   echo -n "┌─┴$pr " && printer "status AI      : actived"
else
   echo -n "┌─┴$pr " && printer "status AI      : deactived"
fi
echo -n "├$pr " && printer "Information Your Phone [•]"
echo -n "├$pr " && printer "android-version : $os"
echo -n "├$pr " && printer "chipset         : $chip"
echo -n "├$pr " && printer "gpu-chip        :$gpu"
echo -n "└$pr " && printer "model-brand     : $model"
echo