#!/bin/bash
set -e

dir="$(dirname $0)"

echo
echo "WARNING: This program will wipe the following config folders and files from your ~/.config directory (if they exist):"
echo
ls -d */ "$dir" | grep --invert-match --line-regexp '.'
echo
echo "Press any key to continue."
read

folders="$(ls $dir)"
for f in $folders; do
    if [[ -f $f ]]; then
        continue
    fi
    fulldir=$(realpath "${dir}/${f}")
    echo $fulldir
    config="${HOME}/.config"
    rm -fr "${config}/${f}"
    ln -s "${fulldir}" "${config}/."
done
