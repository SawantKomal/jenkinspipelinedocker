
#!/bin/bash

DATE=$(date +%H:%M:%S:%d-%m-%Y)
read -p "Enter DB Username:" DB_USERNAME
read -p "Enter DB Hostname:" DB_HOSTNAME
read -p "Enter DB Name:" DB_NAME
read -s -p "Enter DB Password:" DB_PASSWD
read -s -p "Enter AWS Access Key:"
read -s -p "Enter AWS Secret Key:"


mysqldump -u $DB_USERNAME -h $DB_HOSTNAME -p$DB_PASSWD $DB_NAME --column-statistics=0 > /tmp/dbBackup-$DATE.sql

~
~
~

