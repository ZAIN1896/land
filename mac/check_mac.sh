#!/bin/bash

for interface in `ls /sys/class/net`; do
    if [ -d "/sys/class/net/$interface/wireless" ]; then
        export interface
    fi
done

echo -n "Enter MAC: "
read mac

ifconfig $interface down
macchanger -m $mac $interface
ifconfig $interface up

clear

current=$(cat /sys/class/net/$interface/address)
echo "Current MAC: $current"

./check_mac.sh
