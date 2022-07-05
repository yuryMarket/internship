### Important points:
### Read about Jenkins. What is Jenkins and what is it used for? Ways of using. What is a declarative and imperative approach? 
 
### Tasks:
### 1. Install Jenkins. It must be installed in a docker container.
 - Установить пакеты, позволяющие apt пользоваться https:
 sudo apt-get update
 sudo apt-get install \  
    ca-certificates \  
    curl \  
    gnupg \  
    lsb-release
 - Добавить официальный Docker's GPG ключ.  
 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
 - Настроить репозиторий:
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 - Установить Docker на Ubuntu. Использовать следующие команды:  
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
 - Проверить установку Docker запустив hello-world image:
 sudo docker run hello-world
 [![Screenshot-from-2022-07-05-14-02-13.png](https://i.postimg.cc/pLR29swD/Screenshot-from-2022-07-05-14-02-13.png)](https://postimg.cc/SJ103fNs)
 - Запустить контейнер с Jenkins следующей командой:
sudo docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11
 - Проверить установку контейнера: 
sudo docker container ls
 - Прверить доступность GUI Jenkins по адресу My_IP_Adress:8080
 [![Screenshot-from-2022-07-05-14-25-33.png](https://i.postimg.cc/RC3Px9bY/Screenshot-from-2022-07-05-14-25-33.png)](https://postimg.cc/SjhLW04L)
  - Разблокировать Jenkins используя пароль, находящийся по адресу: /var/jenkins_home/secrets/initialAdminPassword. Так же он доступен при установке.
  [![Screenshot-from-2022-07-05-14-31-57.png](https://i.postimg.cc/Y2bmRm3K/Screenshot-from-2022-07-05-14-31-57.png)](https://postimg.cc/s1GXDxqw)
  - Залогиниться в Jenkins
  


### 2. Install necessary plugins (if you need).
 - Установить плагин Local  и изменить язык на английский
 

### 3. Configure several (2-3) build agents. Agents must be run in docker.
### 4. Create a Freestyle project. Which will show the current date as a result of execution.
### 5. Create Pipeline which will execute docker ps -a in docker agent, running on Jenkins master’s Host.
### 6. Create Pipeline, which will build artifact using Dockerfile directly from your github repo (use Dockerfile from previous task).
### 7. Pass  variable PASSWORD=QWERTY! To the docker container. Variable must be encrypted!!!

 
### EXTRA:
### 1. Create a pipeline, which will run a docker container from Dockerfile at the additional VM.
### 2. Create an ansible playbook, which will deploy Jenkins.
### 3. Deploy a local docker registry, upload a docker image there, download img from your local docker registry and run the container.
### 4. Configure integration between Jenkins and your Git repo. Jenkins project must be started automatically if you push or merge to master, you also must see Jenkins last build status(success/unsuccess) in your Git repo.
