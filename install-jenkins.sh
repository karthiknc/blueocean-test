
# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

# Install `Docker Community Edition` required by Jenkins
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

# Giving Jenkins permission to use docker
# Add Jenkins user to docker group
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins

sudo apt-get -y install python3-pip

# Prepare and install aws
# Might not be required
sudo pip3 install awscli --upgrade --user
# sudo ln -s ~/.local/bin/aws /usr/bin/aws
# sudo chown -R ubuntu:ubuntu .local

# Install boto3
if ["" == `(which python)`]; then
        # @todo If python3 does not exist install
        sudo ln -s /usr/bin/python3 /usr/bin/python
        sudo ln -s /usr/bin/pip3 /usr/bin/pip
fi
sudo pip install boto3
sudo pip install virtualenv

mkdir ~/.aws
touch ~/.aws/config
echo '[default]' >> ~/.aws/config
echo 'region = eu-west-1' >> ~/.aws/config
echo 'output = json' >> ~/.aws/config


# Testing below
# wget http://localhost:8080/jnlpJars/jenkins-cli.jar
# java -jar jenkins-cli.jar -s http://localhost:8080/ help
# java -jar ~/jenkins-cli.jar -s http://localhost:8080/ list-jobs --username karthik --password {pass}
# java -jar ~/jenkins-cli.jar -s http://localhost:8080/ get-job blueocean-test > template.xml --username karthik --password {pass}
# java -jar jenkins-cli.jar -s http://localhost:8080/ create-job build-test_demo-site < template.xml --username karthik --password {pass}
