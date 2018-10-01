#!/bin/bash

## Setup
[[ $# == 0 ]] && filename="disable-list.txt" || filename="${1}"
packages=($(awk 'BEGIN { FS = "[ \t]+" } ; { print $1 }' ${filename}))
devices=($(adb devices | tail -n +2 | cut -sf 1))

## Go through each device
for device in "${devices[@]}"
do
  echo -e "Device: \t ${device}"

  ## Go through each package
  for package in "${packages[@]}"
  do

    ## Try to disable
    adb -s ${device} shell "su -c pm uninstall ${package}" &>/dev/null
    if [ $? == 0 ]; then
      echo -e "Uninstall: \t ${package}"
    else
      echo -e "Failed to uninstall: \t ${package}"
    fi
  done
done
