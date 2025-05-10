$AXFUN
time=60
bin="/data/local/tmp"
url_detect="https://reiii3.github.io/Center-Module/update/nox-update.sh"
detec_system() {
   storm -rP "$bin" -s "${url_detect}" -fn ".detecUpdate"
}

while true; do
    detec_system
    sleep $time
    echo "file di perbarui"
done
