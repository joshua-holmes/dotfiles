#!/bin/bash
set -e

dir="$(realpath $(dirname $0))"

echo
echo "WARNING: This program will wipe the following config folders and files from your ~/.config directory (if they exist):"
echo
ls "$dir" | grep --invert-match --line-regexp $(basename -- "$0")
echo
echo "Press any key to continue."
read

folders="$(ls $dir)"
for f in $folders; do
    if [[ $(basename -- "$0") = "$f" ]]; then
        continue
    fi
    fulldir="${dir}/${f}"
    config="${HOME}/.config"
    rm -fr "${config}/${f}"
    ln -s "${fulldir}" "${config}/."
done
