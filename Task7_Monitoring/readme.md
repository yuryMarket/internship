Tasks:
# Zabbix:
Big brother is watching  ....
1. ## Install on server, configure web and base  
### Подключить репозиторий zabbix и установить основные пакеты
- wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-1+ubuntu22.04_all.deb
- sudo dpkg -i zabbix-release_6.2-1+ubuntu22.04_all.deb
- sudo apt update
- sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent  
### Установить базу данных Marid DB
- sudo apt -y install mariadb-common mariadb-server mariadb-client  
### Установить root пароль для базы данных
- sudo mysql_secure_installation
### Создадть базу данных
- sudo mysql -uroot -p'87_mellors' -e "create database zabbix character set utf8 collate utf8_bin;"
- sudo mysql -uroot -p'87_mellors' -e "grant all privileges on zabbix.* to zabbix@localhost identified by '87_mellors';"  
### Импортировать базу
- sudo mysql -uroot -p'87_mellors' zabbix -e "set global innodb_strict_mode='OFF';"
- zcat /usr/share/doc/zabbix-sql-scripts/mysql/server.sql.gz | mysql -uzabbix -p zabbix  
### Активировать innodb_strict_mode
- sudo mysql -uroot -p'87_mellors' zabbix -e "set global innodb_strict_mode='ON';"  
### Указать пароль в файле конфигурации /etc/zabbix/zabbix_server.conf
- DBPassword=87_mellors  
Судя по всему данная команда не отработала. Пршлось дополнительно менять данный параметр здесь:
sudo nano /etc/zabbix/zabbix_server.conf, иначе в GUI выдает ошибку, что сервер не запущен.
### Запустить zabbix сервер и zabbix агента
- sudo systemctl restart zabbix-server zabbix-agent apache2
- sudo systemctl enable zabbix-server zabbix-agent apache2  
### Перейти настройке Zabbix в браузере, перейти по адресу:
- http://server_ip/zabbix
### Оуществляем первоначальные настройки
### Данные для входа:
log:Admin
pass:zabbix  
[![Screenshot-from-2022-07-08-13-48-56.png](https://i.postimg.cc/tTPWgW4c/Screenshot-from-2022-07-08-13-48-56.png)](https://postimg.cc/N9s5JyT8)  

2. ## Prepare VM or instances. 
### Запустить 2 дополнительных инстанса
- ## Install Zabbix agents on previously prepared servers or VM.
### Сконфигурировать хост в интерфейсе zabbixa:
[![Screenshot-from-2022-07-08-14-25-27.png](https://i.postimg.cc/MpPyCjPc/Screenshot-from-2022-07-08-14-25-27.png)](https://postimg.cc/dhCkdDKv)
- В IP Adress вписываем IP нашего сервера, на который будет устанавливаться агент  
### Подключиться к серверу, на который устанавливаем Zabbix Agent по SSH
### Устанавить репозиторий
- wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-1+ubuntu22.04_all.deb
- dpkg -i zabbix-release_6.2-1+ubuntu22.04_all.deb
- apt update
### Установить агента
- apt install zabbix-agent
### Изменить конфигурацию:
- sudo nano /etc/zabbix/zabbix_agentd.conf
Server=My_IP_server_agent
ServerActive=My_IP_server_agent
Hostname=(hostname из настройки в GUI)
### Проверить доступность сервера
[![Screenshot-from-2022-07-08-16-14-22.png](https://i.postimg.cc/3JrpX4vb/Screenshot-from-2022-07-08-16-14-22.png)](https://postimg.cc/HjKVHL3Q)
### Аналогично настроить второй агент на втором сервере.
## EXTRA 1.2.2:  
Complete 1.2.1 using ansible
1.3 Make several of your own dashboards, where to output data from your host/vm/container (one of them)
1.4 Active check vs passive check - use both types.
1.5 Make an agentless check of any resource (ICMP ping)
1.6 Provoke an alert - and create a Maintenance instruction
1.7 Set up a dashboard with infrastructure nodes and monitoring of hosts and software installed on them


# ELK:
Nobody is forgotten and nothing is forgotten.
2.1 Install and configure ELK
2.2 Organize collection of logs from docker to ELK and receive data from running containers
2.3 Customize your dashboards in ELK
EXTRA 2.4: Set up filters on the Logstash side (get separate docker_container and docker_image fields from the message field)
2.5 Configure monitoring in ELK, get metrics from your running containers
2.6 Study features and settings

# Grafana:
3.1 Install Grafana
3.2 Integrate with installed ELK
3.3 Set up Dashboards
3.4 Study features and settings
