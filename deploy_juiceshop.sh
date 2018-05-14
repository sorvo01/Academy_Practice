#!/bin/bash

tput setaf 6
echo -e ""
echo -e "------------------------------------"
echo -e "Beginning of OWASP Juice Shop installation..."
echo -e "------------------------------------"
echo -e ""

tput setaf 2
echo -e "------------------------------------"
echo -e "Installing Docker..."
echo -e "------------------------------------"

{
#Uninstall older versions
sudo apt-get remove docker docker-engine docker.io
#Update the apt package index
sudo apt-get update
#Install packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
#Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#Update the apt package index.
sudo apt-get update
#Install the latest version of Docker CE, or go to the next step to install a specific version
sudo apt-get install docker-ce
#Verify Docker installation
sudo docker run hello-world
} &> /dev/null

echo -e "Verifying Docker installation..."
echo -e "------------------------------------"

service docker start

sudo systemctl status docker | grep 'Active: active (running)' &> /dev/null
if [ $? == 0 ]; then
	echo -e "Docker service is up and running"
	echo -e "------------------------------------"
fi

which docker
docker --version

echo -e "------------------------------------"

docker run hello-world | grep 'This message shows that your installation appears to be working correctly.' &> /dev/null
if [ $? == 0 ]; then
	tput setaf 6
	echo -e ""
	echo -e "------------------------------------"
	echo -e "Docker installed successfylly"
	echo -e "------------------------------------"
	echo -e ""
fi

tput setaf 2
echo -e "------------------------------------"
echo -e "Downloading OWASP Juice Shop..."
echo -e "------------------------------------"

#Download OWASP Juice Shop Docker image
docker pull bkimminich/juice-shop &> /dev/null

echo -e "Launching OWASP Juice Shopp..."
echo -e "------------------------------------"

#Launch OWASP Juice Shop
docker run -d -p 3000:3000 bkimminich/juice-shop &> /dev/null
tput setaf 6
echo -e ""
echo -e "------------------------------------"
echo -e "OWASP Juice Shop has been deployed successfully"
echo -e "Please connect to http://<ip-address>:3000"
echo -e "------------------------------------"
echo -e ""

tput sgr 0
