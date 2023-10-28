#Update package lists and install updates
sudo apt update
sudo apt -y full-upgrade

# get control and experiment interface names
ifacetoC=$(ifconfig | grep -B1 "inet 192.168.10.1" | head -n1 | cut -f1 -d:)
ifacetoS=$(ifconfig | grep -B1 "inet 192.168.1.1" | head -n1 | cut -f1 -d:)

# Introduce delay to the server link at the emulator 
sudo tc qdisc replace dev $ifacetoS root netem delay 30ms limit 60000
