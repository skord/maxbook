### Galera Version

This one has a weird bug I need to look into regarding bringing up the DB
nodes that come up after node1.

Instructions:

```
$ cd galera
$ docker-compose build # This one will take a while
```

You'll want to bring up node1 and wait a minute for it to actually be ready.

```
$ docker-compose up -d node1
```

You can watch it with ```docker-compose logs -f node1```. When it seems to
settle down, run the following which will more than likely fail:

```
$ docker-compose up node2 node3
```

When it fails, run it again in daemon mode:

```
$ docker-compose up -d node2 node3
```

This failure is an artifact of how the official docker image (not provided by us) tries to initialize tablespace on first boot.

Then start maxscale and maxpanel:

```
$ docker-compose up -d maxscale maxpanel
```
Maxpanel will now be available on port 18080.

Next, create and seed the app db:

```
$ docker-compose run --rm app rails db:migrate db:seed
```

Then, start the rest:

```
$ docker-compose up -d
```


All the things should be running now:

* [Maxbook App](http://localhost:3000): A Rails app described in the top level README.md
* [MaxPanel](http://localhost:18080): A simple ember.js app for checking Maxscale status.
* [MaxScale]: MaxInfo JSON listener on port 8003, admin interface on 9003, read-write split on port 13306, read-only service on 13307.
* [Grafana](http://localhost:13000): Metrics on your DB's and MaxScale instance. Login/password: admin/admin

The Grafana container will not have a data source on first run, so you'll have to add one
the first time you bring it up. The easiest way is to run it via compose:

```
$ docker-compose run --rm app curl http://admin:admin@grafana:3000/api/datasources -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"Prometheus","type":"prometheus","url":"http://prometheus:9090","access":"proxy","isDefault":true}'
```


When you're done and want to clean up:

```
$ docker-compose stop
$ docker-compose rm -v -f
```
