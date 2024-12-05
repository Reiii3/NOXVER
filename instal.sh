if [ $AXERON = false ]; then
	echo "Only Support in Laxeron"
fi

$AXFUN
import axeron.prop
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
wr="\e[38;2;188;61;0m"
nwr="\e[0m"
runPackage2=${runPackage}

#// start Execution


usefl=false
	
if [ -n "$1" ] && [ "$1" == "-p" ];then
    axprop $path_axeronprop runPackage -s "$2"
    runPackage="$2"
    shift 2
fi

if [ -z $runPackage ]; then
    echo "Package is Empty"
    exit 1
fi

if [ ${runPackage2} = ${runPackage} ]; then
    echo "Game Detected : [${runPackage}]"
    sleep 0.5
    echo
else
    echo "Add Game    : [${runPackage}]"
    sleep 0.5
    echo "Remove Game : [${runPackage2}]"
    echo
    settings delete global updatable_driver_production_opt_in > /dev/null 2>&1
    sleep 0.5
fi

if [ -n "$1" ] && [ "$1" == "-fl" ]; then
	usefl=true
	shift
fi

if [ -n "$(getprop ro.hardware.vulkan)" ]; then
    renderer="vulkan"
elif [ -n "$(getprop ro.hardware.opengl)" ]; then
    renderer="skiagl"
else
    renderer="opengl"
fi
echo "Render Selection : [${renderer}]"

case $1 in
       "--collingmod"
            setprop debug.sf.hw 0
		        setprop debug.egl.hw 0
	        	setprop debug.egl.sync 1
		        performance=false
		        setprop debug.composition.type cpu
		        echo "[${runPackage}] battery composing"
            ;;
       "--performance" | *)
            setprop debug.sf.hw 1
		        setprop debug.egl.hw 1
        		setprop debug.egl.sync 0
		        performance=true
		        setprop debug.composition.type gpu
		        echo "[${runPackage}] performance composing"
            ;;
esac

 setprop debug.hwui.renderer ${renderer}
 setprop debug.renderengine.backend skiavkthreaded
 am force-stop ${runPackage}
 cmd thermalservice override-status 0
 cmd power set-fixed-performance-mode-enabled true
 cmd power set-adaptive-power-saver-enabled false
 cmd power set-mode 0