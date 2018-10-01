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
    uninstall=$(adb -s ${device} shell "pm uninstall ${package}" &>/dev/null && echo $?)
    uninstalled=$(adb -s ${device} shell "pm list packages | grep ${package}" &>/dev/null && echo $?)

    ## Try to uninstall first
    if [ ${uninstall} == 0 ] && [ ${uninstalled} == 0 ]; then
      echo -e "Uninstalled: \t ${package}"
    else
      echo -e "Failed to uninstall: \t ${package}. Trying to disable."

      ## If uninstalling fails, try to disable
      disable=$(adb -s ${device} shell "pm disable ${package}" &>/dev/null && echo $?)
      if [ ${disable} == 0 ]; then
        echo -e "Disabled: \t ${package}"
      else
        echo -e "Failed to disable: \t ${package}"
      fi
    fi
  done
done
