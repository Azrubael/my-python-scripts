#In Ubuntu look logs in
    /var/log/syslog

#Для запуска скрипта, который фильтрует сислог Убунты    
    $ ./toploglines.sh
Processing: /var/log/syslog
 63 systemd[1]: Condition check resulted in Dispatch Password Requests to Console Directory Watch being skipped.
 56 systemd[1]: Starting Clean php session files...
 56 systemd[1]: phpsessionclean.service: Deactivated successfully.
 56 systemd[1]: Finished Clean php session files.
 49 systemd[1]: Starting Load Kernel Module efi_pstore...

    

#To printout 10 last lines of a logfile:
    $ tail /var/log/syslog
#To printout 10 first lines of a logfile:
    $ head /var/log/syslog
    

#Another realworld examlpe
	$ tail --lines=20 /var/log/syslog | cut -d' ' -f5-
# --lines=20  - вывод послдних 20 строк вместо 10 по умолчанию
# cut -d' '   - команда разрезать строки по пробелам
# -f5-		  - команда распечатать поле номер пять и все, что идет после него 
# т.е. дату и имя компьютера откинуть


    $ cut -d' ' -f5- /var/log/syslog | sort | uniq -c | sort -nr | head
142 systemd[1]: Starting Clean php session files...
142 systemd[1]: phpsessionclean.service: Deactivated successfully.
142 systemd[1]: Finished Clean php session files.
 92 systemd[1]: Starting Hostname Service...
 92 systemd[1]: Started Hostname Service.
 91 systemd[1]: systemd-hostnamed.service: Deactivated successfully.
 72 systemd[1]: Condition check resulted in Dispatch Password Requests to Console Directory Watch being skipped.
 51 systemd[1]: Starting Load Kernel Module ramoops...
 51 systemd[1]: Starting Load Kernel Module pstore_zone...
 51 systemd[1]: Starting Load Kernel Module pstore_blk...
    

    $ cat spider.txt | tr ' ' '\n' | sort | uniq -c | sort -nr | head
      1 shwabra
      1 cadabra
      1 abrvalg
      1 abra
      1 abr
      1 abbr
cat - gets the contents of the 'spider.txt' file
tr - gets its name from the word translate, transforming ' ' into '\n'
sort - sorts result alphabetically
uniq - displays each match once by using '-c' flag it prefixes each unique line with the number of time it occured
sort - sorts once more with '-nr' flag, sorting results numerically in reverce order
head - prints the first 10 lines to STDL