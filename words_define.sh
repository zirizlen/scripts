#!/bin/bash

# Get selected word from clipboard
WORD=$(xclip -o)

# Check if a word is selected
if [[ -z "$WORD" ]]; then
    notify-send "Error" "No word selected!"
    exit 1
fi

# Fetch definitions from FreeDictionaryAPI
RESPONSE=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$WORD")

# Extract first 3 definitions using jq
DEFINITIONS=$(echo "$RESPONSE" | jq -r '.[0].meanings[0].definitions[:3] | .[].definition' 2>/dev/null)

# Check if definitions exist
if [[ -z "$DEFINITIONS" ]]; then
    notify-send "Definition not found" "No results for '$WORD'"
    exit 1
fi

# Format definitions for notification
NOTIFY_TEXT=$(echo "$DEFINITIONS" | awk '{print NR ". " $0}' ORS="\n")

# Send notification
notify-send "Definition of '$WORD'" "$NOTIFY_TEXT"
