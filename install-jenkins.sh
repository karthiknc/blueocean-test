
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



# Testing below
# wget http://localhost:8080/jnlpJars/jenkins-cli.jar
# java -jar jenkins-cli.jar -s http://localhost:8080/ help
# java -jar ~/jenkins-cli.jar -s http://localhost:8080/ list-jobs --username karthik --password {pass}
# java -jar ~/jenkins-cli.jar -s http://localhost:8080/ get-job blueocean-test > template.xml --username karthik --password {pass}
# java -jar jenkins-cli.jar -s http://localhost:8080/ create-job build-test_demo-site < template.xml --username karthik --password {pass}
