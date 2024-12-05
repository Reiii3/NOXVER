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
else
    echo "Add Game    : [${runPackage}]"
    sleep 0.5
    echo "Remove Game : [${runPackage2}]"
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
echo
sleep 0.5


if [ ${runPackage} = ${runPackage2} ]; then

  echo "┌[DionX Performance Actived]"
  sleep 0.5
  echo "├[Compiler System && Renderer Actived]"
  sleep 0.5
  echo "├[Driver Game Actived]"
  sleep 0.5
  echo "├[Mediatek Tuner Actived]"
  sleep 0.5
  echo "├[Comming Soon Next Update]"
  sleep 0.5
  if [ $usefl = true ]; then
      echo "└[Fast Lounch Selection Open the Game ]"
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
	    flaunch $runPackage
  else
      echo "└[${runPackage}] Open To Menu Laxeron📳 "
      sleep 0.5
      echo
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
      echo 
      echo "| -Have a nice play- |"
      echo "|      -enjoy-       |"
	    xtorm $core
  fi

else

case $1 in
       "--collingmod"
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
	          echo "├[Colling System Actived]"
	          sleep 0.5
            ;;
       "--performance" | *)
            setprop debug.sf.hw 1
            setprop debug.egl.hw 1
            setprop debug.egl.sync 0
            setprop debug.cpuprio 6
            setprop debug.gpuprio 7
            setprop debug.ioprio 7
            setprop debug.performance.tuning 1
            setprop debug.performance.profile 1
            setprop debug.performance.force true
            setprop debug.power.profile high_performance
            setprop debug.performance_schema 1
            setprop debug.multicore.processing 1
            setprop debug.systemuicompilerfilter speed
            performance=true
            setprop debug.composition.type gpu
            echo "├[DionX Performance Actived]"
            sleep 0.5
            ;;
esac


#// cmd By Reii
 setprop debug.hwui.renderer ${renderer}
 setprop debug.renderengine.backend skiavkthreaded
 cmd thermalservice override-status 0
 cmd power set-fixed-performance-mode-enabled true
 cmd power set-adaptive-power-saver-enabled false
 cmd package compile -m speed-profile --secondary-dex -f ${runPackage} > /dev/null 2>&1
 cmd power set-mode 0
 echo "├[Compiler System && Renderer Actived]"
 sleep 0.5
 
 #// Driver Game By Mang Levv
 settings put global updatable_driver_production_opt_in_apps ${runPackage}
 echo "├[Driver Game Actived]"
 sleep 0.5
 
 if [ $(getprop ro.hardware.egl) == meow ]; then
       setprop debug.mtk.chiptuning.enable 1
       setprop debug.mtk.gpu.mode 1
       setprop debug.mediatek.disp_decompress 1
       setprop debug.mediatek.game_pq_enable 1
       setprop debug.mediatek.appgamepq_compress 1
       setprop debug.mediatek.high_frame_rate_sf_set_big_core_fps_threshold 119
       echo "├[Mediatek Tuner Actived]"
       sleep 0.5
 else 
     echo "├[$(getprop ro.product.brand)] not supported"
     sleep 0.5
fi

if [ $usefl = true ]; then
	    flaunch $runPackage
  else
      echo "└[${runPackage}] Open To Menu Laxeron📳 "
      sleep 0.5
      echo
      echo "───────────────────────────────────────────────────────"
      sleep 0.5
      echo 
      echo "| -Have a nice play- |"
      echo "|      -enjoy-       |"
	    xtorm $core
  fi
fi