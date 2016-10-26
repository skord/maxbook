### MariaDB Replication Manager / Async Topology with InfluxDB

This will bring up five DB servers and a MaxScale that has two services: read write split and read-only.

Instructions:

```
$ docker-compose build # This one will take a while
```

Bootstrap it:

```
$ ./bootstrap.sh
```


At this point, there will be lots of things to see. Assuming you brought up
everything on your own machine, here's what there's visibility to:

* [Maxbook App](http://localhost:3000): A Rails app described in the top level README.md
* [MaxPanel](http://localhost:18080): A simple ember.js app for checking Maxscale status.
* [MaxScale]: MaxInfo JSON listener on port 8003, admin interface on 9003, read-write split on port 13306, read-only service on 13307.
* [Grafana](http://localhost:13000): Metrics on your DB's and MaxScale instance. Login/password: admin/admin
* [Replication Manager](http://localhost:10001): MariaDB Replication Manager dashboard. Fun to mae it fail over.


The bootstrap script seeds the Rails app db with some users and entries in those user's address books. If you'd like to generate some more records so there's more going on in your dashboards, you can add more address book entries by re-running the seed script:

```
$ docker-compose run --rm app rails db:seed
```

When you're done and want to clean up:

```
$ ./teardown.sh
```
