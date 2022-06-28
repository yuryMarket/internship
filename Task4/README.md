# My tasks in Task 3

1. ### Install docker. (Hint: please use VMs or Clouds  for this.)
 - Докер установлен  
[![Screenshot-from-2022-06-27-21-08-43.png](https://i.postimg.cc/6qxPGSMS/Screenshot-from-2022-06-27-21-08-43.png)](https://postimg.cc/dkn6bWPm)
#### EXTRA 1.1. Write bash script for installing Docker.
- Скрипт находится в файле script_install_docker в текущей дирректории

   
2. ### Find, download and run any docker container "hello world". (Learn commands and parameters to create/run docker containers.
 - Используя команду, запускаем контейнер :  
 dосker run hello-world  
  - [![Screenshot-from-2022-06-27-22-00-24.png](https://i.postimg.cc/zBcV8sFs/Screenshot-from-2022-06-27-22-00-24.png)](https://postimg.cc/XG9VgDhL)  
  #### EXTRA 2.1. Use image with html page, edit html page and paste text: <Username> 2022
- Запускаем контейнер на базе образа Inginx следующей командой:  
docker run -it --rm -d -p 8080:80 --name web nginx
 - Переходим в контейнер используя команду формата:
 docker exec -it <container_id> bash
 - Вносим изменения в index.html:
 echo "Yury 2022" > /usr/share/nginx/html/index.html
 - Результат доступен по ссылке http://35.157.225.181:8080/
3. ### 3.1.Create your Dockerfile for building a docker image. Your docker image should run any web application (nginx, apache, httpd). Web application should be located inside the docker image. 
#### EXTRA 3.1.1. For creating docker image use clear basic images (ubuntu, centos, alpine, etc.)
### 3.2.Add an environment variable "DEVOPS=<username> to your docker image
#### EXTRA 3.2.1. Print environment variable with the value on a web page (if environment variable changed after container restart - the web page must be updated with a new value)
 - Результатом пунктов 3.1, EXTRA 3.1.1, 3.2, EXTRA 3.2.1.
 является Dockerfile в текущей дирректории, переменная выводится по адресу http://35.157.225.181:8090/


4. ### On EC2 Ubuntu, install a web server (nginx/apache);
### Create a web page with the text “Hello World” and information about the current version of the operating system. This page must be visible from the Internet. 
5. ### On EC2 Ubuntu install Docker, installation should be done according to the recommendation of the official Docker manuals 

### EXTRA (optional): 
1. ### Complete  step 1, but AMI ID cannot be hardcoded. You can hardcode operation system name, version, etc. 
2. ### Step 3 read as: 
### EC2 CentOS should have outgoing and incoming access: ICMP, TCP/22, TCP/80, TCP/443, only to EC2 Ubuntu. 
 - Загружаем на сервер EC2 Amazon Linux файл с ключом для доступа по SSH.  
 - Отправляем команду вида: ssh -D8080 -fCqN user@server_ip для открытия туннеля.
 - Открываем файл командой:
vi /etc/yum.conf
 - Добавляем запись: 
proxy=socks5h://127.0.0.1:8080
 

3. ### On EC2 CentOS install nginx (note. Remember about step 7, the task can be done in any way, it is not necessary to use terraform)
### Create a web page with the text “Hello World”. This page must be visible from the  EC2 Ubuntu.
 - выполняем следующие команды по порядку:
 - yum update
 - yum install nginx
 - service nginx start
 - echo "<html>Hey, Dude<p>Linux ip-10-0-0-11 5.15.0-1011-aws #14-Ubuntu SMP Wed Jun 1 20:54:22 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux</p><table clas>" > /var/www/html/index.html