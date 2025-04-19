$AXFUN
local data="/data/local/tmp/nxver"
local url="https://reiii3.github.io/NOXVER/engine/noxen.sh"
local bin="/data/local/tmp"
local cash="$bin/axeron_cash/update"
local nox_bin="$bin/nvxer"
local url_detect="https://reiii3.github.io/Center-Module/update/nox-update.sh"
local url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
local run_update="https://reiii3.github.io/NOXVER/engine/ui-system/ui-maintenance.sh"
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
import axeron.prop
local update="$bin/detecUpdate"
local file_update="$cash/noxUp"
local fun="$nox_bin/function"
local engine="$data/engine"
local stor_ax="$bin/axeron_cash/DionX/response"
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
  axprop $file_update status -s "null"
  axprop $file_update notif -s "false"
  axprop $file_update waktuUp -s "null"
  axprop $file_update waktuIn -s "null"
  echo "DEBUG : File penyimpan update berhasil di tambahkan"
fi

storm -rP "$bin" -s "${url_detect}" -fn "detecUpdate"
. $update
. $file_update

if [[ "$devmode" = true ]]; then
  local id_dev=$(storm "$url_core/user/developer.txt")
fi
local akses_awal=$(echo "$id_dev" | grep -q "$AXERONID" && echo true || echo false)

if [[ $akses_awal = true ]]; then
  echo "DEBUG : cek id berhasi"
else
  echo "DEBUG : cek id gagal, ada masalah di logic anda"
fi

echo 
echo "ui interaktif"
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
     exit 0
  else
     echo "terjadi kesalahan teknis pada logic anda"
     exit 0
  fi
fi
echo
echo