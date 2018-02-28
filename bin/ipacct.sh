#!/bin/sh

#LAN_IFACE
if [ ! ${2} ]; then
	LAN_IFACE='eth0'
else
	LAN_IFACE=${2}
fi

lock()
{
	while [ -f /tmp/ipacct.lock ]; do
		if [ ! -d /proc/$(cat /tmp/ipacct.lock) ]; then
			echo "WARNING : Lockfile detected but process $(cat /tmp/ipacct.lock) does not exist !"
			unlock
		fi
		sleep 1
	done
	echo $$ > /tmp/ipacct.lock
}

unlock()
{
	rm -f /tmp/ipacct.lock
}

case ${1} in

"setup" )

	#Create the TRAFFIC_IN and TRAFFIC_OUT CHAIN's
	iptables -N TRAFFIC_IN 2> /dev/null
	iptables -N TRAFFIC_OUT 2> /dev/null

	#Add the TRAFFIC_IN and TRAFFIC_OUT CHAIN to the FORWARD CHAIN
	iptables -L FORWARD --line-numbers -n | grep "TRAFFIC_IN" | grep "1" > /dev/null
	if [ $? -ne 0 ]; then
		iptables -L FORWARD -n | grep "TRAFFIC_IN" > /dev/null
		if [ $? -eq 0 ]; then
			echo "DEBUG : iptables chain misplaced, recreating it..."
			iptables -D FORWARD -i ${LAN_IFACE} -j TRAFFIC_IN
		fi
		iptables -I FORWARD 1 -i ${LAN_IFACE} -j TRAFFIC_IN
	fi

	iptables -L FORWARD --line-numbers -n | grep "TRAFFIC_OUT" | grep "2" > /dev/null
	if [ $? -ne 0 ]; then
		iptables -L FORWARD -n | grep "TRAFFIC_OUT" > /dev/null
		if [ $? -eq 0 ]; then
			echo "DEBUG : iptables chain misplaced, recreating it..."
			iptables -D FORWARD -o ${LAN_IFACE} -j TRAFFIC_OUT
		fi
		iptables -I FORWARD 2 -o ${LAN_IFACE} -j TRAFFIC_OUT
	fi
	;;

"update" )
	
	#For each host in the ARP table
	grep ${LAN_IFACE} /proc/net/arp | sort -n | sed '/\(\.10\ \)/d' | while read IP TYPE FLAGS MAC MASK IFACE ;
	do
		#Add iptable rule (if non existing),
		iptables -nL TRAFFIC_IN | grep ${IP} > /dev/null
		if [ $? -ne 0 ]; then
			iptables -I TRAFFIC_IN -s ${IP} -j RETURN
			iptables -I TRAFFIC_OUT -d ${IP} -j RETURN
		fi
	done
	;;
esac
