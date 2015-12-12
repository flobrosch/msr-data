#!/bin/bash

for f in ./*.csv; do
    table=`basename $f| cut -f1 -d'.'`
    echo "Restoring $table"
    echo "SET foreign_key_checks = 0; load data local infile '`pwd`/$f' into table $table fields terminated by ',' optionally enclosed by '\n' lines terminated by '\r\n'" | mysql -ufoo -pbar msrsurvey || exit 1
done
