# My tasks in Task 3

1. ### Create EC2 Instance t2.micro
 - Ubuntu
 - CentOS
 ### Both instances must have a tag with names.   
2. ### EC2 Ubuntu must have Internet access, there must be incoming access: ICMP, TCP/22, 80, 443, and any outgoing access.
3. ### EC2 CentOS should not have access to the Internet, but must have outgoing and incoming access: ICMP, TCP/22, TCP/80, TCP/443 only on the local network where EC2 Ubuntu, EC2 CentOS is located. 
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