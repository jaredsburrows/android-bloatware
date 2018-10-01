#!/bin/bash

echo '<table border="1"><tbody>'
echo '<tr><th>Package Name</th><th>Description</th></tr>'
cat "disable-list.txt" | while read d; do package=$(echo ${d} | awk {'print $1'}); description=$(echo ${d} | awk '{$1=""; print $0}'); echo "<tr><td>$package</td><td>$description</td></tr>"; done
echo '</tbody></table>'
