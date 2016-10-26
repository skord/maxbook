FROM ubuntu:16.04
MAINTAINER Michael Danko <michael.danko@mariadb.com>
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys CD2EFD2A
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 8507EFA5
RUN echo "deb http://repo.percona.com/apt xenial main" >> /etc/apt/sources.list &&\
    apt-get update
RUN apt-get install -y percona-xtrabackup s3cmd
VOLUME /var/backup/mysql
