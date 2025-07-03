#!/bin/bash
#   ___| |__   ___  ___| | __  ___| |__
#  / __| '_ \ / _ \/ __| |/ / / __| '_ \
# | (__| | | |  __/ (__|   < _\__ \ | | |
#  \___|_| |_|\___|\___|_|\_(_)___/_| |_|
# https://github.com/galaxy-cli/check
# check.sh - Quickly spell-check and correct text from the terminal with aspell

# `trap` to store temp files
temp=$(mktemp)

# User input prompt
read -r input

# Stores user input as temp file
echo "$input" > "$temp"

# User input is shell checked
aspell -c "$temp"

# Prints corrected user input
cat "$temp"
