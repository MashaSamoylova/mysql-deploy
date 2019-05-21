FROM ubuntu:latest

RUN apt-get update && apt-get install xz-utils libaio1 libaio-dev libnuma-dev openssl -y

RUN groupadd mysql
RUN  useradd -r -g mysql -s /bin/false mysql

COPY distro /usr/local
COPY create_db.sql /usr/local 
WORKDIR /usr/local

RUN mkdir mysql-dir
RUN tar zxvf *.gz -C mysql-dir
RUN ln -s mysql-dir/mysql* mysql

WORKDIR mysql
RUN mkdir mysql-files
RUN chown mysql:mysql mysql-files
RUN chmod 750 mysql-files
RUN bin/mysqld --no-defaults --initialize-insecure --user=mysql --skip-name-resolve --bind-address=0.0.0.0
RUN bin/mysql_ssl_rsa_setup --uid=mysql
RUN bin/mysqld_safe --user=mysql &
RUN cp support-files/mysql.server /etc/init.d/mysql.server

RUN mkdir /usr/local/mysql-dir/mysql-5.7.25-linux-glibc2.12-x86_64/test
RUN chmod 777 /usr/local/mysql-dir/mysql-5.7.25-linux-glibc2.12-x86_64/test
USER mysql
RUN cp -r data/* test
 
RUN ls data
RUN ls test
EXPOSE 3306
ENTRYPOINT ["./bin/mysqld"]
