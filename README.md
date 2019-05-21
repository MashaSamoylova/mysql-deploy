# mysql-deploy
Creation MySQL Docker using Generic Binaries.
[Guide](https://dev.mysql.com/doc/mysql-startstop-excerpt/5.7/en/binary-installation.html)

## Build
Download tar archive fom official [site](https://dev.mysql.com/downloads/mysql/5.7.html).
And put archive into `distro` directory.

Run:
```
./build.sh
```

## Run
```
./run.sh
```

For fix error `ERROR 1130 (HY000): Host '172.17.0.1' is not allowed to connect to this MySQL server`, run
```
./fix_privilege.sh
```
This script adds possibility to connect from random host.

## Connect

Install on your system mysql client. For ubuntu:
```
sudo apt install mysql-client-core-5.7 
```
Run command:
```
mysql -P 3306 --protocol=tcp -u root
```

Connect with certificates
```
mysql -P 3306 —protocol=tcp -u admin —ssl-ca=./db-data/data/ca.pem —ssl-cert=./db-data/data/client-cert.pem —ssl-key=./db-data/data/client-key.pem -p
```
