/*
Требуется развернуть инфраструктуру открытых ключей на основе удостоверяющего центра CA.
Сервер MySQL должен быть настроен на использование электронного сертификата
Необходимо создать следующих пользователей.
1) admin@'%' - требуется подтверждение владельца и издателя сертификата
2) firewallAdmin@'%' - требуется только защищённое соединение
3) pwdAnalyst@'%' - требуется подтверждение: использование любого валидного электронного сертификата в рамках инфраструктуры открытых ключей
4) pwdLoader@'%' - требуется подтверждение издателя сертификата, причём издатель должен быть другим нежели чем издатель для сертификата сервера MySQL
 */



/* 1) admin@'%' - требуется подтверждение владельца и издателя сертификата 
 */
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY '1234';
ALTER USER 'admin'@'%' REQUIRE SSL;
ALTER USER 'admin'@'%' REQUIRE ISSUER '/CN=MySQL_Server_5.7.25_Auto_Generated_CA_Certificate';
ALTER USER 'admin'@'%' REQUIRE SUBJECT '/CN=MySQL_Server_5.7.25_Auto_Generated_Client_Certificate';

/*2) firewallAdmin@'%' - требуется только защищённое соединение
*/
GRANT ALL PRIVILEGES ON *.* TO 'firewallAdmin'@'%' IDENTIFIED BY '1234';
ALTER USER 'firewallAdmin'@'%' REQUIRE SSL;

/*
3) pwdAnalyst@'%' - требуется подтверждение: использование любого валидного электронного сертификата в рамках инфраструктуры открытых ключей
 */

GRANT ALL PRIVILEGES ON *.* TO 'pwdAnalyst'@'%';
ALTER USER 'pwdAnalyst'@'%' REQUIRE X509;

/*
4) pwdLoader@'%' - требуется подтверждение издателя сертификата, причём издатель должен быть другим нежели чем издатель для сертификата сервера MySQL
 */
ALTER USER 'pwdLoader'@'%' REQUIRE ISSUER 'some issuer';

