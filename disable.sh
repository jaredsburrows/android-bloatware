#!/bin/bash
cat "disable-list.txt" | while read d; do tmp=$(echo $d | tr -d '\n'); adb shell "pm disable $tmp"; done

