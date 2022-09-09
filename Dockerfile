FROM ubuntu:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget curl git docker build-essential
RUN apt-get install -y nmap zmap dnsutils htop redis-tools
RUN apt install -y python3-pip

# Upgrade PIP
RUN pip install --upgrade pip

# Install Azure CLI and AWS CLI
RUN pip install awscli --upgrade 
RUN pip install azure-cli

#Copy Scripts
COPY scripts /scripts
COPY 11-docker /etc/update-motd.d/
RUN chmod -R 777 /scripts
RUN chmod -R 777 /etc/update-motd.d/

ENTRYPOINT ["/bin/bash"]"
