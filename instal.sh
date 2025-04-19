$AXFUN
local data="/data/local/tmp/nxver"
local url="https://reiii3.github.io/NOXVER/engine/noxen.sh"
local bin="/data/local/tmp"
local cash="$bin/axeron_cash/update"
local nox_bin="$bin/nvxer"
local url_detect="https://reiii3.github.io/Center-Module/update/nox-update.sh"
local url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
local core="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC2QyrYAcvaZ1Ez9DPOyctd9lC21yrN4mt2ycsXnmP29pQJ5qrR=="
import axeron.prop
local update="$bin/detecUpdate"
local file_update="$cash/noxUp"
local fun="$nox_bin/function"
engine="$data/engine"

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
     echo "haii sekarang waktunya reinkarnasi"
     echo "   - Welcome to NOXVER.AI -"
     echo "       - comming soon -"
     axprop $path_axeronprop name -s "NVEX"
     name="NVEX"
     axprop $path_axeronprop id -s "vexa"
     id="vexa"
     exit 0
  else
     echo "terjadi kesalahan teknis pada logic anda"
     exit 0
  fi
fi
