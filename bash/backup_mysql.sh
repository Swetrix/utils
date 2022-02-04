# mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
SQLFILE=/var/backup/db/db_backup_${DATE}.sql
DATABASE=<database_name>
USER=<db_user>
PASSWORD=<db_user_password>

# in case if it's run more than once a day,
# remove the previous version of the file
unalias rm     2> /dev/null
rm ${SQLFILE}     2> /dev/null
rm ${SQLFILE}.gz  2> /dev/null

# do the mysql database backup (dump)
sudo mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
