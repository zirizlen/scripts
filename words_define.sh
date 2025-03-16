#!/bin/bash

# Get selected word from clipboard
WORD=$(xclip -o | tr ' ' '+')

# Check if a word is selected
if [[ -z "$WORD" ]]; then
    notify-send "Error" "No word selected!"
    exit 1
fi

# Ensure dependencies are installed
if ! command -v curl &>/dev/null || ! command -v jq &>/dev/null; then
    notify-send "Error" "Missing dependencies: Install 'curl' and 'jq'"
    exit 1
fi

# Fetch definitions from FreeDictionaryAPI
RESPONSE=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$WORD")

# Validate API response
if ! echo "$RESPONSE" | jq -e '.[0].meanings[0].definitions[:3]' &>/dev/null; then
    notify-send "Definition not found" "No results for '$WORD'"
    exit 1
fi

# Extract and format definitions
DEFINITIONS=$(echo "$RESPONSE" | jq -r '.[0].meanings[0].definitions[:3] | .[].definition')
NOTIFY_TEXT=$(echo "$DEFINITIONS" | awk '{print NR ". " $0}' ORS="\n" | head -c 200)

# Send notification
notify-send "Definition of '$WORD'" "$NOTIFY_TEXT"
