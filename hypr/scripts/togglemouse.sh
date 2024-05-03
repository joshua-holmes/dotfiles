#!/bin/bash

conf_file="${HOME}/dotfiles/hypr/conf/keyboard.conf"
rg_pattern="follow_mouse\s?=\s?[0-9]+"
sed_pattern="follow_mouse\s\?=\s\?[0-9]\+"

cur_setting="$(rg -e "${rg_pattern}" "${conf_file}" | xargs | sed 's/ //g' | cut -d'=' -f2)"
if ((cur_setting == 1)); then
    new_setting=2
else
    new_setting=1
fi

sed -i -e "s/${sed_pattern}/follow_mouse = ${new_setting}/" "${conf_file}"
