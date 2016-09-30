# MariaDB / MaxScale / MaxPanel / App Demo

There are two versions of this, a mrm and a galera version, each in respective
directories.

### Galera Version

This one has a weird bug I need to look into regarding bringing up the DB
nodes that come up after node1. It works, it's just weird.

Instructions:

```
$ cd galera
$ docker-compose build # This one will take a while
```

This is where the weirdness comes in. You'll want to bring up node1 and wait a
minute for it to actually be ready.

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

Then start maxscale and maxpanel:

```
$ docker-compose up -d maxscale maxpanel
```

Next, create and seed the app db:

```
$ docker-compose run --rm app rails db:create db:migrate db:seed
```

Then, start the app:

```
$ docker-compose up -d app
```

Now the app will be running on your docker host IP on port 3000.

When you're done and want to clean up:

```
$ docker-compose stop
$ docker-compose rm -v -f
```
