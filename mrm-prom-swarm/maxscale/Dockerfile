FROM centos:7
RUN yum install -y https://downloads.mariadb.com/MaxScale/2.0.1-oct27/rhel/7/x86_64/maxscale-2.0.1-2.rhel.7.x86_64.rpm
CMD ["maxscale", "-d", "-l", "stdout"]
