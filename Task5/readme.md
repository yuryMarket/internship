1. Read documentation about System configuration management.
2. Learn about the advantages and disadvantages of Ansible over other tools.
3. Become familiar with ansible basics and YAML syntax.
4. Basics of working with Ansible from the official documentation
EXTRA Read the Jinja2 templating documentation


### 1.Deploy three virtual machines in the Cloud. Install Ansible on one of them (control_plane).  
### 2.Ping pong - execute the built-in ansible ping command. Ping the other two machines.
Запускаем Ping командой: sudo ansible  all -m ping
### 3.My First Playbook: write a playbook for installing Docker on two machines and run it.  

#### EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.  
Результат доступен по ссылке:
http://52.57.34.232:8080/wp-admin/setup-config.php
#### EXTRA 2. Playbooks should not have default creds to databases and/or admin panel.
#### EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).  
Реализация следующая:
 - Ansible должен быть установлен следующим путем:
 sudo apt-add-repository ppa:ansible/ansible
 sudo apt-get update
 sudo apt-get install ansible
 - Создать рабочую дирректорию
 - В неё данными командами скачать файлы ec2.py и ec2.ini:  
 wget https://raw.githubusercontent.com/vshn/ansible-dynamic-inventory-ec2/master/ec2.py  
 wget https://raw.githubusercontent.com/vshn/ansible-dynamic-inventory-ec2/master/ec2.ini

 - если установлен Python 3: в файле ec2.py заменить первую строку:  #!usr/bin/env python → #!usr/bin/python3
 - добавить секретные ключи (перед этим создать их на аккаунте AWS):
  export AWS_ACCESS_KEY_ID='<YOUR ACCESS KEY>'
  export AWS_SECRET_ACCESS_KEY='<YOUR SECRET ACCESS KEY>'
- сделать файл ec2.py исполняемым:  
sudo chmod +x ec2.py
- установить менеджер пакетов pip:  
sudo apt install python3-pip
- скачать модуль boto:  
pip install boto
 - если выдает ошибку в 172 или 173 строке файла ec2.py - закомментировать данную строку, на работу не влияет
  - 