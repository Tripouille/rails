#!/bin/sh
service postgresql start
psql -c "ALTER USER admin WITH password '${ADMIN_PASSWORD}'"
tail -f /var/log/postgresql/postgresql-11-main.log