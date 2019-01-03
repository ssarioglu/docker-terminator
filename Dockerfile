FROM ubuntu:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget curl htop git docker python-pip python-dev build-essential 
RUN apt-get install -y nmap zmap

# Upgrade PIP
RUN pip install --upgrade pip

# Install Azure CLI and AWS CLI
RUN pip install --upgrade awscli python-magic
RUN pip install azure-cli


#Copy Scripts
#COPY scripts /scripts
#COPY motd /etc/motd
#RUN chmod -R 777 /scripts

ENTRYPOINT ["/bin/bash"]
