CREATE USER 'exporter'@'%' IDENTIFIED BY 'pass';
GRANT PROCESS, SHOW DATABASES, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';

CREATE USER 'repl' IDENTIFIED BY 'pass';
GRANT REPLICATION SLAVE ON *.* TO 'repl';

CREATE USER 'maxscale' IDENTIFIED BY 'pass';
GRANT SELECT ON mysql.user TO 'maxscale';
GRANT SELECT ON mysql.db TO 'maxscale';
GRANT SELECT ON mysql.tables_priv TO 'maxscale';
GRANT SHOW DATABASES ON *.* TO 'maxscale';
GRANT REPLICATION CLIENT ON *.* TO 'maxscale';

CREATE DATABASE maxbook_db;
CREATE USER 'appuser'@'%' IDENTIFIED BY 'app-pass';
GRANT ALL PRIVILEGES ON *.* to 'appuser'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

-- RESET MASTER;
