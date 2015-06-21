#!/bin/bash

cat "disable-list.txt" | while read d; do package=$(echo $d | awk {'print $1'}); description=$(echo $d | awk '{$1=""; print $0}'); echo "<tr><td>$package</td><td>$description</td></tr>"; done

