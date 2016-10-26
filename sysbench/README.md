sysbench scripts for testing db loads in containers

example:

```
docker run -it --rm -e MYSQL_USER=root -e MYSQL_PASSWORD=rootpassword -e MYSQL_PORT=13306 -e MYSQL_HOST=maxscale --net=mrmprom_default --link=mrmprom_maxscale_1 skord/sysbench
```
