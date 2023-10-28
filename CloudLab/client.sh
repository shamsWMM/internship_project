# Update package lists and install updates
sudo apt update
sudo apt -y full-upgrade

# Get control and experiment interface names
iface1=$(ifconfig | grep -B1 "inet 192.168.10.2" | head -n1 | cut -f1 -d:)
iface2=$(ifconfig | grep -B1 "inet 192.168.20.2" | head -n1 | cut -f1 -d:)
ifaceC=$(ifconfig | grep -B1 "inet " | head -n1 | cut -f1 -d:) 

# Reset interfaces
sudo ifconfig $iface1 down; sudo ifconfig $iface1 up 
sudo ifconfig $iface2 down; sudo ifconfig $iface2 up

# Add the new routes manually 
sudo route add -net 192.168.3.0/24 gw 192.168.10.1 
sudo route add -net 192.168.4.0/24 gw 192.168.20.1

# Configure routing rules
sudo ip rule add from 192.168.10.2 table 1 
sudo ip rule add from 192.168.20.2 table 2 
sudo ip route add 192.168.10.0/24 dev $iface1 scope link table 1
sudo ip route add 192.168.20.0/24 dev $iface2 scope link table 2 
sudo ip route add 192.168.3.0/24 via 192.168.10.1 dev $iface1 table 1 
sudo ip route add 192.168.4.0/24 via 192.168.20.1 dev $iface2 table 2
