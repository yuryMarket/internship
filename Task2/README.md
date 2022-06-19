## Result of the main part:
[http://3.67.202.19/](http://3.67.202.19/)  

## Result of the external part
[https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot+2022-06-18+20.00.46.png](https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot+2022-06-18+20.00.46.png)
      

# My tasks in Task 2

 1. ### Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
 Регистрация не понадобилась, т.к. уже имелся созданный ранее аккаунт.   

2. ### Explore AWS Billing for checking current costs. 
 На текущий момент уже имеются расходы, т.к. на аккаунте имеется инстэнс из другого проекта, работающий в постоянном режиме и аккаунт уже существует больше года.
 [![Screenshot-from-2022-06-19-17-20-26.png](https://i.postimg.cc/X7Fr0WHN/Screenshot-from-2022-06-19-17-20-26.png)](https://postimg.cc/5644whWD)


3. ### Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
Пошаговое выполнение данной задачи следующее:
1.Переходим в интерфейс создание нового instance (кнопка Launche Instances)  
2.Указываем имя (Ubuntu_vpc1)  
3.Выбираем используемый образ (Ubuntu)  
4.Выбираем Key pair (использовал уже существующую пару)  
5.Выбираем сеть. Т.к. я сразу реализовывал задание в 2 разных сетях, выбираю созданную сеть Task2_vpc1)  
6.Выбираем созданную ранее security group со следующими правилами:
[![Screenshot-from-2022-06-19-17-33-01.png](https://i.postimg.cc/cJcD9VyX/Screenshot-from-2022-06-19-17-33-01.png)](https://postimg.cc/sBv91H2h)  
7.Запускаем новый instance.  
8.Проделываем аналогичные действия для запуска второго instance со следующими изменениями:
- имя - amazon_linux_vpc2
- используемый образ (Amazon Linux)
- сеть - Task2_vpc2)
- security group - vpc_2-SSH-HTTP-HTTPS  



4. ### Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?  
1.Подключаемся к запущенным серверам по SSH со своего хоста используя publick ip.  
[![Screenshot-from-2022-06-19-17-46-29.png](https://i.postimg.cc/T1Pgd4s2/Screenshot-from-2022-06-19-17-46-29.png)](https://postimg.cc/k6kBwf9L)  
[![Screenshot-from-2022-06-19-17-48-39.png](https://i.postimg.cc/XNT9SQ8W/Screenshot-from-2022-06-19-17-48-39.png)](https://postimg.cc/7bn5S1dt)  

### Make sure  ping and SSH are allowed from one instance to another in both ways. Configure SSH connectivity between instances using SSH keys.
- Загружаем файл с secret key на оба сервера. Прверяем пинг и возможность подключения по SSH.  
[![Screenshot-from-2022-06-19-17-57-59.png](https://i.postimg.cc/wBLjNQNX/Screenshot-from-2022-06-19-17-57-59.png)](https://postimg.cc/d7QFPd43)
[![Screenshot-from-2022-06-19-17-59-02.png](https://i.postimg.cc/25wggqNp/Screenshot-from-2022-06-19-17-59-02.png)](https://postimg.cc/Y4vXWCS8)  


5. ### Install web server (nginx/apache) to one instance; 
- ### Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
- ### Make sure your web server is accessible from the internet and you can see your web page in your browser; 
- ### Make sure on the instance without nginx/apache you also maysee the content of your webpage from the instance with nginx/apache.
Устанавливаем и запускаем вебсервер. Добавляем html-страницу с "Hello, world" и информацией о системе. Результат доступен по ссылке [http://3.67.202.19/](http://3.67.202.19/)
 

 
### EXTRA (optional): 
1. ### Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP).
- переходим в раздел по управлению сетями VPC.
- кликаем Create VPC и попадаем в интерфейс создания сетей.
- указываем имя сети (Task2_vpc1)
- указываем CIDR block (указываем 10.0.0.0/28, в большем необходимости нет)
- запускаем создание сети
- переходим в раздел Subnets, кликаем Create Subnet и попадаем в интерфейс создания подсети
- выбираем сеть, в которую добавляем подсеть (Task2_vpc1)
- добавляем имя подсети (subnet_vpc1)
- выбираем Availability Zone
- выбираем CIDR block (аналогичный блоку в созданной сети)
- запускаем создание подсети
- переходим в раздел Internet gateways и кликаем Create internet gateaway
- добавляем имя и запускаем новый gateaway
- возвращаем в раздел Internet gateways и производим attach созданного gateaway к своей сети Task2_vpc1
- переходим в раздел Route tables
- кликаем Create route 
- добавляем имя, выбираем сеть Task2_vpc1
- создаем новый Route table
- переходим в созданный Route table и добавляем следующие роуты
[![Screenshot-from-2022-06-19-18-27-27.png](https://i.postimg.cc/xjN7GjTP/Screenshot-from-2022-06-19-18-27-27.png)](https://postimg.cc/3W7nYTGy)
(роут 10.0.2.0/28 добавляется для последующего пиринга с другой сетью)
- проделываем аналогичные действия для создания второй сети Task2_vpc2. CIDR block указываем 10.0.2.0/28 для наличия возможности дальнейшего соединения данных сетей.
- для соединения между серверами по приватным айпи необходимо соединить данные сети. Для этого производим следующие действия:
- переходим в раздел Peering connections
- кликаем create peering connection
- добавляем название
- выбираем соединяемые сети
- кликаем create peering connection
- перезагружаем страницу и подтверждаем peering connection
 - в результате появляется возможность соединения по внутренним айпи адресам:
[![Screenshot-from-2022-06-19-18-54-04.png](https://i.postimg.cc/9MrH6v5t/Screenshot-from-2022-06-19-18-54-04.png)](https://postimg.cc/LYKWfQsn)

[![Screenshot-from-2022-06-19-18-54-45.png](https://i.postimg.cc/MZQh10WT/Screenshot-from-2022-06-19-18-54-45.png)](https://postimg.cc/BtJY0KP9)


2. ### Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
Написанный скрипт указан во вложенном файле.  

3. ### Run step.6 without “manual” EC2 SSH connection.
Данный запуск производится посредством добавления скрипта в раздел User data  Info при запуске нового Instance.

### EXTRA (optional optional):
1. ### Make a screenshot only of your web page сontent from your browser.
2. ### Create your S3 bucket and place your screenshot there. Make your screenshot visible on the internet for everyone and make sure it works.
Результат доступен по ссылке [https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot+2022-06-18+20.00.46.png](https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot+2022-06-18+20.00.46.png)
 








