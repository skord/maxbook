#!/bin/sh
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -P$MYSQL_PORT -h$MYSQL_HOST -e "create database if not exists dbtest"
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=dbtest --mysql-user=$MYSQL_USER --mysql-port=$MYSQL_PORT --mysql-host=$MYSQL_HOST --mysql-password=$MYSQL_PASSWORD prepare
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=dbtest --mysql-user=$MYSQL_USER --mysql-port=$MYSQL_PORT --mysql-host=$MYSQL_HOST --mysql-password=$MYSQL_PASSWORD --oltp-test-mode=complex --oltp-read-only=off --num-threads=4 run
sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=dbtest --mysql-user=$MYSQL_USER --mysql-port=$MYSQL_PORT --mysql-host=$MYSQL_HOST --mysql-password=$MYSQL_PASSWORD cleanup
