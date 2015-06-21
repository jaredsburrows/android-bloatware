#!/bin/bash
cat "disabled-list.txt" | while read d; do tmp=$(echo $d | tr -d '\n'); adb shell "pm disable $tmp"; done

