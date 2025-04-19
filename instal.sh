$AXFUN
local data="/data/local/tmp/nxver"
local url="https://reiii3.github.io/NOXVER/engine/noxen.sh"
local bin="/data/local/tmp"
local cash="$bin/axeron_cash/update"
local nox_bin="$bin/nvxer"
local url_detect="https://reiii3.github.io/Center-Module/update/nox-update.sh"
local url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
local run_update="https://reiii3.github.io/NOXVER/engine/ui-system/ui-maintenance.sh"
local url_prop="https://reiii3.github.io/NOXVER/engine/prop.sh"
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
import axeron.prop
local update="$bin/detecUpdate"
local file_update="$cash/noxUp"
local fun="$nox_bin/function"
local engine="$data/engine"
local stor_ax="$bin/axeron_cash/DionX/response"
local u_ver="$bin/prop"
echo
echo
if [ ! -d $data ]; then
  mkdir -p "$data"
  echo "DEBUG : direktory berhasil di tambahkan"
fi

if [[ ! -f $engine ]]; then
  storm -rP "$data" -s "${url}" -fn "engine"
  echo "DEBUG : all file berhasil ter ekstrak"
fi

source $engine

if [[ ! -d $cash ]]; then
  mkdir -p "$cash"
  echo "DEBUG : direktory cash berhasil di tambahkan"
fi

if [[ ! -f $file_update ]]; then
  echo "# Dont Change It" > "$file_update"
  axprop $file_update ver -s "null"
  axprop $file_update verc -s "null"
  axprop $file_update nameEngine -s "null"
  axprop $file_update status -s "maintenance"
  axprop $file_update notif -s "false"
  axprop $file_update waktuUp -s "null"
  axprop $file_update waktuIn -s "null"
  axprop $file_update insUp -s true
  echo "DEBUG : File penyimpan update berhasil di tambahkan"
fi

# // url_detect ini adalah fungsi utama dari fungsi maintenance di dalam nya ada variabel bernama noxUpdate jika isi variabel adala true maka syatem maintenance akan berkerja dan juga sebaliknya jika variabel berisi false maka system maintenance akan mati
storm -rP "$bin" -s "${url_detect}" -fn "detecUpdate"
. $update
. $file_update

if [[ "$noxUpdate" == true ]]; then
   axprop $file_update status -s "maintenance"
   axprop $file_update notif -s false
   axprop $file_update insUp -s false
fi

# // dev mod di gunakan untuk mode debugger/akses awal developer
if [[ "$devmode" = true ]]; then
  local id_dev=$(storm "$url_core/user/developer.txt")
fi
local akses_awal=$(echo "$id_dev" | grep -q "$AXERONID" && echo true || echo false)

if [[ $akses_awal = true ]]; then
  echo "DEBUG : cek id berhasi"
else
  echo "DEBUG : cek id gagal, ada masalah di logic anda"
fi



case $1 in
   -update )
   if [[ "$noxUpdate" == false ]]; then
     if [[ "$insUp" == false ]]; then
         storm -rP "$bin" -s "${url_prop}" -fn "prop" "$@"
         . $u_ver
         sleep 5
         echo "  $pr update system starting"
         axprop $file_update ver -s "$verU"
         axprop $file_update verc -s $vercU
         axprop $file_update nameEngine -s "$engineName"
         axprop $file_update waktuIn -s "$time"
         axprop $file_update status -s "done"
         axprop $file_update insUp -s true
         sleep 1
         echo "  $su update succesfully"
         echo
         sleep 0.03
         echo " - New Information Modules -"
         echo "   - version : $ver New"
         echo "   - versionCode : $verc New"
         echo "   - nameEngine : $nameEngine New"
         echo
         rm $u_ver
         exit 0
      else
         echo
         echo " - modules ini sudah terupdate ke versi terbaru sejak -"
         echo "        $waktuIn"
         echo
         exit 0
      fi
   else 
      echo "  - silahkan tunggu maintenance selesai -"
   fi
   ;;
esac

echo 

if [[ "$akses_awal" = false ]]; then
  if [[ "$status" == "maintenance" ]]; then
     storm -x "${run_update}" "maintenance"
     rm $stor_ax
     if [[ "$noxUpdate" == true ]]; then
        echo "info : update terbaru akan segera siap silahkan tunggu.."
      else
        echo "info : update terbaru sudah siap, silahkan update"
        echo "exec : ax vex -update"
     fi
     rm $update
     echo
     exit 0
  fi
fi
echo