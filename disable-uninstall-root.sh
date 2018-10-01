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
    adb -s ${device} shell "su -c pm uninstall ${package}" &>/dev/null
    uninstall=$?
    adb -s ${device} shell "pm list packages | grep ${package}" &>/dev/null
    uninstalled=$?

    ## Try to uninstall first
    if [ ${uninstall} == 0 ] && [ ${uninstalled} == 0 ]; then
      echo -e "Uninstalled: \t ${package}"
    else
      echo -e "Failed to uninstall: \t ${package}. Trying to disable."

      ## If uninstalling fails, try to disable
      adb -s ${device} shell "su -c pm disable ${package}" &>/dev/null
      if [ $? == 0 ]; then
        echo -e "Disabled: \t ${package}"
      else
        echo -e "Failed to disable: \t ${package}"
      fi
    fi
  done
done
