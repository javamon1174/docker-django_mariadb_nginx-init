# django-mysql-nginx-init
django-mysql-nginx-init

## Step
1. add id_rsa file in config/ssh
2. Change data as you want in docker-compose.yml & setting.py
3. set django SECRET_KEY in setting.py
4. $ docker network create mytube-net
5. $ docker-compose up -d --build
