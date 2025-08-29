#!/bin/bash
#  _____                 _        _   _ ____  ____  
# |_   _|__   __ _  __ _| | ___  | | | |  _ \|  _ \ 
#   | |/ _ \ / _` |/ _` | |/ _ \ | |_| | | | | |_) |
#   | | (_) | (_| | (_| | |  __/ |  _  | |_| |  _ < 
#   |_|\___/ \__, |\__, |_|\___| |_| |_|____/|_| \_\
#            |___/ |___/                            

file="${HOME}/dotfiles/hypr/conf/monitor.conf"

# Check if the disabled line is currently commented out (inactive)
if grep -q '^\s*#.*disabled = true' "$file"; then
    # Uncomment the line (enable the disabled setting)
    sed -i 's/^\(\s*\)#\s*\(disabled = true\)/\1\2/' "$file"
    echo "Monitor disabled (uncommented 'disabled = true')"
else
    # Comment out the line (disable the disabled setting, effectively enabling monitor)
    sed -i 's/^\(\s*\)\(disabled = true\)/\1# \2/' "$file"
    echo "Monitor enabled (commented out 'disabled = true')"
fi
