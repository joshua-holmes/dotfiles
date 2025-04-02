#!/bin/bash
#  _____                 _        _   _ ____  ____  
# |_   _|__   __ _  __ _| | ___  | | | |  _ \|  _ \ 
#   | |/ _ \ / _` |/ _` | |/ _ \ | |_| | | | | |_) |
#   | | (_) | (_| | (_| | |  __/ |  _  | |_| |  _ < 
#   |_|\___/ \__, |\__, |_|\___| |_| |_|____/|_| \_\
#            |___/ |___/                            

file="${HOME}/dotfiles/hypr/conf/monitor.conf"
if grep -q '^#.*cm_fs_passthrough' "$file"; then
    # Uncomment the line
    sed -i '/cm_fs_passthrough/s/^#//' "$file"
else
    # Comment out the line
    sed -i '/cm_fs_passthrough/s/^/#/' "$file"
fi
