if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi

$AXFUN
import axeron.prop


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
echo "${wr}            update  : ${version}${nwr}"
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
echo "Status : Removing"
sleep 1
echo "───────────────────────────────────────────────────────"""
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
            performance=true
            setprop debug.composition.type cpu
            setprop debug.hwui.renderer opengl
            cmd power set-fixed-performance-mode-enabled false
            cmd power set-adaptive-power-saver-enabled true
            cmd power set-mode 1
  echo "[${runPackage}] Removing Succesfuly"
  echo "Next Remove Redionpl If installed"
echo "──────────────────────────────────────────────────────"
echo "                Thank you for using my module"