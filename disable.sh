#!/bin/bash

cat "disable-list.txt" | while read d; do tmp=$(echo $d | awk {'print $1'}); adb shell "pm disable $tmp"; done

