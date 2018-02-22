#!/bin/sh


DUMP=/usr/bin/mysqldump
GZIP=/bin/gzip
LPATH=root
ARGS='--flush-logs --flush-privileges --complete-insert --create-options'
SCHEMAS='MyMusic52 MyVideos93 alluc metadata cacti'
BDIR=/home/bjohnston/Backups/mysql

for SCHEMA in $SCHEMAS
do
	MDY=`date +'%m%d%y-%I%H%S%p'`
	/usr/bin/mysqldump --login-path=$LPATH $ARGS $SCHEMA | $GZIP > $BDIR/$SCHEMA-$MDY.sql.gz
	/usr/bin/git add $BDIR/$SCHEMA-$MDY.sql.gz
done

/usr/bin/git commit -m "MySQL backup additions."
/usr/bin/git push > /dev/null 2>&1

exit
