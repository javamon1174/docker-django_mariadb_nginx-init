FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /code/

# Setup for ssh onto github
RUN mkdir -p /root/.ssh
ADD config/ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN eval `ssh-agent -s` && ssh-add /root/.ssh/id_rsa
RUN ssh-keyscan -T 60 github.com >> /root/.ssh/known_hosts