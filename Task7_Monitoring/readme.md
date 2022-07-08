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
### Запустить zabbix сервер и zabbix агента
- sudo systemctl restart zabbix-server zabbix-agent apache2
- sudo systemctl enable zabbix-server zabbix-agent apache2  
### Перейти настройке Zabbix в браузере, перейти по адресу:
- http://server_ip/zabbix
###
2. Prepare VM or instances. 
- Install Zabbix agents on previously prepared servers or VM.
EXTRA 1.2.2: Complete 1.2.1 using ansible
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
