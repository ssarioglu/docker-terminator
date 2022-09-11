FROM ubuntu:latest
MAINTAINER Serdar Sarioglu, Serdar.Sarioglu@mysystem.org

# Install Basic Tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential ca-certificates wget curl git docker unzip mysql-client redis-tools nmap zmap dnsutils htop 
RUN apt install -y python3-pip

# Upgrade PIP
RUN pip install --upgrade pip

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.2.9/terraform_1.2.9_linux_amd64.zip
RUN unzip terraform_1.2.9_linux_amd64.zip
RUN mv terraform /usr/local/bin/
RUN terraform --version 

#Install Kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# Install Azure CLI, AWS CLI and Google Cloud CLI
RUN pip install awscli --upgrade 
RUN pip install azure-cli

#Copy Scripts
COPY scripts /scripts
COPY 11-docker /etc/update-motd.d/
RUN chmod -R 777 /scripts
RUN chmod -R 777 /etc/update-motd.d/

ENTRYPOINT ["/bin/bash"]"
