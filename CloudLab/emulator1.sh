# Update package lists and install updates
sudo apt update
sudo apt -y full-upgrade

# Get control and experiment interface names
ifacetoC=$(ifconfig | grep -B1 "inet 192.168.10.1" | head -n1 | cut -f1 -d:)
ifacetoS=$(ifconfig | grep -B1 "inet 192.168.1.1" | head -n1 | cut -f1 -d:)

# Reset interfaces
sudo ifconfig $ifacetoC down; sudo ifconfig $ifacetoC up 
sudo ifconfig $ifacetoS down; sudo ifconfig $ifacetoS up

# Add the new routes manually 
sudo route add -net 192.168.3.0/24 gw 192.168.1.2

# Introduce delay to the server link at the emulator 
sudo tc qdisc replace dev $ifacetoS root netem delay 30ms limit 60000
