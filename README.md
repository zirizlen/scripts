# scripts
------------
Creat a folder */home/user_name/bin*, if you don't have it, and place your scripts there. It should be already in your $PATH variable. Check it with `echo $PATH` command. Make the script executable with `sudo chmod +x <name_of_the_script.sh>`.

## words_define.sh
----------------- 
It grabs a word from your clipboard (highlight the word and press the chosen key combination), fetches its definitions from the FreeDictionaryAPI, and sends a notification with up to three definitions.

Install needed packages if you don't have them:
- xclip: For interacting with the clipboard
- jq: To parse JSON data returned by the API
- notify-send: For displaying notifications (part of the libnotify package)

Bind it to some key combination.
