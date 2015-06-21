#!/bin/bash

cat "disable-list.txt" | uniq | sort -f > "temp.txt"
mv "temp.txt" "disable-list.txt"

