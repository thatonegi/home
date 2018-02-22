#!/bin/sh


DUMP=/usr/bin/mysqldump
GZIP=/bin/gzip
LPATH=root
ARGS='--flush-logs --flush-privileges --complete-insert --create-options'
SCHEMAS='MyMusic52 MyVideos93 alluc metadata cacti'
BDIR=/home/bjohnston/Backups/mysql
CHOWN=/bin/chown
LUID=1000
LGID=1000

for SCHEMA in $SCHEMAS
do
	MDY=`date +'%m%d%y-%I%H%S%p'`
	/usr/bin/mysqldump --login-path=$LPATH $ARGS $SCHEMA | $GZIP > $BDIR/$SCHEMA-$MDY.sql.gz
	#${CHOWN} ${LUID}:${LGID} ${BDIR}/${SCHEMA}-${MDY}.sql.gz
done
exit
