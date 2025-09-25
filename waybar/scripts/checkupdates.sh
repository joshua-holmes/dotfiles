#   ____ _               _      _   _           _       _            
#  / ___| |__   ___  ___| | __ | | | |_ __   __| | __ _| |_ ___  ___ 
# | |   | '_ \ / _ \/ __| |/ / | | | | '_ \ / _` |/ _` | __/ _ \/ __|
# | |___| | | |  __/ (__|   <  | |_| | |_) | (_| | (_| | ||  __/\__ \
#  \____|_| |_|\___|\___|_|\_\  \___/| .__/ \__,_|\__,_|\__\___||___/
#                                    |_|                             

cache=~/.cache/checkupdates
cache_timeout_sec=$(( 60 * 60 * 24 )) # 24 hours
signal=8

checkupdates() {
  # check for updates
  # NOTE: this line needs to be run somewhere else as root on a regular basis, e.i. via cron
  # # paru -Syy

  # get results
  paru -Qu | wc -l
}

get_cache_line() {
  awk "NR==${1} {print; exit}" "${cache}"
}

if [[ "${1}" = "--help" || "${1}" = "-h" ]]; then
  echo "--help, -h   | This help menu"
  echo "--update, -u | Begin update process instead of checking for updates"
  exit
fi

if [[ "${1}" = "--update" || "${1}" = "-u" ]]; then
  ghostty -e bash -c "paru -Syu && rm ${cache}; echo Done - Press enter to exit; read"
  pkill "-SIGRTMIN+${signal}" waybar
  exit
fi

valid_cache="true"
if [[ -f "${cache}" ]]; then
  for line in $(cat "${cache}"); do
    if [[ ! "${line}" =~ ^[0-9]+$ ]]; then
      valid_cache="false"
    fi
  done
  if (( "$(cat "${cache}" | wc -l)" < 2 )); then
    valid_cache="false"
  fi
  if [[ "${valid_cache}" = "true" && $(( $(get_cache_line 1) + ${cache_timeout_sec} )) -lt $(date +%s) ]]; then
    valid_cache="false"
  fi
else
  valid_cache="false"
fi

if [[ "${valid_cache}" = "true" ]]; then
  echo "$(get_cache_line 2)"
else
  updates="$(checkupdates)"
  printf "$(date +%s)\n${updates}\n" > "${cache}"
  echo "${updates}"
fi
