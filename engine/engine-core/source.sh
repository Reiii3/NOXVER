data="/data/local/tmp/debug/nox-control"

source $data

if [[ $mode_stable == true ]]; then
  export url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
  export url_ui="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/ui-system/ui-v1.sh"
  export url_system_update="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/ui-system/update.sh"
  export url_ai="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/engine-core/nox-ai.sh"
  export url_info="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/ui-system/info.sh"
  export url_change="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/ui-system/change.sh"
  export url_pl="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/plugin.sh"
  export engine_system="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/engine/engine-core/system-performance.sh"
  export url_core="https://raw.githubusercontent.com/Reiii3/NOXVER/dev/user/developer.txt"
else
  export url_funct="https://reiii3.github.io/Center-Module/core-system/function.sh"
  export url_ui="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/ui-system/ui-v1.sh"
  export url_system_update="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/ui-system/update.sh"
  export url_ai="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/engine-core/nox-ai.sh"
  export url_info="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/ui-system/info.sh"
  export url_change="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/ui-system/change.sh"
  export url_pl="https://raw.githubusercontent.com/Reiii3/NOXVER/main/plugin.sh"
  export engine_system="https://raw.githubusercontent.com/Reiii3/NOXVER/main/engine/engine-core/system-performance.sh"
  export url_core="https://raw.githubusercontent.com/Reiii3/NOXVER/main/user/developer.txt"
fi