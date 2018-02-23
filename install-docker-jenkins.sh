#!/bin/bash

# Install `Docker Community Edition`
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce

sudo makedir /home/ubuntu/jenkins-data

# Run jenkins on docker
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/ubuntu/jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins \
  jenkinsci/blueocean


# Inside docker image add git authentication mechanism.
# Better to fetch auth key in runtime
# Adding ssh keys for now:
# mkdir ~/.ssh
# touch ~/.ssh/known_hosts
# ssh-keyscan github.com >> ~/.ssh/known_hosts
# Generate ssh key

# Jenkinsfile preparation step
# steps {
#   sh '''
#   cp ../../rsa_key ~/.ssh/id_rsa
#   chmod 600 ~/.ssh/id_rsa
#   git clone git@github.com:newsuk/nu-ecsplatform.git
#   ls -al
#   '''
# }
