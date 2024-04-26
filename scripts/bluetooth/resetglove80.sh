#!/bin/bash

glove80_id='F0:B9:FA:39:A7:C0'
timeout=1
d="$(realpath $(dirname $0))"

# start agent using python
python "${d}/bluez_simple_agent.py" &
pid="$(jobs -l | cut -d' ' -f2 | xargs)"

# remove old connection
bluetoothctl disconnect "${glove80_id}"
bluetoothctl remove "${glove80_id}"

# scan for new connection
for ((i = 0; i < 3; i++)); do
    bluetoothctl --timeout "$((timeout + i))" scan on
    if [[ "$(bluetoothctl devices)" = *"${glove80_id}"* ]]; then
        break
    fi
done

# connect to glove
bluetoothctl agent on
bluetoothctl pair "${glove80_id}"
bluetoothctl connect "${glove80_id}"

# kill old agent
kill "$pid"
