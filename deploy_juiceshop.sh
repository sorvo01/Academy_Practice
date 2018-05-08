#!/bin/bash

tput setaf 6
echo -e ""
echo -e "------------------------------------"
echo -e "Begin of "
echo -e "Please connect to http://<ip-address>:3000"
echo -e "------------------------------------"
echo -e ""

tput setaf 2
echo -e "------------------------------------"
echo -e "Installing Docker..."
echo -e "------------------------------------"

{
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

apt-get update

apt-get purge lxc-docker

apt-cache policy docker-engine

apt-get update

apt-get upgrade -y

apt-get install -y linux-image-extra-$(uname -r)

apt-get install -y docker-engine
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
echo -e "Downloading OWASP Juice Shopp..."
echo -e "------------------------------------"

docker pull bkimminich/juice-shop &> /dev/null

echo -e "Launching OWASP Juice Shopp..."
echo -e "------------------------------------"

docker run -d -p 3000:3000 bkimminich/juice-shop &> /dev/null
tput setaf 6
echo -e ""
echo -e "------------------------------------"
echo -e "OWASP Juice Shop has been deployed successfully"
echo -e "Please connect to http://<ip-address>:3000"
echo -e "------------------------------------"
echo -e ""

tput sgr 0
