#!/usr/bin/env python3
import re
import operator
import csv

errors ={}
per_user = {}

with open("syslog.log") as file:
    raw_data = file.readlines()
    for log in raw_data:
        found = re.search(r"ticky: (INFO|ERROR) (.*) \((.*)\)", log.strip())
        if found != None:
            log_type = found.group(1)
            user = found.group(3).strip()
            message = found.group(2).strip()
            (inf,err) = per_user.get(user,(0,0))
            if log_type == 'ERROR':
                errors[message] = errors.get(message,0)+1
                err +=1
            else:
                inf +=1
      
            per_user[user] = (inf,err)
file.close()    

errors = sorted(errors.items(), key = operator.itemgetter(1), reverse=True)
per_user = [ (key, val[0], val[1]) for key, val in sorted(per_user.items(), key = operator.itemgetter(0)) ] 

with open("error_message.csv", 'w+') as errors_file:   
    writer = csv.writer(errors_file)
    writer.writerow(("Error", "Count"))
    writer.writerows(errors)
errors_file.close()

with open("user_statistics.csv", 'w+') as users_file:   
    writer = csv.writer(users_file)
    writer.writerow(("Username", "INFO", "ERROR"))
    writer.writerows(per_user)
users_file.close()     
