#!/bin/bash
docker-compose up -d
echo "Sleeping 15 seconds"
sleep 15
docker-compose run --rm replication-manager bootstrap --hosts=mariadb1,mariadb2,mariadb3,mariadb4,mariadb5 --user=root:rootpassword --rpluser=repl:pass --verbose
echo "Sleeping 5 seconds to give maxscale time to find the master"
sleep 5
docker-compose run --rm app rails db:migrate
echo "Seeding app, may take a moment"
docker-compose run --rm app rails db:seed
