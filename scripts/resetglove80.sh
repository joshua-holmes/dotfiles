#!/bin/bash

glove80_id='F0:B9:FA:39:A7:C0'
timeout=1
bluetoothctl disconnect "${glove80_id}"
bluetoothctl remove "${glove80_id}"

for ((i = 0; i < 3; i++)); do
    bluetoothctl --timeout "$((timeout + i))" scan on
    if [[ "$(bluetoothctl devices)" = *"${glove80_id}"* ]]; then
        break
    fi
done

bluetoothctl pair "${glove80_id}"
bluetoothctl connect "${glove80_id}"
