#!/bin/bash

state=$(bluetoothctl show | grep "Powered: yes")

if [[ -n "$state" ]]; then
  bluetoothctl power off
else
  bluetoothctl power on
fi

