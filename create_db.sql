CREATE DATABASE firewallLogs CHARACTER set utf8;
CREATE DATABASE passwordsHashes CHARACTER set utf8;

USE firewallLogs;

CREATE TABLE logs (
    date_time      DATETIME NOT NULL,
    type           VARCHAR(20) NOT NULL,
    server_address VARCHAR(15) NOT NULL,
    server_port    int NOT NULL,
    client_address VARCHAR(15) NOT NULL,
    client_port    int NOT NULL,

    PRIMARY KEY(date_time)
);

USE passwordsHashes;

CREATE TABLE yandex (
    email        VARCHAR(256),
    passwordHash VARCHAR(128),

    PRIMARY KEY(email)
);

CREATE TABLE google (
    email        VARCHAR(256),
    passwordHash VARCHAR(128),

    PRIMARY KEY(email)
);

CREATE TABLE mail_ru (
    email        VARCHAR(256),
    passwordHash VARCHAR(128),

    PRIMARY KEY(email)
);
