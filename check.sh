#!/bin/bash
#   ___| |__   ___  ___| | __  ___| |__
#  / __| '_ \ / _ \/ __| |/ / / __| '_ \
# | (__| | | |  __/ (__|   < _\__ \ | | |
#  \___|_| |_|\___|\___|_|\_(_)___/_| |_|
# https://github.com/galaxy-cli/check
# check.sh - Spellcheck helper tool

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
