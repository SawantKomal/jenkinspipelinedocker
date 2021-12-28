#!/bin/bash

DB_USERNAME=$1
DB_HOSTNAME=$2
DB_NAME=$3
DB_PASSWD=$4
AWS_Secret_key=$5
BUCKET_NAME=$6

DATE=$(date +%H:%M:%S:%d-%m-%Y)
FILENAME=dbBackup-$DATE.sql
BACKUP=db_$DATE.sql


echo "Taking backup...."

mysqldump -u $DB_USERNAME -h $DB_HOSTNAME -p$DB_PASSWD $DB_NAME --column-statistics=0 > /tmp/$FILENAME

export AWS_ACCESS_KEY_ID=AKIAYEEMDLXTHDQIZ27P && \
export AWS_SECRET_ACCESS_KEY=$AWS_Secret_key && \

echo "uploading mysql database backup to bucket $BUCKET_NAME ....."

aws s3 cp /tmp/$FILENAME s3://$BUCKET_NAME/$BACKUP
