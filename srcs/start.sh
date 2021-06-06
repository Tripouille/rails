#!/bin/bash
cd /var/lib/postgresql/11/main
mkdir -p pg_commit_ts pg_dynshmem pg_logical/mappings pg_logical/snapshots pg_replslot \
pg_serial pg_snapshots pg_stat pg_stat_tmp pg_tblspc pg_twophase pg_wal/archive_status
chown -R postgres:postgres /var/lib/postgresql/11/main
chmod -R 700 /var/lib/postgresql/11/main
service postgresql start
psql -U postgres -c "ALTER USER admin WITH password '${ADMIN_PASSWORD}'"
cd /www
bundle install
rm -f /www/tmp/pids/server.pid
if [ "$RAILS_ENV" == "production" ]; then rails assets:precompile; fi
rails s -b "0.0.0.0"