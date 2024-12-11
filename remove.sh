if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi

$AXFUN
import axeron.prop
wr="\e[38;2;188;61;0m"
nwr="\e[0m"

echo
sleep 0.5
sleep 1
echo "                 ⟨⟨INFORMATION MODULES⟩⟩"
echo "${wr}        ┌═══════════════════════════════════════┐${nwr}"
sleep 1
echo "${wr}            source  : @Reiieja${nwr}"
sleep 1
echo "${wr}            Dev     : ${author}${nwr}"
sleep 1
echo "${wr}            update  : ${version} | ${versionCode}${nwr}"
sleep 1
echo "${wr}            modules : online${nwr}"
sleep 1
if [ -z "$user" ]; then 
   echo "${wr}            user    : username is not detected${nwr}"
else 
   echo "${wr}            user    : ${user}${nwr}"
fi
sleep 1
echo "${wr}        └═══════════════════════════════════════┘${nwr}"
sleep 1
echo
sleep 1
echo "Status       : Removing"
sleep 0.5 
echo "Game Removed : ${runPackage}"
sleep 1
echo "───────────────────────────────────────────────────────"
#// Unistaler By Reii
            setprop debug.sf.hw 0
            setprop debug.egl.hw 0
            setprop debug.egl.sync 1
            setprop debug.cpuprio 5
            setprop debug.gpuprio 5
            setprop debug.ioprio 5
            setprop debug.performance.tuning 0
            setprop debug.performance.profile 0
            setprop debug.performance.force false
            setprop debug.power.profile medium
            setprop debug.performance_schema 0
            setprop debug.multicore.processing 0
            setprop debug.systemuicompilerfilter balanced
            performance=false
            setprop debug.composition.type cpu
            setprop debug.hwui.renderer opengl
            cmd power set-fixed-performance-mode-enabled false > /dev/null 2>&1
            cmd power set-adaptive-power-saver-enabled true > /dev/null 2>&1
            cmd power set-mode 1 > /dev/null 2>&1
            cmd package compile -m verify -f ${runPackage2} > /dev/null 2>&1
  echo "[${runPackage}] Removing Succesfuly"
  echo "Next Remove Redionpl If installed"
echo "──────────────────────────────────────────────────────"
echo "                Thank you for using my module"