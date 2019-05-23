/*
Требуется развернуть инфраструктуру открытых ключей на основе удостоверяющего центра CA.
Сервер MySQL должен быть настроен на использование электронного сертификата
Необходимо создать следующих пользователей.
 */



/* 1) admin@'%' - требуется подтверждение владельца и издателя сертификата 
 */

ALTER USER 'admin'@'%' REQUIRE SSL;
ALTER USER 'admin'@'%' REQUIRE ISSUER '/CN=MySQL_Server_5.7.25_Auto_Generated_CA_Certificate';
ALTER USER 'admin'@'%' REQUIRE SUBJECT '/CN=MySQL_Server_5.7.25_Auto_Generated_Client_Certificate';

/*2) firewallAdmin@'%' - требуется только защищённое соединение
*/
ALTER USER 'firewallAdmin'@'%' REQUIRE SSL;

/*
3) pwdAnalyst@'%' - требуется подтверждение: использование любого валидного электронного сертификата в рамках инфраструктуры открытых ключей
 */

ALTER USER 'pwdAnalyst'@'%' REQUIRE X509;

/*
4) pwdLoader@'%' - требуется подтверждение издателя сертификата, причём издатель должен быть другим нежели чем издатель для сертификата сервера MySQL
 */
ALTER USER 'pwdLoader'@'%' REQUIRE ISSUER '/CN=olololo';


/*
Generate client certificate:
openssl req -x509 -newkey rsa:1024 -keyout client-key-enc.pem -out client-cert.pem -subj '/DC=com/DC=example/CN=olololo' -passout pass:asdfasdf

openssl rsa -in client-key-enc.pem -out client-key.pem

cat server-cert.pem client-cert.pem > ca.pem

CHECK CONNECTION:
mysql -P 3306 --protocol=tcp -u pwdLoader  --ssl-cert=./db-data/data/client-cert.pem --ssl-key=./db-data/data/client-key.pem -p
*/
