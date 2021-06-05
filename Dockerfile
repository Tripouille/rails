FROM debian:buster
RUN apt update && apt -y full-upgrade

#Postgresql
RUN apt-get install -y postgresql postgresql-client
USER postgres
WORKDIR /etc/postgresql/11/main/
COPY --chown=postgres:postgres srcs/pg_hba.conf .
COPY --chown=postgres:postgres srcs/postgresql.conf .
RUN service postgresql start && createuser admin && createdb transcendence -O admin

#RUN mkdir /run/postgresql && chown postgres:postgres /run/postgresql/
#USER postgres
#WORKDIR /var/lib/postgresql/
#RUN mkdir data && chmod 0700 data && initdb -D data
COPY srcs/start.sh /