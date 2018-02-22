#!/bin/bash
FW=$1
if [ ${FW}!='masq' ]; then
	RULES="/etc/iptables/v4.nomasq"
else 
	RULES="/etc/iptables/v4.rules"
fi
sudo modprobe -r ath9k && sudo modprobe ath9k
sleep 3
sudo /etc/init.d/networking restart
sleep 3
sudo /etc/init.d/network-manager stop
sleep 3
sudo /etc/init.d/network-manager start
# Popeyes Guest
#sudo iwconfig wlan0 essid "A-R-2-G" mode Managed channel 10 ap 70:8B:CD:C9:2F:00
#sudo iwconfig wlan0 essid "Ellipses" mode Managed channel 4 ap 54:AB:3A:AC:3F:74
#sudo iwconfig wlan0 essid "Lct4vets" mode Managed channel 11 ap 58:8B:F3:E5:26:56
#sudo iwconfig wlan0 essid "Lct4vets" mode Managed channel 10 ap 14:91:82:F6:2B:1F
#sudo iwconfig wlan0 essid "Lct4vetsext" mode Managed channel 4 ap 58:8B:F3:E5:26:56
# Popeyes Guest
#sudo iwconfig wlan0 essid "Popeyes Guest" mode Managed channel 1 ap 88:DC:96:36:66:9E
# Starbucks, Oregon City Shopping Center
#sudo iwconfig wlan0 essid "Google Starbucks" mode Managed channel 1 ap 24:DE:C6:64:53:D0
# Oregon City Public Library.
#sudo iwconfig wlan0 essid "oc-wifi" mode Managed channel 5 ap AC:86:74:5A:B1:C1
# Glen's place.
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 0E:51:A4:1F:89:09
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 0E:51:A4:1D:6F:E4
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 11 ap 84:16:F9:2D:AE:76
sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 06:1D:D5:70:E1:90
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 06:1D:D5:70:E1:90
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 06:1D:D5:FB:4C:50
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 4E:7A:8A:8E:3C:08
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 6 ap 3E:7E:81:09:02:9D
#sudo iwconfig wlan0 essid "xfinitywifi" mode Managed channel 11 ap 00:71:C2:CA:97:4A
# Starbucks McLaughlin Blvd. Next to Frddies.
#sudo iwconfig wlan0 essid "Google Starbucks" mode Managed channel 1 ap 18:64:72:6D:FF:E0
#sudo iwconfig wlan0 essid "Google Starbucks" mode Managed channel 11 ap 70:3A:0E:CD:9E:80
# Fred Meyer McLaughlin Blvd.  Milwaukie
#sudo iwconfig wlan0 essid "Fred Meyer WiFi" mode Managed channel 11 ap 00:15:70:E8:79:70
#sudo iwconfig wlan0 essid "LG5" mode Managed channel 11 ap D2:13:FD:36:3C:72
#sudo iwconfig wlan0 essid "TP-Reports" mode Managed channel 6 ap 84:16:F9:2D:AE:76
#sudo iwconfig wlan0 essid "TP-Link" mode Managed channel 6 ap 84:16:F9:2D:AE:76
#sudo iwconfig wlan0 essid "UDP Crue" mode Managed channel 1 ap 90:B6:86:2B:58:04
#sudo iwconfig wlan0 essid "Milwaukie-Library" mode Managed channel 5 ap AC:86:74:5A:B0:21
#sudo iwconfig wlan0 essid "jackwifi" mode Managed channel 11 ap 20:25:64:A0:0F:30
sleep 5
sudo ifconfig eth0 down
sleep 5
sudo sysctl -p /etc/sysctl.conf
iptables-restore < ${RULES}
exit
