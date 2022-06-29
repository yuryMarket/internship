# My tasks in Task 4

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
- Запускаем контейнер на базе образа nginx следующей командой:  
docker run -it --rm -d -p 8080:80 --name web nginx
 - Переходим в контейнер используя команду формата:
 docker exec -it <container_id> bash
 - Вносим изменения в index.html:
 echo "Yury 2022" > /usr/share/nginx/html/index.html
3. ### 3.1.Create your Dockerfile for building a docker image. Your docker image should run any web application (nginx, apache, httpd). Web application should be located inside the docker image. 
#### EXTRA 3.1.1. For creating docker image use clear basic images (ubuntu, centos, alpine, etc.)
### 3.2.Add an environment variable "DEVOPS=<username> to your docker image
#### EXTRA 3.2.1. Print environment variable with the value on a web page (if environment variable changed after container restart - the web page must be updated with a new value)
 - Результатом пунктов 3.1, EXTRA 3.1.1, 3.2, EXTRA 3.2.1.
 является Dockerfile 
4. ### Push your docker image to docker hub (https://hub.docker.com/). Create any description for your Docker image.   
 [![Screenshot-from-2022-06-28-23-55-02.png](https://i.postimg.cc/gcTr7SJT/Screenshot-from-2022-06-28-23-55-02.png)](https://postimg.cc/Dm12Jc1r)  
 #### EXTRA 4.1. Integrate your docker image and your github repository. Create an automatic deployment for each push. (The Deployment can be in the “Pending” status for 10-20 minutes. This is normal)  
 https://github.com/yuryMarket/internship/actions  


5. ### Create docker-compose file. Deploy a few docker containers via one docker-compose file. 
 - first image - your docker image from the previous step. 5 nodes of the first image should be run;
 - second image - any java application;
 - last image - any database image (mysql, postgresql, mongo or etc.).
 - Second container should be run right after a successful run of a database container.  
   
Файл docker-compose.yml находится в текущей дирректории. В качетсве java приложения запущен Jenkins, в качестве базы данных выбрана Mongodb.
#### EXTRA 5.1. Use env files to configure each service.  
[![Screenshot-from-2022-06-30-00-53-49.png](https://i.postimg.cc/FFxtgZZf/Screenshot-from-2022-06-30-00-53-49.png)](https://postimg.cc/jCCkRyBK)

    

