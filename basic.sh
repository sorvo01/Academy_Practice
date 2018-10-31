arp-scan -I eth0 --srcaddr=DE:AD:BE:EF:CA:BA <ip>/24
nmap -sC sV <ip> -oA nmap/<ip>
apt-get install cewl -y
dirb http://
cewl http://<site> > list.txt
