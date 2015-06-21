#!/bin/bash

cat "disable-list.txt" | while read d; do tmp=$(echo $d | tr -d '\n' | awk {'print $1'}); adb shell "su -c 'pm disable $tmp'"; done

