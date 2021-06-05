FROM debian:buster
RUN apt update && apt -y full-upgrade

#Postgresql
RUN apt-get install -y postgresql postgresql-client
USER postgres
WORKDIR /etc/postgresql/11/main/
COPY --chown=postgres:postgres srcs/pg_hba.conf .
COPY --chown=postgres:postgres srcs/postgresql.conf .
RUN service postgresql start && createuser admin && createdb transcendence -O admin

COPY srcs/start.sh /