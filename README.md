# MariaDB Demo Containers

This is a collection of different MariaDB topologies and tools for working with
said topologies.

### Topologies

There's four topologies in total right now, each has a README in its own
subdirectory for getting started with the docker-compose environment:

* galera: A three node Galera cluster + MaxScale with a read/write split. InfluxDB, Telegraf, and Grafana for metrics and monitoring.
* galera-prom: A three node Galera cluster + Maxscale with a read/write split. Uses Prometheus to monitor MaxScale and the Galera Nodes. Includes Percona Grafana dashboards and a MaxScale Dashboard.
* mrm: A five node MariaDB cluster with async replication. MaxScale has two listeners and routers, one for read/write splitting across nodes 1-3 and one that is a read-only service to servers four and five. InfluxDB + Telegraf + Grafana for Metrics.
* mrm-prom: A five node MariaDB cluster with async replication. MaxScale has two listeners and routers, one for read/write splitting across nodes 1-3 and one that is a read-only service to servers four and five. Uses Prometheus for metrics for MaxScale and the DB nodes. Includes Percona Grafana dashboards and a MaxScale Dashboard.

All four topologies include a sample Ruby on Rails app that gets exposed on port 3000.

Admin Login:
```
username: admin@mariadb.com
password: Welcome1
```

User Login:
```
username: user@mariadb.com
password: Welcome1
```

MaxPanel, a simple ember app for quickly seeing your MaxScale server status is also on all the
topologies, and is mapped to port 18080.


### One off utilities

There are some other images that don't exactly fit into a compose setup, but are pretty darn useful to have around. They have README files in their respective directories as well:

* sysbench: Sysbench OLTP Benchmarks. Make a big table. Do a bunch of stuff with it. Clean it up. Makes your Grafana dashboards interesting.
* xtrabackup: Backup your important seed data and benchmark tables. 
