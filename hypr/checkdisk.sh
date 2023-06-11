#!/bin/bash

g='G'
while true; do
    sleep 3600    
    disk_space=$(df -h | sed -n 4p | awk '{ print $3 }' | cut -d'G' -f 1)
    disk_total=$(df -h | sed -n 4p | awk '{ print $2 }' | cut -d'G' -f 1)
    disk_remain=$((disk_total - disk_space))
    notify-send 'CHECKING DISK...'
    sleep 3
    if [$disk_remain -gt 2]; then
        notify-send 'so much porn, only left'$disk_remain$g' for you :)'
    else
        notify-send 'DISK SPACE: ' $disk_space$g
        notify-send 'DISK REMAIN: ' $disk_remain$g
    fi
done
