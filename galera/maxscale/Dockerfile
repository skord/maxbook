FROM centos:7
RUN yum install -y https://downloads.mariadb.com/MaxScale/2.0.1/rhel/7/x86_64/maxscale-2.0.1-1.rhel.7.x86_64.rpm
ADD maxscale.cnf /etc/maxscale.cnf
CMD ["maxscale", "-d"]
