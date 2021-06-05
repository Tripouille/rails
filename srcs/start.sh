#!/bin/sh
chown -R postgres:postgres /var/lib/postgresql/11/main
chmod -R 700 /var/lib/postgresql/11/main
service postgresql start
psql -U postgres -c "ALTER USER admin WITH password '${ADMIN_PASSWORD}'"
tail -f /var/log/postgresql/postgresql-11-main.log