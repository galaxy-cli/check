#!/bin/bash
##############
#            #
#  check.sh  #
#            #
##############

temp=$(mktemp)

read -r input

echo "$input" > "$temp"

aspell -c "$temp"

cat "$temp"'
