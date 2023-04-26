#!/bin/bash
#Скрипт для поиска в логфайлах Убунты

for logfile in /var/log/syslog; do
  echo "Processing: $logfile"
  cut -d' ' -f5- $logfile | sort | uniq -c | sort -nr | head -5
done

# cut -d' '   - команда разрезать строки по пробелам
# -f5-	  - команда распечатать поле номер пять и все, что идет после него т.е. дату и имя компьютера откинуть
# sort - sorts result alphabetically
# uniq - displays each match once by using '-c' flag it prefixes each unique line with the number of time it occured
# sort - sorts once more with '-nr' flag, sorting results numerically in reverce order
# head - prints the first 5 lines to STDL
