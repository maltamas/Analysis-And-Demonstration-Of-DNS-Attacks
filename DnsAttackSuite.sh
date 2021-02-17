figlet DNS-ATTACK
figlet SUITE
echo "                                                        "
echo "--------------------------------------------------------------------"
echo "| This script uses hping3 , so make sure to install it !!          |"
echo "| DISCLAIMER: This script is for authorized testing and educational|"
echo "| purpose only , we are not responsible for any kind of misuse !!  |"
echo "--------------------------------------------------------------------"
echo "                                                        "
echo "THIS TOOL USES KALI TOOLS TO PERFORM DIFFERENT DNS ATTACKS"
echo "CHOOSE THE ATTACK YOU WANT TO PERFORM"
echo "1. CACHE_POISON"
echo "2. DNSSPOOF(MITM)"
echo "3. UDP FLOOD(DDOS)"
read choice
if [ $choice -eq "1" ]
then
sh /root/cache_poison.sh
elif [ $choice -eq "2" ]
then
sh /root/DNSSpoof.sh
else
sh /root/UDPFlood
fi
