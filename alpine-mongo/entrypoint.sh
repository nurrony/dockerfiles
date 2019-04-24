#!/usr/bin/dumb-init /bin/sh

echo "starting MongoDB"

mongod --bind_ip_all --port ${MONGO_PORT} --dbpath ${MONGO_DBPATH} --logpath ${MONGO_LOGFILE} --logappend -v &
echo "please wait - live logging in 5 secs ..."
sleep 5
tail -f ${MONGO_LOGFILE}