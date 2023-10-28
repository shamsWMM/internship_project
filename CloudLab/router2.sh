# Update package lists and install updates
sudo apt update
sudo apt -y full-upgrade

# Get control and experiment interface names
ifacetoC=$(ifconfig | grep -B1 "inet 192.168.2.2" | head -n1 | cut -f1 -d:)
ifacetoS=$(ifconfig | grep -B1 "inet 192.168.4.2" | head -n1 | cut -f1 -d:)

# Reset interfaces
sudo ifconfig $ifacetoC down; sudo ifconfig $ifacetoC up 
sudo ifconfig $ifacetoS down; sudo ifconfig $ifacetoS up

# Add the new routes manually 
sudo route add -net 192.168.20.0/24 gw 192.168.2.1 

# Set bottleneck capacity and buffer size at the router
sudo tc qdisc del dev $ifacetoS root 
# Ignore error message

sudo tc qdisc replace dev $ifacetoS root handle 1: htb default 3 
sudo tc class add dev $ifacetoS parent 1: classid 1:3 htb rate 100mbit 
sudo tc qdisc add dev $ifacetoS parent 1:3 handle 3: bfifo limit 375000 
