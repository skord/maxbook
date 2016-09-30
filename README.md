# MariaDB / MaxScale / MaxPanel / App Demo

There are two versions of this, a mrm and a galera version, each in respective
directories.

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

### MariaDB Replication Manager / Async Version

This will bring up five DB servers and a MaxScale that has two services: read write split and read-only.

Instructions:

```
$ cd mrm
$ docker-compose build # This one will take a while
```

Bring up your cluster

```
$ docker-compose up -d
```

Wait about 30 seconds and bootstrap replication:

```
$ docker-compose run --rm replication-manager bootstrap --hosts=mariadb1,mariadb2,mariadb3,mariadb4,mariadb5 --user=root:rootpassword --rpluser=repl:pass --verbose
```

Seed the db and start the demo app:

```
$ docker-compose run --rm app rails db:migrate db:seed
```

At this point, you should be able to see maxpanel running on port 18080 and the replication manager dashboard on port 10001.

The app should be available on port 3000 after a short moment.

If you'd like to add more users to the DB and watch the connections count in MaxPanel go up, you can run the seed process
again. Once it's done, you'll see the connection count go back to normal.

Seed again:
```
$ docker-compose run --rm app rails db:seed
```

When you're done and want to clean up:

```
$ docker-compose stop
$ docker-compose rm -v -f
```

##### Demo of Failure with the MRM setup.

Rails has a timer that runs periodicaly that will reap dead threads from the
connection pool. In production, you'd probably tweak your app to be a little more
responsive to failure than this, but we can try simulating a failure in the demo
to see how it's handled.

If your docker instance isn't running on localhost, substitute that host for localhost in the steps below:

1. Go to http://localhost:3000
2. Pick a user and click "Show" on that user's line.
3. In a new browser tab, go to http://localhost:10001 and click the "Switchover" button and confirm the switch.
4. Refresh the demo app tab. You shouldn't see any problems because maxscale handles the read split and Rails has no reason to mark any connection threads as dead.
5. Click the "Edit" link on the user page.
6. Click the "Update Person" button. You should see an error page now.
7. Hit the refresh button in your browser a few times and confirm the form resubmission.
7. Click the "Show" link on the user page.
8. Click the "Edit" link on the user page, then the "Update Person" button.
9. Wait about 5 seconds to ensure the web server has reaped the dead connection.
10. Click the "Update Person" button, it should just work.
