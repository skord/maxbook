FROM ubuntu:16.04
RUN apt-get update && apt-get install -y sysbench mariadb-client
ADD benchmark.sh /benchmark.sh
RUN chmod +x benchmark.sh
CMD ["/benchmark.sh"]
