FROM centos:7
RUN yum install -y http://max-tst-01.mariadb.com/ci-repository/maxscale-2.0.1-sep26/mariadb-maxscale/centos/7/x86_64/maxscale-2.0.1-1.centos.7.x86_64.rpm
ADD maxscale.cnf /etc/maxscale.cnf
CMD ["maxscale", "-d"]
