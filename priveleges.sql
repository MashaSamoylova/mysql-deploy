/*
1) Пользователя для управления только данными во всех БД на сервере.
имя: admin
хост: любой хост
без права передавать привилегии
 */

CREATE USER 'admin'@'%';
GRANT INSERT, SELECT, DELETE, UPDATE  ON  *.* TO 'admin'@'%';

/*
2) Пользователя для управления схемой firewallLogs
имя: firewallAdmin
хост: localhost
с правом передавать привелегии
 */

CREATE USER 'firewallAdmin'@'localhost';
GRANT ALL PRIVILEGES ON firewallLogs.* TO 'firewallAdmin'@'localhost' WITH GRANT OPTION;

/*
3) Пользователя для загрузки данных в таблицы схемы passwordsHashes
имя: pwdLoader
хост: любой хост
без права передавать привилегии
 */

CREATE USER 'pwdLoader'@'%';
GRANT UPDATE, INSERT  ON passwordsHashes.* TO 'pwdLoader'@'%' IDENTIFIED BY '1234';

/*
4) Пользователя для анализа данных в схеме passwordsHashes
имя: pwdAnalyst
с правом передавать привилегии
 */


CREATE USER 'pwdAnalyst'@'%';
GRANT SELECT ON passwordsHashes.* TO 'pwdAnalyst'@'%' WITH GRANT OPTION;

/*
5) Анонимного пользователя
без права передавать привелегии
 */

CREATE USER ''@'%';
