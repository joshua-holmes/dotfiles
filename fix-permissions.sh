#!/bin/bash
set -e

dir="$(dirname $0)/config"

sudo chown -R root:users "$dir"
sudo chmod -R 774 "$dir"
