#!/bin/bash

cat "disable-list.txt" | grep -v "^$" | uniq | sort -f > "temp.txt"
mv "temp.txt" "disable-list.txt"
