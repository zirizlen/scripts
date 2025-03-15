# scripts

## words_define.sh
----------------- 
It grabs a word from your clipboard, fetches its definitions from the FreeDictionaryAPI, and sends a notification with up to three definitions.

Install needed packages if you don't have them:
- xclip: For interacting with the clipboard
- jq: To parse JSON data returned by the API
- notify-send: For displaying notifications (part of the libnotify package)

Place this script in /.local/bin and bind to some key combination.
