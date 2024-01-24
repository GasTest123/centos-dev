docker run -d --restart always \
  --name mysql \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=Jingle@100 \
  -v /opt/docker/mysql/data:/var/lib/mysql \
  -v /opt/docker/mysql/config/mysql.cnf:/etc/mysql/mysql.cnf \
  -v /opt/docker/mysql/config/mysqld.cnf:/etc/mysql/mysql.conf.d/mysqld.cnf \
  mysql:5

# mysql -u root -p
# ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Jingle@100';

